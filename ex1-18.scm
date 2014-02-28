(define (double num)
  (+ num num))

(define (halve num)
  (/ num 2))

(define (fast-multi a b)
  (fast-multi-iter a b 0))

(define (fast-multi-iter a b c)
  (cond ((= b 0) c)
        ((even? b) (fast-multi-iter (double a) (halve b) c))
        (else (fast-multi-iter a (- b 1) (+ c a)))))


(newline)
(display (fast-multi 3 4))
(newline)
(display (fast-multi 15 21))
(newline)
(display (fast-multi 30 1234))
(newline)
(display (fast-multi 11111111 11111111))
