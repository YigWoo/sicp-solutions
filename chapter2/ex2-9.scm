;; 2.9
(load "ex2-7")
(newline)
(display "-------------\n")
(define (interval-width x)
  (/ (abs (- (upper-bound x) (lower-bound x))) 2))

(display (interval-width (add-interval a b)))
(newline)
(display (+ (interval-width a) (interval-width b)))
(newline)
(display "interval-width of (add-interval a b) is just (width a) + (width b)")
(newline)

(display (interval-width (sub-interval a b)))
(newline)
(display (+ (interval-width a) (interval-width b)))
(newline)
(display "interval-width of (sub-interval a b) is just (width a) + (width b)\n")

(display (interval-width (mul-interval a b)))
(newline)
(display (* (interval-width a) (interval-width b)))
(newline)
(display (/ (interval-width a) (interval-width b)))
(newline)
(display (* (interval-width b) (interval-width a)))
(newline)
(display (/ (interval-width b) (interval-width a)))
(newline)
(display (+ (interval-width a) (interval-width b)))
(newline)
(display (- (interval-width a) (interval-width b)))
(newline)
(display (- (interval-width b) (interval-width a)))
(newline)