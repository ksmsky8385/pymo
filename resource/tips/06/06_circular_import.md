# Circular Import

## Circular Import란?

두 개 이상의 모듈이 서로를 import 하는 상황을 의미합니다.

예시:

A.py

```python
from B import func
```

B.py

```python
from A import func
```

위와 같은 구조를 Circular Import(순환 참조)라고 합니다.

## 왜 문제가 될까?

Python은 import 시 모듈을 한 번만 로드하며 초기화합니다.

하지만 초기화가 끝나지 않은 모듈을 다시 import 하게 되면 필요한 함수나 변수 생성이 완료되지 않은 상태가 됩니다.

그 결과 다음과 같은 예외가 발생할 수 있습니다.

```text
ImportError
```

또는

```text
AttributeError
```

## 대표적인 해결 방법

- 모듈 간 의존성 제거
- 공통 기능을 별도 파일로 분리
- 함수 내부에서 필요한 시점에 import 수행
- 설계를 변경하여 참조 방향 단순화

일반적으로는 공통 기능 분리가 가장 권장되는 방법입니다.
