# File Object

Python에서 파일을 열면 실제 파일 데이터가 반환되는 것이 아니라

파일을 제어할 수 있는 File Object가 반환됩니다.

```python
file = open("data.txt", "r")
```

open() 함수의 반환값은 File Object 입니다.

이 객체를 통해 파일을 읽고, 쓰고, 닫을 수 있습니다.

## 데이터 읽기

### read()

파일 전체 내용을 문자열(String)로 읽어옵니다.

```python
content = file.read()
```

예시:

```text
Hello
World
```

결과:

```python
'Hello\nWorld\n'
```

## 데이터 저장

### write()

파일에 문자열을 기록합니다.

```python
file.write("Hello")
```

문자열의 길이만큼 파일에 기록됩니다.

## 파일 닫기

### close()

파일 사용이 끝났다면 반드시 닫아야 합니다.

```python
file.close()
```

운영체제는 열린 파일에 대한 자원을 유지하고 있기 때문에

사용이 끝난 파일은 정리해주는 것이 좋습니다.

## 타입 힌트

이번 모듈에서는 open()의 반환 타입을 묻고 있습니다.

typing 모듈에서는 다음과 같이 표현할 수 있습니다.

```python
import typing

file: typing.IO[str]
```

즉 open()은 문자열 입출력을 수행하는 IO 객체를 반환합니다.

## 활용

File Object는 다음 작업에 사용됩니다.

- 파일 내용 읽기
- 파일 내용 저장
- 파일 한 줄 읽기
- 파일 닫기

파일 작업의 대부분은 File Object를 통해 수행됩니다.