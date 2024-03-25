# 논리회로 및 설계ㅣ

## 복잡성 관리 기술

- 추상화: TMI 가지치기i
- 규율화: 모래주머니
- 3Y
  - 계층성
  - 모듈성
  - 단순성

## 조합논리회로

- 논리회로의 기본
  - 입력
  - 출력
  - 기능적 관계
  - 시간적 관계

- 논리회로의 분류
  - 조합논리회로
    - 입력만을 가지고 출력을 결정
    - 메모리가 없음
  - 순차논리회로
    - 입력과 내부 상태(이전 입력 등)에 의해 출력이 결정
    - 메모리가 있음

- 조합논리회로의 규칙
  - 모든 요소는 조합적임
  - 모든 노드는 하나 이상의 입력을 가짐
  - 모든 노드는 단 하나의 출력을 가짐
  - 모든 노드는 순환을 가지지 않음

## 불리언 방정식

### 사전 정의

- Complement: $\overline{A}, \overline{B}, \overline{C}, \cdots$
  - 보수
- Literal: $A, \overline{A}, B, \overline{B}, C, \overline{C}, \cdots$
  - 변수나 변수의 보수
- Implicit AND: $AB = A \cdot B$
  - 리터럴의 논리곱
- Minterm: $m_i = A \cdot B \cdot C$
  - 모든 입력 변수의 논리곱
- Maxterm: $M_i = A + B + C$
  - 모든 입력 변수의 논리합

### 곱의 합(Sum of Products, SOP)

- 모든 불리언 방정식은 SOP로 표현 가능
- 각 줄은 minterm
- 각 줄의 minterm은 해당 줄에서 참

### 합의 곱(Product of Sums, POS)

- 모든 불리언 방정식은 POS로 표현 가능
- 각 줄은 maxterm
- 각 줄의 maxterm은 해당 줄에서 거짓

## 부울 대수: 공리

- A1: 바이너리 필드
  - $B \not= 1 \Rightarrow B = 0$
- A2: NOT
  - $\overline{0} = 1$
- A3: AND/OR
  - $0 \cdot 0 = 0$
- A4: AND/OR
  - $1 \cdot 0 = 0$
- A5: AND/OR
  - $0 \cdot 1 = 1 \cdot 0 = 0$

## 부울 대수: 정리

- T1: 항등
  - $A \cdot 1 = A$
  - $A + 0 = A$
- T2: Null
  - $A \cdot 0 = 0$
  - $A + 1 = 1$
- T3: 멱등성
  - $A \cdot A = A$
  - $A + A = A$
- T4: 대합
  - $\overline{\overline{A}} = A$
- T5: 보수
  - $A \cdot \overline{A} = 0$
  - $A + \overline{A} = 1$
- T6: 교환법칙
  - $A \cdot B = B \cdot A$
  - $A + B = B + A$
- T7: 결합법칙
  - $(A \cdot B) \cdot C = A \cdot (B \cdot C)$
  - $(A + B) + C = A + (B + C)$
- T8: 분배법칙
  - $A \cdot (B + C) = A \cdot B + A \cdot C$
  - $A + B \cdot C = (A + B) \cdot (A + C)$
- T9: Covering
  - $A + A \cdot B = A$
  - $A \cdot (A + B) = A$
- T10: Combining
  - $(A \cdot B)g + (A \cdot \overline{B}) = A$
  - $(A + B) \cdot (A + \overline{B}) = A$
- T11: Consensus
  - $(A + B) \cdot (\overline{A} + C) \cdot (B + C) = (A + B) \cdot (\overline{A} + C)$
  - $(A \cdot B) + (\overline{A} \cdot C) + (B \cdot C) = (A \cdot B) + (\overline{A} \cdot C)$
- T12: 드모르간의 정리
  - $\overline{A \cdot B} = \overline{A} + \overline{B}$
  - $\overline{A + B} = \overline{A} \cdot \overline{B}$