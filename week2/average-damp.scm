;;; same as fixed point file
(define tolerance 0.00001)

(define (fixed-point f first-guess)
    (define (close-enough? v1 v2)
        (< (abs (- v1 v2))
        tolerance))
    (define (try guess)
        (let ((next (f guess)))
        (if (close-enough? guess next)
            next
            (try next))))
    (try first-guess))


;;; defining average damp wih lambda return value
(define (average a b) (/ (+ a b) 2))

(define (average-damp f)
    (lambda (x) (average x (f x))))

(define (sqrt x)
    (fixed-point (average-damp (lambda (y) (/ x y)))
    1.0))

(sqrt 144)

;;; extending procedures to cube root (cbrt)
(define (square a) (* a a))

(define (cbrt x)
    (fixed-point (average-damp (lambda (y) (/ x (square y))))
    1.0))

(cbrt 27)