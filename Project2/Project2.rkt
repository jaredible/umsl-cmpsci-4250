#lang racket

(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))))

(define pi 3.1416)

#|
(define (my_area flag radius)
  (cond
    [(< radius 0) #f]
    [(= flag 1) (* pi (* radius radius))]
    [(= flag 2) (* (/ 4 3) pi (* radius radius radius))]
    [else #f]))
|#

(define (my_area flag radius)
  (if (< radius 0)
      #f
      (if (= flag 1)
          (* pi (* radius radius))
          (if (= flag 2)
              (* (/ 4 3) pi (* radius radius radius))
              #f))))

(define (rem_second list)
  (if (= (length list) 2)
      (cons (car list) (cdr (cdr list)))
      '()))

(define (my_union a b)
  (cond
    [(null? b) a]
    [(member (car b) a) (my_union a (cdr b))]
    [else (my_union (cons (car b) a) (cdr b))]))

;; (my_union '(1 2) '(1 2)) WORK
;; (my_union '(1 2 1) '(1 2 1)) NOT WORK

(define (my_delete atom list)
  (cond
    [(null? list) list]
    [(list? (car list)) (cons (my_delete atom (car list)) (my_delete atom (cdr list)))]
    [(equal? atom (car list)) (my_delete atom (cdr list))]
    [else (cons (car list) (my_delete atom (cdr list)))]))

;; (my_delete 'a '(a))
;; (my_delete 1 '(1))
;; (my_delete 'abc '(abc))
;; (my_delete a '(3 4 5))
;; (my_delete 1 '(1 2 3 (1 2 3 (1 2 3 a b c) a b c) a b c (1 2 3 (1 2 3 a b c) a b c)))
;; (my_delete 1 '(1 (1 (1 (1) 1) 1) 1 (1 (1 (1) 1) 1) 1))