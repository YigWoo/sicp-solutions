;; recursive form of cont-frac
;; 定义递归计算无限分式的方法
;; k作为总的项数，i作为计算中具体的某一项。
;; i从1开始，每步递归都增加1。
;; 当i == k的时候，说明程序在进行第k项的运算
;; 因为第k项是可以直接计算的，所以直接返回第k项的值。
;; 然后递归栈逐一返回，直到返回至第1项，求出无线分式的值。
(define (cont-frac-recursive n d k)
  (define (cont-frac-recursive-sub n d i)
    (if (= k i)
      (/ (n k) (d k))
      (/ (n k) (+ (d k) (cont-frac-recursive n d (- k 1))))))
  (cont-frac-recursive-sub n d 1))


;; 从截断的那一项去分析，因为后面的分式都被截取了，相当与
;; 后面的所有分式的值都为0。
;; 所以可以计算截断项的值为 result[k] = N[k]/D[k] + 0
;; 然后将result作为参数传到下一个计算过程中。
;; 下一个计算步骤有：result[k-1] = N[k-1] / (D[k-1] + result[k])
;; 计算出result[k-1]之后，在将其传到下一个计算过程。
;; 以这种方法重复迭代，直到计算到最后一层（在无穷分式中是最顶层）。
;; 即result = N[1]/(D[1] + result[2])
;; 计算出最后的结果，即result
(define (cont-frac-iterative n d k)
  (define (iter-subprocess n d k val)
    (if (= k 0)
        val
        (iter-subprocess n d (- k 1) (/ (n k) (+ (d k) val)))))
  (iter-subprocess n d k 0 ))


(define (test-cont-frac cont-frac k)
  (display (cont-frac
            (lambda (i) 1.0)
            (lambda (i) 1.0)
            k)))

;; test
(newline)
(test-cont-frac cont-frac-recursive 20)
(newline)
(test-cont-frac cont-frac-iterative 20)

;; OUTPUT
;; .6180339850173578
;; .6180339850173578
