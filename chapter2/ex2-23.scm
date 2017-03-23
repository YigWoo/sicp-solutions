(for-each 
 (lambda (x) (newline) (display x))
 (list 57 321 88))

(define (for-each proc items)
  (if (null? items)
      ()
      (cons (proc (car items))
            (for-each proc (cdr items)))))
