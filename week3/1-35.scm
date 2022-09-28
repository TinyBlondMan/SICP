;;; fixed point --> f(x) = x
;;; in this case f(x) = 1 + 1/x = x
;;; so x + 1 = x² which is the golden ratio
;;;

(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1)