# try & except

## 기본 구조

``` python
try:
    # 에러가 발생할 수 있는 코드
except Exception as e:
    # 에러 발생 시 실행
```

작동 흐름
1. try 블록 실행
2. 에러 발생 여부 확인
3. 에러 발생 시 except로 이동
4. 프로그램 종료 없이 계속 진행

예시

``` python
try:
    int("abc")
except ValueError as e:
    print("Caught error:", e)
```

출력 예:
``` text
Caught error: invalid literal for int() with base 10: 'abc'
```

에러 발생 시 프로그램이 강제 종료되는 것을 막기 위해 사용합니다.