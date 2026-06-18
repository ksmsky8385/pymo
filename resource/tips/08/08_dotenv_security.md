# python-dotenv와 보안

`.env` 파일은 개발 환경에서 사용할 환경변수를 파일로 관리합니다.

예시:

```text
MATRIX_MODE=development
DATABASE_URL=sqlite:///matrix.db
LOG_LEVEL=DEBUG
```

## python-dotenv

`python-dotenv` 라이브러리의 `load_dotenv()`는 `.env` 파일의 값을 환경변수로 불러옵니다.

```python
import os
from dotenv import load_dotenv

load_dotenv()
mode: str = os.getenv("MATRIX_MODE", "development")
```

기본 동작에서는 이미 운영체제에 설정된 환경변수를 `.env` 값으로 덮어쓰지 않습니다. 따라서 실행 명령에서 전달한 운영 설정을 우선하여 사용할 수 있습니다.

## .env.example

`.env.example`에는 실제 비밀값 대신 필요한 변수 이름과 예시값을 작성합니다.

다른 사용자는 이를 복사하여 자신의 `.env`를 만들 수 있습니다.

```shell
cp .env.example .env
```

## .gitignore

실제 API 키와 비밀번호가 포함될 수 있는 `.env`는 Git에서 제외해야 합니다.

```gitignore
.env
```

- `.env`: 실제 설정이므로 커밋하지 않음
- `.env.example`: 설정 형식을 공유하기 위해 커밋

이미 커밋된 비밀값은 `.gitignore`를 추가하는 것만으로 Git 기록에서 사라지지 않으므로 주의해야 합니다.
