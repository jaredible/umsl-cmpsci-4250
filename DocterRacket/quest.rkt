#lang racket
(define (quest x y)
   (cond
      ((null? x) '())
      ((null? y) '())
      (else (cons (list (car x) (car y))
                  (quest (cdr x) (cdr y))))
))

(quest '(1 2 3) '(a b c))
