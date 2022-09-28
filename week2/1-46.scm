;;; Write three procedures:
;;; 1 - iterative-improve which takes two arguments
;;;     returns a procedure that takes a guess as argument
;;; 2 - good enough? to detect if the guess is good enough
;;; 3 - improve which improves the guess 

(define (average a b) (/ (+ a b) 2))
(define tolerance 0.00001)


(define (iterative-improve good-enough? improve)
  (define (iterate guess)
    (if (good-enough? guess)
	    (if (< (abs (- (square (round guess)) (square guess))) tolerance) ;defining if round or not
            (round guess) 
            guess) 
	    (iterate (improve guess))))
  iterate)


(define (sqrt x)  ;; compare to bottom of page 30 of SICP
  ((iterative-improve 
    (lambda (guess) (< (abs (- (square guess) x)) tolerance)) ; good-enough?
	(lambda (guess) (average guess (/ x guess)))) ; improve
   1.0))


;;;(define (fixed-point f first-guess)  ;; compare to page 69
;;;  ((iterative-improve (lambda (guess) (< (abs (- guess (f guess))) tolerance)) f)
;;;   first-guess))


;;; results and tests
(define (square a) (* a a))

(sqrt 9) ;round
(sqrt 2) ;not round
(sqrt 14884) ;round
(sqrt 7) ;not round