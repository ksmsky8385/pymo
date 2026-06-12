# Exception Handling

파일을 다루는 작업 중에서도 예외처리가 필요합니다.

- 존재하지 않는 파일
- 접근 권한이 없는 파일
- 잘못된 입력값

등 다양한 문제가 발생할 수 있습니다.

이러한 문제를 Exception(예외)이라고 부릅니다.

## try / except

try / except 문법을 사용하여 예외를 처리합니다.

```python
try:
    file = open("data.txt")
except Exception as e:
    print(e)
```

예외가 발생하면 프로그램이 종료되지 않고

except 블록이 실행됩니다.

## Exception 객체

예외 정보는 변수로 받을 수 있습니다.

```python
except Exception as e:
    print(e)
```

예시:

```text
[Errno 2] No such file or directory: 'foo'
```

실제 운영체제가 전달한 오류 메시지를 그대로 확인할 수 있습니다.

## FileNotFoundError

존재하지 않는 파일을 열려고 할 때 발생합니다.

```python
open("unknown.txt")
```

결과:

```text
[Errno 2] No such file or directory
```

가장 흔하게 발생하는 파일 예외입니다.

---

## PermissionError

접근 권한이 없는 파일을 열려고 할 때 발생합니다.

```python
open("/etc/master.passwd")
```

결과:

```text
[Errno 13] Permission denied
```

파일은 존재하지만 읽거나 수정할 권한이 없다는 의미입니다.

---

## 운영체제와의 관계

파일 작업은 Python이 직접 수행하는 것이 아닙니다.

실제로는 운영체제에게 요청을 보내고

운영체제가 결과를 반환합니다.

```text
Python
 ↓
Operating System
 ↓
File System
```

따라서 예외 메시지에는 운영체제의 오류 코드가 포함됩니다.

---

## Errno

오류 메시지의 숫자는 운영체제 오류 번호입니다.

예시:

```text
Errno 2
```

파일 없음

```text
Errno 13
```

권한 없음

운영체제는 이러한 번호를 통해 오류 종류를 구분합니다.

---

## 활용

파일 시스템 예외 처리는

- 안정적인 프로그램 작성
- 사용자 친화적 오류 메시지 출력
- 비정상 종료 방지

를 위해 반드시 필요합니다.