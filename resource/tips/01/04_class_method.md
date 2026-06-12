# 클래스 메서드 (@classmethod)

클래스 자체를 인자로 받으며, 클래스 상태를 변경하거나 부모/자식 클래스의 정보를 다룰 때 사용합니다.

``` python
    class Plant:
        species_count = 0  # 클래스 변수

        @classmethod
        def increment_count(cls) -> None:
            cls.species_count += 1
```

첫 번째 인자로 **무조건 클래스 자체(cls)** 를 받습니다. 인스턴스를 생성하지 않고 `클래스이름.메서드이름()`으로 바로 호출할 수 있습니다.
