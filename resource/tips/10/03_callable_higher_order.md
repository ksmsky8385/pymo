# Callable과 고차 함수

## 호출 가능한 객체

호출 가능한 객체는 뒤에 괄호를 붙여 실행할 수 있는 객체입니다.

가장 흔한 예시는 함수입니다.

```python
def greet(name: str) -> str:
    return f"Hello, {name}"


print(greet("Alex"))
```

클래스나 `__call__` 메서드를 가진 객체도 호출 가능 객체가 될 수 있습니다.

## callable()

`callable(value)`는 값이 호출 가능한지 확인하는 내장 함수입니다.

```python
def greet() -> str:
    return "hello"


print(callable(greet))
print(callable("hello"))
```

결과:

```text
True
False
```

## Callable 타입 힌트

함수를 인자로 받거나 반환할 때는 `Callable` 타입 힌트를 사용할 수 있습니다.

```python
from collections.abc import Callable


NumberAction = Callable[[int], int]


def run_action(value: int, action: NumberAction) -> int:
    return action(value)
```

`Callable[[int], int]`는 `int` 하나를 받아 `int`를 반환하는 호출 가능한 객체라는 뜻입니다.

인자가 없으면 빈 리스트를 사용합니다.

```python
from collections.abc import Callable


MessageFactory = Callable[[], str]
```

인자 개수를 정확히 제한하기 어렵거나 여러 형태를 받을 때는 `...`를 사용할 수 있습니다.

```python
from collections.abc import Callable


AnyStringFunction = Callable[..., str]
```

## 고차 함수

고차 함수는 함수를 인자로 받거나 함수를 반환하는 함수입니다.

```python
from collections.abc import Callable


def repeat(action: Callable[[str], str], count: int) -> Callable[[str], list[str]]:
    def runner(text: str) -> list[str]:
        return [action(text) for _ in range(count)]

    return runner


excited = repeat(lambda text: text + "!", 3)
print(excited("go"))
```

이 구조를 사용하면 반복, 조건, 변환 같은 공통 흐름과 실제 동작 함수를 분리할 수 있습니다.

