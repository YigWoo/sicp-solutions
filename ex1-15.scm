(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* x (cube x))))
(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))
