# finally

finally 블록은 에러 발생 여부와 관계없이 항상 실행됩니다.

## 기본 구조

``` python
try:
    ...
except Exception:
    ...
finally:
    ...
```

언제 사용하는가?

- 파일 닫기
- 리소스 정리
- 시스템 종료 처리
- 연결 해제

등 "무조건 실행되어야 하는 코드"에 사용합니다.

## 사용 예시

``` python
try:
    raise Exception("error")
finally:
    print("Always executed")
```

