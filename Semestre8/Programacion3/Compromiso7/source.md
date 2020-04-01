## Miguel Estevez 

### 20170200

### 6.1 Write an attribute grammar for the integer value of a number given by the following grammar:

$$
number\rightarrow digit\ number\ |\ digit \\
digit \rightarrow\ 0\ |\ 1\ |\ 2\ |\ 3\ |\ 4\ |\ 5\ |\ 6\ |\ 7\ |\ 8\ |\ 9\
$$

### Gramatica

$numero \rightarrow numero1.digito$						{numero.val = numero1.val * 10 + digito.val}

$numero \rightarrow digito$ 										{numero.val = digito.val}

$digito \rightarrow 0|1|2|3|4|5|6|7|8|9$							{digito.val = lexema.val}





### 6.2 Write an attribute grammar for the floating point valque of a decimal number given by the following grammar. (Hint: Use a count attribute to count the number of digits to the right of the decimal point.)

$$
dnum \rightarrow num.num\\
num \rightarrow num\ digit\ |\ digit\\
digit \rightarrow\ 0\ |\ 1\ |\ 2\ |\ 3\ |\ 4\ |\ 5\ |\ 6\ |\ 7\ |\ 8\ |\ 9\
$$

$dnum \rightarrow num.num$														{dnum.val = num1.val'.'num2.val($10^{-1}*num2.count$)}

$num \rightarrow num\ digito$														{num.val = num1.val*10 + digito.val

​																								num.count = num1.count + 1}
$num \rightarrow digito$																	{num.val = digito.val

​																								num.count = 1}

### 6.5 Rewrite the attribute grammar of Table 6.2 to compute a postfix string attribute instead of _val_, containing the postfix form for the simple integer expression. For example, the postfix attribute for $(34 - 3)*42$ is $"34\ 3\ -\ 42\ +\ *"$. You may assume a concatenation operator $||$ and the existence of a **number**.strval attribute.

$exp\rightarrow exp1 + term$																			{exp.post = exp1.postfix| term.postfix| +}

$exp \rightarrow exp1 - term$																			{exp.post = exp1.postfix | term.postfix| -}

$exp \rightarrow term$																						{exp.post = term.post}

$term \rightarrow term1 * factor$																	{term.post = term1.postfix| factor.postfix| *}

$term \rightarrow factor$																					{exp.post = factor.post}

$factor \rightarrow (exp)$																					{factor.post = exp.post}

$factor \rightarrow numero$																				{factor.post = numero.strval}

### 6.7 Consider the following grammar for simple Pascal-style declarations:

$$
decl \rightarrow var-list\ :\ type\\
var-list \rightarrow\ var-list\ ,\ id\ |\ id \\
type \rightarrow integer | real
$$

Write an attribute grammar for the type of a variable.

$decl \rightarrow var-list\ :\ type\ $																							{var-list.type = type.type}

$var-list \rightarrow\ var-list\ ,\ id\ $																						{var-list1.type = var-list.type

​																																				id.type = var-list.type}

$var-list \rightarrow id $																												{var-list1.type = id.type}
$type \rightarrow integer $																												{type.type = integer}

$type \rightarrow real$																														{type.type = real}

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

![](/home/miguel/Repository/PUCMM/Semestre8/Programacion3/Compromiso7/Blank Diagram.png)

![](/home/miguel/Repository/PUCMM/Semestre8/Programacion3/Compromiso7/Blank Diagram(1).png)

$S\rightarrow ABC$

$C \rightarrow c$

$B \rightarrow b$

$A \rightarrow a$

#### b) Suppose that S.u is assigned the value 3 before attribute evaluation begins. What is the value of S.v when evaluation has finished?

$$
S.v = 2*(3+1)\\
S.v = 8
$$



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

El valor de S.v seria imposible de calcularlo por el hecho de que C. requiere de C.u que transitivamente requiere a C.v.

C.v = C.u -2

C.u = A.v

A.v = 2 * A.u

A.u = B.v + C.v ( Aqui es donde inicia la dependencia transitiva.)



