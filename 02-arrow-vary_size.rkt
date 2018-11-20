#lang racket

(require pict)

; describe a way to save the image
(define (save-pict img fname ftype)
  (define bm (pict->bitmap img))
  (send bm save-file fname ftype))

; create a rectangular background of specified color and size
(define (background color lx ly)
  (colorize (filled-rectangle lx ly) color))

; create a foreground shape
(define (foreground color size angle)
  (colorize (arrowhead size angle) color))

; superimpose forground shape on the background rectangle
; generate random size for the foreground shape
(define (myscene bgcolor fgcolor lx ly)
  (cc-superimpose (background bgcolor lx ly)
                  (foreground fgcolor (random (/ lx 20) (/ lx 4)) (/ pi 2))))

; Draw a gray rectangle with a ligher gray arrow in the center
(save-pict (myscene "dimgray" "lightgray" 1920 1080)
           "02-arrow-random_size.png" 'png)
