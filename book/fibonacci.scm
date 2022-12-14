;;; not efficient way (recursive tree)
(define (fib n)
    (cond   ((= n 0) 0)
            ((= n 1) 1)
    (else (+ (fib (- n 1)) (fib (- n 2))))))

(fib 8)

;;; efficient way with block structure
(define (fib-eff n)
    (define (fib-iter a b n )
    (if (= n 0)
        b
        (fib-iter (+ a b) a (- n 1))))
    (fib-iter 1 0 n))


(fib-eff 100)