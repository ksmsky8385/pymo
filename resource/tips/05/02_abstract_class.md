# Abstract Class

추상 클래스는 객체를 직접 생성하지 못하는 클래스입니다.

설계도 역할을 수행합니다.

Python에서는 abc 모듈을 사용합니다.

```python
import abc

class DataProcessor(abc.ABC):
	pass
```

## Abstract Method

자식 클래스가 반드시 구현해야 하는 메서드입니다.

```python
import abc

class DataProcessor(abc.ABC):

	@abc.abstractmethod
	def validate(self, data):
		pass
```

## 특징

다음 코드는 실행할 수 없습니다.

```python
processor = DataProcessor()
```

결과

```text
TypeError
```

추상 메서드를 구현한 자식 클래스만 생성할 수 있습니다.

```python
class NumericProcessor(DataProcessor):

	def validate(self, data):
		return True
```

## 추상 클래스에 일반 메서드 만들기

```python
class DataProcessor(abc.ABC):

	@abc.abstractmethod
	def validate(self, data):
		pass

	def output(self):
		pass
```

추상 메서드와 일반 메서드는 함께 사용할 수 있습니다.