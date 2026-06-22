# Enum과 model_validator

## Enum

가능한 문자열 값이 정해져 있다면 표준 라이브러리의 `Enum`으로 표현할 수 있습니다.

```python
from enum import Enum


class DeliveryMethod(str, Enum):
    STANDARD = "standard"
    EXPRESS = "express"
    PICKUP = "pickup"
```

`str`도 함께 상속하면 각 enum 값이 문자열 기반으로 동작합니다.

Pydantic 모델의 필드 타입으로 enum을 사용하면 정의된 값 이외의 입력은 자동으로 거부됩니다.

## Field와 model_validator의 역할

한 필드만 확인하면 되는 조건은 먼저 타입과 `Field`로 표현합니다.

여러 필드의 조합을 확인해야 하는 규칙은 `model_validator`로 처리합니다.

예시 규칙:

- 배송 방식이 `pickup`이면 수령 코드가 필요함
- 수량이 많으면 승인 상태가 필요함

```python
from pydantic import BaseModel, model_validator


class Delivery(BaseModel):
    method: DeliveryMethod
    pickup_code: str | None = None

    @model_validator(mode="after")
    def validate_delivery(self) -> "Delivery":
        if self.method == DeliveryMethod.PICKUP:
            if self.pickup_code is None:
                raise ValueError("Pickup requires a pickup code")
        return self
```

이 예시는 decorator와 조건문 구조를 보여주기 위한 것으로 과제의 검증 규칙과는 별개입니다.

## mode="after"

`mode="after"`에서는 각 필드의 기본 타입 검증이 끝난 모델 인스턴스를 `self`로 확인합니다.

검증에 실패하면 `ValueError`를 발생시키고, 성공하면 마지막에 반드시 `self`를 반환합니다.

```python
return self
```

반환을 빠뜨리면 모델 검증 과정이 올바르게 완료되지 않습니다.

## 조건 작성 순서

1. 각 Subject 규칙을 별도의 문장으로 정리
2. 규칙에 관련된 필드 확인
3. 규칙을 위반하는 조건 작성
4. 위반 시 의미가 분명한 `ValueError` 발생
5. 모든 조건을 통과하면 `self` 반환

하나의 긴 조건식으로 합치기보다 규칙마다 독립된 `if` 문을 사용하면 검증과 오류 메시지를 관리하기 쉽습니다.
