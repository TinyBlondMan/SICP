;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; RECURSIVE VERSION

;;; my version
(define (f n)
    (cond   ((< n 3) n)
    (else (+ 
        (* 1 (f (- n 1))) 
        (* 2 (f (- n 2)))
        (* 3 (f (- n 3)))))))

;;; correction (FINE)
(define (fn n)
    (if (< n 3)
        n
        (+ (fn (- n 1))
           (* 2 (fn (- n 2)))
           (* 3 (fn (- n 3))))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ITERATIVE VERSION

;;; my version


;;; correction

(define (fn1 n)
    (define (fn-iter a b c i)
        (if (= n i)
            (+ (* 3 a) (* 2 b) c)
            (fn-iter b c (+ (* 3 a) (* 2 b) c) (+ i 1))))
    (if (< n 3)
        n
        (fn-iter 0 1 2 3)))

(f 3)
(fn 3)
(fn1 3)
(f 6)
(fn 6)
(fn1 6)
(f 10)
(fn 10)
(fn1 10)