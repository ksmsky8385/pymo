# Standard Streams

운영체제는 프로그램에게 기본 입출력 통로를 제공합니다.

이를 Standard Stream이라고 부릅니다.

모든 CLI 프로그램은 기본적으로 이 세 가지 스트림을 사용합니다.


## stdin

Standard Input

사용자의 입력을 읽는 스트림입니다.

```python
sys.stdin
```

## stdout

Standard Output

일반 메시지를 출력하는 스트림입니다.

```python
sys.stdout
```

print()는 기본적으로 stdout을 사용합니다.

```python
print("Hello")
```

## stderr

Standard Error

오류 메시지를 출력하는 전용 스트림입니다.

```python
sys.stderr
```

예시:

```python
print("Error", file=sys.stderr)
```

## 왜 분리할까?

일반 출력과 오류 출력을 구분할 수 있기 때문입니다.

예시:

```text
stdout → 정상 결과
stderr → 오류 메시지
```

실제 서버 프로그램과 CLI 프로그램에서 매우 중요하게 사용됩니다.

## stdin으로 입력 받기

이번 모듈에서는 input() 대신 stdin을 사용합니다.

```python
name = sys.stdin.readline()
```

사용자가 입력한 한 줄을 읽어옵니다.

## 개행 문자 제거

readline()은 마지막에 개행 문자를 포함합니다.

```python
name = sys.stdin.readline()
```

입력:

```text
hello
```

실제 값:

```python
"hello\n"
```

보통 strip() 또는 rstrip()을 사용하여 제거합니다.

```python
name = sys.stdin.readline().strip()
```

## 활용

표준 스트림은

- CLI 프로그램
- 쉘 스크립트
- 서버 로그
- 파이프 처리

등 다양한 환경에서 사용됩니다.