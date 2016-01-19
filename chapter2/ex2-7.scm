; 2.7
(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval x
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))

(define (make-interval a b) (cons a b))

(define (upper-bound x)
  (if (> (car x) (cdr x))
      (car x)
      (cdr x)))

(define (lower-bound x)
  (if (> (car x) (cdr x))
      (cdr x)
      (car x)))


(display "test upper-bound and lower-bound")
(newline)
(display "define a[1 2] and b[2 4]")
(newline)
(define a (make-interval 1 2))
(define b (make-interval 2 4))

(display "add")
(newline)
(display (add-interval a b))
(newline)
(display "mul")
(newline)
(display (mul-interval a b))
(newline)
(display "div")
(newline)
(display (div-interval a b))

