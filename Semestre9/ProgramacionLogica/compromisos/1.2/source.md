## Compromiso 1.2 - Normalización y Resolución en Lógica de Primer Orden

### Miguel Estevez

### 2017-0200



**Ejercicios**

**a).- Use resolucion por refutacion para demostrar(Recuerden normalizar la formulas)**

1. $\{\forall x [P(x) \rightarrow Q(x)], \exists x P(x)\} \vdash_{Res} \exists x Q(x)$
   $$
   \exist x P(x)\\
   1.\ P(y)\\
   \forall x(P(x)\rightarrow Q(x))\\
   2.\ (\neg P(x) \vee Q(x))\\
   \neg \exist x Q(x)\\
   \neg \exist z Q(z)\\
   \forall z \neg Q(z)\\
   3.\ \neg Q(z)
   $$
   ![](/home/maet98/Pictures/1.1.png)
   
2. $\{\forall x [P(x) \rightarrow Q(x)], \forall x [Q(x) \rightarrow R(x)] \} \vdash_{Res} \forall x [P(x) \rightarrow R(x)]$

$$
\forall x[P(x) \rightarrow Q(x)]\\
\forall x[\neg P(x) \vee Q(x)]\\
1. \neg P(x) \vee Q(x)\\
\forall x[Q(x) \rightarrow R(x)]\\
\forall y[\neg Q(y) \vee R(y)]\\
2. \neg Q(y) \vee R(y)\\
\neg \forall x [P(x) \rightarrow R(X)]\\
\exist z \neg[P(x) \rightarrow R(x)]\\
\exist z [P(z) \wedge \neg R(z)]\\
3. P(z)\\
4. \neg R(z)
$$

![](/home/maet98/Pictures/1.2.png)

3. $\vdash_{Res} \exists x [P(x) \rightarrow \forall z P(z)]$

$$
\neg \exist x[P(x) \rightarrow \forall z P(z)]\\
\forall x \neg[P(x) \vee \forall z P(z)]\\
\forall x [P(x) \wedge \neg \forall z P(z)]\\
\forall x [P(x) \wedge \exist z \neg P(z)]\\
\forall x \exist z [P(x) \wedge \neg P(z)]\\
1.\ P(x)\\
2.\ \neg P(z)
$$

![](/home/maet98/Pictures/1.3.png)

4. $\vdash_{Res} \forall x \exists y \neg (P(y, x) \leftrightarrow \neg P(y,y))$

$$
\neg \forall x \exist y \neg[(P(y,x)\rightarrow \neg P(y,y)) \wedge (P(y,y) \rightarrow P(y,x))]\\
\exist x \forall y \neg \neg[( P(y,x)\rightarrow \neg P(y,y)) \wedge (\neg P(y,y) \rightarrow P(y,x))]\\
\exist x \forall y[( \neg P(y,x)\vee \neg P(y,y)) \wedge ( P(y,y) \vee P(y,x))]\\
1. \neg P(y,x) \vee \neg P(y,y)\\
2. P(y,y) \vee P(y,x)
$$

![](/home/maet98/Pictures/1.4.png)

**b).- Use resolucion por refutacion y compute la unificacion de demuestran la insconsistencia de cada uno de los siguientes conjuntos de clausulas.**

1. $S_1 = \{ \{\neg P(x, f(x,y))\}, \{P(a,z) \neg Q(z,v)\}, \{Q(u,a)\}\}$

![](/home/maet98/Pictures/2.1.png)

2. $S_2 = \{\{P(x)\}, \{\neg P(f(x))\} \}$

![](/home/maet98/Pictures/2.2.png) 
$$
con: \\
\theta_1 = \epsilon\\
\theta_2 = [\frac{x}{x'}]\\
\sigma = [\frac{x}{f(x')}]
$$


3. $S_3 = \{ \{P(x,y), P(y,x)\}, \{\neg P(u,v), \neg P(v,u)\} \}$

![](/home/maet98/Pictures/2.3.png)

**c). - Para los siguientes pares de terminos, determine si si o si no son unificables.**

* **Si son unificables, calcule (paso a paso) el unificador de maxima generalidad (mgu)**
* **Si no lo son, determine la causa (¿Cuál condición del algoritmo de unificación es la que falla?)**

1. $f(g(x),z),f(u,h(u))$

$$
\{f(u,z),f(u,h(u))\}[g(x)/u]\\
\{f(u,z),f(u,z)\}[g(x)/u,h(u)/z]
$$



2. $j(x,y,z),j(f(y,y),f(z,z),f(a,a))$

$$
\{j(x,y,z),j(x,f(z,z),f(a,a)\}[f(y,y)/x]\\
\{j(x,y,z),j(x,y,f(a,a)\}[f(y,y)/x, f(z,z)/y]\\
\{j(x,y,z),j(x,y,z\}[f(y,y)/x,f(z,z)/y,f(a,a)/z]\\
$$



3. $j(x,z,x),j(u,f(u),z)$

$$
\{j(x,z,x),j(x,f(x),z)\}[u/x]\\
\{j(x,f(x),x),j(x,f(x),f(x))\}[u/x,z/f(x)]\\
$$

No es posible sustituir a z por x, ya que su valor es f(x).

4. $j(f(x),y,a),j(y,z,z)$

$$
\{j(y,y,a),j(y,z,z)\}[f(x)/y]\\
\{j(z,z,a),j(z,z,z)\}[f(x)/y,y/z]\\
$$

No es posible sustituir a 'y' o 'a' por z, por tanto no es resoluble

5. $j(g(x),a,y),j(z,x,f(z,z))$

$$
\{j(z,a,y),j(z,x,f(z,z))\}[g(x)/z]\\
\{j(z,x,y),j(z,x,f(z,z))\}[g(x)/z, a/x]\\
\{j(z,x,y),j(z,x,y)\}[g(x)/z, a/x,f(z,z)/y]\\
$$



**d).- Dado el conjunto de fórmulas indicado mas abajo:**

$\Gamma = \{\forall y P(0, y, y),\forall x \forall y \forall z [P(x,y,x) \rightarrow P(s(x), y, s(z))], Q(0), \forall x [Q(x) \rightarrow Q(s(s(x)))]\}$

**determinar utilizando resolución por refutación,**

$\Gamma \vdash_{Res} \exists x \exists w [P(x, s(w), s(s(0))) \wedge Q(s(x))]$

* **Muestre el árbol de refutación**
* **Indique la unificación que resulta de la refutación**
* **Use Swish Prolog para traducir T a Prolog y verfique la refutación hecha en el punto anterior.**
* **Liste el código de Prolog que corresponde al argumento dado más arriba**

$$
1. P(0,y,y)\\
\forall x \forall y \forall z[P(x,y,x) \rightarrow P(s(x),y,s(z))]\\
\forall x \forall y \forall z[\neg P(x,y,x) \vee P(s(x),y,s(z))]\\
2. \neg P(x,y,x) \vee P(s(x),y,s(z))\\ 
\\
3. Q(0)\\ \\
\forall x [Q(x) \rightarrow Q(s(s(x)))]\\
\forall x [\neg Q(x) \vee Q(s(s(x)))]\\
4. \neg Q(x) \vee Q(s(s(x)))\\
\neg \exist x \exist w[P(x,s(w),s(s(0))) \wedge Q(s(x))]\\
\forall x \forall w \neg[P(x,s(w),s(s(0))) \wedge Q(s(x))]\\
\forall x \forall w [\neg P(x,s(w),s(s(0))) \vee \neg Q(s(x))]\\
5. \neg P(x,s(w),s(s(0))) \vee \neg Q(s(x))
$$

![](/home/maet98/Pictures/4foto.png)

```prolog
p(0,Y,Y).
p(s(X),Y,s(Z)).

not(p(X,Y,X)).
q(0).

not(q(X)).
q(s(s(X))).
```

**Query**

```
not(p(X,s(W),s(s(0)))) ; not(q(s(X)))
```

