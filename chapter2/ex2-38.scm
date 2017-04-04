(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(fold-left / 1 (list 1 2 3))

;; give a property that `op` should satisfy
;; to guarantee that fold-right and fold-left
;; will produce the same values for any sequence
;; 能够想到的一个就是，对于输入的序列没有顺序的要求
