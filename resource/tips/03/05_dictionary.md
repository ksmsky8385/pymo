# Dictionary

Dictionary는 **Key와 Value를 쌍으로 저장하는 자료형**입니다.

하나의 Key는 하나의 Value와 연결되며, Key를 통해 원하는 값을 빠르게 찾을 수 있습니다.

```python
inventory = {
    "sword": 1,
    "potion": 5
}
```

## 데이터 추가

존재하지 않는 Key에 값을 대입하면 새로운 데이터가 추가됩니다.

```python
inventory["shield"] = 1

print(inventory)
```

결과

```shell
{'sword': 1, 'potion': 5, 'shield': 1}
```

## 데이터 수정

이미 존재하는 Key에 값을 대입하거나 `update()`를 사용하면 값을 변경할 수 있습니다.

```python
inventory.update({
    "potion": 10
})

print(inventory)
```

결과

```shell
{'sword': 1, 'potion': 10}
```

## 값 접근

Key를 사용하여 원하는 Value를 가져올 수 있습니다.

```python
print(inventory["sword"])
```

결과

```shell
1
```

## 존재 여부 확인

특정 Key가 존재하는지 확인할 수 있습니다.

```python
if "sword" in inventory:
    print("Player owns a sword")
```

## 활용

Dictionary는 다음과 같은 상황에 자주 사용됩니다.

- 인벤토리 시스템
- 플레이어 정보 저장
- 설정값 관리
- 점수판 관리