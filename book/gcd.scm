;;; based on the fact that we know that:
;;; if r = remainder a b
;;; gcd for a and b is the same as b and r

(define (gcd a b)
    (if (= b 0) a
    (gcd b (remainder a b))))

(gcd 17282 1175176) ;;; 68 * 17282 so the answer is 17282
(/ 1175176 17282)