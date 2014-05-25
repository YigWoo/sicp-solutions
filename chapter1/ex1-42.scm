;; 复合函数x -> f(g(x))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (inc x) (+ x 1))

(newline)
(display ((compose square inc) 6))
