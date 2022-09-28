;Write an analogous procedure called
;product that returns the product of the values of a
;function at points over a given range. Show how to de-
;ﬁne factorial in terms of product.

;Also use product
;to compute approximations to π using the formula

;  π   2 · 4 · 4 · 6 · 6 · 8 · · ·
;  - = -   -   -   -   -   -
;  4   3 · 3 · 5 · 5 · 7 · 7 · · · 


;;; generalized procedure
(define (product term a next b)
    (if (> a b)
        1
        (*  (term a)
            (product term (next a) next b))))

(define (inc a) (+ a 1))
(define (identity x) x)

(define (factorial n)
       (product identity 1 inc n))

;;; working
(factorial 10)


;;; with pi approximation, my solution
(define (pi-inc a) (+ a 2))
(define (pi-identity x) (* (/ (- x 1) x) (/ (+ x 1) x)))
(define (pi-approx n)
       (* 4 (product pi-identity 3.0 pi-inc n)))

;;; found solution to confirm it's ok, mine is better because handles floating point
(define (pi terms) (* 4 (product
	(lambda (x) (/ (* (-1+ x) (1+ x))
		(* x x) ))
			 3 ;should need .0 to avoid fractional result
	(lambda (x) (+ x 2))
		terms )))

(pi 1000)
(pi-approx 1000)