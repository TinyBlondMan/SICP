(define (cont-frac n d k)
  (define (helper i)
    (if (> i k)
	0
	(/ (n i) (+ (d i)
		    (helper (+ i 1))))))
  (helper 1))
  

(define (e k)
  (+ 2 (cont-frac (lambda (i) 1.0)
		  (lambda (i)
		    (if (= (remainder (- i 2) 3) 0)
			(* 2 (+ 1 (quotient (- i 2) 3)))
			1))
		  k)))

(e 20)