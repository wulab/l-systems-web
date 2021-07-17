(define (load-verbose filename)
  (display (string-append "Loading " filename " ... "))
  (load filename)
  (display "done.")
  (newline))

(load-verbose "operation-test.scm")
