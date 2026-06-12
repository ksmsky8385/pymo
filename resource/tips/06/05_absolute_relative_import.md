# Absolute Import & Relative Import

## Absolute Import

프로젝트 루트 기준으로 접근합니다.

```python
from alchemy.potions import strength_potion
```

가독성이 좋습니다.

## Relative Import

현재 패키지 위치 기준으로 접근합니다.

```python
from ..elements import create_air
```

현재 디렉토리 기준으로 이동합니다.

## 기호 의미

```text
.
```

현재 패키지

```text
..
```

상위 패키지

## 언제 사용할까?

패키지 내부 코드에서는 Relative Import가 자주 사용됩니다.

외부 접근은 Absolute Import가 일반적입니다.