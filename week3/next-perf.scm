(define (next-perf n)
    (n))

(define (factorial n)
    (define (iter product counter)
        (if (> counter n)
            product
            (iter (* counter product)
                (+ counter 1))))
    (iter 1 1))

(define (sum n)
    (define (iter product counter)
        (if (> counter n)
            product
            (iter (+ counter product)
                (+ counter 1))))
    (iter 0 1))



(factorial 3)
(sum 3)
(helper 3 *)
(helper 3 +)