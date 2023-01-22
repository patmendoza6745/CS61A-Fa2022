; Quasiquotation practice

(define (square-expr term) `(* ,term ,term))
`(+ ,(square-expr `a) ,(square-expr `b))
(square-expr (square-expr (square-expr 'x)))

; Macros

(print 2)
(begin (print 2) (print 2))
(define (twice expr) (list 'begin expr expr))
(twice (print 2))
(twice '(print 2))
(eval (twice '(print 2)))

(define-macro (twice expr) (list 'begin expr expr))

(define x -2)
(define (check val) (if val 'Passed 'Failed))
(check (> x 0))
(define-macro (check expr) (list 'if expr ''Passed ''Failed))
(check (> x 0))
(define-macro (check expr) (list 'if expr ''Passed (list 'quote (list 'Failed:  expr))))
(check (> x 0))

; For

(define (map fn vals) 
  (if (null? vals) 
      () 
      (cons (fn (car vals)) 
            (map fn (cdr vals)))))

(map (lambda (x) (* x x)) '(2 3 4 5))

(define-macro (for sym vals expr)
  (list 'map (list 'lambda (list sym) expr) vals))

(define-macro (for sym vals exprs)
  `(map (lambda (,sym) ,@exprs) ,vals))

(for x '(2 3 4 5) (* x x))

; Trace

(define fact (lambda (n)
  (if (zero? n) 1 (* n (fact (- n 1))))))

(fact 5)

; Trace (fact 5)
(begin
  (define original fact)
  (define fact (lambda (n) 
  	         (print (list 'fact n)) 
  	         (original n)))
  (define result (fact 5))
  (define fact original)
  result)

(fact 5)

;; E.g., (trace (fact 5))
(define-macro (trace expr)
  (define operator (car expr))
  `(begin
     (define original ,operator)
     (define ,operator (lambda (n) 
			  (print (list (quote ,operator) n)) 
			  (original n)))
     (define result ,expr)
     (define ,operator original)
     result))

(fact 5)
(trace (fact 5))
(fact 5)
  
