# UMSL CMPSCI4250 Homework 3

1. Describe a situation when the arithmetical 'add' operator in a programming language would not be commutative.

2. Describe a situation when the arithmetical 'add' operator in a programming language would not be associative.

3. Consider the following C program:
```c
int fun(int *i) {
  *i += 5;
  return 4;
}

void main() {
  int x = 3;
  x = x + fun(&x);
}
```
&nbsp;&nbsp;What is the value of <i>x</i> after the assignment statement in main, assuming
&nbsp;&nbsp;&nbsp;&nbsp;a. operands are evaluated left to right.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<small><i>x</i> = 7 // since <i>x</i> = 3 + 4</small>
&nbsp;&nbsp;&nbsp;&nbsp;b. operands are evaluated right to left.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<small><i>x</i> = 12 // since <i>x</i> = 8 + 4</small>

4. Indicate 3 general characteristics of a subprogram.
<small>
&nbsp;&nbsp;Three general characteristics of a subprogram are as follows:
&nbsp;&nbsp;&nbsp;&nbsp;1) Each subprogram has a single entry point
&nbsp;&nbsp;&nbsp;&nbsp;2) When a subprogram is called,...
&nbsp;&nbsp;&nbsp;&nbsp;3) When the called subprogram completes its ex
</small>
