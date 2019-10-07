#lang racket
((compose car cdr) '((a b) c d))

(define (third_elm a_list)
  ((compose car (compose cdr cdr)) a_list))

(third_elm '(a (b c) (d e) f))