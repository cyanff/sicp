#lang sicp
(define (square x) (* x x))
(square 9)
(define (sum-of-square x y) (+ (square x) (square y)))
(sum-of-square 2 2)

(/ 1 3)

(+ (* 2 4) (- 4 6))
(define a 3)
(define b (+ a 1))
(+ a b (* a b))
(= a b)

(if (and (> b a) (< b (* a b))) b a)

(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))

(+ 2 (if (> b a) b a))

(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1))

(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5))))) (* 3 (- 6 2) (- 2 7)))

(define (largest-2-sum-of-square x y z)
  (cond
    ((and (>= x z) (>= y z)) (sum-of-square x y))
    ((and (>= y x) (>= z x)) (sum-of-square y z))
    (else (sum-of-square z x))))

(= (largest-2-sum-of-square 10 10 10) (sum-of-square 10 10))
(= (largest-2-sum-of-square 1 10 10) (sum-of-square 10 10))
(= (largest-2-sum-of-square 10 1 10) (sum-of-square 10 10))
(= (largest-2-sum-of-square 10 10 1) (sum-of-square 10 10))
(= (largest-2-sum-of-square 1 10 100) (sum-of-square 10 100))
(= (largest-2-sum-of-square 1 100 10) (sum-of-square 10 100))
(= (largest-2-sum-of-square 10 1 100) (sum-of-square 10 100))
(= (largest-2-sum-of-square 10 100 1) (sum-of-square 10 100))
(= (largest-2-sum-of-square 100 10 1) (sum-of-square 10 100))
(= (largest-2-sum-of-square 100 1 10) (sum-of-square 10 100))



(define (a-plus-abs-b a b)
  ((if (>= b 0) + - ) a b))

(a-plus-abs-b 1 -1)

(define (p) (p))
(define (test x y)
  ((if (= x 0 ) 0 y)))
(test 0 p)


(define (abs x)
  (if (<= x 0) (- x) x))


(define (good-enough? guess next-guess)
  (let ((diff (- guess next-guess)))
    (<= (abs diff) (/ 1 100))))

(define (sqrt-iter guess x)
  (if (< x 0) "don't do that :<"
      (let ((next-guess (/ (+ guess (/ x guess)) 2 )))
        (if (good-enough? guess next-guess) next-guess
            (sqrt-iter next-guess x)))
      ))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt -1)


(define (cbrt-iter guess x)
  (if (< x 0) "don't do that :<"
      (let ((next-guess (/ (+ (* 2 guess) (/ x (square guess)) ) 3)))
        (if (good-enough? guess next-guess) next-guess (cbrt-iter next-guess x)))))

(define (cbrt x)
  (cbrt-iter 1.0 x))

(cbrt 27)



#|
(define (+ a b)
  (if (= a 0) b (inc (+ (dec a) b))))
                      ^ no tco


(define (+ a b)
  (if (= a 0) b (+ (dec a) (inc b))))
                 ^ last exp, tco
|#


(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1) (A x (- y 1))))))
#|
(A 0 n)
(* 2 n)

(A 1 n)


|#

(A 1 2)
(A 2 4)
(A 3 3)



