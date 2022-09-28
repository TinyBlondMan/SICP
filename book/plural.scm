
;;;helper functions
(define (return-last-letter st)
    (substring st (get-last-letter st)))

(define (get-last-letter st)
    (- (string-length st) 1))

(define (butlast st)
    (substring st 0 (get-last-letter st)))

(define (compare-last-letters st x)
    (string=? (return-last-letter st) x))


;;; plural function
(define (plural wd)
    (define trimmed (string-trim wd))
    (cond   ((compare-last-letters trimmed "y" ) 
                (string-append (butlast trimmed) "ies"))
            ((compare-last-letters trimmed "s") 
                (string-append trimmed "es"))
    (else (string-append trimmed "s"))))



;;; tests
(get-last-letter "book")
(return-last-letter "book")
(butlast "study")
(compare-last-letters "book" "y")
(compare-last-letters "study" "y")
(plural "book")
(plural "study")
(plural "bus")