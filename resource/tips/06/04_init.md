# __init__.py

이번 모듈의 핵심 파일입니다.

## 함수 공개

```python
from .elements import create_air
```

외부에서

```python
import alchemy

alchemy.create_air()
```

를 사용할 수 있게 됩니다.

## 공개 제어

```python
__all__ = ["create_air"]
```

외부 공개 목록을 명시할 수 있습니다.

## Alias

```python
heal = healing_potion
```

별칭을 생성할 수 있습니다.

예시:

```python
alchemy.heal()
```