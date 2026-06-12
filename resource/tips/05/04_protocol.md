# Protocol

Protocol은 덕 타이핑(Duck Typing)을 위한 인터페이스입니다.

## Duck Typing

Python에는 다음과 같은 철학이 있습니다.

**"오리처럼 걷고 오리처럼 울면 오리다."**

즉, 상속 여부보다

"필요한 메서드를 가지고 있는가"

를 중요하게 생각합니다.

## Protocol 예시

```python
from typing import Protocol

class ExportPlugin(Protocol):

	def process_output(self, data):
		...
```

## 구현 클래스

```python
class CsvPlugin:

	def process_output(self, data):
		pass
```

```python
class JsonPlugin:

	def process_output(self, data):
		pass
```

상속하지 않았지만

process_output()

메서드를 제공하므로 Protocol을 만족합니다.

## 장점

새로운 Plugin을 추가해도 DataStream 코드를 수정하지 않아도 됩니다.