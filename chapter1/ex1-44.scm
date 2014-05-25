;; 实现n次平滑一个函数

;; 这道题目中的涉及到的思想，我想在还是没有太理解透。
;; 但是大体上想来，最关键的是repeated过程的调用。
;; 在1-43中，调用repeated过程中的f，f的参数都是数值
;; 而在这里，smooth-n中的(repeated smooth n)的smooth
;; 其参数为另外一个过程。

(load "ex1-43.scm")

(define dx 0.1)

;; smooth(x) = (f(x) + f(x+dx) + f(x-dx)) / 3
(define (smooth f)
  (lambda (x)
    (/ (+ (f x) (f (- x dx)) (f (+ x dx))) 3)))

;; (repeated smooth n)是一个lambda函数， 接受一个
;; 函数作为参数
;; 所以也可以这么写, 参考sicp解题集（readthedocs上）
(define (smooth-n-with-let f n)
  (let ((n-time-smooth (repeated smooth n)))
    (n-time-smooth f)))

(define (smooth-n f n)
  ((repeated smooth n) f))
;; 相当于
;; (smooth (smooth (smooth (...(smooth f)...))))

(define (test-f x)
  (+ (* x x) (* 2 x) 1))

(define (plain-f x)
  (* 2 x))
