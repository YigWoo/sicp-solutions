(load "ex2-2")
;; public area and perimeter used by two methods of solving the probelm

(define (area rect)
  (* (h-len rect) (v-len rect)))

(define (perimeter rect)
  (* 2 (+ (h-len rect) (v-len rect))))

(define (unit-test rect)
  (newline)
  (display "area: ")
  (display (area rect))
  (newline)
  (display "perimeter: ")
  (display (perimeter rect)))

;; first method is to use two point

(define (make-rect bottom-left top-right)
  (if (or (= (x-point bottom-left) (x-point top-right))
          (= (y-point bottom-left) (y-point top-right)))
      (error "point1 and point2 cannot form a rectangle")
      (cons bottom-left top-right)))

(define (bottom-left rect) (car rect))
(define (top-right rect) (cdr rect))
(define (h-len rect)
  (abs (- (x-point (bottom-left rect)) (x-point (top-right rect)))))
(define (v-len rect)
  (abs (- (y-point (bottom-left rect)) (y-point (top-right rect)))))

(define rect1 (make-rect (make-point 0 0) (make-point 2 2)))

(unit-test rect1)

;; second method is to use two segments

;; need too much error checking, ommit it
(define (make-rect2 h-side v-side)
  (cons h-side v-side))

(define (square x)
  (* x x))

(define (seg-len segment)
  (sqrt (+ (square (- (car (x-point segment)) (car (y-point segment))))
           (square (- (cdr (x-point segment)) (cdr (y-point segment)))))))

(define (h-len rect)
  (seg-len (car rect)))

(define (v-len rect)
  (seg-len (cdr rect)))


(define h-side (make-segment (make-point 0 0) (make-point 2 0)))
(define v-side (make-segment (make-point 0 0) (make-point 0 2)))

(define rect2 (make-rect2 h-side v-side))

(unit-test rect2)
