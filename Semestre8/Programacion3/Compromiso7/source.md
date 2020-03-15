### 6.1 Write an attribute grammar for the integer value of a number given by the following grammar:

$$
number\rightarrow digit\ number\ |\ digit \\
digit \rightarrow\ 0\ |\ 1\ |\ 2\ |\ 3\ |\ 4\ |\ 5\ |\ 6\ |\ 7\ |\ 8\ |\ 9\
$$

### Gramatica

$numero \rightarrow numero1.digito$						{numero.val = numero1.val * 10 + digito.val}

$numero \rightarrow digito$ 										{numero.val = digito.val}

$digito \rightarrow 0|1|$





### 6.2 Write an attribute grammar for the floating point valque of a decimal number given by the following grammar. (Hint: Use a count attribute to count the number of digits to the right of the decimal point.)

$$
dnum \rightarrow num.num\\
num \rightarrow num\ digit\ |\ digit\\
digit \rightarrow\ 0\ |\ 1\ |\ 2\ |\ 3\ |\ 4\ |\ 5\ |\ 6\ |\ 7\ |\ 8\ |\ 9\
$$



### 6.5 Rewrite the attribute grammar of Table 6.2 to compute a postfix string attribute instead of _val_, containing the postfix form for the simple integer expression. For example, the postfix attribute for $(34 - 3)*42$ is $"34\ 3\ -\ 42\ +\ *"$. You may assume a concatenation operator $||$ and the existence of a **number**.strval attribute.

### 6.7 Consider the following grammar for simple Pascal-style declarations:

$$
decl \rightarrow var-list\ :\ type\\
var-list \rightarrow\ var-list\ ,\ id\ |\ id \\
type \rightarrow integer | real
$$

Write an attribute grammar for the type of a variable.

### 6.13 Consider the following attribute grammar:

| Grammar Rule           | Semantic Rules  |
| ---------------------- | --------------- |
| $S\rightarrow A\ B\ C$ | B.u = S.u       |
|                        | A.u = B.v + C.y |
|                        | S.v = A.v       |
| $A \rightarrow a$      | A.v = 2* A.u    |
| $B \rightarrow b$      | B.v = B.u       |
| $C \rightarrow c$      | C.v = 1         |



#### a) Draw the parse tree for the string _abc_ (the only string in the language), and draw the dependency graph for the associated attributes. Describe a correct order for the evaluation of the attributes.

#### b) Suppose that S.u is assigned the value 3 before attribute evaluation begins. What is the value of S.v when evaluation has finished?

#### c) Suppose the attribute equations are modified as follows:

| Grammar Rule           | Semantic Rules  |
| ---------------------- | --------------- |
| $S\rightarrow A\ B\ C$ | B.u = S.u       |
|                        | C.u = A.v       |
|                        | A.u = B.v + C.v |
|                        | S.v = A.v       |
| $A \rightarrow a$      | A.v = 2* A.u    |
| $B \rightarrow b$      | B.v = B.u       |
| $C \rightarrow c$      | C.v = C.u - 2   |

What value does S.v have after attribute evaluation, if S.u = 3 before evaluation begins?