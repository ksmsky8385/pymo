# Virtual Environment

가상환경은 프로젝트별로 독립된 Python 실행 환경을 만드는 기능입니다.

프로젝트마다 필요한 라이브러리와 버전이 다를 수 있으므로 전역 Python 환경과 분리하여 관리합니다.

## 생성

```shell
python3 -m venv matrix_env
```

## 활성화

Linux와 macOS:

```shell
source matrix_env/bin/activate
```

또는
```shell
. matrix_env/bin/activate
```

Windows:

```shell
matrix_env\Scripts\activate
```

## 비활성화

```shell
deactivate
```

가상환경을 활성화한 상태에서 설치한 라이브러리는 일반적으로 해당 가상환경 내부에만 설치됩니다.

가상환경 디렉토리는 크기가 크고 다시 생성할 수 있으므로 Git 저장소에는 제출하지 않는 것이 일반적입니다.
