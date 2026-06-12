# for, range() & while

Python에는 대표적으로 두 가지 반복문이 있습니다.

- for
- while

## for

for 문은 반복 가능한 객체(Iterable)를 순회합니다.

```python
for item in iterable:
    print(item)
```

대표적인 Iterable:

- range()
- list
- tuple
- str
- set
- dict

예시:

```python
for ch in "hello":
    print(ch)
```

## range()

숫자 범위를 생성하는 Iterable 객체입니다.

```python
range(stop)
range(start, stop)
range(start, stop, step)
```

예시:

```python
for i in range(5):
    print(i)
```

결과:

```text
0
1
2
3
4
```

range()는 모든 숫자를 미리 생성하지 않고 필요할 때마다 생성합니다.

## while

조건이 참인 동안 반복합니다.

```python
count = 0

while count < 5:
    print(count)
    count += 1
```

## 언제 사용할까?

반복 횟수가 정해져 있다면:

```python
for i in range(10):
    ...
```

종료 시점을 미리 알 수 없다면:

```python
while True:
    ...
```

## break

반복문을 즉시 종료합니다.

```python
if condition:
    break
```

## continue

현재 반복을 건너뛰고 다음 반복으로 이동합니다.

```python
if condition:
    continue
```