# 스태틱 메서드 (@staticmethod)

클래스나 인스턴스의 상태에 전혀 관여하지 않고, 단순한 편의 기능(Helper)을 제공하는 일반 함수와 같습니다.

``` python
    class Plant:
        @staticmethod
        def is_valid_temperature(temp: int) -> bool:
            return 10 <= temp <= 35
```

`self`나 `cls` 같은 **첫 번째 고정 인자가 없습니다.** 클래스 내부에 네임스페이스만 묶여있을 뿐, 일반 함수와 완전히 동일하게 작동합니다.


메서드 안에서 **클래스 변수(위 예시의 `species_count`)에 접근하거나 수정해야 한다면** `cls`를 사용할 수 있는 `@classmethod`를 선택하고, **클래스 내부의 어떤 변수도 쓰지 않는 독립적인 기능이라면** `@staticmethod`를 선택합니다.