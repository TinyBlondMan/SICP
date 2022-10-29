(define (cont-frac n d k)
  (define (helper i)
    (if (> i k)
	0
	(/ (n i) (+ (d i)
		    (helper (+ i 1))))))
  (helper 1))


;;; iterative version
(define (cont-frac-iter n d k)
  (define (iter k result)
    (if (= k 0)
	result
	(iter (- k 1)
	      (/ (n k) (+ (d k) result)))))
  (iter k 0))


(define (phi k)
    (/ 1 (cont-frac 
        (lambda (i) 1.0)
		(lambda (i) 1.0)
		k)))


;;; iterative version
(define (phi-iter k)
    (/ 1 (cont-frac-iter 
        (lambda (i) 1.0)
		(lambda (i) 1.0)
		k)))

(phi 20)
(phi-iter 20)