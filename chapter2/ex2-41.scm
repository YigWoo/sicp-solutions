(define (unique-pairs n)
  (flatmap
   (lambda (i)
         (map (lambda (j) (list i j))
              (enumerate-interval 1 (- i 1))))
       (enumerate-interval 1 n)))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (enumerate-interval low high)
  (if (> low high)
      ()
      (cons low (enumerate-interval (+ low 1) high))))

(define (flatmap proc seq)
  (accumulate append () (map proc seq)))

(define (ordered-triple n s)
  (filter (lambda (triple)
            (= s (+ (car triple) (cadr triple) (caddr triple))))
          (flatmap (lambda (i)
                     (map (lambda (j) (append (list i)  j))
                          (unique-pairs (- i 1))))
                   (enumerate-interval 1 n))))
