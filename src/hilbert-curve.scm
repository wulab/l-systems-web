(load "turtle.scm")
(load "0l-system.scm")

(define axiom '(X))

(define productions
  '((X -> - Y F + X F X + F Y -)
    (Y -> + X F - Y F Y - F X +)))

(define turtle (make-turtle-on-plane "Hilbert curve" 500 500))

((turtle 'interpret) (derive axiom 5) 6 90)
