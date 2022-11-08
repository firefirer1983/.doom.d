;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "张旭毅"
      user-mail-address "fyman.zhang@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!
;; (setq doom-font (font-spec :family "JetBrains Mono NL" :size 13)
;;       doom-unicode-font (font-spec :family "Microsoft YaHei UI Light" :size 13)
;;       ;; doom-variable-pitch-font (font-spec :family "Microsoft YaHei UI Light" :size 13)
;;       )
(setq doom-font (font-spec :family "JetBrains Mono NL" :size 15 :weight 'normal :width 'normal)
      doom-variable-pitch-font (font-spec :family "JetBrains Mono NL" :size 15 :weight 'normal :width 'normal)
      doom-big-font (font-spec :family "JetBrains Mnon NL" :size 26))

;; Set font for chinese characters
;; Font should be twice the width of asci chars so that org tables align
;; This will break if run in terminal mode, so use conditional to only run for GUI.
(if (display-graphic-p)
    (dolist (charset '(kana han cjk-misc bopomofo))
      (set-fontset-font (frame-parameter nil 'font)
                        charset (font-spec :family "SourceHanSansCN-Normal" :size 18))))


(if IS-WINDOWS
    (set-selection-coding-system 'utf-16le-dos)
  (set-selection-coding-system 'utf-8))


;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setq plantuml-jar-path "D:/plantuml.jar")
;; (setq plantuml-default-exec-mode 'jar)
(setq plantuml-exec-mode 'plantuml)
(setq plantuml-java-args (list "-Djava.awt.headless=true" "-jar"))
(setq plantuml-jar-args (list "-charset UTF-8" "-config ~/.plantuml.cfg"))
(setq org-plantuml-args (list "-headless" "-charset UTF-8" "-config ~/.plantuml.cfg"))
(setq org-plantuml-exec-mode 'plantuml)
(setq org-agenda-files "~/Documents/IKAS/gtd.org")


(setq confirm-kill-emacs nil)
(setq org-agenda-time-grid (quote ((daily today require-timed)
                                   (900
                                    1000
                                    1200
                                    1350
                                    1800
                                    2000)
                                   "......"
                                   "-----------------------------------------------------"
                                   )))

(setq org-agenda-files '("~/Documents/ikas/gtd.org") )
(setq org-todo-keywords '((sequence "TODO(t)" "WAIT(w)" "|" "DONE(d)" "KILL(k)")))
(setq org-agenda-use-time-grid t)
;;(setq org-agenda-timegrid-use-ampm t)

(defun mode-name-to-lang-name (mode)
  (or (cadr (assoc mode
                   '(("asymptote" "Asymptote")
                     ("awk" "Awk")
                     ("C" "C")
                     ("clojure" "Clojure")
                     ("css" "CSS")
                     ("D" "D")
                     ("ditaa" "ditaa")
                     ("dot" "Graphviz")
                     ("calc" "Emacs Calc")
                     ("emacs-lisp" "Emacs Lisp")
                     ("fortran" "Fortran")
                     ("gnuplot" "gnuplot")
                     ("haskell" "Haskell")
                     ("hledger" "hledger")
                     ("java" "Java")
                     ("js" "Javascript")
                     ("latex" "LaTeX")
                     ("ledger" "Ledger")
                     ("lisp" "Lisp")
                     ("lilypond" "Lilypond")
                     ("lua" "Lua")
                     ("matlab" "MATLAB")
                     ("mscgen" "Mscgen")
                     ("ocaml" "Objective Caml")
                     ("octave" "Octave")
                     ("org" "Org mode")
                     ("oz" "OZ")
                     ("plantuml" "Plantuml")
                     ("processing" "Processing.js")
                     ("python" "Python")
                     ("R" "R")
                     ("ruby" "Ruby")
                     ("sass" "Sass")
                     ("scheme" "Scheme")
                     ("screen" "Gnu Screen")
                     ("sed" "Sed")
                     ("sh" "shell")
                     ("sql" "SQL")
                     ("sqlite" "SQLite")
                     ("forth" "Forth")
                     ("io" "IO")
                     ("J" "J")
                     ("makefile" "Makefile")
                     ("maxima" "Maxima")
                     ("perl" "Perl")
                     ("picolisp" "Pico Lisp")
                     ("scala" "Scala")
                     ("shell" "Shell Script")
                     ("ebnf2ps" "ebfn2ps")
                     ("cpp" "C++")
                     ("abc" "ABC")
                     ("coq" "Coq")
                     ("groovy" "Groovy")
                     ("bash" "bash")
                     ("csh" "csh")
                     ("ash" "ash")
                     ("dash" "dash")
                     ("ksh" "ksh")
                     ("mksh" "mksh")
                     ("posh" "posh")
                     ("ada" "Ada")
                     ("asm" "Assembler")
                     ("caml" "Caml")
                     ("delphi" "Delphi")
                     ("html" "HTML")
                     ("idl" "IDL")
                     ("mercury" "Mercury")
                     ("metapost" "MetaPost")
                     ("modula-2" "Modula-2")
                     ("pascal" "Pascal")
                     ("ps" "PostScript")
                     ("prolog" "Prolog")
                     ("simula" "Simula")
                     ("tcl" "tcl")
                     ("tex" "LaTeX")
                     ("plain-tex" "TeX")
                     ("verilog" "Verilog")
                     ("vhdl" "VHDL")
                     ("xml" "XML")
                     ("nxml" "XML")
                     ("conf" "Configuration File"))))
      mode))

(use-package! expand-region
  :bind
  (("C-q" . 'er/expand-region)))

(after! org

  (load-library "ox-reveal")
  (setq org-reveal-root "file:///g:/repo/reveal.js")
  (setq org-reveal-title-slide nil)
  (setq org-startup-folded t)
  )

(use-package! better-defaults)
(use-package! dired+
  :init
  (setq diredp-w32-local-drives '(("C:" "Local Disk") ("D:" "Local Disk") ("E:" "Local Disk") ("//wsl$/Ubuntu-18.04/home/xy/" "WSL Disk")))
  )

(use-package! htmlize
  :defer t)

(use-package! flycheck-plantuml)

(use-package! org-jira
  :init
  (setq jiralib-url "http://jira.oa.ikasinfo.com")
  (setq org-jira-custom-jqls
  '(
    (:jql " project = ZCMOCVD1
AND resolution = Unresolved
AND issuetype = Sub-task
AND assignee in (zhang.feng, ye.jinfeng, qin.xinhui, wu.qiwen, xie.yuan, xu.jianguo, zhang.xuyi, gou.xiaojun, li.daohuan, huang.kai)
AND labels in (RMS, FDC, EAP, APC)
ORDER BY priority DESC, updated DESC "
          :limit 10000
          :filename "mtc")
    ))
  )
;; Keybindings
(map! "C-x C-r" #'counsel-recentf)
(map! "C-x C-b" #'counsel-buffer-or-recentf)
(map! "C-x b" #'counsel-switch-buffer)
(map! "C-x C-o" #'other-window)
(map! "C-x k" #'kill-this-buffer)
(map! "C-j" #'join-line)
(map! "M-n" #'yas/insert-snippet)
(map! "C-s" #'swiper-isearch)
(map! "M-y" #'counsel-yank-pop)
(map! "C-r" nil)
(map! "C-r s" #'counsel-ag)
(map! "C-r g" #'counsel-rg)
(map! "C-r g" #'counsel-rg)
(map! "C-r r" #'ivy-resume)
(map! "C-c h" #'help-command)
(map! "M-1" #'counsel-projectile-find-file)


(add-hook! 'prog-mode-hook #'subword-mode)
(add-hook! 'org-mode-hook #'subword-mode)
(use-package! org-jira
  :init
  (setq jiralib-url "http://jira.oa.ikasinfo.com")
  )
