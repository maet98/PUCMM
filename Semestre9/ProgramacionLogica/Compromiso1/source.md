# Compromiso 1 - Deducción Natural y Resolución en Lógica Proposicional

## Miguel Estevez

## 20170200


$$
\{T, T \rightarrow \neg Q, \neg Q \rightarrow \neg S\} \vdash \neg S
$$

1. $T$
2. $T \rightarrow \neg Q$

3. $ \neg Q \rightarrow \neg S$

---

4. $\neg Q$					$MP\ 1,2$
5. $\neg S$			        $MP\ 3,4$

![](/home/maet98/Repository/pucmm/Semestre9/ProgramacionLogica/Compromiso1/1.png)

$$
\displaystyle{\{ \neg B, A \rightarrow B, \neg A \rightarrow C \} \vdash C}
$$

1. $\neg B$

2. $A \rightarrow B$

3. $\neg A \rightarrow C$

---

4. $\neg A$              $MT\ 1,2$

5. $C$                 $MP\ 3,4$

![](/home/maet98/Repository/pucmm/Semestre9/ProgramacionLogica/Compromiso1/2.png)

$$
\displaystyle{\{ P \vee Q, \neg T, Q \rightarrow T \} \vdash P}
$$

1. $P \vee Q$
2. $\neg T$
3. $Q \rightarrow T$

---

4. $\neg Q$            $MT\ 2,3$
5. $P$               $SD\ 1,4$

![](/home/maet98/Repository/pucmm/Semestre9/ProgramacionLogica/Compromiso1/3.png)

$$
\displaystyle{\{P \rightarrow Q, Q \rightarrow \neg R, R, P \vee (T \wedge S) \} \vdash S}
$$

1. $P \rightarrow Q$
2. $Q \rightarrow \neg R$
3. $R$
4. $P \vee (T \wedge S)$

---

5. $\neg\ \neg\ R$            $DN\ 3$
6. $\neg\ Q$                $MT\ 2,5$
7. $\neg P$                 $MT\ 1,6$
8. $T \wedge S$             $SD\ 4,7$
9. S                      $EC\ 8$

![](/home/maet98/Repository/pucmm/Semestre9/ProgramacionLogica/Compromiso1/4.png)

$$
\displaystyle{\{ S \wedge \neg R. R \vee \neg T, Q \rightarrow T \} \vdash \neg Q \wedge S}
$$

1. $S \wedge \neg R$
2. $R \vee \neg T$
3. $Q \rightarrow T$

---

4. $\neg R$ 				$EC\ 1$
5. $\neg T$                 $SD\ 2,4$
6. $\neg Q$                 $MT\ 3,5$
7. $S$                     $EC\ 1$
8. $\neg Q \wedge S$          $IC\ 6,7$
![](/home/maet98/Repository/pucmm/Semestre9/ProgramacionLogica/Compromiso1/5.png)

$$
\displaystyle{\{P \vee Q, Q \rightarrow R, P \rightarrow T, \neg T \} \vdash R \wedge (P \vee Q)}
$$

1. $P \vee Q$
2. $Q \rightarrow R$
3. $P \rightarrow T$
4. $\neg T$

---

5. $\neg P$                              $MT\ 3,4$
6. $Q$                                $SD\ 1,5$
7. $R$                                $MP\ 2,6$
8. $R \wedge (P \vee Q)$            $IC\ 1,7$
![](/home/maet98/Repository/pucmm/Semestre9/ProgramacionLogica/Compromiso1/6.png)

$$
\displaystyle{ \{P \rightarrow R \} \vdash (P \vee Q) \rightarrow (P \vee R)}
$$

### Caso que no da

Q: V

P: F

R: F
$$
\displaystyle{ \{P \rightarrow (Q \rightarrow R) \} \vdash Q \rightarrow (P \rightarrow R) }
$$

1. $P \rightarrow (Q \rightarrow R)$

---

2. $\neg( Q \rightarrow (P \rightarrow R))$            **Hipotesis**

3. $Q \wedge \neg ( P \rightarrow R)$                 $NI\ 2$

4. $Q \wedge P \wedge \neg R$                      $NI\ 3$

5. $P$                                         $EC\ 4$

6. $Q \rightarrow R$                               $MP\ 1,5$

7. $Q$                                         $EC\ 4$

8. $R$                                         $MP\ 6,7$

9. $\neg R$                                       $EC\ 4$

10. $R \wedge \neg R$                               $IC\ 8,9$

11. $Q \rightarrow (P \rightarrow R)$                   $RA\ 2-10$

    

    ![](/home/maet98/Repository/pucmm/Semestre9/ProgramacionLogica/Compromiso1/7.png)

$$
\{ (P \rightarrow Q) \wedge (P \rightarrow R) \} \vdash P \rightarrow (Q \wedge R)
$$

1. $(P \rightarrow Q) \wedge (P \rightarrow R)$

---

2. P							  **Hipotesis**
3. $P \rightarrow Q$                   $EC\ 1$
4. $Q$                             $MP\ 2,3$
5. $P \rightarrow R$                   $EC\ 1$
6. $R$                             $MP\ 2,5$
7. $Q \wedge R$                    $IC\ 4,6$
8. $P \rightarrow (Q \wedge R)$       $II\ 2-7$
9. ![](/home/maet98/Repository/pucmm/Semestre9/ProgramacionLogica/Compromiso1/8.png)