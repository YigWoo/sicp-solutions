(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (x) (dot-product x v)) m))

(define (transpose mat)
  (accumulate-n cons () mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
  (map (lambda (x) (matrix-*-vector cols x)) m)))

;; test
(define m (list (list 1 2 3 4) (list 4 5 6 6)
                (list 6 7 8 9)))
(define n (transpose m))

(define v (list 1 2 3 4))
(define w (list 1 2 3 4))
(newline)
(display (dot-product v w))
(newline)
(display (matrix-*-vector m v))
(newline)
(display (transpose m))
(newline)
(display (matrix-*-matrix m n))
