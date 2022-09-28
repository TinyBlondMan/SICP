;;; NOT FINISHED


;;; helper functions
(define (inc a) (+ a 1))
(define (identity x) x)


;;; define new versions of sum and product
(define (sum term a next b pred) 
    (filtered-accumulate + 0 term a next b pred))
(define (product term a next b pred) 
    (filtered-accumulate * 1 term a next b pred))


;;; defining filtered-accumulate
(define (filtered-accumulate combiner null-value term a next b pred)
  (cond ((> a b) null-value)
	((pred a)
	 (combiner (term a)
		   (filtered-accumulate combiner
					null-value
					term
					(next a)
					next
					b
					pred)))
	(else (filtered-accumulate combiner
				   null-value
				   term
				   (next a)
				   next
				   b
				   pred))))


;;; sum squares of the prime numbers in the interval a to b
(define (sum-square-primes a b)
    (filtered-accumulate 
        + 
        0 
        (lambda (x) (* x x) a) 
        identity 
        inc 
        b 
        prime?))

(sum-square-primes 1 11)