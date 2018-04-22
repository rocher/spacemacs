;; keybindings

(global-set-key [f1] 'helm-buffers-list)
;; [f2] :  see packages.el
(global-set-key [f3] 'call-last-kbd-macro)
(global-set-key [f4] 'eval-last-sexp)
(global-set-key [f5] 'save-buffer)
(global-set-key [f7] 'hs-hide-block)
(global-set-key [f8] 'hs-show-block)
(global-set-key [f9] 'other-window)
(global-set-key [f10] 'delete-window)
(global-set-key [f11] 'delete-other-windows)
(global-set-key [f12] 'split-window-below)

(global-set-key [(control ?.)] 'goto-last-change)

(global-set-key [(control f1)] 'rocher/vc-dir)
;; [(control f2)] : see packages.el
(global-set-key [(control f3)] 'end-kbd-macro)
(global-set-key [(control f7)] 'hs-hide-all)
(global-set-key [(control f8)] 'hs-show-all)
(global-set-key [(control f9)] 'rocher/window-toggle-no-other-window)
(global-set-key [(control f11)] 'menu-bar-mode)

(global-set-key [(control backspace)] 'kill-whole-line)
(global-set-key [(control menu)] 'execute-extended-command)
(global-set-key [(control meta ?j)] 'kill-buffer)
(global-set-key [(control next)] 'persp-next)
(global-set-key [(control prior)] 'persp-prev)
(global-set-key [(control meta next)] 'persp-fr-move-right)
(global-set-key [(control meta prior)] 'persp-fr-move-left)
;; (global-set-key [(control meta return)] 'kill-buffer) ;; set in .spacemacs
(global-set-key [(control return)] 'rocher/switch-to-other-buffer)
(global-set-key [(control shift f4)] 'eval-buffer)

(global-set-key [end] 'rocher/eol-trim-spaces)
(global-set-key [insert] 'rocher/overwrite-mode)

(global-set-key [menu] 'menu-bar-open)

(global-set-key [(meta ?+)] 'dabbrev-expand)
(global-set-key [(meta ?-)] 'undo)
;; (global-set-key [(meta ?_)] 'hl-line-mode) ;; pending
;; (global-set-key [(meta ?g)] 'goto-line) ;; pending
(global-set-key [(meta ?n)] 'display-line-numbers-mode)
(global-set-key [(meta ?p) ?a] 'rocher/persp-add-current-buffer)
(global-set-key [(meta ?p) ?n] 'rocher/persp-new)
(global-set-key [(meta ?p) ?r] 'persp-rename)
(global-set-key [(meta ?s)] 'rocher/toggle-show-paren-mode)
(global-set-key [(meta ?¡)] 'company-complete)

(global-set-key [(meta delete)] 'kill-word)
(global-set-key [(meta f1)] '(lambda () (interactive) (bs-show nil)))
(global-set-key [(meta f12)] 'split-window-right)
(global-set-key [(meta left)] 'backward-sexp)
(global-set-key [(meta right)] 'forward-sexp)

(global-set-key [(shift f1)] '(lambda () (interactive) (dired default-directory)))
;; [(shift f2)] : see packages.el
(global-set-key [(shift f3)] 'start-kbd-macro)
(global-set-key [(shift f4)] 'eval-region)
(global-set-key [(shift f7)] 'hs-hide-level)
(global-set-key [(shift f11)] 'toggle-frame-fullscreen)

(global-set-key [(super ?1)] 'rocher/treemacs-switch-window)
(global-set-key [(super ?c)] 'rocher/mc-selection-or-highlighted-symbol)
(global-set-key [(super ?g) ?h] 'git-gutter+-show-hunk)
(global-set-key [(super ?g) ?l] 'helm-ls-git-ls)
(global-set-key [(super ?g) ?n] 'git-gutter+-next-hunk)
(global-set-key [(super ?g) ?p] 'git-gutter+-previous-hunk)
(global-set-key [(super ?g) ?r] 'git-gutter+-revert-hunk)
(global-set-key [(super ?g) ?s] 'git-gutter+-show-hunk-inline-at-point)
;; (global-set-key [(super ?h)] 'fr-helm-mode) ;; pending
;; (global-set-key [(super ?w)] 'which-key-mode) ;; pending
(global-set-key [(super left)] 'buf-move-left)
(global-set-key [(super right)] 'buf-move-right)

(global-set-key [(super ?-)] 'rocher/default-face-downscale)
(global-set-key [(super ?0)] 'rocher/default-face-restore)
(global-set-key [(super ?+)] 'rocher/default-face-upscale)

;; (global-set-key [Scroll_Lock] 'swimming) ;; pending
(global-set-key [S-iso-lefttab] '(lambda() (interactive) (insert "	")))
