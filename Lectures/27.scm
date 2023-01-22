; Call expressions

(+ 1 2 3 4)
(+)
(*)
(- 12)
(- 20 1 2 3 4 5)
(* 2 (+ 1 (* 2 2 2 2 3 3 7)))
(number? 12)
(integer? 3.3)
(zero? 2)

; Definitions

(define (square x) (* x x))

(define (average x y) (/ (+ x y) 2))

(define (abs x)
  (if (< x 0)
      (- x)
      x))

(define (sqrt x)
  (define (improve guess)
    (average guess (/ x guess)))
  (define (sqrt-iter guess)
    (if (= (square guess) x)
        guess
        (sqrt-iter (improve guess))))
  (sqrt-iter 1))

; Let example

(define (star n m) 
  (let ((a (/ (* 360 m) n)))
    (define (side k) 
      (if (< k n) (begin (fd 100) (rt a) (side (+ k 1))))) 
    (side 0)))

(star 17 7)

; Sierpinski's Triangle (aka Sierpinski's Gasket).

(define (repeat k fn)
  ; Repeat fn k times.
  (fn)
  (if (> k 1) (repeat (- k 1) fn)))
(define (tri fn)
  ; Repeat fn 3 times, each followed by a 120 degree turn.
  (repeat 3 (lambda () (fn) (lt 120))))
(define (sier d k)
  ; Draw three legs of Sierpinski's triangle to depth k.
  (tri (lambda ()
         (if (= k 1) (fd d) (leg d k)))))
(define (leg d k)
  ; Draw one leg of Sierpinski's triangle to depth k.
  (sier (/ d 2) (- k 1))
  (penup) (fd d) (pendown))

(speed 0)
(rt 90)
(sier 200 5)