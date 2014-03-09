(define (fast-expt b n)
  (fast-expt-iter b 1 n))

(define (fast-expt-iter b a n)
  (cond ((= n 0) a)
        ((even? n) (fast-expt-iter (square b) a (/ n 2)))
        (else (fast-expt-iter b (* a b) (- n 1)))))

(newline)
(display (fast-expt 2 10))
(newline)
(display (fast-expt 3 3))
(newline)
