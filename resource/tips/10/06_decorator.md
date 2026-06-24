# Decorator와 staticmethod

## decorator

decorator는 함수를 감싸서 실행 전후 동작을 추가하는 함수입니다.

```python
from collections.abc import Callable
from functools import wraps


def trace(func: Callable[[str], str]) -> Callable[[str], str]:
    @wraps(func)
    def wrapper(text: str) -> str:
        print("before")
        result = func(text)
        print("after")
        return result

    return wrapper
```

`wraps()`를 사용하면 감싼 뒤에도 원래 함수의 이름과 문서 문자열 같은 메타데이터가 보존됩니다.

## decorator factory

decorator에 설정값이 필요하면 decorator를 만들어 반환하는 함수를 한 단계 더 둡니다.

```python
from collections.abc import Callable
from functools import wraps


TextFunc = Callable[[str], str]


def min_length(length: int) -> Callable[[TextFunc], TextFunc]:
    def decorator(func: Callable[[str], str]) -> Callable[[str], str]:
        @wraps(func)
        def wrapper(text: str) -> str:
            if len(text) < length:
                return "too short"
            return func(text)

        return wrapper

    return decorator
```

## staticmethod

`@staticmethod`는 클래스 안에 있지만 `self`나 `cls`를 받지 않는 함수입니다.

```python
class TextRules:
    @staticmethod
    def is_upper(text: str) -> bool:
        return text.isupper()


print(TextRules.is_upper("HELLO"))
```

클래스와 의미상 관련은 있지만 인스턴스 상태를 쓰지 않는 검증 함수나 변환 함수에 적합합니다.

