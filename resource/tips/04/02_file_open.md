# File Open

파일을 사용하기 위해서는 먼저 운영체제에게 해당 파일을 열어달라고 요청해야 합니다.

Python에서는 open() 함수를 사용합니다.

```python
file = open("data.txt", "r")
```

open()은 파일 객체(File Object)를 반환합니다.

이 객체를 통해 파일의 데이터를 읽거나 저장할 수 있습니다.

## 주요 모드

### 읽기 (Read)

```python
file = open("data.txt", "r")
```

파일 내용을 읽기 위해 사용합니다.

### 쓰기 (Write)

```python
file = open("data.txt", "w")
```

파일을 새로 생성하거나 기존 내용을 덮어씁니다.

### 이어쓰기 (Append)

```python
file = open("data.txt", "a")
```

기존 내용을 유지한 채 파일 끝에 데이터를 추가합니다.

## 주의사항

파일을 열었다면 반드시 닫아야 합니다.

```python
file.close()
```

닫지 않으면 자원(Resource)이 낭비될 수 있습니다.

이 문제를 해결하기 위해 Python은 Context Manager와 with 문법을 제공합니다.