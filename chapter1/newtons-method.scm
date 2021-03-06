;; 牛顿法求不动点f(x) = x
(load "fixed-point.scm")

(define dx 0.00001)

(define (derive g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((derive g) x)))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))
