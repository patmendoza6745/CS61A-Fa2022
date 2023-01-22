(define-macro (when condition exprs)

  (list 'if condition 
    (cons 'begin exprs)
    (list 'print ''okay)
  )

)

(define-macro (switch expr cases)
	(cons 'cond
		(map (lambda (case) (cons `(eq? ,expr ',(car case)) (cdr case)))
    			cases))
)
