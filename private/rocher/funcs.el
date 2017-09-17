
;; rocher/functions

(defun rocher/default-face-downscale ()
  "Downscale default face size."
  (interactive)
  (or (boundp  'fr-default-face-height)
      (setq fr-default-face-height (face-attribute 'default :height)))
  (set-face-attribute 'default (window-frame) :height
                      (- (face-attribute 'default :height) 10)))

(defun rocher/default-face-restore ()
  "Restores default face size."
  (interactive)
  (and (boundp  'fr-default-face-height)
       (set-face-attribute
        'default (window-frame) :height fr-default-face-height)))

(defun rocher/default-face-upscale ()
  "Upscale default face size."
  (interactive)
  (or (boundp  'fr-default-face-height)
      (setq fr-default-face-height (face-attribute 'default :height)))
  (set-face-attribute 'default (window-frame) :height
                      (+ (face-attribute 'default :height) 10)))

(defun rocher/eol-trim-spaces ()
  "Move the cursor to the end of line and remove trailing spaces."
  (interactive "^")
  (end-of-line)
  (when (not buffer-read-only)
    (save-excursion
      (let ((deactivate-mark nil))
        (delete-horizontal-space)))))

(defun rocher/mc-selection-or-highlighted-symbol ()
  "Starts multi-cursor edition with region or highlighted symbol."
  (interactive)
  (if (region-active-p)
      (mc/mark-all-like-this)
    (mc/mark-all-symbols-like-this)))

(defun rocher/next-ahs-or-bm ()
  "Move the cursor the next highlighted symbol or buffer bookmark."
  (interactive)
  (if ahs-highlighted
      (ahs-forward)
    (bm-next)))

(defun rocher/overwrite-mode ()
  "Toggle overwrite mode and set cursor shape accordingly."
  (interactive)
  (if overwrite-mode
      (progn (overwrite-mode 0)
             (setq cursor-type t)
             ;; (set-cursor-color fr-cursor-color)
             )
    (progn (overwrite-mode  1)
           (setq cursor-type 'box)
           ;; (set-cursor-color "red")
           )))

(defun rocher/persp-add-current-buffer ()
  "Add the current buffer to the current perspective."
  (interactive)
  (persp-add-buffer (current-buffer)))

(defun rocher/persp-new ()
  "Create a new perspective."
  (interactive)
  (if (boundp 'rocher/persp-counter)
      (setq rocher/persp-counter (+ rocher/persp-counter 1))
    (setq rocher/persp-counter 0))
  (let ((persp-name (format "P%02d" rocher/persp-counter)))
    (persp-add-new persp-name)
    (persp-switch persp-name)
    (delete-other-windows)))

(defun rocher/prev-ahs-or-bm ()
  "Move the cursor the previous highlighted symbol or buffer bookmark."
  (interactive)
  (if ahs-highlighted
      (ahs-backward)
    (bm-previous)))

(defun rocher/proxy-indra ()
  "Configure proxy services to be used from inside Indra LAN."
  (interactive)
  (copy-file "~/.emacs.d/private/rocher/proxy-indra.el"
             "~/.emacs.d/private/rocher/proxy-default.el"
             t t t t)
  (load-file "~/.emacs.d/private/rocher/proxy-default.el")
  (message "proxy services set to use Indra's proxy"))

(defun rocher/proxy-off ()
  "Remove proxy configuration."
  (interactive)
  (copy-file "~/.emacs.d/private/rocher/proxy-nil.el"
             "~/.emacs.d/private/rocher/proxy-default.el"
             t t t t)
  (load-file "~/.emacs.d/private/rocher/proxy-default.el")
  (message "proxy services set to direct access to Internet"))

(defun rocher/rtags-setup ()
  "Hook function called the first time c-mode-common is invoked to setup `rtags'."
  (interactive)
  (require 'rtags)
  (require 'flycheck-rtags)
  (require 'company-rtags)

  ;; start daemon, if needed
  (rtags-start-process-unless-running)

  (define-key c-mode-base-map (kbd "M-.") 'rtags-find-symbol-at-point)
  (define-key c-mode-base-map (kbd "M-,") 'rtags-find-references-at-point)

  ;; jump to definition and see the keybindings.
  (rtags-enable-standard-keybindings)

  ;(setq rtags-use-helm t)
  ;(setq rtags-autostart-diagnostics t)
  ;(rtags-diagnostics)
  (setq rtags-completions-enabled t)
  (push 'company-rtags company-backends)
  ;(global-company-mode)
  (define-key c-mode-base-map (kbd "<C-tab>") (function company-complete))

  ;; c-mode-common-hook is also called by c++-mode
  ;;.del (add-hook 'c-mode-common-hook 'fr-rtags-hook)
  ;;(flycheck-select-checker 'rtags)
  ;; RTags creates more accurate overlays.
  ;;(setq-local flycheck-highlighting-mode nil)
  ;;(setq-local flycheck-check-syntax-automatically nil)

  ;; first initialization finished, so no more rtags setup needed
  (remove-hook 'c-mode-common-hook 'rocher/rtags-setup))

(defun rocher/sort-packages (reverse beg end)
  (interactive "*P\nr")
  ;;(sort-regexp-fields reverse "\\(\\w\\|-\\|\\+\\)+" "\\&" beg end))
  (sort-regexp-fields reverse "[^ ]+" "\\&" beg end))

(defun rocher/switch-to-other-buffer ()
  "Switch to other, similar buffer."
  (interactive "")
  (require 's)
  (let* ((cb-name (buffer-name))
         (cb-basename (elt (s-split "\\." cb-name) 0))
         (bl-name nil)
         (sel-buffer nil))
    (if (length cb-basename)
        (dolist (bl-buff (buffer-list))
          (setq bl-name (buffer-name bl-buff))
          (if (and (not (equal cb-name bl-name))
                   (equal cb-basename (elt (s-split "\\." bl-name) 0)))
              (setq sel-buffer bl-buff))))
    (if (null sel-buffer)
        (switch-to-buffer (other-buffer (current-buffer) t))
      (switch-to-buffer sel-buffer))))

(defun rocher/toggle-show-paren-mode ()
  (interactive)
  (if show-paren-mode
      (show-paren-mode 0)
    (progn
      (show-paren-mode)
      (setq show-paren-style 'expression))))

(defun rocher/vc-dir ()
  "Opens a version control session in the current directory."
  (interactive)
  (let ((buffer
         (or (--first (let ((bn (buffer-name it)))
                        (and (> (length bn) 7)
                             (equal "*magit: " (substring bn 0 8))))
                      (buffer-list))
             (get-buffer "*svn-status*")
             (get-buffer "*vc-dir*")
             (get-buffer "*cvs*"))))
    (if buffer
        (switch-to-buffer buffer)
      (if (and (buffer-file-name)
               (file-exists-p (buffer-file-name)))
          (magit-status)
        (if (eq major-mode 'dired-mode)
            (magit-status dired-directory))))))

(defun rocher/window-toggle-no-other-window ()
  "Toggle window navigability with F9."
  (interactive "")
  (let* ((current-window (frame-selected-window))
         (value (window-parameter current-window 'no-other-window)))
    (set-window-parameter current-window 'no-other-window (not value))))
