(define (even? n)
    (= (remainder n 2) 0))


(define (expmod base exp m)
    (cond ((= exp 0) 1)
        ((even? exp)
            (remainder
                (square (expmod base (/ exp 2) m))
                m))
        (else
            (remainder
                (* base (expmod base (- exp 1) m))
                m))))


(define (fermat-test n)
    (define (try-it a)
        (= (expmod a n n) a))
        (try-it (+ 1 (random (- n 1)))))


(define (fast-prime? n times)
    (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))


;;; gives true, for the number n is M-521
;;; (trace fast-prime?)
(fast-prime? 6864797660130609714981900799081393217269435300143305409394463459185543183397656052122559640661454554977296311391480858037121987999716643812574028291115057151  1000)