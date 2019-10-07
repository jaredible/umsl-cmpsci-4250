#lang racket
(map (lambda (num) (* num num num)) '(3 4 5 6))


(define (arith x)
     (+ 3 (* 2 x x x))
  )

(arith -3)

(define (mappng arith a_list)
  (cond
  ((null? a_list) '())
  (else (cons (arith (car a_list))
              (mappng arith (cdr a_list))))
  ))

(mappng arith '(2 4 6 8))