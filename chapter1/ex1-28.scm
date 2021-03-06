(define (nontrivial-square-root? a n)
  (and (not (= a 1))
       (not (= a (- n 1)))
       (= 1 (remainder (square a) n))))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((nontrivial-square-root? base m) 0)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m)) m))
        (else
         (remainder (* base (expmod base (- exp 1) m)) m))))

(define (test-step n)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((test-step n) (fast-prime? n (- times 10)))
        (else false)))

(define (rabin-miller-test n)
  (let ((times (ceiling (/ n 2))))
    (fast-prime? n times)))

(newline)
(display (rabin-miller-test 561))
(newline)
(display (rabin-miller-test 2465))
(newline)
(display (rabin-miller-test 2821))
(newline)
(display (rabin-miller-test 15))
(newline)
(display (rabin-miller-test 19))
