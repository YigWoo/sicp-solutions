(load "map")

(define (square-list1 items)
  (if (null? items)
      ()
      (cons (square (car items))
            (square-list1 (cdr items)))))

(define (square-list2 items)
  (map (lambda (x) (square x)) items))


(display(square-list1 (list 1 2 3 4)))
(newline)
(display (square-list2 (list 1 2 3 4)))
