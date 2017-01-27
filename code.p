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
 ;----------------------------------------------------------------------------------------------------------------------------------------------------------------
(define (min-value-in-list L) ; Finds the smallest value in a list
  (cond
    ((null? L) #F) ;If list is empty return false saying that there are no numbers in the list
    ((not(number? (car L))) (min-value-in-list(cdr L))) ; If element is not a number continue searching the list
    ((null? (cdr L)) (car L)) ; Is there only one element in the list? Return that element
    ((not(number? (car(cdr L)))) (min-value-in-list(cons(car L) (cdr(cdr L)))))
    ((<(car L) (car(cdr L))) (min-value-in-list(cons(car L) (cdr(cdr L))))) ;Is the first element in the list smaller than the second element in the list?
    (else (min-value-in-list(cdr L))))
)

(define (get-values-greater-than L number) ; Deletes values that are smaller than number from the list
  (cond
    ((null? L) #F) ;There are no numbers in the list
    ((not(number? (car L))) (get-values-greater-than(cdr L) number))
    ((<= (car L) number) (get-values-greater-than(cdr L) number))
    (else (cons(car L) (get-values-greater-than(cdr L) number)))
   )
)

(define (min-above-min L1 L2) ; Definition of min-above-min...L1 & L2 are simple lists
  (cond ; Condiitional statement
    ((null? L1) #F) ; If L1 is empty the equation will equate to false
    ((null? L2) min-value-in-list(L1)) ; If L2 is empty do the function for finding smallest over L1
    ;((not(number? min-value-in-list(L2))) (min-value-in-list(L1)))
    ;(else (min-value-in-list(get-values-greater-than(L1 (min-value-in-list(L2))))))
  )
)
