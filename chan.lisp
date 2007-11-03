(defpackage :chan
  (:use :cl))
(in-package :chan)

(defun hello-world ()
  (format t "Hello, world!"))

(defclass image ()
  ((size
    :documentation "Image size in bytes"
    :initarg :size
    :accessor size
    :initform nil)
   (width
    :documentation "Image width in pixels"
    :initarg :width
    :accessor width
    :initform nil)
   (height
    :documentation "Image height in pixels"
    :initarg :height
    :accessor height
    :initform nil))
  (:documentation "An image attached to a post"))

(let ((id 0))
  (defun next-id ()
    (incf id)))

(defclass post ()
  ((id
    :documentation "Thread/Post id, this is globally incrementing per board"
    :initarg :id
    :accessor id
    :initform (next-id))
   (date
    :documentation "Creation time of the post"
    :initarg :date
    :accessor date
    :initform (get-universal-time))
   (title
    :documentation "Title"
    :initarg :title
    :accessor title
    :initform "")
   (author
    :documentation "Author"
    :initarg :author
    :accessor author
    :initform "Anonyomus")
   (text
    :documentation "Post content"
    :initarg :text
    :accessor text
    :initform "")
   (image
    :documentation "Post image, an instance of `image'"
    :initarg :image
    :accessor image
    :initform nil))
  (:documentation "A single post in a thread"))

(defmethod print-object ((post post) stream)
  (with-slots (id date title author text image) post
    (format stream "id: ~a~%date: ~a~%title: ~a~%author: ~a~%text: ~a~%image: ~a"
            id date title author text image)))

(defmethod print-object ((image image) stream)
  (with-slots (size width height) image
    (format stream "size: ~a (~ax~a)"
            size width height)))