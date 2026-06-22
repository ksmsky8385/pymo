# BaseModel과 Field

## BaseModel

Pydantic 모델은 `BaseModel`을 상속하고 필드를 타입 표기된 클래스 속성으로 선언합니다.

```python
from datetime import datetime

from pydantic import BaseModel, Field


class SensorRecord(BaseModel):
    sensor_id: str = Field(min_length=2, max_length=12)
    value: float = Field(ge=0.0, le=50.0)
    measured_at: datetime
    enabled: bool = True
    memo: str | None = Field(default=None, max_length=100)
```

이 예시는 과제 모델의 정답이 아니라 `Field` 작성 형태를 보여주기 위한 별도 모델입니다.

## 자주 사용하는 Field 조건

- `min_length`: 문자열 또는 목록의 최소 길이
- `max_length`: 문자열 또는 목록의 최대 길이
- `ge`: 값이 기준보다 크거나 같음
- `le`: 값이 기준보다 작거나 같음
- `gt`: 값이 기준보다 큼
- `lt`: 값이 기준보다 작음

```python
count: int = Field(ge=1, le=10)
ratio: float = Field(gt=0.0, lt=1.0)
```

Subject의 표현이 "1-10"이라면 일반적으로 양 끝을 포함하므로 `ge=1`, `le=10`처럼 작성합니다.

## 필수값과 기본값

기본값을 작성하지 않은 필드는 객체 생성 시 반드시 전달해야 합니다.

```python
name: str
active: bool = True
```

`name`은 필수이고 `active`는 생략하면 `True`가 됩니다.

Optional 타입은 값으로 `None`을 허용한다는 의미입니다. 생략도 허용하려면 기본값을 함께 작성합니다.

```python
description: str | None = None
```

## datetime 변환

필드 타입을 `datetime`으로 선언하면 올바른 형식의 문자열을 전달했을 때 Pydantic이 `datetime` 객체로 변환할 수 있습니다.

```python
record = SensorRecord(
    sensor_id="SN01",
    value=12.5,
    measured_at="2026-01-15T10:30:00",
)

print(type(record.measured_at))
```

변환할 수 없는 문자열은 검증 오류가 됩니다.
