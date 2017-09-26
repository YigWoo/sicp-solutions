(define (filter predicate sequence)
  (cond ((null? sequence) ())
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))


(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))


(define (flatmap proc seq)
  (accumulate append () (map proc seq)))


(define (enumerate-interval low high)
  (if (> low high)
      ()
      (cons low (enumerate-interval (+ low 1) high))))


(define empty-board ())

(define (safe? k positions)
  (let ((new-queen (car positions))
        (rest-queens (cdr positions)))
    (null?
     (filter
      (lambda (queen)
        (let ((rest-row (car queen))
              (rest-col (cadr queen))
              (new-row (car new-queen))
              (new-col k))
          (or (= rest-row new-row)
              (= (abs (- rest-row new-row))
                 (abs (- rest-col new-col))))))
      rest-queens))))

(define (adjoin-position new-row k rest-of-queens)
  (cons (list new-row k) rest-of-queens))

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))
