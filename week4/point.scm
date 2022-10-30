(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")")))

(define a-point (make-point 2 2))
(define b-point (make-point 4 6))

(print-point a-point)
(print-point b-point)

(define (make-segment a b)
  (cons (make-point (x-point a) (y-point a))
        (make-point (x-point b) (y-point b))))

(define (start-segment seg) (car seg))
(define (ending-segment seg) (cdr seg))

(define segment-ab (make-segment a-point b-point))

(print-point (start-segment segment-ab))
(print-point (ending-segment segment-ab))

(define (average a b ) (/ (+ a b) 2))

(define (midpoint-segment seg)
  (make-point (average (x-point (start-segment seg)) (x-point (ending-segment seg)))
              (average (y-point (start-segment seg)) (y-point (ending-segment seg)))
              ))

(print-point (midpoint-segment segment-ab))
