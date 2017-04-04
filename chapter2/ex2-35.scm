(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))


(define (count-leaves t)
  (accumulate + 0 (map (lambda (node)
                         (if (pair? node)
                             (count-leaves node)
                             1)) t)))

;; test
(define x (cons (list 1 2) (list 3 4)))
(newline)
(display (count-leaves x))
(newline)
(display (count-leaves (list x x)))
