# Closure와 nonlocal

## lexical scoping

Python 함수는 자신이 정의된 위치의 이름 범위를 기억합니다. 안쪽 함수는 바깥 함수의 지역 변수에 접근할 수 있습니다.

```python
def make_prefixer(prefix: str):
    def add_prefix(text: str) -> str:
        return prefix + text

    return add_prefix


add_error = make_prefixer("ERROR: ")
print(add_error("failed"))
```

`make_prefixer()` 실행이 끝난 뒤에도 반환된 함수는 `prefix` 값을 기억합니다.

## closure

closure는 함수와 그 함수가 기억하는 외부 변수 묶음입니다. 같은 factory 함수를 여러 번 호출하면 서로 독립된 상태를 가진 함수를 만들 수 있습니다.

```python
def make_counter():
    count = 0

    def next_count() -> int:
        nonlocal count
        count += 1
        return count

    return next_count


a = make_counter()
b = make_counter()

print(a())
print(a())
print(b())
```

`a`와 `b`는 같은 코드로 만들어졌지만 각자 다른 `count`를 가집니다.

## nonlocal

안쪽 함수에서 바깥 함수의 변수를 다시 할당하려면 `nonlocal`이 필요합니다.

```python
def make_total(start: int):
    total = start

    def add(value: int) -> int:
        nonlocal total
        total += value
        return total

    return add
```

`nonlocal`은 가장 가까운 바깥 함수 범위의 이름을 수정합니다. 전역 상태를 공유하는 `global`보다 영향 범위가 좁습니다.

## private state

closure를 사용하면 내부 상태를 직접 노출하지 않고, 정해진 함수로만 접근하게 만들 수 있습니다.

```python
def make_store():
    data: dict[str, object] = {}

    def set_value(key: str, value: object) -> None:
        data[key] = value

    def get_value(key: str) -> object | None:
        return data.get(key)

    return set_value, get_value
```

이 방식은 간단한 상태 저장, 누적 계산, 설정을 기억하는 함수 생성에 자주 쓰입니다.

