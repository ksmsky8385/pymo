# Command Line Arguments

프로그램 실행 시 전달되는 인자를 사용할 수 있습니다.

``` shell
python3 test.py hello world
```

## sys.argv

``` python
import sys

print(sys.argv)
```

출력

``` shell
['test.py', 'hello', 'world']
```

## 자주 사용하는 형태

``` python
args = sys.argv[1:]
```

프로그램 이름을 제외한 인자만 가져옵니다.
