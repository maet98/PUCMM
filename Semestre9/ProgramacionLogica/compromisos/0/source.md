# Miguel Estevez

## 2017-0200



$$
\displaystyle{\frac{P, \ Q}{\therefore P \wedge Q}}
$$

| P    | Q    | $P \wedge Q$ | $P \wedge Q \rightarrow P \wedge Q$ |
| ---- | ---- | ------------ | ----------------------------------- |
| 0    | 0    | 0            | 1                                   |
| 0    | 1    | 0            | 1                                   |
| 1    | 0    | 0            | 1                                   |
| 1    | 1    | 1            | 1                                   |

Es una tautologia.
$$
\displaystyle{\frac{P}{\therefore P \vee Q}}
$$

| P    | Q    | $P \vee Q$ | $P \rightarrow P \vee Q $ |
| ---- | ---- | ---------- | ------------------------- |
| 0    | 0    | 0          | 1                         |
| 0    | 1    | 1          | 1                         |
| 1    | 0    | 1          | 1                         |
| 1    | 1    | 1          | 1                         |

Es una tautologia.
$$
\displaystyle{\frac{P \wedge Q}{\therefore Q}}
$$

| P    | Q    | $P \wedge Q$ | $P \wedge Q \rightarrow Q$ |
| ---- | ---- | ------------ | -------------------------- |
| 0    | 0    | 0            | 1                          |
| 0    | 1    | 0            | 1                          |
| 1    | 0    | 0            | 1                          |
| 1    | 1    | 1            | 1                          |

Es una tautologia.
$$
\displaystyle{\frac{P \wedge Q}{\therefore P}}
$$

| P    | Q    | $P \wedge Q$ | $P \wedge Q \rightarrow P$ |
| ---- | ---- | ------------ | -------------------------- |
| 0    | 0    | 0            | 1                          |
| 0    | 1    | 0            | 1                          |
| 1    | 0    | 0            | 1                          |
| 1    | 1    | 1            | 1                          |

Es una tautologia.
$$
\displaystyle{\frac{P \rightarrow Q, P}{\therefore Q}}
$$

| P    | Q    | $P \rightarrow Q$ | $P \rightarrow Q \wedge P$ | $P \rightarrow Q \wedge P \rightarrow Q$ |
| ---- | ---- | ----------------- | -------------------------- | ---------------------------------------- |
| 0    | 0    | 1                 | 0                          | 1                                        |
| 0    | 1    | 1                 | 0                          | 1                                        |
| 1    | 0    | 0                 | 0                          | 1                                        |
| 1    | 1    | 1                 | 1                          | 1                                        |

Es una tautologia.
$$
\displaystyle{\frac{P\rightarrow Q, \neg Q}{\therefore \neg P}}
$$

| P    | Q    | $P \rightarrow Q$ | $\neg Q$ | $P \rightarrow Q \wedge \neg Q$ | $\neg P$ | $P \rightarrow Q \wedge \neg Q \rightarrow \neg P$ |
| ---- | ---- | ----------------- | -------- | ------------------------------- | -------- | -------------------------------------------------- |
| 0    | 0    | 1                 | 1        | 1                               | 1        | 1                                                  |
| 0    | 1    | 1                 | 0        | 0                               | 1        | 1                                                  |
| 1    | 0    | 0                 | 1        | 0                               | 0        | 1                                                  |
| 1    | 1    | 1                 | 0        | 0                               | 0        | 1                                                  |

Es una tautologia.

$$
\displaystyle{\frac{P \vee Q, \neg P}{\therefore Q}}
$$



| P    | Q    | $P \vee Q$ | $\neg P$ | $P \vee Q \wedge \neg P$ | $P \vee Q \wedge \neg P \rightarrow Q$ |
| ---- | ---- | ---------- | -------- | ------------------------ | -------------------------------------- |
| 0    | 0    | 0          | 1        | 0                        | 1                                      |
| 0    | 1    | 1          | 1        | 1                        | 1                                      |
| 1    | 0    | 1          | 0        | 0                        | 1                                      |
| 1    | 1    | 1          | 0        | 0                        | 1                                      |

Es una tautologia