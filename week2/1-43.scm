(define (repeated f n)
    (lambda (x)
    (if (= n 0)
	    x
	    (f ((repeated f (- n 1)) x)))))

;;;((repeated square 2) 5)
;;; computes (square (square 5))
;;; 625

(define (square x) (* x x))

((repeated square 2) 5)




;;; FOR EXERCISE 1-42

;;; ((compose square inc) 6)
;;; gives 49
;;; by computing inc x then square result

(define (inc a) (1+ a))

(define (compose f g)
    (lambda (x) (f (g x))))

((compose square inc) 6)


;;; And for fun reverse-compose
;;; which computes square x then inc the result by one

(define (reverse-compose f g)
    (lambda (x) (g (f x))))

((reverse-compose square inc) 6)