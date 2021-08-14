(load "turtle.scm")
(load "0l-system.scm")

(define alphabets '(F + -))

(define axiom '(F + F + F + F))

(define productions
  '((F -> F + F - F - F F + F + F - F)
    (+ -> +)
    (- -> -)))

(define turtle (make-turtle-on-plane "Koch island" 500 500))

((turtle 'set-state) (make-state 250 250 90))
((turtle 'interpret) (derive axiom 3) 2 90)
