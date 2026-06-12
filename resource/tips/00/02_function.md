# Python 함수(Function)와 중첩 함수(Nested Function)

Python에서 함수(Function)는 일급 객체(First-Class Object)로 취급됩니다.

따라서 변수에 저장하거나 다른 함수에 전달할 수 있으며, 함수 내부에 또 다른 함수를 정의하는 것도 가능합니다.

## 1. 기본 함수 정의 (`def`)

```python
def 함수이름(매개변수):
    # 실행할 코드
    return 반환값
```

예시:

```python
def add(a, b):
    return a + b
```

함수는 입력값(매개변수)을 받아 작업을 수행한 뒤 결과를 반환합니다.

## 2. return

return은 함수의 실행 결과를 호출한 곳으로 전달합니다.

```python
def square(x):
    return x * x
```

```python
result = square(5)

print(result)
```

결과:

```text
25
```

return 문이 없으면 Python은 기본적으로 None을 반환합니다.

```python
def hello():
    print("Hello")
```

```python
result = hello()

print(result)
```

결과:

```text
Hello
None
```

## 3. 중첩 함수 (Nested Function)

Python에서는 함수 내부에 또 다른 함수를 정의할 수 있습니다.

```python
def outer_func(x):

    def inner_func(y):
        return y * 2

    return inner_func(x)
```

내부 함수는 외부 함수 안에서만 사용할 수 있습니다.

```python
outer_func(5)
```

결과:

```text
10
```

## 4. 왜 사용할까?

중첩 함수는 외부에 공개할 필요가 없는 보조 로직을 숨길 수 있습니다.

```python
def process_data(data):

    def validate(value):
        return value > 0

    if validate(data):
        return data * 2

    return 0
```

함수 내부에서만 사용하는 기능을 깔끔하게 분리할 수 있습니다.

## 참고

Method(메서드)는 클래스 내부에 정의된 함수를 의미합니다.

```python
class User:

    def hello(self):
        print("Hello")
```
