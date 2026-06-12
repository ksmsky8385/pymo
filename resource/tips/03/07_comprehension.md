# Comprehension

Comprehension은 반복문을 사용하여 새로운 자료구조를 만드는 과정을 한 줄로 표현하는 문법입니다.

코드를 간결하게 작성할 수 있으며, 데이터 변환이나 필터링에 자주 사용됩니다.

## List Comprehension

반복문을 이용해 새로운 List를 생성할 수 있습니다.

```python
numbers = [x * 2 for x in range(5)]

print(numbers)
```

결과

```shell
[0, 2, 4, 6, 8]
```

위 코드는 다음 반복문과 같은 의미입니다.

```python
numbers = []

for x in range(5):
    numbers.append(x * 2)
```

## 조건 사용

조건을 추가하여 원하는 데이터만 선택할 수 있습니다.

```python
evens = [
    x
    for x in range(10)
    if x % 2 == 0
]

print(evens)
```

결과

```shell
[0, 2, 4, 6, 8]
```

## Dictionary Comprehension

반복문을 이용하여 Dictionary를 생성할 수 있습니다.

```python
scores = {
    name: 0
    for name in players
}

print(scores)
```

결과

```shell
{
    'Alice': 0,
    'Bob': 0,
    'Charlie': 0
}
```

## 활용

Comprehension은 다음과 같은 상황에 자주 사용됩니다.

- 데이터 변환
- 데이터 필터링
- 새로운 List 생성
- 새로운 Dictionary 생성
