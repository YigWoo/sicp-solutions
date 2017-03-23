(define (square-tree1 tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (square-tree1 sub-tree)
             (square sub-tree)))
       tree))

(square-tree1
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))
