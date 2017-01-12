---
title: Sherlock and Moving Tiles
author: Rajan Khullar
---

# Sherlock and Moving Tiles

This problem was posted by [darkshadows][author] on [HackerRank][source].

## Problem
Two congruent squares or tiles are placed such that their bottom left corners coincide with the origin of the Cartesian plane and their sides are paralled to the axis. Let $$L$$ represent the length of one side of either square.

At time $$t=0$$ both squares start moving along the line $$y=x$$ with velocities $$S_1$$ and $$S_2$$.  Let $$A$$ represent the area of the intersection between the two squares at any given time.

We need to solve for $$t$$ given $$L$$, $$S_1$$, $$S_2$$ and $$A$$. We can assume that the units of distance, time and velocity are meters, seconds and meters per second respecively.

## Constraints
$${S_1,S_2}\gt{0}$$
$${S_1}\neq{S_2}$$
$${0}\leq{A}\leq{L^2}$$

## Solution

| ![figure1][figure2] | ![figure2][figure3] |
| :-----------------: | :-----------------: |
|   **_Figure 1_**    |   **_Figure 2_**    |

In order to solve the problem we need to focus on the bottom left and top right corners of the squares. Figure 2 shows represents the overall situation. Since the two squares are moving at different speeds the area in red will decrease over time until eventually there is no intersection at all. Let's assume that $${S_2}\gt{S_1}$$. The area of interest is the square bounded by the corners $$B_t$$ and $$C_t$$. Point $$B_t$$ is the top right corner of $$\square_1$$ and point $$C_t$$ is the bottom left corner of $$\square_2$$.

So how do we find the position of an individual square's corners? Remember, the bottom left corners of both squares coincide with the origin at time $$t=0$$. If the square moves along the line $$y=x$$ with velocity $$S$$, then by time $$t$$ it has traveled a total distance of $${S}\times{t}$$. Let $$G_t$$ and $$H_t$$ denote the bottom left and top right corners respectively. Since those points always intersect with the line $$y=x$$, an equation like  $$P_t=v$$ may actually mean $$P_t=(v,v)$$.

| $$G_t=\frac{St}{\sqrt{2}} $$ | $$H_t=G_t+L=\frac{St+L\sqrt2}{\sqrt2}$$ |
| :--------------------------: | :-------------------------------------: |
|  _**Equation** for_ $$G_t$$  |       _**Equation** for_ $$H_t$$        |

| $$B_t=\frac{S_1t+L\sqrt2}{\sqrt{2}}$$ | $$C_t=\frac{S_2t}{ \sqrt2 }$$ |
| :-----------------------------------: | :---------------------------: |
|      _**Equation** for_ $$B_t$$       |  _**Equation** for_ $$C_t$$   |

After solving for all our points of interest, we can finally determine the time at which the overlapping area would be $$A$$. Also note that we can remove the assumption of $${S_2}\gt{S_1}$$ by taking the absolute value of $$S_2-S_1$$.

|           $$B_t-C_t=\sqrt{A}$$           |
| :--------------------------------------: |
| $$\frac{S_1t+L\sqrt2-S_2t}{\sqrt2}=\sqrt{A}$$ |
|     $$S_1t+L\sqrt2-S_2t=\sqrt{2A}$$      |
|     $$S_1t-S_2t=\sqrt{2A}-L\sqrt2$$      |
|    $$(S_1-S_2)t=(\sqrt{A}-L)\sqrt2$$     |
|   $$\|S_2-S_1\|t=(L-\sqrt{A})\sqrt2$$    |
| $$t=\frac{L-\sqrt{A}}{\|S_2-S_1\|}\sqrt2$$ |
|         _**Equation** for_ $$t$$         |

## Notes
If $$A=L^2$$ then the numerator of our equation evaluates to zero, which results in $$t=0$$. This makes sense since initially both squares are in the same position and their sizes are also identical.

If we want to determine the exact time that the two squares no longer overlap, then we can set $$A=0$$ and our equation reduces to $$t=\frac{L\sqrt2}{|S_2-S_1|}$$.


[source]: https://www.hackerrank.com/challenges/sherlock-and-moving-tiles
[author]: https://www.hackerrank.com/darkshadows

[figure2]: https://rkhullar.github.io/sherlock-and-moving-tiles/images/figure2.svg
[figure3]: https://rkhullar.github.io/sherlock-and-moving-tiles/images/figure3.svg
