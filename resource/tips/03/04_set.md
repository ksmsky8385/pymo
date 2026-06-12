# Set

Set은 **중복을 허용하지 않는 자료형**입니다.

같은 값을 여러 번 저장해도 하나만 유지됩니다.

```python
achievements = {
    "Explorer",
    "Hunter",
    "Explorer"
}

print(achievements)
```

출력

```shell
{'Explorer', 'Hunter'}
```

---

## 합집합 (Union)

여러 Set에 존재하는 모든 요소를 합칩니다.

```python
a = {"Sword", "Shield"}
b = {"Shield", "Potion"}

print(a.union(b))
```

결과

```shell
{'Sword', 'Shield', 'Potion'}
```

---

## 교집합 (Intersection)

두 Set에 모두 존재하는 요소만 추출합니다.

```python
a = {"Sword", "Shield"}
b = {"Shield", "Potion"}

print(a.intersection(b))
```

결과

```shell
{'Shield'}
```

## 차집합 (Difference)

다른 Set에는 없고 현재 Set에만 존재하는 요소를 추출합니다.

```python
a = {"Sword", "Shield"}
b = {"Shield", "Potion"}

print(a.difference(b))
```

결과

```shell
{'Sword'}
```

## 활용

Set은 다음과 같은 상황에 자주 사용됩니다.

- 업적 시스템
- 태그 관리
- 중복 제거
- 공통 데이터 찾기