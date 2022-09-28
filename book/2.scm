(define (square a) (* a a))

(define (sum-square a b ) (+ (square a) (square b)))

(define (choose-sum-square a b c )
    (cond   ((and (<= a b)(<= a c)) (sum-square b c)) 
            ((and (<= b a)(<= b c)) (sum-square a c))
            (else (sumSquare a b))
    )
)

(choose-sum-square 3 2 4)