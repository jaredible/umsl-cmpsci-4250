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
What is the value of <i>x</i> after the assignment statement in main, assuming
&nbsp;&nbsp;a. operands are evaluated left to right.
&nbsp;&nbsp;b. operands are evaluated right to left.
