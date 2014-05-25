;; 正切函数
(define (cont-frac n d k)
  (define (cont-frac-sub n d i)
    (if (= k i)
        (/ (n i) (d i))
        (/ (n i) (- (d i) (cont-frac-sub n d (+ i 1))))))
  (cont-frac-sub n d 1))

(define (tan-cf x k)
  (exact->inexact  (cont-frac
                    (lambda (i) (if (= i 1) x (square x)))
                    (lambda (i) (- (* 2 i) 1))
                    k)))
