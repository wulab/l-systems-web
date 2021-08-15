(load "turtle.scm")
(load "0l-system.scm")

(define alphabets '(X Y F + -))

(define axiom '(X))

(define productions
  '((X -> X + Y F +)
    (Y -> - F X - Y)
    (F -> F)
    (+ -> +)
    (- -> -)))

(define turtle (make-turtle-on-plane "dragon curve" 500 500))

((turtle 'set-state) (make-state 250 250 90))
((turtle 'interpret) (derive axiom 14) 1 90)
