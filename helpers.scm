(define (double f)
    (lambda (x) (f (f x))))

(define inc (lambda (x) (1+ x)))
(define dec (lambda (x) (-1+ x)))

(define (cube x) (* x x x))

(define (square x) (* x x))

(define (identity x) x)

(define (compose f g)
    (lambda (x) (f (g x))))

(define (even? n)
    (= (remainder n 2) 0))