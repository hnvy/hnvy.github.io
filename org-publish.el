;; Set the package installation directory so that packages aren't stored in the
;; ~/.emacs.d/elpa path.
;; I am grateful for System Crafters for posting this config online.
;; You can find the original code at: https://systemcrafters.net/publishing-websites-with-org-mode/building-the-site/

(require 'package)
(setq package-user-dir (expand-file-name "./.packages"))
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))


;; Initialize the package system
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Install dependencies
;; (package-install 'htmlize)

;; Load the publishing system
(require 'ox-publish)

(setq org-publish-use-timestamps-flag nil)
;; (setq org-publish-timestamp-directory "/home/runner/work/hnvy.github.io/hnvy.github.io/public/timestamps/")

;; Customize the HTML output
(setq org-html-validation-link nil
      org-html-head-include-scripts nil
      org-html-head-include-default-style nil
      org-export-with-sub-superscripts nil
      org-html-head "<link rel=\"stylesheet\" href=\"https://hnvy.github.io/css/main.css\" />")

;; Define the publishing project
(setq org-publish-project-alist
      (list
       (list "hnvy"
             :recursive t
             :base-directory "./src"
             :publishing-function 'org-html-publish-to-html
             :publishing-directory "./public"
             :with-creator t
             :with-author nil
             :with-toc nil
             :section-numbers nil
             :time-stamp-file nil
             :timestamp t)))

(org-publish-remove-all-timestamps)

;; Generate the site output
(org-publish-all t)
