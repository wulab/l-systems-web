;; Based on Graphical Applications of L-Systems by Przemyslaw Prusinkiewicz
;; http://algorithmicbotany.org/papers/graphical-applications.pdf

(define (predecessor production)
  (car production))

(define (successor production)
  (cdr (cdr production)))

(define (rewrite alphabet)
  (if (assq alphabet productions)
      (successor (assq alphabet productions))
      (list alphabet)))

(define (generate word)
  (if (null? word)
      nil
      (append (rewrite (car word))
              (generate (cdr word)))))

(define (derive word n)
  (if (= n 0)
      word
      (derive (generate word) (-1+ n))))
