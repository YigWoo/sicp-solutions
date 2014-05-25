;; 实现f(f(f...f(x)))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (inc x) (+ x 1))

(define (repeated f n)
  (define (repeated-sub composed k)
    (if (= k 1)
        composed
        (repeated-sub (compose composed f) (- k 1))))
  (repeated-sub f n))
