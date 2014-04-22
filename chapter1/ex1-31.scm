;; define a product abstraction procedure
;; f is the function which generate the term value. which you can think it as f(x)
;; a and b is the range
;; next is the function which generate the next x.
;; so you can see the whole procedure as
;; product(f, next, a, b) = f(a) * f(next(a)) * f(next(next(a))) * ... * f(b)
(define (product f next a b)
  (if (> a b)
      1
      (* (f a)
         (product f next (next a) b))))

(define (identity x)
  x)

(define (inc x)
  (+ x 1))

(define (factorial n)
  (product identity inc 1 n))

;; test of factorial
(newline)
(display (factorial 5))
(newline)
(display (factorial 10))
(newline)
(display (factorial 20))

;; iterative version of product
(define (product-iter f next a b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (f a)))))
  (iter a 1))

(define (factorial-iter n)
  (product-iter identity inc 1 n))

;; test of factorial-iter
(newline)
(display (factorial-iter 5))
(newline)
(display (factorial-iter 10))
(newline)
(display (factorial-iter 20))
