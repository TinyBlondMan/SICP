;;; defining old version of product
(define (product term a next b)
    (if (> a b)
        1
        (*  (term a)
            (product term (next a) next b))))

;;; defining old version of sum
(define (sum term a next b)
    (if (> a b)
        0
        (+  (term a)
            (sum term (next a) next b))))


;;; factorial & pi-approx helpers for results
(define (inc a) (+ a 1))
(define (factorial-identity x) x)
(define (factorial n)
       (product factorial-identity 1 inc n))


(define (pi-inc a) (+ a 2))
(define (pi-identity x) (* (/ (- x 1) x) (/ (+ x 1) x)))
(define (pi-approx n)
       (* 4 (product pi-identity 3.0 pi-inc n)))


(define (cube x) (* x x x))
(define (sum-cubes a b)
    (sum cube a inc b))

(factorial 4) ;24
(pi-approx 1000) ;3.143
(sum-cubes 1 4) ;100

;Show that sum and product (Exercise 1.31) are both
;special cases of a still more general notion called accumulate
;that combines a collection of terms, using some general 
;accumulation function:

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
		(accumulate combiner null-value term (next a) next b))))


;;; define new versions of sum and product
(define (sum term a next b) (accumulate + 0 term a next b))
(define (product term a next b) (accumulate * 1 term a next b))

(factorial 4) ;;;24
(pi-approx 1000) ;;;3.143
(sum-cubes 1 4) ;;;100