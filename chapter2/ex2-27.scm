(define x
  (list (list 1 2) (list 3 4)))

(reverse x)

(define (deep-reverse items)
  (if (pair? items)
      (reverse (map deep-reverse t))
      items))

(define (contains-no-pair? items)
  (null? (filter pair? items)))


(define (eli-deep-reverse lst)
   (cond ((null? lst) ())
         ((pair? (car lst))
          (append
           (eli-deep-reverse (cdr lst))
           (list (eli-deep-reverse (car lst)))))
         (else
          (append
           (eli-deep-reverse (cdr lst))
           (list (car lst))))))

(define (deep-reverse-2 items)
  (cond ((null? items) ())
        ((not (pair? items)) items)
        (else
         (append (deep-reverse-2 (cdr items))
                 (list (deep-reverse-2 (car items)))))))

(define (deep-reverse-iter items)
  (define (iter things result)
    (if (null? things)
        result
        (if (pair? (car things))
            (let ((x (iter (car things) ())))
              (iter (cdr things) (cons x result)))
            (iter (cdr things) (cons (car things) result)))))
  (iter items ())) ; 没有理解这个是怎么写的
