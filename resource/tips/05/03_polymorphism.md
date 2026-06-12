# Polymorphism

다형성은 동일한 인터페이스를 사용하지만
객체에 따라 다른 동작을 수행하는 기술입니다.

## 예시

```python
class Animal:

	def speak(self):
		pass
```

```python
class Dog(Animal):

	def speak(self):
		print("멍멍")
```

```python
class Cat(Animal):

	def speak(self):
		print("야옹")
```

```python
animals = [
	Dog(),
	Cat(),
]

for animal in animals:
	animal.speak()
```

출력

```text
멍멍
야옹
```

## Module 05 에서의 다형성

```python
for processor in processors:

	if processor.validate(data):
		processor.ingest(data)
```

DataStream은

- NumericProcessor
- TextProcessor
- LogProcessor

중 어떤 객체인지 모릅니다.

하지만 객체는 자신의 validate()를 실행합니다.

이것이 다형성입니다.

## 장점

새로운 Processor가 추가되어도
DataStream의 코드를 수정할 필요가 없습니다.