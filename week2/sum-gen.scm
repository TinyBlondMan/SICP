;;; generalized procedure
(define (sum term a next b)
    (if (> a b)
        0
        (+  (term a)
            (sum term (next a) next b))))


;;; next procedures
(define (inc n) (+ n 1))

(define (pi-next x)
    (+ x 4))


;;; term procedures
(define (cube x) (* x x x))

(define (identity x) x)

(define (pi-term x)
    (/ 1.0 (* x (+ x 2))))


;;; final functions
(define (sum-cubes a b)
    (sum cube a inc b))

(define (sum-integers a b)
(sum identity a inc b))

(define (pi-sum a b)
    (sum pi-term a pi-next b))

(sum-cubes 1 10)
(sum-integers 1 10)

(define pi-approx-100 (pi-sum 1 100))
(define pi-approx-1k (pi-sum 1 1000))
(define pi-approx-10k (pi-sum 1 10000))
(define pi-approx-100k (pi-sum 1 100000))


;;; integral (cube for example)
(define (integral f a b dx)
    (define (add-dx x)
        (+ x dx))
    (*  (sum f   
        (+ a (/ dx 2.0)) add-dx b) dx))


;;; to get approx of pi
(* 8 pi-approx-100)
(* 8 pi-approx-1k)
(* 8 pi-approx-10k)
(* 8 pi-approx-100k)

; to get approx of integral of cube function between 0 and 1
;(The exact value of the integral of cube between 0 and 1 is 1/4.)
(integral cube 0 1 0.1)
(integral cube 0 1 0.01)
(integral cube 0 1 0.001)
(integral cube 0 1 0.0001)

