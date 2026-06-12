# Module 과 Package

## Module

Python 파일 하나를 Module이라고 합니다.

예시:

```text
elements.py
```

사용:

```python
import elements
```

## Package

Python 파일들을 모아둔 디렉토리입니다.

예시:

```text
alchemy/
├── __init__.py
└── elements.py
```

사용:

```python
import alchemy
```

## __init__.py

해당 디렉토리를 Package로 인식시키는 파일입니다.

또한 외부에 공개할 함수들을 정의하는 역할도 수행합니다.