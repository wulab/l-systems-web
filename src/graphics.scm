(load "vector.scm")

(define *viewport* 'viewport)
(define *canvas-size* 'canvas-size)

(define (make-viewport name w h)
  (set! *viewport* (open-viewport name w h))
  (set! *canvas-size* (cons w h))
  *viewport*)

(define (line-draw v0 v1)
  (let ((x0 (xcor v0))
        (y0 (- (cdr *canvas-size*) (ycor v0)))
        (x1 (xcor v1))
        (y1 (- (cdr *canvas-size*) (ycor v1))))
  (draw-line *viewport* x0 y0 x1 y1)))

;; bridge to javascript functions

(define (open-viewport name w h)
  (js-call (js-eval "openViewport") name w h))

(define (draw-line viewport x0 y0 x1 y1)
  (js-call (js-eval "drawLine") viewport x0 y0 x1 y1))

(define (draw-string viewport text x y)
  (js-call (js-eval "drawString") viewport text x y))
