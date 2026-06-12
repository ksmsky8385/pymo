# Tuple

Tuple은 여러 값을 하나의 변수로 저장하는 자료형입니다.

``` python
position = (1.0, 2.0, 3.0)
```

## 특징

- 순서 존재
- 수정 불가
- 인덱스 접근 가능

``` python
print(position[0])
```

## 좌표 표현

Tuple은 위치 정보를 저장할 때 자주 사용됩니다.

``` python
player_pos = (10.0, 20.0, 30.0)
```

## 함수 반환

``` python
def get_position() -> tuple[float, float, float]:
    return (1.0, 2.0, 3.0)
```
