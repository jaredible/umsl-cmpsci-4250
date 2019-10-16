#lang racket
((compose car cdr) '((a b) c d))

(define (fourth_elm a_list)
  ((compose car (compose cdr(compose cdr cdr))) a_list))

(fourth_elm '(a b c d e f))