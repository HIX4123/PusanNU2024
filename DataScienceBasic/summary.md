# 데이터과학입문

## 데이터과학이란?

- 데이터마이닝
- 머신 러닝
- 빅 데이터

## numpy 명령어 모음

```python
arange([start,] stop[, step,], dtype=None)
```

- 지정한 범위에 해당하는 데이터를 생성
- start: 시작값
- stop: 종료값
- step: 간격
- dtype: 데이터 타입

```python
reshape(a, newshape)
```

- 데이터를 지정한 모양으로 변형
- a: 데이터
- newshape: 변형할 모양

```python
zeros(shape, dtype=float)
```

- 지정한 모양에 해당하는 데이터를 0으로 채움
- shape: 모양
- dtype: 데이터 타입

```python
array(object, dtype=None, copy=True, order='K', subok=False, ndmin=0)
```

- 데이터를 배열로 변환
- object: 데이터
- dtype: 데이터 타입
- copy: 복사 여부
- order: 배열 순서
- subok: 하위 클래스 여부
- ndmin: 최소 차원

## pandas 명령어 모음

```python
read_csv(filepath_or_buffer, sep=',', delimiter=None, header='infer', names=None, index_col=None, usecols=None)
```

- CSV 파일을 읽음
- filepath_or_buffer: 파일 경로
- sep: 구분자
- delimiter: 구분자
- header: 헤더
- names: 열 이름
- index_col: 인덱스 열
- usecols: 사용할 열

```python
Dataframe(data=None, index=None, columns=None, dtype=None, copy=False)
```

- 데이터프레임 생성
- data: 데이터
- index: 인덱스
- columns: 열 이름
- dtype: 데이터 타입
- copy: 복사 여부

```python
Dataframe.insert(loc, column, value, allow_duplicates=False)
```

- 열 추가
- loc: 위치
- column: 열 이름
- value: 값
- allow_duplicates: 중복 허용 여부

```python
Dataframe.rename(columns=None, index=None, copy=True, inplace=False, level=None)
```

- 열 이름 변경
- columns: 열 이름
- index: 인덱스
- copy: 복사 여부
- inplace: 원본 변경 여부
- level: 레벨

```python
Dataframe.sort_values(by, axis=0, ascending=True, inplace=False, kind='quicksort', na_position='last')
```

- 정렬
- by: 기준
- axis: 축
- ascending: 오름차순 여부
- inplace: 원본 변경 여부
- kind: 정렬 방법
- na_position: 결측치 위치

```python
Dataframe.head(n=5)
```

- 처음 n개 행 출력
- n: 행 개수

```python