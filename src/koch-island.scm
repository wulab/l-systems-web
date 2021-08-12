(load "turtle.scm")
(load "0l-system.scm")

(define alphabets '(F + -))

(define axiom '(F + F + F + F))

(define productions
  '((F -> F + F - F - F F + F + F - F)
    (+ -> +)
    (- -> -)))

(interpret (derive axiom 3) (make-state 250 250 90) 3 90)
