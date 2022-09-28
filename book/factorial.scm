;;; first method, recursively goign from n to 1
(define (factorial n)
(if (= n 1)
1
(* n (factorial (- n 1)))))

(factorial 6)

;;; logic behind the scene, every line give the same answer
(factorial 6)
;(* 6 (factorial 5))
;(* 6 (* 5 (factorial 4)))
;(* 6 (* 5 (* 4 (factorial 3))))
;(* 6 (* 5 (* 4 (* 3 (factorial 2)))))
;(* 6 (* 5 (* 4 (* 3 (* 2 (factorial 1))))))
;(* 6 (* 5 (* 4 (* 3 (* 2 1)))))
;(* 6 (* 5 (* 4 (* 3 2))))
;(* 6 (* 5 (* 4 6)))
;(* 6 (* 5 24))
;
(* 6 120)

;;; alternative method, going from 1 to n
(define (factorial-alternative n)
    (fact-iter 1 1 n))
(define (fact-iter product counter max-count)
    (if (> counter max-count)
        product
        (fact-iter (* counter product)
                   (+ counter 1)
                   max-count)))

(factorial-alternative 6)

;;; with block structure
(define (factorial-block n)
    (define (iter product counter)
        (if (> counter n)
            product
            (iter (* counter product)
                (+ counter 1))))
    (iter 1 1))

(factorial-block 6)