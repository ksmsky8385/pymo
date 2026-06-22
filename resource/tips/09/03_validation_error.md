# ValidationError 처리

## 검증 실패

Pydantic 모델 생성 중 타입이나 `Field` 조건을 만족하지 못하면 `ValidationError`가 발생합니다.

```python
from pydantic import BaseModel, Field, ValidationError


class Reading(BaseModel):
    label: str = Field(min_length=2)
    level: int = Field(ge=0, le=10)


try:
    Reading(label="A", level=20)
except ValidationError as error:
    print(error)
```

`ValidationError`에는 실패한 필드 위치, 입력값, 오류 종류와 메시지가 포함됩니다.

## 정상 사례와 실패 사례 분리

과제의 `main()`에서는 정상 모델이 실제로 생성되는지 먼저 확인한 뒤, 실패가 예상되는 데이터만 `try` 블록에서 생성하는 방식이 읽기 쉽습니다.

```python
valid = Reading(label="core", level=7)
print(valid)

try:
    Reading(label="core", level=-1)
except ValidationError as error:
    print("Expected validation error:")
    print(error)
```

## 오류를 숨기지 않기

다음과 같이 모든 예외를 아무 처리 없이 무시하면 검증 결과를 확인할 수 없습니다.

```python
try:
    Reading(label="", level=-1)
except Exception:
    pass
```

예상하는 `ValidationError`만 처리하고 오류 메시지를 출력해야 어떤 규칙이 동작했는지 확인할 수 있습니다.

## 여러 조건 시험

처음부터 여러 조건을 동시에 위반하면 어떤 규칙을 확인하려는지 불명확해질 수 있습니다. 사용자 정의 규칙을 시험할 때는 가능하면 나머지 필드는 정상값으로 두고 확인할 조건 하나만 위반시키는 것이 좋습니다.
