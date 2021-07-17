;; http://algorithmicbotany.org/papers/applications-of-l-systems-to-computer-imagery.pdf

(define nil '())

(define alphabets '(A B))

(define axiom '(A))

(define productions
  '((A -> A B)
    (B -> A)))

(define (predecessor production)
  (car production))

(define (successor production)
  (cdr (cdr production)))

(define (rewrite alphabet)
  (successor (assq alphabet productions)))

(define (generate word)
  (if (null? word)
      nil
      (append (rewrite (car word))
              (generate (cdr word)))))

(define (derive word n)
  (if (= n 0)
      word
      (derive (generate word) (-1+ n))))
