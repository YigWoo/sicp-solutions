;; filtered-accumulate, only accumulate the terms you want using a
;; filter.
(load "prime.scm")
(load "gcd.scm")

(define (filtered-accumulate combiner null-value term filter next a b)
  (if (> a b)
      null-value
      (if (filter a)
          (combiner (term a)
                    (filtered-accumulate combiner null-value term filter next (next a) b))
          (filtered-accumulate combiner null-value term filter next (next a) b))))

(define (identity x) x)
(define (inc x) (+ x 1))

(define (add-prime a b)
  (filtered-accumulate + 0 identity prime? inc a b))

(newline)
(display (add-prime 1 10))

(define (product-of-undivisables-to-n n)
  (define (undivisable? a)
    (= (gcd a n) 1))
  (filtered-accumulate * 1 identity undivisable? inc 1 n))

(newline)
(display (product-of-undivisables-to-n 10))
