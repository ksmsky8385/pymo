# Data Library 기초

## NumPy

NumPy는 수치 계산과 배열 처리를 위한 라이브러리입니다.

```python
import numpy as np

values = np.random.randint(0, 100, size=10)
print(values)
print(values.mean())
```

`np.random`을 사용하면 하드코딩된 목록 대신 테스트용 데이터를 생성할 수 있습니다.

## pandas

pandas의 `DataFrame`은 행과 열로 구성된 표 형태의 데이터를 다룹니다.

```python
import pandas as pd

frame = pd.DataFrame({"signal": [10, 20, 30]})
print(frame.describe())
```

## matplotlib

matplotlib은 데이터를 그래프로 표현하고 이미지 파일로 저장할 수 있습니다.

```python
import matplotlib.pyplot as plt

plt.plot([1, 2, 3], [10, 20, 15])
plt.savefig("result.png")
plt.close()
```

파일 저장 후 `plt.close()`를 호출하면 사용이 끝난 그래프 자원을 정리할 수 있습니다.
