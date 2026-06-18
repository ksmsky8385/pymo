# 외부 라이브러리 확인

외부 라이브러리가 설치되지 않은 상태에서 import하면 `ModuleNotFoundError`가 발생합니다.

## 예외 처리

```python
try:
    import pandas
except ImportError:
    print("pandas가 설치되어 있지 않습니다.")
```

`ImportError`를 처리하면 traceback만 출력하는 대신 사용자에게 설치 방법을 안내할 수 있습니다.

## importlib

문자열로 모듈을 불러오거나 모듈 정보를 확인할 때 사용할 수 있습니다.

```python
import importlib

module = importlib.import_module("numpy")
print(module.__version__)
```

## 버전 확인

많은 외부 라이브러리는 `__version__` 속성으로 버전을 제공합니다.

```python
import numpy

print(numpy.__version__)
```

모든 모듈이 `__version__`을 제공하는 것은 아니므로 일반적인 프로그램에서는 속성 존재 여부도 고려해야 합니다.
