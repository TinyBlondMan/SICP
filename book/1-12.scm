;;; First solution
(define (choose n m)
    (cond ((or (= n m) (= m 0)) 1)
          ((or (= m (- n 1)) (= m 1)) n)
          (else (+ (choose (- n 1) m)
                   (choose (- n 1) (- m 1))))))


;;; Second solution
 (define (pascal r c) 
   (if (or (= c 1) (= c r)) 
       1 
       (+ (pascal (- r 1) (- c 1)) (pascal (- r 1) c)))) 

 (pascal 1 1) ;1
 (pascal 2 2) ;1
 (pascal 3 2) ;2
 (pascal 4 2) ;3
 (pascal 5 3) ;6