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

;;; use calculator in rad and press cos for 1 multiple times, gives same result in the end
(fixed-point cos 1.0)

;;; searching for root of y = sin y + cos y
(fixed-point 
    (lambda (y) (+ (sin y) (cos y)))
    1.0)


;;; extrapoling, we can search for sqrt as ysquare = x, thus y = x/y
(define (sqrt x)
    (fixed-point (lambda (y) (/ x y))
    1.0))
;;; won't work that simply, because guesses are too far away from one another
;;; then we need to average guesses

(define (average a b) (/ (+ a b) 2))
(define (sqrt x)
    (fixed-point (lambda (y) (average y (/ x y)))
    1.0))


(sqrt 144)