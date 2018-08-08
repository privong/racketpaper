#lang racket

(require pict)

(define (save-pict img fname ftype)
  (define bm (pict->bitmap img))
  (send bm save-file fname ftype))

(define (background color lx ly)
  (colorize (filled-rectangle lx ly) color))

(define (foreground color size angle)
  (colorize (arrowhead size angle) color))

(define (myscene bgcolor fgcolor lx ly)
  (cc-superimpose (background bgcolor lx ly)
                  (foreground fgcolor 430 (/ pi 2))))

; Draw a gray rectangle with a ligher gray arrow in the center
(save-pict (myscene "dimgray" "lightgray" 1920 1080)
           "01-arrow.png" 'png)
