(define (reverse-general L)
  (cond ;Conditional statement
    ((null? L) '()) ;Is list is empty? [Return Value: empty list] 
    ((list? L) ;Is element a list? [Return Value: append everything but first element with list version of first element  
     (append
      (reverse-general (cdr L))(list (reverse-general (car L))))
    )
    (else L) ;Else return the list
  ) 
)
