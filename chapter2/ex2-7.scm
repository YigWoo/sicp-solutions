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

(define (upper-bound x) (cdr x))
(define (lower-bound x) (car x))


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

; 2.8
(newline)
(display "-------------\n")
(display "define sub-interval")
(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
		 (- (upper-bound x) (lower-bound y))))
(newline)
(display "test (sub-interval a b)")
(newline)
(display (sub-interval a b))

; 2.9
(newline)
(display "-------------\n")
(define (interval-width x)
  (/ (abs (- (upper-bound x) (lower-bound x))) 2))

(display (interval-width (add-interval a b)))
(newline)
(display (+ (interval-width a) (interval-width b)))
(newline)
(display "interval-width of (add-interval a b) is just (width a) + (width b)")
(newline)

(display (interval-width (sub-interval a b)))
(newline)
(display (+ (interval-width a) (interval-width b)))
(newline)
(display "interval-width of (sub-interval a b) is just (width a) + (width b)\n")

(display (interval-width (mul-interval a b)))
(newline)
(display (* (interval-width a) (interval-width b)))
(newline)
(display (/ (interval-width a) (interval-width b)))
(newline)
(display (* (interval-width b) (interval-width a)))
(newline)
(display (/ (interval-width b) (interval-width a)))
(newline)
(display (+ (interval-width a) (interval-width b)))
(newline)
(display (- (interval-width a) (interval-width b)))
(newline)
(display (- (interval-width b) (interval-width a)))
(newline)

; 2.10
(newline)
(display "-------------\n")
