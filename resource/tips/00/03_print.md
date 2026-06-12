# print() 함수

이 함수의 기본 정보는 다음과 같습니다.

``` python
(function) def print(
    *values: object,
    sep: str | None = " ",
    end: str | None = "\n",
    file: SupportsWrite[str] | None = None,
    flush: Literal[False] = False
) -> None
```

값을 stream 또는 기본적으로 sys.stdout에 인쇄합니다.

선택적 키워드 인수:
- file: 파일과 유사한 객체(stream), 기본값은 sys.stdout입니다.
- sep: 값 사이에 삽입된 문자열, 기본값은 공백입니다.
- end: 마지막 값 뒤에 문자열이 추가되고, 기본적으로 \n이 추가됩니다.
- flush: 스트림을 강제로 플러시할지 여부.

과제수행 중 `sep=`과 `end=`를 적절히 사용하여 출력문을 제어하는 것을 권장합니다.