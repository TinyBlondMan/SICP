(define (search f neg-point pos-point)
    (let ((midpoint (average neg-point pos-point)))
        (if (close-enough? neg-point pos-point)
        midpoint
        (let ((test-value (f midpoint)))
            (cond ((positive? test-value)
                    (search f neg-point midpoint))
                ((negative? test-value)
                    (search f midpoint pos-point))
            (else midpoint))))))

(define (close-enough? x y) (< (abs (- x y)) 0.0001))
(define (average a b) (/ (+ a b) 2))


;;; avoids answering errors if a and b have same sign
(define (half-interval-method f a b)
    (let ((a-value (f a))
          (b-value (f b)))
        (cond ((and (negative? a-value) (positive? b-value))
                (search f a b))
            ((and (negative? b-value) (positive? a-value))
                (search f b a))
            (else
                (error "Values are not of opposite sign" a b)))))


;;; computes approximation of root for sin x = 0 between 2 and 4, which is Pi
(half-interval-method sin 2.0 4.0)
;;; hence will throw an error as Pi (the root) is not in the interval
(half-interval-method sin 2.0 3.0)


;;; searches for roots of xcube - 2x - 3 = 0 between 1 and 2
(half-interval-method 
    (lambda (x) (- (* x x x) (* 2 x) 3))
    1.0
    2.0)