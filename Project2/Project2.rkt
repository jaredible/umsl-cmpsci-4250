#lang racket

(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))))

(define pi 3.1416)

#|
(define (my_area flag radius) ; create a function named my_area1 with parameters flag (integer) and radius (real)
  (cond
    [(< radius 0) #f] ; if the radius is less than 0, then return false
    [(= flag 1) (* pi (* radius radius))] ; if the flag is equal to 1, then return the area of a circle using radius
    [(= flag 2) (* (/ 4 3) pi (* radius radius radius))] ; if the flag is equal to 2, the return the volume of a sphere using radius
    [else #f])) ; if the flag is not equal to 1 or 2, then return false
|#

(define (my_area flag radius)
  (if (>= radius 0)
      (if (= flag 1)
          (* pi (* radius radius))
          (if (= flag 2)
              (* (/ 4 3) pi (* radius radius radius))
              #f))
      #f))

(define (rem_second list)
  (if (>= (length list) 2)
      (cons (car list) (cdr (cdr list)))
      '()))

(define (my_union a b)
  (cond
    [(not (list? a)) (error "Error: The first parameter is not a list!")]
    [(not (list? b)) (error "Error: The second parameter is not a list!")]
    [(null? b) a]
    [(member (car b) a) (my_union a (cdr b))]
    [else (my_union (cons (car b) a) (cdr b))]))

(define (my_delete atom list)
  (cond
    [(not (atom? atom)) (error "Error: The first parameter is not an atom!")]
    [(not (list? list)) (error "Error: The second parameter is not a list!")]
    [(null? list) list]
    [(list? (first list)) (cons (my_delete atom (first list)) (my_delete atom (rest list)))]
    [(equal? atom (first list)) (my_delete atom (rest list))]
    [else (cons (first list) (my_delete atom (rest list)))]))

;; (my_delete 'a '(a))
;; (my_delete 1 '(1))
;; (my_delete 'abc '(abc))
;; (my_delete a '(3 4 5))
;; (my_delete 1 '(1 2 3 (1 2 3 (1 2 3 a b c) a b c) a b c (1 2 3 (1 2 3 a b c) a b c)))
;; (my_delete 1 '(1 (1 (1 (1) 1) 1) 1 (1 (1 (1) 1) 1) 1))