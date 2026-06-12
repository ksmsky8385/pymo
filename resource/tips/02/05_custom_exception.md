# Custom Exception

Python은 사용자 정의 Exception을 만들 수 있습니다.

## 기본 구조

``` python
class GardenError(Exception):
    pass
```

에러 의미를 명확하게 구분하기 위해 사용합니다.

예:

- PlantError
- WaterError
- DatabaseError
- NetworkError

예외 클래스의 상속 자식클래스 생성도 가능합니다.