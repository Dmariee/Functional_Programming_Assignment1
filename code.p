(define (reverse-general L) ;Reverses the contents of a list including elements in nested lists
  (cond ;Conditional statement
    ((null? L) '()) ;Is list is empty? [Return Value: empty list] 
    ((list? L) ;Is element a list? [Return Value: append everything but first element with list version of first element  
     (append
      (reverse-general (cdr L))(list (reverse-general (car L))))
    )
    (else L) ;Else return the list
  ) 
)

(define (sum-up-numbers-simple L) ;Sum up all numbers in a list that are not in nested loops
  (cond
    ((null? L) 0) ;Is list empty? [Return Value: 0]
    ((list? (car L)) 0) ;Is it a nested list? [Return Value: 0]
    ((number? (car L)) (car L))
    (sum-up-numbers-simple (cdr L) (list(sum-up-numbers-simple (car L))))
  )
)
