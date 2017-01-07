# Matrix Tracing

This problem was posted by [dheeraj][author] on [HackerRank][source].

## Problem
Given an $${M}\times{N}$$ matrix find the number of unique paths from the top left corner to the bottom right corner. In each iteration we can only move RIGHT or DOWN. The result should be in mod $$10^9+7$$.

## Constraints
$${1}\le{M,N}\le{10^6}$$

## Solution
### Phase 1

To start off let's use some egde cases. If the matrix given is $${1}\times{1}$$ then there is only one possible path. If $$M=1$$ or $$N=1$$ there is still only one possible path. We can only move in a single direction.

Now let's try an example with a $${3}\times{4}$$ matrix. We can fill the first row and column with $$1$$s. Each cell in our matrix will represent the number of paths from the top left corner to the current cell. We can actually fill in the remaining cells by adding the cells to the left and above together. In order to reach $$A_{i,\ j}$$ we can either move down from $$A_{i,\ j-1}$$ or move right from $$A_{i-1,\ j}$$.

$$
\begin{bmatrix}
  1 & 1 & 1 & 1  \\
  1 & 2 & 3 & 4  \\
  1 & 3 & 6 & 10
\end{bmatrix}
$$

$$
A_{i,\ j} = \begin{cases}
  1, & \text{if } i=1 \text{ or } j=1, \\
  A_{i-1,\ j}+A_{i,\ j-1}, & \text{otherwise}.
\end{cases}
\textbf{ s.t. } i \in [1,M] \text{ and } j \in [1, N]
$$

The final result will be in the bottom right corner or our matrix. However there are some problems. There are $${M}\times{N}$$ cells in the matrix which is very inefficient as those number can become large.

### Phase 2
In order to reduce space complexity we can try storing only two vectors of the matrix at a time. We can also pick the size of each vector to be  _M_ or_ N_ based on whichever is smaller. In our example _M_ is smaller so our matrix now is _$${M}\times{2}$$_. For every iteration we replace an old column with a new column without extra swapping. If N is even the result will be $$A_{M,\ 2}$$ otherwise it will be $$A_{M,\ 1}$$.
$$
\begin{matrix}
  \begin{bmatrix}
    1 & 1 \\
    1 & 2 \\
    1 & 3 \\
  \end{bmatrix} &
  \begin{bmatrix}
    1 & 1 \\
    3 & 2 \\
    6 & 3 \\
  \end{bmatrix} &
  \begin{bmatrix}
    1 & 1 \\
    3 & 4 \\
    6 & 10 \\
  \end{bmatrix}
\end{matrix}
$$

### Phase 3
Let's represent possible paths as string with the characters R and D. Another way to get the result is to find the number of unique strings. From statistics we can use the combination formula.

We can learn the following:
1. The number of D's is _M-1_
2. The number of R's is _N-1_
3. The length of the string is _M+N-2_

$$\textbf{Ans}={m+n-2\choose m-1} = \frac{(m+n-2)!}{{(m-1)!}\times{(n-1)!}}$$

We are almost done but the answer should be in mod $$10^9+7$$. Let's use the variables _x_ and _y_ to break up our equation. Let's also use _p_ to represent the modulus which is also a large prime number.

$$
x={(m-1)!}\times{(n-1)!} \\
y=(m+n-2)!
$$

$$
\begin{align*}
  \textbf{Ans} &= \frac{y}{x}        & \\
               &= {x^{-1}}\times{y}  & \\
               &= {x^{p-2}}\times{y} & \\
               &                     & (\text{mod }p)
\end{align*}
$$

$$
\textbf{Ans} \ (\text{mod }p) = 
[{(m-1)!}\times{(n-1)!]^{p-2}}\times{(m+n-2)!}
$$


## Analysis

| Solution |   Time Complexity   |    Space Complexity    |
| :------: | :-----------------: | :--------------------: |
|    1     | $$O({M}\times{N})$$ |  $$O({M}\times{N})$$   |
|    2     | $$O({M}\times{N})$$ | $$O(\text{min}(M,N))$$ |
|    3     |     $$O(M+N)$$      |        $$O(1)$$        |

## Notes
In this problem the result is in mod _p_ but in real life it's probably more practical to know the real answer or the log of it. In that case we can might use the BigInteger class from Java.

[source]: https://www.hackerrank.com/challenges/matrix-tracing
[author]: https://www.hackerrank.com/dheeraj