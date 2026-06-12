# input() 함수

사용자로부터 한 줄의 문자열 입력을 받는 함수입니다.

기본 정보는 다음과 같습니다.

```python
(function) def input(
    prompt: object = "",
    /
) -> str
```

`input()`은 사용자 입력을 문자열(`str`)로 반환합니다.

## 기본 사용

```python
name = input()
```

사용자가 입력한 값이 `name` 변수에 저장됩니다.

## prompt 사용

```python
name = input("Enter your name: ")
```

`prompt`는 입력 전에 출력되는 안내 문구입니다.

결과:

```text
Enter your name:
```

## 반환값은 항상 문자열

```python
age = input("Age: ")
```

사용자가 `20`을 입력해도 결과는 문자열입니다.

```python
"20"
```

숫자로 사용하려면 직접 변환해야 합니다.

```python
age = int(input("Age: "))
```

## 주의사항

`input()`은 Enter를 누를 때까지 프로그램을 기다리게 합니다.

입력값은 항상 문자열이므로,

숫자 계산이 필요하면 `int()`나 `float()`로 변환해야 합니다.
