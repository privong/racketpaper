#lang racket

(require pict)

; Draw a gray rectangle with a ligher gray arrow in the center
(cc-superimpose (colorize (filled-rectangle 1920 1080) "dimgray")
                (colorize (arrowhead 430 (/ pi 2)) "lightgray"))
