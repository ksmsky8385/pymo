# 클래스 상속 및 오버라이딩 (Inheritance & Overriding)

상속은 기존 클래스(부모)의 속성과 기능을 그대로 물려받아, 새로운 클래스(자식)를 만드는 기능입니다.

## 1. 기본 상속 문법

``` python
class 자식클래스(부모클래스):
    pass
```

자식 클래스는 부모 클래스에 정의된 모든 인스턴스 변수와 메서드를 그대로 가져와 사용할 수 있습니다.

## 2. 메서드 오버라이딩 (Method Overriding)

부모 클래스로부터 물려받은 메서드를 자식 클래스에서 **같은 이름으로 다시 정의하여 덮어쓰는 것** 을 말합니다.

```python
class Tree(Plant):  # Plant를 상속받음
    def show(self) -> None:
        # 부모의 show() 메서드를 무시하고 자식만의 방식으로 새로 정의
        print(f"[나무] {self.name}는 현재 {self.height}cm 입니다.")
```

자식 인스턴스에서 해당 메서드를 호출하면, 부모의 메서드 대신 **재정의된 자식의 메서드가 우선적으로 실행** 됩니다.

## 3. super()를 통한 부모 메서드 호출

자식 클래스에서 부모 클래스의 기능을 완전히 버리지 않고, **일부 기능을 확장** 하고 싶을 때 사용합니다.

```python
class Flower(Plant):
    def __init__(self, name: str, height: int, age: int, color: str) -> None:
        # 1. 부모 클래스의 __init__을 호출하여 기본 속성 초기화
        super().__init__(name, height, age)
        # 2. 자식 클래스만의 새로운 속성 추가
        self.color = color
```

`super()`는 현재 클래스의 부모 클래스를 가리킵니다. 이를 통해 부모의 생성자(`__init__`)나 일반 메서드를 자식 내부에서 호출할 수 있습니다.

자식 클래스에서 `__init__`을 새로 정의할 때, `super().__init__(...)`을 호출하지 않으면 부모가 만들어둔 기본 속성들(`self.name`, `self.height` 등)이 누락되어 `AttributeError`가 발생할 수 있습니다.