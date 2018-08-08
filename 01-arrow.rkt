#lang racket

(require pict)

(define (save-pict img fname ftype)
  (define bm (pict->bitmap img))
  (send bm save-file fname ftype))

; Draw a gray rectangle with a ligher gray arrow in the center
(save-pict (cc-superimpose (colorize (filled-rectangle 1920 1080) "dimgray")
                           (colorize (arrowhead 430 (/ pi 2)) "lightgray"))
           "01-arrow.png" 'png)
