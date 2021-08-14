(define (load-verbose filename)
  (display (string-append "Loading " filename " ... "))
  (load filename)
  (display "done.\n"))

(load-verbose "integration.scm")
(load-verbose "koch-island.scm")
(load-verbose "hilbert-curve.scm")
