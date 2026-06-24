# functools

## functools.reduce()

`functools.reduce()`는 목록의 값을 하나의 결과로 누적합니다.

```python
from functools import reduce
from operator import add


values = [1, 2, 3, 4]
total = reduce(add, values)

print(total)
```

빈 목록에 초기값 없이 `reduce()`를 사용하면 오류가 발생합니다.

빈 입력이 가능한 경우에는 먼저 처리하거나 초기값을 전달합니다.

## functools.partial()

`partial()`은 함수 인자 일부를 미리 채운 새 함수를 만듭니다.

```python
from functools import partial


def format_message(level: str, text: str) -> str:
    return f"[{level}] {text}"


warn = partial(format_message, "WARN")
print(warn("disk is almost full"))
```

자주 반복되는 인자 조합을 이름 있는 함수처럼 재사용할 때 유용합니다.

## functools.lru_cache()

`lru_cache()`는 같은 인자로 호출된 함수 결과를 저장해 재사용합니다.

```python
from functools import lru_cache


@lru_cache
def fib(n: int) -> int:
    if n < 2:
        return n
    return fib(n - 1) + fib(n - 2)


print(fib(10))
print(fib.cache_info())
```

입력이 같으면 결과도 같은 순수 함수에 잘 맞습니다.

## functools.singledispatch()

`singledispatch()`는 첫 번째 인자의 타입에 따라 실행할 함수를 나눕니다.

```python
from functools import singledispatch


@singledispatch
def describe(value: object) -> str:
    return "unknown"


@describe.register
def _(value: int) -> str:
    return f"number: {value}"


@describe.register
def _(value: str) -> str:
    return f"text: {value}"


print(describe(42))
print(describe("hello"))
print(describe(3.14))
```

타입별 분기가 많아질 때 `if isinstance(...)`를 길게 늘어놓는 대신 사용할 수 있습니다.

