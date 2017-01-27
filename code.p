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
    ((null? L) '()) ; Is the list empty? [Return Value : 0]
    ((list? (car L)) 0)
   
    ((number? (car L)) (+ (car L) (sum-up-numbers-simple (cdr L)))) ;(cons(car L ))) ;Is the element a number? [Return Value:5 the number it is]
    ;((not(null? (cdr L))) (+ sum-up-numbers-simple(cdr L) (sum-up-numbers-simple(car L)))) ;Is list empty? [Return Value: 0]
    (else 0)
  )
)
