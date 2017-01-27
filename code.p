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
  (cond ; Conditional statement
    ((null? L) 0) ; Is the list empty? Return 0
    ((list? (car L)) (sum-up-numbers-simple(cdr L))) ; Is the first element a list? Continue with the rest of the list 
    ((number? (car L)) (+ (car L) (sum-up-numbers-simple (cdr L)))) ; Is the first element a number? Continue with the rest of the list while having added the value of the number
    (else (sum-up-numbers-simple (cdr L) )) ; Continue to the next element in the list.
  )
)

(define (sum-up-numbers-general L) ;Sum up all numbers in a list
  (cond ; Conditional statement
    ((null? L) 0) ; Is the list empty? Have we come to the end of the list? Return 0
    ((list? (car L)) (+ (sum-up-numbers-general(car L))(sum-up-numbers-general(cdr L)))) ; Adding the function call of the partitioned sub-list with the remaining sections
    ((number? (car L)) (+ (car L) (sum-up-numbers-general (cdr L)))) ; Check if the element is a number. Call recursion to continue til end of list while adding the value of the number
    (else (sum-up-numbers-general (cdr L) )) ; Continue to the next element in the list since its not the end of the list
  )
)
