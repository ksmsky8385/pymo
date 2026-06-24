# Lambda

## lambda

`lambda`는 이름 없는 짧은 함수를 만들 때 사용합니다.

```python
square = lambda value: value * value

print(square(4))
```

간단한 정렬 기준, 필터 조건, 일회성 변환처럼 한 줄로 의미가 분명한 경우에 적합합니다.

여러 줄의 로직이나 예외 처리가 필요하면 일반 `def` 함수가 더 읽기 쉽습니다.

## sorted()의 key

`sorted()`의 `key` 인자는 각 요소에서 비교 기준으로 사용할 값을 뽑아냅니다.

```python
items = [
    {"name": "book", "price": 12000},
    {"name": "pen", "price": 1500},
]

by_price = sorted(items, key=lambda item: item["price"])
print(by_price)
```

내림차순 정렬은 `reverse=True`를 함께 사용합니다.

## filter()

`filter()`는 조건 함수가 참을 반환하는 요소만 남깁니다.

```python
values = [3, 10, 15, 2]
large_values = list(filter(lambda value: value >= 10, values))

print(large_values)
```

조건 함수는 각 요소를 받아 `True` 또는 `False`로 판단할 수 있어야 합니다.

## map()

`map()`은 각 요소에 같은 변환 함수를 적용합니다.

```python
names = ["alice", "bob", "chris"]
upper_names = list(map(lambda name: name.upper(), names))

print(upper_names)
```

`map()`의 결과는 iterator이므로 목록이 필요하면 `list()`로 감쌉니다.

