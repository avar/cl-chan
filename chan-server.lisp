(in-package :cl-user)

;(push :hunchentoot-no-ssl *features*)

(require 'asdf)
(require 'hunchentoot)
(require 'cl-who)
(require 'cl-ppcre)

(defpackage :cl-chan
  (:use :cl :cl-who :hunchentoot)
  (:export :start-server :stop-server))

(in-package :cl-chan)

(defvar *server* (start-server :port 8092))

(push (hunchentoot:create-regex-dispatcher "^/$" 'chan-nav)
      hunchentoot:*dispatch-table*)

(push (hunchentoot:create-regex-dispatcher "^/nav$" 'chan-nav)
      hunchentoot:*dispatch-table*)

(push (hunchentoot:create-regex-dispatcher "^/\\w+/$" 'chan-board)
      hunchentoot:*dispatch-table*)

;;;
;;; cl-chan server configuration
;;;

(defparameter *boards*
  '(("a" "Anime & Manga")
    ("an" "Animals & Nature")
    ("b" "Random")
    ("c" "Anime/Cute")
    ("cgl" "Cosplay & EGL")
    ("ck" "Food & Cooking")
    ("cm" "Cute/Male")
    ("co" "Comics & Cartoons")
    ("d" "Hentai/Alternative")
    ("e" "Ecchi")
    ("g" "Technology")
    ("gif" "Animated GIF")
    ("h" "Hentai")
    ("hr" "High Resolution")
    ("k" "Weapons")
    ("m" "Mecha")
    ("mu" "Music")
    ("n" "News")
    ("o" "Auto")
    ("p" "Photography")
    ("po" "Papercraft & Origami")
    ("r" "Request")
    ("s" "Sexy Beautiful Women")
    ("t" "Torrents")
    ("tg" "Traditional Games")
    ("tv" "Television & Film")
    ("u" "Yuri")
    ("v" "Video Games")
    ("w" "Anime/Wallpapers")
    ("wg" "Wallpapers/General")
    ("x" "Paranormal")
    ("y" "Yaoi")))

(defun chan-nav ()
  (cl-who:with-html-output-to-string (str)
    (:html
     (:head (:title "cl-chan - Navigation"))
     (:body
      (:h1 "cl-chan")
      (:h2 "Boards")
      (:ul
       (dolist (board *boards*)
         (cl-who:htm
          (:li
           (:a :href (format nil "/~a/" (car board))
               :title (cadr board)
               (cl-who:str (cadr board)))))))))))

;(defun board-exists (board) t)

(defun chan-board ()
  (cl-who:with-html-output-to-string (str)
    (:html
     (:body (:h1 "aoeu penis")
            (:p "foo")))))
    
;
;(let ((id 0))
;  (defun id ()
;    (incf id)))
;
;(defvar *our-mutex* (hunchentoot-mp:make-lock "our-lock"))
;(defvar *events* '())


