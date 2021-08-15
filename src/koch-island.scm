(load "turtle.scm")
(load "0l-system.scm")

(define axiom '(F + F + F + F))

(define productions
  '((F -> F + F - F - F F + F + F - F)))

(define turtle (make-turtle-on-plane "Koch island" 500 500))

((turtle 'interpret) (derive axiom 3) 2 90)
