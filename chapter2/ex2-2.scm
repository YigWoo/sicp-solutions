(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (make-segment start-point end-point)
  (cons start-point end-point))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

(define (make-point x-point y-point)
  (cons x-point y-point))

(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))

(define (midpoint-segment segment)
 (make-point (/ (+ (x-point (start-segment segment)) (x-point (end-segment segment))) 2)
             (/ (+ (y-point (start-segment segment)) (y-point (end-segment segment))) 2)))

(define s (make-point 0 0))
(define e (make-point 2 2))
(define l (make-segment s e))
(define mp (midpoint-segment l))

(define (unit-test)
  (newline)
  (print-point s)
  (newline)
  (print-point e)
  (newline)
  (print-point mp))

(define s1 (make-point 20 20))
(define e1 (make-point -10 -10))
(define l1 (make-segment s1 e1))
(define mp1 (midpoint-segment l1))

(define (unit-test1)
  (newline)
  (print-point s1)
  (newline)
  (print-point e1)
  (newline)
  (print-point mp1))
