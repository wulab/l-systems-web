;; representation

(define nil '())

(define (make-state x y a)
  (list x y a))

(define (position-x state)
  (car state))

(define (position-y state)
  (cadr state))

(define (heading state)
  (caddr state))

;; operations

(define (move state d a)
  (make-state (+ (position-x state) (* d (cos a)))
              (+ (position-y state) (* d (sin a)))
              (+ (heading state) a)))

(define (make-turtle state)
  (define history nil)
  (define (move-forward d)
    (display (string-append "Move forward " (number->string d) " unit(s)\n"))
    (set! history (cons (forward d) history))
    (set! state (move state d 0))
    state)
  (define (move-right a)
    (display (string-append "Turn right " (number->string a) " degree(s)\n"))
    (set! history (cons (turn-right a) history))
    (set! state (move state 0 a))
    state)
  (define (move-left a)
    (display (string-append "Turn left " (number->string a) " degree(s)\n"))
    (set! history (cons (turn-left a) history))
    (set! state (move state 0 (- a)))
    state)
  (define (dispatch m)
    (cond ((eq? m 'forward) move-forward)
          ((eq? m 'right) move-right)
          ((eq? m 'left) move-left)
          ((eq? m 'state) state)
          ((eq? m 'history) (reverse history))
          (else (error "Unknown command"))))
  dispatch)

;; operator

(define (interpret word state d a)
  (define turtle (make-turtle state))
  (define (dispatch m)
    (cond ((eq? m 'F) ((turtle 'forward) d))
          ((eq? m '+) ((turtle 'right) a))
          ((eq? m '-) ((turtle 'left) a))
          (else (error "Unknown alphabet"))))
  (for-each dispatch word)
  (draw (turtle 'history)))
