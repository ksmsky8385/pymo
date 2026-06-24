# 함수형 프로그래밍 기본

## 함수는 값입니다

Python에서 함수는 변수에 담거나, 다른 함수의 인자로 전달하거나, 함수의 반환값으로 돌려줄 수 있습니다.

```python
def shout(text: str) -> str:
    return text.upper()


func = shout
print(func("hello"))
```

이 성질 때문에 공통 처리 흐름은 그대로 두고, 세부 동작만 함수로 갈아끼우는 구조를 만들 수 있습니다.

## 작은 함수를 조합하기

함수형 스타일에서는 하나의 큰 함수보다 역할이 작은 함수를 조합하는 방식을 자주 사용합니다.

```python
def double(value: int) -> int:
    return value * 2


def apply(value: int, action) -> int:
    return action(value)


print(apply(10, double))
```

핵심은 데이터를 직접 바꾸는 대신, 입력을 받아 새 결과를 반환하는 흐름을 명확히 만드는 것입니다.
