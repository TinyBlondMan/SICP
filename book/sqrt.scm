;(define (sqrt-iter guess x)
;    (if (good-enough? guess x)
;        guess
;        (sqrt-iter (improve guess x) x)))

;(define (improve guess x)
;    (average guess (/ x guess)))

;(define (average x y)
;    (/ (+ x y) 2))

;(define (good-enough? guess x)
;    (< (abs (- (square guess) x)) 0.001))

;(define (sqrt x)
;    (sqrt-iter 1.0 x))

(define (square x) (* x x))

(define (good-enough? previous-guess guess)
  (< (abs (/ (- guess previous-guess) guess)) 0.00000000001))

(define (sqrt-iter guess x)
  (if (good-enough? guess (improve guess x))
      guess
      (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt (* 123456789012345 123456789012345))
(sqrt (* 0.00000000123456 0.00000000123456))
(sqrt 2)
(sqrt 144)

