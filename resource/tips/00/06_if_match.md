# 조건문 if / elif / else & match-case

조건문은 상황에 따라 다른 코드를 실행하기 위해 사용합니다.

## if 문

조건이 참일 때만 코드를 실행합니다.

```python
age = 20

if age >= 18:
    print("adult")
```

## if / else

조건이 참이면 if 블록을 실행하고,

거짓이면 else 블록을 실행합니다.

```python
score = 70

if score >= 60:
    print("pass")
else:
    print("fail")
```

## if / elif / else

여러 조건을 순서대로 검사할 때 사용합니다.

```python
score = 85

if score >= 90:
    print("A")
elif score >= 80:
    print("B")
else:
    print("C")
```

위에서부터 차례대로 검사하며,

처음으로 참이 되는 블록만 실행됩니다.

## 비교 연산자

조건식에서 자주 사용하는 연산자입니다.

| 연산자 | 의미 |
|--------|------|
| == | 같다 |
| != | 다르다 |
| > | 크다 |
| < | 작다 |
| >= | 크거나 같다 |
| <= | 작거나 같다 |

## 논리 연산자

여러 조건을 조합할 때 사용합니다.

```python
age = 20
has_ticket = True

if age >= 18 and has_ticket:
    print("enter")
```

| 연산자 | 의미 |
|--------|------|
| and | 둘 다 참 |
| or | 하나라도 참 |
| not | 참/거짓 반전 |

## match-case

Python 3.10부터 사용할 수 있는 조건 분기 문법입니다.

값의 형태나 내용에 따라 코드를 나눌 때 사용할 수 있습니다.

```python
command = "start"

match command:
    case "start":
        print("Start")
    case "stop":
        print("Stop")
    case _:
        print("Unknown")
```

`case _`는 위 조건에 모두 해당하지 않을 때 실행되는 기본 처리입니다.

## 언제 사용할까?

단순한 조건 분기는 if 문을 사용합니다.

```python
if value > 0:
    print("positive")
```

하나의 값을 여러 경우로 나눌 때는 match-case를 사용할 수 있습니다.

```python
match command:
    case "add":
        print("add")
    case "delete":
        print("delete")
```

## 정리

조건을 검사할 때는 `if`를 사용합니다.

여러 조건을 순서대로 검사할 때는 `elif`를 사용합니다.

나머지 경우를 처리할 때는 `else`를 사용합니다.

하나의 값을 여러 패턴으로 나눌 때는 `match-case`를 사용할 수 있습니다.