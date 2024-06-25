# 공학선형대수학

## 벡터와 행렬

- 스칼라: 무차원 값
- 벡터: 1차원 배열
  - 열벡터: $\begin{bmatrix} 1 \\ 2 \\ 3 \end{bmatrix} \in \mathbb{R}^{n \times 1}$
  - 행벡터: $\begin{bmatrix} 1 & 2 & 3 \end{bmatrix} \in \mathbb{R}^{1 \times n}$
- 행렬: 2차원 배열
- 텐서: 3차원 이상의 배열
  
### 벡터연산

- 아다마르곱
  - $\begin{bmatrix} 1 \\ 2 \\ 3 \end{bmatrix} \circ \begin{bmatrix} 4 \\ 5 \\ 6 \end{bmatrix} = \begin{bmatrix} 1 \times 4 \\ 2 \times 5 \\ 3 \times 6 \end{bmatrix}$
- 내적(스칼라곱, 도트곱)
  - $\begin{bmatrix} 1 & 2 & 3 \end{bmatrix} \cdot \begin{bmatrix} 4 \\ 5 \\ 6 \end{bmatrix} = 1 \times 4 + 2 \times 5 + 3 \times 6$
- 외적(벡터곱, 크로스곱)
  - $\begin{bmatrix} 1 \\ 2 \\ 3 \end{bmatrix} \times \begin{bmatrix} 4 \\ 5 \\ 6 \end{bmatrix} = \begin{bmatrix} 2 \times 6 - 3 \times 5 \\ 3 \times 4 - 1 \times 6 \\ 1 \times 5 - 2 \times 4 \end{bmatrix}$

### 행렬연산

- 아다마르곱
  - $\begin{bmatrix} 1 & 2 \\ 3 & 4 \end{bmatrix} \circ \begin{bmatrix} 5 & 6 \\ 7 & 8 \end{bmatrix} = \begin{bmatrix} 1 \times 5 & 2 \times 6 \\ 3 \times 7 & 4 \times 8 \end{bmatrix}$
- 행렬곱
  - $\begin{bmatrix} 1 & 2 \\ 3 & 4 \end{bmatrix} \times \begin{bmatrix} 5 & 6 \\ 7 & 8 \end{bmatrix} = \begin{bmatrix} 1 \times 5 + 2 \times 7 & 1 \times 6 + 2 \times 8 \\ 3 \times 5 + 4 \times 7 & 3 \times 6 + 4 \times 8 \end{bmatrix}$
  - 교환법칙 _**성립하지 않음**_(단, 항등행렬은 예외)
- 역행렬
  - $A^{-1} = \dfrac{1}{ad-bc} \begin{bmatrix} d & -b \\ -c & a \end{bmatrix}$
  - $\left(ABC\right)^{-1} = C^{-1}B^{-1}A^{-1}$

## 선형방정식

### 정확한 삼각형 형태

### 행 사다리꼴 형태

#### 가우스 소거법

### 감소된 행 사다리꼴 형태

- 각 행에서 0이 아닌 첫번째 원소가 그 열에서 0이 아닌 유일한 원소
- ex) $\left[\begin{array}{cccc|c} 1 & 0 & 0 & -1 & 330 \\ 0 & 1 & 0 & -1 & 170 \\ 0 & 0 & 1 & -1 & 210 \\ 0 & 0 & 0 & 0 & 0 \end{array}\right]$

#### 가우스-조르단 소거법

### 동종 시스템

- 우변의 상수가 모두 0인 경우
- 항상 모순이 아님

### 기본 행렬

## 행렬대수학

### 특이 행렬

- 역행렬이 존재하지 않는 행렬

## 행렬식

- 특이행렬 판별식
- 행렬식의 성질
  - $|A^T| = |A|$
  - $|AB| = |A||B|$
  - $|A^{-1}| = \dfrac{1}{|A|}$
  - $|cA| = c^n|A|$
  - $|A| = 0 \iff A$는 특이행렬
  - $|A| = 0 \iff A$는 역행렬이 존재하지 않음
  - 삼각행렬의 행렬식은 대각원소의 곱
  - 0만 있는 행이나 열이 하나라도 있으면 행렬식은 0
  - 완전히 동일한 두 개의 행이나 열이 있으면 행렬식은 0

### 1차원 행렬식

- $\begin{vmatrix} a \end{vmatrix} = a$

### 2차원 행렬식

- $\begin{vmatrix} a & b \\ c & d \end{vmatrix} = ad - bc$

### 3차원 행렬식

- $\begin{vmatrix} a & b & c \\ d & e & f \\ g & h & i \end{vmatrix} = aei + bfg + cdh - ceg - bdi - afh$ (사루스 법칙)

### 소행렬식

- 주어진 행렬에서 특정 행과 열을 제거한 행렬식

### 여인수

- $C_{ij} = (-1)^{i+j} \begin{vmatrix} M_{ij} \end{vmatrix}$

#### 여인수 전개

- $|A| = \sum_{j=1}^{n} a_{ij}C_{ij}$

## 벡터공간

## 선형독립

## 선형변환

## 직교성

## 최소제곱법

## 직교화

## 고유값과 고유벡터

## 대각화

## 특이값분해
