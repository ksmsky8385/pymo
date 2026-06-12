# Exception Types

Python은 상황마다 서로 다른 Exception 타입을 사용합니다.

## 주요 Exception 종류

- ValueError

    잘못된 값 전달

    ``` python
    int("abc")
    ```

- ZeroDivisionError

    0으로 나누기

    ``` python
    10 / 0
    ```

- FileNotFoundError

    존재하지 않는 파일 열기

    ``` python
    open("missing.txt")
    ```

- TypeError

    호환되지 않는 타입 연산

    ``` python
    "hello" + 3
    ```

    mypy 정적 검사 시 TypeError 강제 발생 코드에서 적발될 수 있습니다.
    코드 뒤에 `# type: ignore[operator]` 주석을 활용하여 무시할 수 있습니다.

## 여러 Exception 한번에 처리하기

``` python
except (ValueError, TypeError) as e:
    print(e)
```