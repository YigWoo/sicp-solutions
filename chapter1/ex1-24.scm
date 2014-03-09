(load "timed-prime-test.scm")
(load "fermat-test.scm")

(define (start-prime-test n start-time)
  (if (fast-prime? n 10)
      (report-prime (- (runtime) start-time))))

(define (search-for-primes n)
  (incremental-search n 12))

(define (incremental-search n count)
  (cond ((= count 0) (display " are primes"))
        ((fast-prime? n 10)
         (timed-prime-test n)
         (incremental-search (+ n 1) (- count 1))
         )
        (else
         (incremental-search (+ n 1) count))))
