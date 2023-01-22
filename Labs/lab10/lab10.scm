(define (over-or-under num1 num2) 
    (cond ((< num1 num2) -1)
        ((> num1 num2) 1)                   
        (else 0)))

(define (make-adder num) (lambda (int) (+ num int)))

(define (composed f g) (lambda (x) (f (g x))))

(define lst (cons '(1) (cons 2 (cons (cons 3 (cons 4 nil)) (cons 5 nil)))))

(define (duplicate lst) 
    (if (null? lst) nil
        (cons (car lst) (cons (car lst) (duplicate (cdr lst))))
    ))
