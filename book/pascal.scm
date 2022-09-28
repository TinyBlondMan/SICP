;;; SECOND PART OF THE FILE WON'T INTEPRETE WITH MIT-SCHEME 
;;; as first, bf and every sentence functions aren't implemented in it


;;; recursive method
(define (pascal row col)
    (cond ((= col 0) 1)
        ((= col row) 1)
        (else (+ (pascal (- row 1) (- col 1))
            (pascal (- row 1) col) ))))


;;; iterative method
(define (new-pascal row col)
    (nth col (pascal-row row)) )

(define (pascal-row row-num)
    (define (iter in out)
        (if (empty? (bf in))
            out
    (iter (bf in) (se (+ (first in) (first (bf in))) out)) ))
    (define (next-row old-row num)
        (if (= num 0)
            old-row
            (next-row (se 1 (iter old-row `(1))) (- num 1)) ))
    (next-row `(1) row-num) )


(pascal 20 8) ;;; slow
(pascal-row 20) ;;; faster
(new-pascal 20 8)