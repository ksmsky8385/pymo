# Import 방식

Python에는 여러 Import 방식이 존재합니다.

## import module

```python
import elements

elements.create_fire()
```

모듈 전체를 가져옵니다.

## from module import name

```python
from elements import create_fire

create_fire()
```

특정 함수만 가져옵니다.

## alias

```python
import elements as el

el.create_fire()
```

짧은 이름으로 사용할 수 있습니다.

## 언제 사용할까?

모듈 전체를 사용할 경우

```python
import module
```

특정 함수만 사용할 경우

```python
from module import function
```

형태가 일반적으로 사용됩니다.