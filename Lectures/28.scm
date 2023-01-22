; List demos

(define s (cons 1 (cons 2 nil)))
(cons 3 s)
(cons 4 (cons 3 s))
(cons (cons 4 (cons 3 nil)) s)
(car (car (cons (cons 4 (cons 3 nil)) s)))
(cons s (cons s nil))

(list? s)
(list? nil)
(list? 4)
(null? nil)
(null? s)

(list 1 2)
(list 1 2 3 4)
(cdr (list 1 2 3 4))
(cons 0 (cdr (list 1 2 3 4)))

(list s)
(list 3 s)
(cons 3 s)
(list s s)
(cons s s)

(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))

(define squares (list 1 4 9 16 25))

(length squares)

(append s s)
(cons s s)

; Quotation demos

'(1 2 3)
(quote (1 2 3))
'(1 (2 3) 4)
(car (cdr (car (cdr '(1 (2 3) 4)))))
(car (cdr (car (cdr '(a (b c) d)))))
'(+ 1 2)
(car (quote (+ 1 2)))
(car '(+ 1 2))
(cons '+ (list 1 2))

; List processing

(define s (cons 1 (cons 2 nil)))
(append s s)
(map (lambda (x) (* 2 x)) '(3 4 5)) 
(map (lambda (s) (cons 2 s)) '((3) (4 5)))
(filter even? '(3 4 5))
(apply + '(3 4 5))
(map + '(3 4 5))

;;; non-empty subsets of integer list s that have an even sum
(define (even-subsets s)
  (if (null? s) nil
      (append (even-subsets (cdr s))
              (map (lambda (t) (cons (car s) t))
  	           (if (even? (car s))
		       (even-subsets (cdr s))
		       (odd-subsets (cdr s))))
	      (if (even? (car s)) (list (list (car s))) nil))))

;;; non-empty subsets of integer list s that have an odd sum
(define (odd-subsets s)
  (if (null? s) nil
      (append (odd-subsets (cdr s))
              (map (lambda (t) (cons (car s) t))
  	           (if (odd? (car s))
		       (even-subsets (cdr s))
		       (odd-subsets (cdr s))))
	      (if (odd? (car s)) (list (list (car s))) nil))))

;;; non-empty subsets of s
(define (nonempty-subsets s)
  (if (null? s) nil
      (let ((rest (nonempty-subsets (cdr s))))
	 (append rest 
		 (map (lambda (t) (cons (car s) t)) rest)
		 (list (list (car s)))))))

(define (even-subsets2 s)
  (filter (lambda (s) (even? (apply + s))) (nonempty-subsets s)))
	    