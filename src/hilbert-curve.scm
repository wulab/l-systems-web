(load "turtle.scm")
(load "0l-system.scm")

(define alphabets '(X Y F + -))

(define axiom '(X))

(define productions
  '((X -> - Y F + X F X + F Y -)
    (Y -> + X F - Y F Y - F X +)
    (F -> F)
    (+ -> +)
    (- -> -)))

(define turtle (make-turtle-on-plane "Hilbert curve" 500 500))

((turtle 'set-state) (make-state 250 250 90))
((turtle 'interpret) (derive axiom 5) 6 90)
