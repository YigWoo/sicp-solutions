;; 求x^3 + ax^2 + bx + c的零点

(define (cubic a b c)
  (lambda (x)
    (+ (* x x x) (* a (square x)) (* b x) c)))

(define a 1)
(define b 1)
(define c 2)

(newtons-method (cubic a b c) 1)
