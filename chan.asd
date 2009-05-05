(defpackage :chan-asd
  (:use :cl :asdf))
(in-package :chan-asd)

(defsystem :chan
  :name "Chan"
  :version "0.0.0"
  :author "Ævar Arnfjörð Bjarmason"
  :maintainer "Ævar Arnfjörð Bjarmason"
  :license "public domain"
  ; The dependencies are linear
  :serial t
  :components ((:file "chan.lisp")))

