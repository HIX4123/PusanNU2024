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
