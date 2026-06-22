# 중첩 Pydantic 모델

## 모델을 필드 타입으로 사용

Pydantic 모델은 다른 모델의 필드 타입으로 사용할 수 있습니다.

```python
from pydantic import BaseModel, Field


class Member(BaseModel):
    member_id: str
    name: str
    active: bool = True


class Team(BaseModel):
    team_id: str
    members: list[Member] = Field(min_length=1, max_length=8)
```

`Team`을 생성하면 `members` 목록의 각 항목도 `Member` 규칙에 따라 검증됩니다.

## 딕셔너리 입력

중첩 모델에는 미리 만든 모델 인스턴스뿐 아니라 필드 구조가 맞는 딕셔너리도 전달할 수 있습니다.

```python
team = Team(
    team_id="TEAM01",
    members=[
        {
            "member_id": "MB01",
            "name": "Alex",
            "active": True,
        }
    ],
)
```

Pydantic은 내부 딕셔너리를 `Member` 인스턴스로 변환합니다. 내부 데이터가 잘못되면 바깥쪽 `Team` 생성도 실패하며 오류 위치에 목록 인덱스와 내부 필드가 함께 표시됩니다.

## 중첩 구조의 model_validator

바깥쪽 모델의 `model_validator(mode="after")`에서는 변환이 완료된 내부 모델을 순회할 수 있습니다.

```python
active_count = sum(member.active for member in self.members)
```

목록 전체에 관한 규칙은 다음 순서로 생각할 수 있습니다.

1. 목록에 필요한 최소·최대 개수 확인
2. 특정 조건을 가진 구성원이 존재하는지 확인
3. 조건을 만족하는 구성원의 비율 계산
4. 모든 내부 구성원의 상태 확인

## 비율 계산

목록 중 조건을 만족하는 항목의 비율은 개수를 세어 계산할 수 있습니다.

```python
qualified_count = sum(member.active for member in self.members)
qualified_ratio = qualified_count / len(self.members)
```

목록의 최소 길이가 이미 `Field(min_length=1)`로 보장되었다면 0으로 나누는 문제를 피할 수 있습니다.

## 데이터 출력

모델 속성은 일반 객체처럼 접근할 수 있습니다.

```python
print(team.team_id)

for member in team.members:
    print(member.name)
```

전체 중첩 데이터를 딕셔너리로 확인하려면 Pydantic v2의 `model_dump()`를 사용할 수 있습니다.

```python
print(team.model_dump())
```
