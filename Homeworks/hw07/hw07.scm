(define (cddr s) (cdr (cdr s)))

(define (cadr s) (car (cdr s)))

(define (caddr s) (car (cddr s)))

(define (ascending? asc-lst)  
    (if (or (null? asc-lst) (null? (cdr asc-lst))) #t
        (if (<= (car asc-lst) (car (cdr asc-lst))) 
            (ascending? (cdr asc-lst))
            #f)))

(define (square n) (* n n))

(define (pow base exp)         
    
    (cond ((or (= base 1) (= exp 0)) 1)
          ((even? exp) (square (pow base (quotient exp 2)))) 
          (else (* base (pow base (- exp 1)))))
    )