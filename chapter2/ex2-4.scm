(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

; (car (cons x y))
; ((cons x y) (lambda (p q) p))
; ((lambda (p q) p) x y)
; x
(define (cdr z)
  (z (lambda (p q) q)))

; test
(car (cons 1 2)) ; 1
(cdr (cons 1 2)) ; 2



