# Dependency Management

Dependency는 프로그램 실행에 필요한 외부 라이브러리를 의미합니다.

## pip와 requirements.txt

pip는 Python 패키지를 설치하는 도구입니다.

```shell
pip install pandas
```

`requirements.txt`에는 필요한 패키지와 버전 조건을 기록할 수 있습니다.

```text
pandas==2.1.0
numpy>=1.25.0
```

설치:

```shell
pip install -r requirements.txt
```

## Poetry와 pyproject.toml

Poetry는 의존성 선언, 버전 해결, 가상환경 및 패키지 실행을 함께 관리합니다.

```shell
poetry install
poetry run python loading.py
```

`pyproject.toml`에는 프로젝트 정보와 의존성을 선언하고, `poetry.lock`에는 실제로 선택된 의존성 버전이 기록됩니다.

## 차이

- pip: 패키지 설치 도구
- Poetry: 프로젝트와 의존성 환경을 함께 관리하는 도구

두 방식 모두 의존성 파일을 통해 다른 사용자가 동일한 실행 환경을 다시 만들 수 있게 합니다.
