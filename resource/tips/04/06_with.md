# with Statement

파일은 운영체제가 관리하는 자원(Resource)입니다.

파일을 열었다면 사용이 끝난 후 반드시 닫아야 합니다.

```python
file = open("data.txt", "r")

content = file.read()

file.close()
```

만약 close()를 호출하지 않으면 파일이 계속 열린 상태로 남게 됩니다.

이러한 문제를 Resource Leak(자원 누수)라고 부릅니다.

## Context Manager

Python은 자원을 안전하게 관리하기 위해 Context Manager라는 기능을 제공합니다.

Context Manager는 작업이 끝났을 때 자동으로 정리 작업을 수행합니다.

예를 들어 파일을 사용한 후 자동으로 close()를 호출할 수 있습니다.

## with Statement

with 문은 Context Manager를 사용하는 Python 문법입니다.

```python
with open("data.txt", "r") as file:
    content = file.read()
```

블록이 종료되면 Python이 자동으로 파일을 닫아줍니다.

따라서 직접 close()를 호출할 필요가 없습니다.

## 기존 방식과 비교

일반적인 방식:

```python
file = open("data.txt", "r")

content = file.read()

file.close()
```

with 사용:

```python
with open("data.txt", "r") as file:
    content = file.read()
```

동일한 작업을 수행하지만

with 문이 더 간결하고 안전합니다.

## 예외가 발생해도 안전

```python
with open("data.txt", "r") as file:
    raise Exception("Something went wrong")
```

예외가 발생하더라도 파일은 정상적으로 닫힙니다.

따라서 예외 상황에서도 자원 누수를 방지할 수 있습니다.

## 왜 사용할까?

파일을 닫는 것을 깜빡하는 실수를 방지할 수 있습니다.

또한 예외가 발생하더라도 자동으로 정리 작업이 수행됩니다.

그래서 현대 Python 코드에서는 파일 작업 시 with 문 사용이 권장됩니다.
