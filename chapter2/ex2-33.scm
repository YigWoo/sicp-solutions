(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (map p sequence)
  (accumulate
   (lambda (x y) (cons (p x) y))
   () sequence))

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(define (length sequence)
  (accumulate (lambda (x y) (+ x 1)) 0 sequence))

;; test
(newline)

(display (map square (list 1 2)))
(newline)

(display (append (list 1 2) (list 3 4)))
(newline)

(display (length (list 3 4 5 6)))
