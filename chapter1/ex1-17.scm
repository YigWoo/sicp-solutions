(define (double num)
  (+ num num))

(define (halve num)
  (/ num 2))

(define (fast-multi a b)
  (cond ((= b 0) 0)
        ((even? b) (fast-multi (double a) (halve b)))
        (else (+ a (fast-multi a (- b 1))))))

(newline)
(display (fast-multi 3 4))
(newline)
(display (fast-multi 15 21))
(newline)
(display (fast-multi 30 1234))
(newline)
(display (fast-multi 11111111 11111111))
