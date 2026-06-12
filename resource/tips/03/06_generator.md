# Generator

Generator는 값을 한 번에 모두 만들지 않고, **필요할 때마다 하나씩 생성하는 객체**입니다.

일반 함수는 `return`을 만나면 종료되지만, Generator는 `yield`를 만나면 현재 상태를 저장한 채 잠시 멈춥니다.

## yield

`yield`는 값을 반환하면서 함수의 실행 상태를 기억합니다.

```python
def counter():
    yield 1
    yield 2
    yield 3
```

## next()

Generator는 `next()`를 호출할 때마다 다음 값을 생성합니다.

```python
g = counter()

print(next(g))
print(next(g))
print(next(g))
```

결과

```shell
1
2
3
```

## Generator 종료

더 이상 생성할 값이 없으면 Generator는 종료됩니다.

```python
g = counter()

next(g)
next(g)
next(g)
next(g)
```

결과

```shell
StopIteration
```

## 무한 생성기

`while True`를 사용하면 끝없이 값을 생성할 수 있습니다.

```python
def counter():
    value = 0

    while True:
        yield value
        value += 1
```

사용 예시

```python
g = counter()

print(next(g))
print(next(g))
print(next(g))
```

결과

```shell
0
1
2
```

## 활용

Generator는 다음과 같은 상황에 자주 사용됩니다.

- 이벤트 스트림 처리
- 로그 분석
- 대용량 데이터 처리
- 실시간 데이터 생성