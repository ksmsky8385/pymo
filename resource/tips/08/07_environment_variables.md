# Environment Variables

환경변수는 프로그램 외부에서 설정값을 전달하는 방법입니다.

코드를 수정하지 않고 개발 환경과 운영 환경의 설정을 다르게 지정할 수 있습니다.

## 값 읽기

```python
import os

mode: str = os.getenv("MATRIX_MODE", "development")
api_key: str | None = os.getenv("API_KEY")
```

두 번째 인자는 환경변수가 없을 때 사용할 기본값입니다.

기본값이 없다면 반환값은 `None`이 될 수 있으므로 확인이 필요합니다.

```python
if api_key is None:
    print("API_KEY가 설정되어 있지 않습니다.")
```

## 명령 실행 시 전달

```shell
MATRIX_MODE=production API_KEY=secret123 python3 oracle.py
```

이 방식으로 전달한 값은 해당 명령이 실행되는 동안 사용할 수 있습니다.

비밀번호와 API 키를 Python 코드에 직접 작성하지 않고 외부 설정으로 분리하는 것이 중요합니다.
