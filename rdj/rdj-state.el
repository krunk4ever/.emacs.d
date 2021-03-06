;; If there's no desktop state to load, open a couple of files I
;; always have open and split the window.
(require 'desktop)
(setq desktop-path (list user-emacs-directory))
(defun rdj-default-initial-state ()
  "Opens init.el and scratchfile in a split window"
  (interactive)
  (progn
    (find-file "~/scratchfile")
    (split-window-horizontally)
    (find-file "~/.emacs.d/init.el")
    (other-window 1)
    ))
(add-hook 'desktop-no-desktop-file-hook 'rdj-default-initial-state)
(add-hook 'desktop-after-read-hook (function (lambda () (progn
                                                          (split-window-horizontally)
                                                          (previous-buffer)
                                                          (other-window 1)
                                                          ))))

;; clean-buffer-list is a great function that can save you from the
;; insanity of a months-old desktop session with thousands of buffers.
(require 'midnight)
(setq clean-buffer-list-delay-general 7) ;; days
(add-to-list 'clean-buffer-list-kill-never-buffer-names "scratchfile")
(add-to-list 'clean-buffer-list-kill-regexps "^\\*magit.*$")

;; I use window-system as a marker for this being the "main instance"
;; of emacs. I generally use `emacs -nw` from bash for short-lived
;; editing like `sudo emacs -nw /etc/hosts`
(when window-system
  (server-start)
  (setq server-window (selected-frame))
  (desktop-save-mode 1)
  (rdj-smartsize-frame)
  )

(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (concat user-emacs-directory ".saveplace"))

(provide 'rdj-state)
