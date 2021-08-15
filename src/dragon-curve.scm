(load "turtle.scm")
(load "0l-system.scm")

(define axiom '(X))

(define productions
  '((X -> X + Y F +)
    (Y -> - F X - Y)))

(define turtle (make-turtle-on-plane "dragon curve" 500 500))

((turtle 'interpret) (derive axiom 14) 1 90)
