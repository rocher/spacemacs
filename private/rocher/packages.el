;;; packages.el --- rocher layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Francesc Rocher
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `rocher-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `rocher/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `rocher/pre-init-PACKAGE' and/or
;;   `rocher/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst rocher-packages
  '(auto-highlight-symbol
    bm
    buffer-move
    dynamic-ruler
    persp-fr)
  "The list of Lisp packages required by the rocher layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

(defun rocher/post-init-auto-highlight-symbol ()
  (setq ahs-idle-interval 1.0)
  (spacemacs/toggle-automatic-symbol-highlight)
  (add-to-list 'ahs-unhighlight-allowed-commands 'rocher/next-ahs-or-bm t)
  (add-to-list 'ahs-unhighlight-allowed-commands 'rocher/prev-ahs-or-bm t)
  (add-to-list 'ahs-unhighlight-allowed-commands 'mc/mark-all-like-this))

(defun rocher/init-bm ()
  (use-package "bm")
  (global-set-key [f2] 'rocher/next-ahs-or-bm)
  (global-set-key [(control f2)] 'bm-toggle)
  (global-set-key [(shift f2)] 'rocher/prev-ahs-or-bm))

(defun rocher/init-buffer-move ()
  (use-package "buffer-move")
  (global-set-key [(control shift up)] 'buf-move-up)
  (global-set-key [(control shift down)]   'buf-move-down)
  (global-set-key [(control shift left)] 'buf-move-left)
  (global-set-key [(control shift right)]  'buf-move-right))

(defun rocher/init-dynamic-ruler ()
  (use-package "dynamic-ruler")
  (global-set-key [(control f5)] 'dynamic-ruler)
  (global-set-key [(control f6)] 'dynamic-ruler-vertical))

(defun rocher/init-persp-fr ()
  (use-package "persp-fr")
  (persp-fr-start))

;;; packages.el ends here
