(define (my-filter pred s) 

  (if (null? s) nil
    (if (pred (car s)) (cons (car s) (my-filter pred (cdr s)))
      (my-filter pred (cdr s))
    )
  )
)

(define (interleave lst1 lst2) 

  (cond ((null? lst1) lst2)
        ((null? lst2) lst1)
        (else (cons (car lst1) (interleave lst2 (cdr lst1))))
  )
)

(define (accumulate joiner start n term)
  
  (if (= (+ n 1) 1) start
    (accumulate joiner (joiner start (term n)) (- n 1) term)
  )
)

(define (no-repeats lst)

  (if (null? lst) nil
    (cons (car lst) (my-filter (lambda (elem) (not (= elem (car lst)))) (no-repeats (cdr lst))))
  )
)
