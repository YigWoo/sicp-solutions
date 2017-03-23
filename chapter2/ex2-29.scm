(define (make-mobile left right)
    (list left right))

(define (make-branch length structure)
  (list length structure))

(define left-branch car)

(define right-branch cadr)

(define branch-length car)

(define branch-structure cadr)

(define (mobile? m)
  (and (pair? m)
       (pair? (left-branch m))))

(define (total-weight mobile)
  (let ((lb (left-branch mobile))
        (rb (right-branch mobile)))
  (if (mobile? mobile)
      (+ (total-weight lb)
         (total-weight rb))
      (+ (branch-length mobile)
         (cond ((not (pair? rb)) rb)
               ((mobile? rb) (total-weight rb))
               (branch-length rb))))))

(define (calc-torque mobile level)
  (if (mobile? mobile)
      (+ (calc-torque (left-branch mobile) (+ level 1))
         (calc-torque (right-branch mobile) (+ level 1)))
      (+ (* (branch-length mobile) level)
         (cond ((not (pair? (right-branch mobile))) (* (right-branch mobile) level))
               ((moible? (right-branch mobile)) (calc-torque (right-branch mobile) (+ level 1)))
               (* (branch-length (right-branch mobile)) (+ level 1))))))

(define (is-balanced mobile)
  (= (calc-torque (left-branch mobile) 0)
     (calc-torque (right-branch mobile) 0)))

;; (define (make-mobile left right)
;;   (cons left right))

;; (define (make-branch length structure)
;;   (cons length structure))
