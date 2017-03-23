(load "map")

(define (scale factor)
  (lambda (x) (* x factor)))

(define (scale-list items factor)
  (map (scale factor) items))
