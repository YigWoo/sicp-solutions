;; Recursive version of accumulate.

;; method accumulate is a higher abstraction of
;; method sum and product
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (product term a next b)
  (accumulate * 1 term a next b))

(define (identity x)
  x)

(define (inc x)
  (+ x 1))

(define (sum-integers a b)
  (sum identity a inc b))

(newline)
(display (sum-integers 1 10))

(define (factorial n)
  (product identity 1 inc n))

(newline)
(display (factorial 10))

;; iterative version of method accumulate

(define (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result (term a)))))
  (iter a null-value))

(define (sum-iter term a next b)
  (accumulate-iter + 0 term a next b))

(define (product-iter term a next b)
  (accumulate-iter * 1 term a next b))

(define (sum-integer-iter a b)
  (sum-iter identity a inc b))

(define (factorial-iter n)
  (product-iter identity 1 inc n))

(newline)
(display (sum-integer-iter 1 10))
(newline)
(display (factorial-iter 10))
(newline)
0
