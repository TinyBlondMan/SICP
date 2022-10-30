(define (make-interval a b)
  (if (< a b)
    (cons a b )
    (cons b a)))

;;; ex 2.7
(define (lower-bound a) (car a))
(define (upper-bound a) (cdr a))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
  (make-interval (min p1 p2 p3 p4)
                 (max p1 p2 p3 p4))))

(define (div-interval x y)
  (if (spans-zero? y)
    (error "Error: Interval spans 0" y)
    (mul-interval
      x
      (make-interval (/ 1.0 (upper-bound y))
                 (/ 1.0 (lower-bound y))))))

(define (print-interval i)
  (newline)
  (display "[")
  (display (lower-bound i))
  (display ",")
  (display (upper-bound i))
  (display "]")))

;;; ex 2.8
(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))


;;; ex 2.9
(define a (make-interval 2 4))
(define b (make-interval 3 4))
(add-interval a b)
(mul-interval a b)

(define b (make-interval 4 5)) ;;; same b interval width as previously
(add-interval a b) ;;; same result width
(mul-interval a b) ;;; not same result width

;;; ex 2.10

(define (spans-zero? i)
(and 
	(not (> (lower-bound i) 0)) 
	(not (< (upper-bound i) 0))))

(define null-interval (make-interval -1 1))
;;; (div-interval a null-interval) ;;; throws error
(div-interval a b)

;;; ex 2.12
(define (make-center-percent a b)
  (make-interval (- (* (/ a 100) b) a)
        (+ (* (/ a 100) b) a)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2.0)))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2.0))

(define book-interval (make-center-percent 6.8 10.0))
(print-interval book-interval) ;;; 6,12 - 7,48

(define (percent i)
  (/ (width i) (center i)))

(percent book-interval)
