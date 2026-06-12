# Mypy Ignore Tips

mypy는 타입 검사기이며, 특정 줄의 오류를 무시하려면
`# type: ignore[...]` 주석을 사용할 수 있습니다.

## 자주 사용하는 ignore 종류

### arg-type

함수 인자 타입이 맞지 않을 때 사용.

```python
def print_number(n: int) -> None:
    print(n)

print_number("hello")  # type: ignore[arg-type]
```

### operator

지원되지 않는 연산을 사용할 때 사용.

```python
print("age" + 1)  # type: ignore[operator]
```

### assignment

변수에 다른 타입의 값을 대입할 때 사용.

```python
name: str = 42  # type: ignore[assignment]
```

### return-value

함수의 반환 타입이 선언과 다를 때 사용.

```python
def get_name() -> str:
    return 42  # type: ignore[return-value]
```

### call-arg

함수 호출 시 인자 개수나 이름이 잘못되었을 때 사용.

```python
def greet(name: str) -> None:
    print(name)

greet()  # type: ignore[call-arg]
```

### attr-defined

존재하지 않는 속성이나 메서드에 접근할 때 사용.

```python
text = "hello"
text.foo()  # type: ignore[attr-defined]
```

### index

인덱싱이 허용되지 않는 객체에 인덱스를 사용할 때 사용.

```python
number = 42
print(number[0])  # type: ignore[index]
```

### 전체 무시

모든 mypy 오류를 무시할 수 있습니다.

```python
something()  # type: ignore
```

하지만 과제 제출 시의 문제 등 오류 종류를 명시하는 것이 좋습니다.