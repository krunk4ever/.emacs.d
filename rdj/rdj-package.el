;; Bootstrap package.el
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar rdj-packages
  '(
    find-file-in-project
    magit
    php-mode
    yaml-mode
    )
  "A list of packages to ensure are installed at launch.")

(dolist (p rdj-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(provide 'rdj-package)
