# Python 실행 환경 확인

## sys.executable

현재 코드를 실행하고 있는 Python 실행 파일의 경로를 확인합니다.

```python
import sys

print(sys.executable)
```

## sys.prefix와 sys.base_prefix

일반 환경에서는 두 값이 대체로 같습니다.

가상환경에서는 `sys.prefix`가 가상환경 경로를 가리키고, `sys.base_prefix`는 기반 Python 경로를 가리킵니다.

```python
import sys

inside_venv: bool = sys.prefix != sys.base_prefix
print(inside_venv)
```

## site-packages

외부 라이브러리가 설치되는 경로는 `site` 모듈로 확인할 수 있습니다.

```python
import site

print(site.getsitepackages())
```

가상환경 안과 밖에서 같은 코드를 실행하여 경로 차이를 비교해볼 수 있습니다.
