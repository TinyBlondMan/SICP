(define (double f)
    (lambda (x) (f (f x))))

(define inc (lambda (x) (1+ x)))

((double inc) 5)
((double (double inc)) 5)
((double (double (double inc))) 5)
((double (double (double (double inc)))) 5)

(((double (double double)) inc) 5)