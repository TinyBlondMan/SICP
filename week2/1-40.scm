;;; helper functions
(define dx 0.0001)
(define (deriv g)
    (lambda (x) (/ (- (g (+ x dx)) (g x)) dx)))

(define (cube x) (* x x x))
(define (square x) (* x x))


;;; same fixed point as before
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


;;; now we extend fixed point with newton
;;; this one is f(x)= x - g(x)/Dg(x)
(define (newton-transform g)
    (lambda (x) (- x (/ (g x) ((deriv g) x)))))


;;; applying newton-transform as guessing function (first parameter) to fixed point
(define (newtons-method g guess)
    (fixed-point (newton-transform g) guess))


(define (cubic a b c)
  (lambda (x) (+ (cube x) (* a (square x)) (* b x) c)))

(newtons-method (cubic 1 2 3) 1) ; -1.27568