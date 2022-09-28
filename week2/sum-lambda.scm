;;; former procedure form
(define (sum term a next b)
    (if (> a b)
        0
        (+  (term a)
            (sum term (next a) next b))))

(define (pi-next x)
    (+ x 4))

(define (pi-term x)
    (/ 1.0 (* x (+ x 2))))

(define (pi-sum a b)
    (sum pi-term a pi-next b))


;;; new procedure with lambda
(lambda (x) (+ x 4)) ;is next procedure
(lambda (x) (/ 1.0 (* x (+ x 2)))) ;is term procedure

(define (pi-sum-lambda a b)
    (sum    
    (lambda (x) (/ 1.0 (* x (+ x 2))))
    a
    (lambda (x) (+ x 4)) b))


; gives same result
(pi-sum 1 10000)
(pi-sum-lambda 1 10000)