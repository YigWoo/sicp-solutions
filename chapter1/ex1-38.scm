;; 基于欧拉展开式求e的近似值
(load "ex1-37.scm")

;; 先定义D[i]
;; 观察到对于一个整数i，如果i%3 == 2，令k = i / 3
;; 那么，其对应的D[i]的值就为2k+2
;; 于是有D[3k+2] = 2k+2
;; 对于其他的i值，D[i]都是1
(define (d i)
  (let ((k (modulo i 3))
        (t (quotient i 3)))
    (if (= 2 k)
        (+ 2 (* 2 t))
        1)))

;; 使用练习37所定义的无限分式计算e的值，k表示近似程度
(define (e-by-k k)
  (+ 2 (cont-frac-iterative
        (lambda (i) 1.0)
        d
        k)))
