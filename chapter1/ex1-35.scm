;; require fixed-point function
(load "fixed-point.scm")

(define golden-ratio (fixed-point (lambda (x) (+ 1 (/ 1 x))) 2))

(display golden-ratio)
(newline)
(display (exact->inexact golden-ratio))
