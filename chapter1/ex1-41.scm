(define (inc x)
  (+ x 1))

(define (double f)
  (lambda (x) (f (f x))))

(newline)
(display ((double inc) 1))
;; => 3

(newline)
(display ((double square) 2))
;; => 16

(newline)
(display (((double (double double)) inc) 5))
;; => 21
