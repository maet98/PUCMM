##### 4.5 a) Show the actions of an LL(1) parser that uses Table 4.4 (page 163) to recognize the following arithmetic expressions:

​	a-) $3+4*5-6$

​	b-)$3*(4-5+6)$

​	c-) $3-(4+5*6)

##### 4.6 Show the actions  of an LL(1) parser that uses table Section 4.2.2, page 155, to recognize the following arithmetic expressions:

​	a-)  $(())()$

​	b-) $(()())$

​	c-) $()(())$

##### 4.11 An LL( 1) parsing table such as that of Table 4.4 (page 163) generally has many blank entries representing errors. In many cases, all the blank entries in a row can be replaced by a single **default entry**, thus decreasing the size of the table considerably. Potential default entries occur in nonterminal rows when a nonterminal has a single production choice or when it has an production. Apply these ideas to Table 4.4. What are the drawbacks of such a scheme, if any?
#### 4.12

##### a. Can a LL(1) grammar be ambiguous? Why or why not?

##### b. Can an ambiguous grammar be LL(1)? Why or Why not?

##### c. Must an unambiguous grammar be LL(1)? Why or why not?

##### 4.13 Show that a left-recursive grammar cannot be LL(1).

##### 4.21 Given the grammar $A \rightarrow aAa | \epsilon$
a. Show that this grammar is not LL(1).

b. An attempt to write a recursive-descent parser for this grammar is represented by the
following pseudocode.

```pse
procedure A ;
begin
	if token = a then
		getToken;
		A;
		if token = a then getToken ;
		else error;
	else if token o $ then error;
end A ;
```



Show that this procedure will not work correctly.

c. A **backtracking** recursive-descent parser for this language can be written but requires
the use of an unGetToken procedure that takes a token as a parameter and returns that
token to the front of the stream of input tokens. It also requires that the procedure
A be written as a Boolean function that returns success or failure, so that when A
calls itself, it can test for success before consuming another token, and so that, if the
A —> a A a choice fails, the code can go on to try the A —» e alternative. Rewrite the
pseudocode of part (b) according to this recipe, and trace its operation on the string
aaaa$.