(load "timed-prime-test.scm")

(define (search-for-primes n)
  (incremental-search n 3))

(define (incremental-search n count)
  (cond ((= count 0) (display " are primes"))
        ((prime? n)
         (timed-prime-test n)
         (incremental-search (+ n 1) (- count 1))
         )
        (else
         (incremental-search (+ n 1) count))))
