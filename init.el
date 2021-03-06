;; On Mac OS X, GUI programs do not get a sensible PATH variable (i.e.
;; from /usr/libexec/path_helper). You can mitigate this by setting
;; the PATH variable in the binary plist file at this path:
;;
;;   ~/.MacOSX/environment.plist
;;
;; Easiest way is using defaults:
;;
;;   defaults write $HOME/.MacOSX/environment PATH "$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin"
;;
;; You will have to log out and back in for this to take effect.
;;
;; NOTE: At some point a Lion update broke this behavior. I now
;; manually load this file in rdj-fix-path.

(require 'cl)
(require 'assoc)

;; My files are in .emacs.d/rdj
(setq rdj-elisp-path (concat user-emacs-directory "rdj/"))
(push rdj-elisp-path load-path)

;; Non-package.el stuff from ~/.emacs.d/vendor
(setq rdj-vendor-elisp-path (concat user-emacs-directory "vendor/"))
(push rdj-vendor-elisp-path load-path)

;; Temporarily vendoring in the whole cc-mode package to fix the
;; c-annotation-face bug
(push (concat rdj-vendor-elisp-path "cc-mode/") load-path)

;; Customize is basically an anti-feature, but some things like theme
;; whitelists according to file hashes are just probably going to live
;; there.
(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file)

(require 'rdj-utils)
(require 'rdj-fix-path)

(require 'rdj-early-off)
(require 'rdj-package)
(require 'rdj-misc)
(require 'rdj-smartsize)
(require 'rdj-turds)
(require 'rdj-whitespace)

(require 'rdj-prog)

(require 'rdj-bindings)
(require 'rdj-theme)
(require 'rdj-state)

