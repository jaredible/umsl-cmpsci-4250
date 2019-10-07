#lang racket

;;
;; Predicate function: atom?
;; Illustrates the use of 'lambda', 'and', 'not'
;; special forms, and the built-in pair? and null?
;; predicate functions. The question mark after the
;; function name isn't required, it's just customary
;; to include a question mark at the end of a
;; function that returns a true or false.
;;
;; 
;;
(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))))

(define pi 3.1416) ; create a variable named pi and assign it the value 3.1416

;;
;; Function: my_area
;;
;; Using a two-way selection structure, computes the
;; area of a circle or the volume of a sphere given
;; a radius. If the flag is set as 1, then the area
;; of a circle is returned. If the flag is set as 2,
;; then the volume of a sphere is returned. For the
;; flag parameter, only integer values 1 and 2 are
;; valid. Likewise, for the radius parameter, only
;; nonnegative numerical values are valid. Otherwise,
;; the function returns false.
;;
#|
(define (my_area flag radius) ; create a function named my_area1 with parameters flag (integer) and radius (real)
  (cond
    [(< radius 0) #f] ; if the radius is less than 0, then return false
    [(= flag 1) (* pi (* radius radius))] ; if the flag is equal to 1, then return the area of a circle using radius
    [(= flag 2) (* (/ 4 3) pi (* radius radius radius))] ; if the flag is equal to 2, the return the volume of a sphere using radius
    [else #f])) ; if the flag is not equal to 1 or 2, then return false
|#

;;
;; Function: my_area
;;
;; Using a multiple-way selection structure, computes
;; the area of a circle or the volume of a sphere given
;; a radius. If the flag is set as 1, then the area
;; of a circle is returned. If the flag is set as 2,
;; then the volume of a sphere is returned. For the
;; flag parameter, only integer values 1 and 2 are
;; valid. Likewise, for the radius parameter, only
;; nonnegative numerical values are valid. Otherwise,
;; the function returns false.
;;
(define (my_area flag radius) ; create a function named my_area2 with parameters flag (integer) and radius (real)
  (if (>= radius 0) ; if the radius is greater than or equal to 0
      (if (= flag 1) ; and if the flag is equal to 1
          (* pi (* radius radius)) ; then return the area of a circle using radius
          (if (= flag 2) ; else if the flag is equal to 2
              (* (/ 4 3) pi (* radius radius radius)) ; then return the volume of a sphere using radius
              #f)) ; if the flag is not equal to 1 or 2, then return false
      #f)) ; if the radius is less than 0, then return false

(define (rem_second list) ; create a function named rem_second with parameter list (list)
  (if (>= (length list) 2) ; if the length of the list is greater than or equal to 2
      (cons (car list) (cdr (cdr list))) ; then remove the second element from the list
      '())) ; if the length of the list is less than 2, then return an empty list

(define (my_union a b) ; create a function named my_union with parametes a (list) and b (list)
  (cond
    [(not (list? a)) (error "Error: The first parameter is not a list!")] ; if a is not a list, then return an appropriate error
    [(not (list? b)) (error "Error: The second parameter is not a list!")] ; if b is not a list, then return an appropriate error
    [(null? b) a] ; if the list b is null, then return the list a
    [(member (car b) a) (my_union a (cdr b))]
    [else (my_union (cons (car b) a) (cdr b))]))

;;
;; Function: my_delete
;; Input: atom - is an atom
;;        list - is a list
;; Output: a list with all occurrences of atom removed
;;
;; ...
;;
(define (my_delete atom list) ; create a function named my_delete with parameters atom (atom) and list (list)
  (cond
    [(not (atom? atom)) (error "Error: The first parameter is not an atom!")] ; if atom is not an atom, then return an appropriate error
    [(not (list? list)) (error "Error: The second parameter is not a list!")] ; if list is not a list, then return an appropriate error
    [(null? list) list] ; if the list is null, then return it
    [(list? (first list)) (cons (my_delete atom (first list)) (my_delete atom (rest list)))]
    [(equal? atom (first list)) (my_delete atom (rest list))] ; if the atom and the first element in the list are equal, then recurse using the atom and the rest of the list
    [else (cons (first list) (my_delete atom (rest list)))]))

;; (my_delete 'a '(a))
;; (my_delete 1 '(1))
;; (my_delete 'abc '(abc))
;; (my_delete a '(3 4 5))
;; (my_delete 1 '(1 2 3 (1 2 3 (1 2 3 a b c) a b c) a b c (1 2 3 (1 2 3 a b c) a b c)))
;; (my_delete 1 '(1 (1 (1 (1) 1) 1) 1 (1 (1 (1) 1) 1) 1))