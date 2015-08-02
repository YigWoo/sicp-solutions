(define zero (lambda (f) (lambda (x) x)))
(define (add-1 n) (lambda (f) (lambda (x) (f ((n f) x)))))

; one equals (add-1 zero)
(add-1 zero)
; replace n with zero
(lambda (f)
  (lambda (x)
    (f ((zero f))
       x)))
; substitute
(lambda (f)
  (lambda (x)
    (f
     (((lambda (f) (lambda (x) x)) f) x))))
; substitute
(lambda (f)
  (lambda (x)
    (f
     ((lambda (x) x) x)
     )))
; substitute, the final form of one
(lambda (f)
  (lambda (x)
    (f x)))

; define one
(define one
  (lambda (f) (lambda (x) (f x))))

; two equals (add-1 one)
(add-1 one)
(lambda (f)
  (lambda (x)
    (f
     ((one f) x))))
; sub
(lambda (f)
  (lambda (x)
    (f
     (((lambda (f) (lambda (x) (f x))) f) x))))
; sub
(lambda (f)
  (lambda (x)
    (f
     ((lambda (x) (f x)) x))))
; sub
(lambda (f)
  (lambda (x)
    (f
     (f x))))
; define two
(define two
  (lambda (f) (lambda (x) (f (f x)))))

; define plus operation directly
; I do not have much knowledge on lambda calculus
; so I come up with the solution from wikipedia
; and add-1 function
(define plus
  (lambda (m)
    (lambda (n)
      (lambda (f)
        (lambda (x)
          (m f ((n f) x)))))))

; try to verify the function

(plus one one)

; sub
(lambda (f)
  (lambda (x)
    (one f
         ((one f) x))))

(lambda (f)
  (lambda (x)
    (one f
         (((lambda (f) (lambda (x) (f x))) f) x))))

(lambda (f)
  (lambda (x)
    (one f
         ((lambda (x) (f x)) x))))

(lambda (f)
  (lambda (x)
    (one f
         (f x))))

(lambda (f)
  (lambda (x)
    ((lambda (f) (lambda (x) (f x)))
     f
     (f x))))

(lambda (f)
  (lambda (x)
    ((lambda (x) (f x)) (f x))))

; substitute x with (f x)

(lambda (f)
  (lambda (x)
    (f (f x))))

; the final result is two as defined
