; Simple pascal triangle calculation, no bound checks.

(define (pascal-triangle x y)
  (if (or (= x 1) (= y 1) (= y x))
      1
      (+ (pascal-triangle (- x 1) (- y 1)) (pascal-triangle (- x 1) y))))
