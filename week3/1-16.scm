;;; we go from fast-expt
(define (fast-expt b n)
    (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (expt-iter b counter product)
    (if (= counter 0)
        product
        (expt-iter b
            (- counter 1)
            (* b product))))

(define (faster-expt b n)
  (define (iter a b n)
    (cond ((= n 0) a)
	  ((even? n) (iter a (square b) (/ n 2)))
	  (else (iter (* a b) b (- n 1)))))
  (iter 1 b n))


;;;(expt 2 2000000) ;;; won't calculate
(fast-expt 2 2000000) ;; calculates instantly
(faster-expt 2 2000000) ;; calculates instantlier