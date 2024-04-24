# 선형대수학 과제 3장

학번: 202355517\
학과: 컴퓨터공학과\
이름: 권민규

## 1. 다음 벡터들이 $P_3$ 공간에서 선형 독립인지 판별하라.

### (a) $x^2$, $1$, $x^2-1$

$-\left(x^2\right)+\left(1\right)+\left(x^2-1\right)=0$

$\therefore$ <u>선형 종속</u>이다.

### (b) $3$, $x$, $x^2$, $x-2$

계수 행렬 $\left[\begin{array}{cccc|c}
  0 & 0 & 1 & 0 & 0 \\
  0 & 1 & 0 & 1 & 0 \\
  3 & 0 & 0 & -2 & 0
\end{array}\right]$에서
$\left(2, -3, 0, 3\right)$의 해가 존재하므로 <u>선형 종속</u>이다.

### (c) $x+1$, $x^2$, $x-1$

1, 3번째 벡터에서 <u>선형 독립</u>임을 알 수 있다.

### (d) $x^2+2x$, $x+1$

일차항을 소거하려 할 때 나머지 항이 남아있으므로 <u>선형 독립</u>임을 알 수 있다.

## 2. $\{\mathbf{v}_1,\,\mathbf{v}_2,\,\cdots,\,\mathbf{v}_n\}$이 벡터공간 $V$의 생성 집합이고, $\mathbf{v}$가 $V$의 임의의 다른 벡터라고 하면, $\mathbf{v}, \mathbf{v}_1, \mathbf{v}_2, \cdots, \mathbf{v}_n$이 선형 종속임을 보여라.

$\mathbf{v}=c_1\mathbf{v}_1+c_2\mathbf{v}_2+\cdots+c_n\mathbf{v}_n$에서 $\mathbf{v}+d_1\mathbf{v}_1+d_2\mathbf{v}_2+\cdots+d_n\mathbf{v}_n$일 때 $c_k=d_k$의 해를 가지므로 선형 종속이다.

## 3. 다음과 같이 주어진 벡터 $\mathbf{x}_1=\begin{bmatrix}2\\1\\3\end{bmatrix}$, $\mathbf{x}_2=\begin{bmatrix}3\\-1\\4\end{bmatrix}$, $\mathbf{x}_3=\begin{bmatrix}2\\6\\4\end{bmatrix}$에 대해

### (a) $\mathbf{x}_1$, $\mathbf{x}_2$, $\mathbf{x}_3$이 선형 종속임을 보여라.

$\begin{vmatrix}
  2 & 3 & 2 \\
  1 & -1 & 6  \\
  3 & 4 & 4 
\end{vmatrix}=0$에서 선형 종속임을 알 수 있다.

### (b) $\mathbf{x}_1$와 $\mathbf{x}_2$가 선형 독립임을 보여라.

각 행을 동시에 소거시킬 수 없다.

### (c) $\text{Span}\left(\mathbf{x}_1,\,\mathbf{x}_2,\,\mathbf{x}_3\right)$의 차원을 구하라.

$x_1$, $x_2$로 기저를 이룰 수 있으므로 <u>2차원</u>이다.

### (d) $\text{Span}\left(\mathbf{x}_1,\,\mathbf{x}_2,\,\mathbf{x}_3\right)$을 기하학적으로 설명하라.

<u>원점을 통과하는 3차원상 평면</u>이다.

## 4. 다음 벡터들은 $\mathbb{R}^3$을 생성한다. 집합 $\{\mathbf{v}_1,\,\mathbf{v}_2,\,\mathbf{v}_3, \mathbf{v}_4, \mathbf{v}_5\}$가 $\mathbb{R}^3$의 기저가 되도록 감축하라.

$\mathbf{v}_1=\begin{bmatrix}1\\0\\3\end{bmatrix}$, $\mathbf{v}_2=\begin{bmatrix}2\\2\\1\end{bmatrix}$, $\mathbf{v}_3=\begin{bmatrix}1\\2\\-2\end{bmatrix}$, $\mathbf{v}_4=\begin{bmatrix}2\\0\\6\end{bmatrix}$, $\mathbf{v}_5=\begin{bmatrix}0\\4\\5\end{bmatrix}$

각 벡터들이 서로 선형독립일 때까지 벡터를 제거한다.

$\mathbf{v}_4$를 제거하면 $\underline{\mathbf{v}_1,\,\mathbf{v}_2,\,\mathbf{v}_3,\,\mathbf{v}_5}$가 기저가 된다.

## 5. 다음의 각각에 대하여 기저를 $\{\mathbf{u}_1, \mathbf{u}_2\}$에서 $\{\mathbf{e}_1, \mathbf{e}_2\}$로 변환하기 위한 천이 행렬을 구하라.

### (a) $\mathbf{u}_1=\left(1,\,-1\right)^T$, $\mathbf{u}_2=\left(1,\,2\right)^T$

$\begin{bmatrix} 1 & 1 \\ -1 & 2 \end{bmatrix}$

### (b) $\mathbf{u}_1=\left(2,\,3\right)^T$, $\mathbf{u}_2=\left(4,\,7\right)^T$

$\begin{bmatrix} 2 & 4 \\ 3 & 7 \end{bmatrix}$

### (c) $\mathbf{u}_1=\left(1,\,0\right)^T$, $\mathbf{u}_2=\left(0,\,1\right)^T$

$\begin{bmatrix} 1 & 0 \\ 0 & 1 \end{bmatrix}$

## 6. $\mathbf{u}_1=\left(1,\,1,\,1\right)^T$, $\mathbf{u}_2=\left(1,\,2,\,2\right)^T$, $\mathbf{u}_3=\left(2,\,3,\,4\right)^T$라고 하자.

### (a) $\{\mathbf{e},\,\mathbf{e}_2,\,\mathbf{e}_3\}$로부터 $\{\mathbf{u}_1,\,\mathbf{u}_2,\,\mathbf{u}_3\}$로의 기저 변환에 해당하는 천이 행렬을 구하라.

$\begin{bmatrix} 1 & 1 & 2 \\ 1 & 2 & 3 \\ 1 & 2 & 4 \end{bmatrix}^{-1}= \underline{\begin{bmatrix} 2 & 0 & 1 \\ -1 & 2 & -1 \\ 0 & -1 & 1 \end{bmatrix}}$

### (b) 기저 $\{\mathbf{u}_1, \mathbf{u}_2, \mathbf{u}_3\}$에 대한 다음 벡터들의 좌표를 구하라.

#### (i) $\left(3,\,2,\,5\right)^T$

$\begin{bmatrix} 2 & 0 & 1 \\ -1 & 2 & -1 \\ 0 & -1 & 1 \end{bmatrix}\begin{bmatrix} 3 \\ 2 \\ 5 \end{bmatrix}=\underline{\begin{bmatrix} 1 \\ -4 \\ 3 \end{bmatrix}}$

#### (ii) $\left(1,\,1,\,2\right)^T$

$\begin{bmatrix} 2 & 0 & 1 \\ -1 & 2 & -1 \\ 0 & -1 & 1 \end{bmatrix}\begin{bmatrix} 1 \\ 1 \\ 2 \end{bmatrix}=\underline{\begin{bmatrix} 0 \\ -1 \\ 1 \end{bmatrix}}$

#### (iii) $\left(2,\,3,\,2\right)^T$

$\begin{bmatrix} 2 & 0 & 1 \\ -1 & 2 & -1 \\ 0 & -1 & 1 \end{bmatrix}\begin{bmatrix} 2 \\ 3 \\ 2 \end{bmatrix}=\underline{\begin{bmatrix} 2 \\ 2 \\ -1 \end{bmatrix}}$

## 7. 다음과 같이 주어진 벡터들에 대해 $S$가 $\{\mathbf{w}_1,\,\mathbf{w}_2\}로부터 \{\mathbf{v}_1,\,\mathbf{v}_2\}$로의 천이 행렬이기 위한 벡터 $\mathbf{w}_1$과 $\mathbf{w}_2$를 구하라.

$\mathbf{v}_1=\begin{bmatrix}3\\1\end{bmatrix}$, $\mathbf{v}_2=\begin{bmatrix}4\\2\end{bmatrix}$, $S=\begin{bmatrix}2 & -5 \\ -1 & 3\end{bmatrix}$

$\begin{bmatrix}3 & 4 \\ 1 & 2\end{bmatrix}\begin{bmatrix}2 & -5 \\ -1 & 3\end{bmatrix}=\begin{bmatrix}2 & -3 \\ 0 & 1\end{bmatrix}$

$\therefore \underline{\mathbf{w}_1=\begin{bmatrix}2\\0\end{bmatrix},\,\mathbf{w}_2=\begin{bmatrix}-3\\1\end{bmatrix}}$

## 8. $\left[x,\,1\right]$과 $\left[2x-1,\,2x+1\right]$이 $P_2$의 순서 기저들이라고 하자.

### (a) $\left[2x-1,\,2x+1\right]$로부터 $\left[x,\,1\right]$로의 좌표 변환을 나타내는 천이 행렬을 구하라.

$\begin{bmatrix} 2 & 2 \\ -1 & 1 \end{bmatrix}$

### (b) $\left[x,\,1\right]$로부터 $\left[2x-1,\,2x+1\right]$로의 좌표 변환을 나타내는 천이 행렬을 구하라.

$\begin{bmatrix} 2 & 2 \\ -1 & 1 \end{bmatrix}^{-1}=\underline{\dfrac14\begin{bmatrix} 1 & -2 \\ 1 & 2 \end{bmatrix}}$

## 9. 다음 각 행렬들에 대하여 행 공간의 기저, 열 공간의 기저 및 영공간의 기저를 구하라.

### (a) $\begin{bmatrix} 1 & 3 & 2 \\ 2 & 1 & 4 \\ 4 & 7 & 8 \end{bmatrix}$

감소된 행 사다리꼴 $\begin{bmatrix} 1 & 3 & 2 \\ 0 & 1 & 0 \\ 0 & 0 & 0 \end{bmatrix}$에서

행 공간의 기저는 $\underline{\begin{bmatrix} 1 & 3 & 2 \end{bmatrix},\,\begin{bmatrix} 0 & 1 & 0 \end{bmatrix}}$이고\
열 공간의 기저는 $\underline{\begin{bmatrix} 1 \\ 2 \\ 4 \end{bmatrix},\,\begin{bmatrix} 3 \\ 1 \\ 7 \end{bmatrix}}$이며\
영공간의 기저는 $N\left(A\right)=\begin{bmatrix} -2 \\ 0 \\ 1 \end{bmatrix}\alpha$에서 $\underline{\begin{bmatrix} -2 \\ 0 \\ 1 \end{bmatrix}}$이다.

### (b) $\begin{bmatrix} -3 & 1 & 3 & 4 \\ 1 & 2 & -1 & -2 \\ -3 & 8 & 4 & 2 \end{bmatrix}$

감소된 행 사다리꼴 $\begin{bmatrix} -3 & 1 & 3 & 4 \\ 0 & 7 & 0 & 2 \\ 0 & 0 & 1 & 0 \end{bmatrix}$에서\
행 공간의 기저는 $\underline{\begin{bmatrix} -3 & 1 & 3 & 4 \end{bmatrix},\,\begin{bmatrix} 0 & 7 & 0 & 2 \end{bmatrix}, \begin{bmatrix} 0 & 0 & 1 & 0 \end{bmatrix}}$이고\
열 공간의 기저는 $\underline{\begin{bmatrix} -3 \\ 1 \\ -3 \end{bmatrix},\,\begin{bmatrix} 1 \\ 2 \\ 8 \end{bmatrix},\,\begin{bmatrix} 3 \\ -1 \\ 4 \end{bmatrix}}$이며\
영공간의 기저는 $N\left(A\right)=\begin{bmatrix} 5 \\ 7 \\ 0 \\ 2 \end{bmatrix}\alpha$에서 $\underline{\begin{bmatrix} 5 \\ 7 \\ 0 \\ 2 \end{bmatrix}}$이다.

### (c) $\begin{bmatrix} 1 & 3 & -2 & 1 \\ 2 & 1 & 3 & 2 \\ 3 & 4 & 5 & 6 \end{bmatrix}$

감소된 행 사다리꼴 $\begin{bmatrix} 1 & 3 & -2 & 1 \\ 0 & -5 & 7 & 0 \\ 0 & 0 & 4 & 3 \end{bmatrix}$에서\
행 공간의 기저는 $\underline{\begin{bmatrix} 1 & 3 & -2 & 1 \end{bmatrix},\,\begin{bmatrix} 0 & -5 & 7 & 0 \end{bmatrix},\,\begin{bmatrix} 0 & 0 & 4 & 3 \end{bmatrix}}$이고\
열 공간의 기저는 $\underline{\begin{bmatrix} 1 \\ 2 \\ 3 \end{bmatrix},\,\begin{bmatrix} 3 \\ 1 \\ 4 \end{bmatrix},\,\begin{bmatrix} -2 \\ 3 \\ 5 \end{bmatrix}}$이며\
영공간의 기저는 $N\left(A\right)=\begin{bmatrix} 13 \\ -21 \\ -15 \\ 20 \end{bmatrix}\alpha$에서 $\underline{\begin{bmatrix} 13 \\ -21 \\ -15 \\ 20 \end{bmatrix}}$이다.

## 10. $A$는 다음과 같은 감소된 사다리꼴을 갖는 $4 \times 4$ 행렬이라고 하자.

$$U=\begin{bmatrix} 1 & 0 & -1 & 1 \\ 0 & 1 & 3 & 2 \\ 0 & 0 & 0 & 0 \\ 0 & 0 & 0 & 0 \end{bmatrix}$$

만약 $\mathbf{a}_1=\begin{bmatrix} 3 \\ 2 \\ -1 \\ 2 \end{bmatrix}$, $\mathbf{a}_2=\begin{bmatrix} 1 \\ 1 \\ -2 \\ 3 \end{bmatrix}$이라면 $\mathbf{a}_3$와 $\mathbf{a}_4$를 구하라.

선행 1과 그에 대응되는 수를 이용해서 각 행을 계산할 수 있다.

$A=\underline{\begin{bmatrix} 3 & 1 & 0 & 5 \\ 2 & 1 & 1 & 4 \\ -1 & -2 & -5 & -5 \\ 2 & 3 & 7 & 8 \end{bmatrix}}$