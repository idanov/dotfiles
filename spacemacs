;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. "~/.mycontribs/")
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(nginx
     clojure
     ansible
     rust
     csv
     systemd
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     (osx :variables osx-option-as 'meta
          osx-right-option-as 'none)
     auto-completion
     better-defaults
     emacs-lisp
     hackernews
     copy-as-format
     nav-flash
     evil-better-jumper
     (evil-snipe :variables evil-snipe-enable-alternate-f-and-t-behaviors t)
     (sql :variables sql-backend 'lsp
          sql-capitalize-keywords t
          sql-capitalize-keywords-blacklist '("name")
          sql-capitalize-keywords-disable-interactive t)
     spacemacs-editing-visual
     (spacemacs-editing :variables
                        vim-style-enable-undo-region t)
     semantic
     (docker :variables docker-dockerfile-backend 'lsp)
     (openai :variables
             openai-key (getenv "OPENAI_API_KEY")
             openai-user (getenv "OPENAI_USER")
             )
     (llm-client :variables llm-client-enable-gptel t)
     (git :variables git-enable-magit-delta-plugin nil)
     (helm :variables helm-follow-mode-persistent t)
     (tree-sitter :variables
                  spacemacs-tree-sitter-hl-black-list '(js2-mode rjsx-mode)
                  tree-sitter-syntax-highlight-enable t
                  tree-sitter-fold-enable t
                  tree-sitter-fold-indicators-enable nil)
     (lsp :variables
          lsp-use-upstream-bindings t
          lsp-lens-enable t
          lsp-use-lsp-ui t)
     (markdown :variables markdown-live-preview-engine 'vmd)
     (docker :variables docker-dockerfile-backend 'lsp)
     multiple-cursors
     (shell :variables
            shell-default-term-shell "/bin/zsh"
            multi-term-program "/bin/zsh"
            shell-default-shell 'vterm
            shell-default-full-span nil
            shell-default-height 30
            shell-default-position 'bottom)
     (spell-checking :variables
                     enable-flyspell-auto-completion t
                     spell-checking-enable-by-default nil)
     syntax-checking
     (version-control :variables
                      version-control-diff-tool 'diff-hl
                      version-control-diff-side 'right
                      version-control-global-margin t)
     emoji
     games
     (yaml :variables yaml-enable-lsp t)
     plantuml
     latex
     html
     graphviz
     epub
     pdf
     vimscript
     (typescript :variables
                 typescript-fmt-on-save t
                 typescript-indent-level 2
                 typescript-fmt-tool 'prettier
                 typescript-linter 'eslint
                 typescript-backend 'lsp)
     (json :variables json-fmt-tool 'prettier)
     (javascript :variables
                 node-add-modules-path t
                 js2-mode-show-strict-warnings nil
                 js2-mode-show-parse-errors nil
                 js2-basic-offset 2
                 js-indent-level 2
                 javascript-backend 'lsp
                 javascript-lsp-linter t
                 javascript-fmt-tool 'prettier
                 javascript-fmt-on-save t
                 javascript-import-tool 'import-js
                 javascript-repl `nodejs)
     (terraform :variables
                terraform-auto-format-on-save t
                terraform-backend 'lsp)
     php
     solidity
     (org :variables
          org-want-todo-bindings t
          org-todo-keywords '((sequence "TODO(t)" "DOING(i!)" "WAITING(w@/!)" "|" "DONE(d)" "CANCELLED(c)"))
          org-superstar-todo-bullet-alist '(("TODO" . 9744) ("DOING" . 9881) ("WAITING" . 9684) ("DONE" . 9745) ("CANCELLED" . 9746))
          org-superstar-special-todo-items t
          org-superstar-headline-bullets-list '("◉" "○" "●" "◎" "◍" "◈" "◇" "◆")
          org-enable-sticky-header t
          org-enable-reveal-js-support t
          org-html-htmlize-output-type 'css
          org-enable-hugo-support t
          org-download-image-dir "~/org/roam/assets/"
          org-download-method 'directory
          org-download-heading-lvl nil
          org-download-screenshot-method (if (eq system-type 'darwin) "pngpaste %s" "gnome-screenshot -a -f %s")
          org-image-actual-width 700
          org-default-notes-file "~/org/roam/pages/inbox.org"
          org-enable-notifications t
          org-start-notification-daemon-on-startup t
          org-agenda-files '("~/org/roam/pages/projects.org"
                             "~/org/roam/pages/areas.org"
                             "~/org/roam/journals/"
                             )
          org-agenda-todo-ignore-with-date t
          org-agenda-skip-scheduled-if-done t
          org-agenda-include-diary t
          org-agenda-skip-deadline-if-done t
          org-agenda-custom-commands '(("o" "Agenda and work TODOs"
                                        ((tags "@work+PRIORITY=\"A\""
                                               ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                                                (org-agenda-overriding-header "High-priority tasks:")))
                                         (agenda "" ((org-agenda-span 'day)))
                                         (tags-todo "@work"
                                                    ((org-agenda-skip-function 'skip-all-siblings-but-first)
                                                     (org-agenda-overriding-header "Next tasks at work:"))))
                                        ((org-agenda-sorting-strategy '(habit-up priority-down))))
                                       ("n" "Agenda and non-work TODOs"
                                        ((tags "-@work-@habit+PRIORITY=\"A\""
                                               ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                                                (org-agenda-overriding-header "High-priority tasks:")))
                                         (agenda "" ((org-agenda-span 'day)))
                                         (tags "-@work-@habit"
                                               ((org-agenda-skip-function 'skip-all-siblings-but-first)
                                                (org-agenda-overriding-header "Next tasks at home:"))))
                                        ((org-agenda-sorting-strategy '(habit-up priority-down))))
                                       )
          org-refile-targets '(("~/org/roam/pages/someday.org" :maxlevel . 2)
                               ("~/org/roam/pages/projects.org" :maxlevel . 2)
                               ("~/org/roam/pages/areas.org" :maxlevel . 2))
          ;; this one is to allow for top-level refile
          org-refile-use-outline-path 'file
          ;; this one is to show all headings and files in helm
          org-outline-path-complete-in-steps nil
          ;; this one is to provide with an option to create a new parent node
          org-refile-allow-creating-parent-nodes 'confirm
          org-modules '(org-habit)
          org-startup-indented t
          org-archive-location "~/org/archives.org::"
          org-enable-roam-support t
          org-enable-roam-protocol t
          org-enable-roam-server t
          org-enable-roam-ui t
          org-roam-directory "~/org/roam"
          org-roam-dailies-directory "journals/"
          org-roam-db-location "~/org/roam/org-roam.db"
          org-roam-completion-everywhere t
          org-roam-file-exclude-regexp "\\.st[^/]*\\|logseq/.*$"
          org-enable-appear-support t
          org-enable-valign-support t
          org-hide-emphasis-markers t
          org-enable-transclusion-support t
          org-enable-org-contacts-support t
          org-contacts-files '("~/org/roam/pages/areas.org")
          )
     (tabs :variables tabs-selected-tab-bar 'left)
     (treemacs :variables
               treemacs-use-scope-type 'Perspectives
               treemacs-indent-guide-style 'line
               treemacs-use-git-mode 'simple
               treemacs-lock-width t
               treemacs-use-all-the-icons-theme t)
     (spacemacs-layouts :variables
                        persp-autokill-buffer-on-remove 'kill-weak
                        spacemacs-layouts-restrict-spc-tab t)
     (conda :variables conda-anaconda-home (file-name-parent-directory (getenv "WORKON_HOME")))
     (python :variables
             python-backend 'lsp
             python-lsp-server 'pyright
             python-test-runner 'pytest
             python-formatter 'black
             python-format-on-save t
             python-sort-imports-on-save t
             python-indent-guess-indent-offset-verbose nil
             python-shell-interpreter "python3"
             importmagic-python-interpreter "python3"
             )
     )

   ;; List of additional packages that will be installed without being wrapped
   ;; in a layer (generally the packages are installed only and should still be
   ;; loaded using load/require/use-package in the user-config section below in
   ;; this file). If you need some configuration for these packages, then
   ;; consider creating a layer. You can also put the configuration in
   ;; `dotspacemacs/user-config'. To use a local version of a package, use the
   ;; `:location' property: '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(
                                      (chatgpt-shell)
                                      (ob-chatgpt-shell)
                                      (evil-textobj-tree-sitter)
                                      (evil-tree-edit)
                                      (doom-themes)
                                      (catppuccin-theme)
                                      (org-modern)
                                      ;; Need to install https://foosoft.net/projects/anki-connect/
                                      (anki-editor :location (recipe :fetcher github
                                                                     :repo "anki-editor/anki-editor"))
                                      (ankiorg :location (recipe :fetcher github
                                                                 :repo "orgtre/ankiorg"))
                                      (org-global-capture :location (recipe :fetcher github
                                                                            :repo "idanov/org-global-capture.el"))
                                      (bulgarian-holidays :location (recipe :fetcher github
                                                                            :repo "idanov/bulgarian-holidays.el"))
                                      (emacs-conflict :location (recipe :fetcher github
                                                                        :repo "ibizaman/emacs-conflict"))
                                      ;; (org-roam-logseq :location "~/workspace/org-roam-logseq.el/")
                                      (org-roam-logseq :location (recipe :fetcher github
                                                                         :repo "idanov/org-roam-logseq.el"))
                                      )

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need to
   ;; compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;;
   ;; WARNING: pdumper does not work with Native Compilation, so it's disabled
   ;; regardless of the following setting when native compilation is in effect.
   ;;
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=$HOME/.emacs.d/.cache/dumps/spacemacs-27.1.pdmp
   ;; (default (format "spacemacs-%s.pdmp" emacs-version))
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. Spacelpa is currently in
   ;; experimental state please use only for testing purposes.
   ;; (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; Scale factor controls the scaling (size) of the startup banner. Default
   ;; value is `auto' for scaling the logo automatically to fit all buffer
   ;; contents, to a maximum of the full image height and a minimum of 3 line
   ;; heights. If set to a number (int or float) it is used as a constant
   ;; scaling factor for the default logo size.
   dotspacemacs-startup-banner-scale 'auto

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `recents-by-project' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   ;; The exceptional case is `recents-by-project', where list-type must be a
   ;; pair of numbers, e.g. `(recents-by-project . (7 .  5))', where the first
   ;; number is the project limit and the second the limit on the recent files
   ;; within a project.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Show numbers before the startup list lines. (default t)
   dotspacemacs-show-startup-list-numbers t

   ;; The minimum delay in seconds between number key presses. (default 0.4)
   dotspacemacs-startup-buffer-multi-digit-delay 0.4

   ;; If non-nil, show file icons for entries and headings on Spacemacs home buffer.
   ;; with 2 themes variants, one dark and one light)
   ;; This has no effect in terminal or if "nerd-icons" package or the font
   ;; is not installed. (default nil)
   dotspacemacs-startup-buffer-show-icons t

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; If non-nil, *scratch* buffer will be persistent. Things you write down in
   ;; *scratch* buffer will be saved and restored automatically.
   dotspacemacs-scratch-buffer-persistent t

   ;; If non-nil, `kill-buffer' on *scratch* buffer
   ;; will bury it instead of killing.
   dotspacemacs-scratch-buffer-unkillable t

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light). A theme from external
   ;; package can be defined with `:package', or a theme can be defined with
   ;; `:location' to download the theme package, refer the themes section in
   ;; DOCUMENTATION.org for the full theme specifications.
   dotspacemacs-themes '(doom-one
                         doom-one-light
                         doom-dracula
                         catppuccin
                         spacemacs-dark
                         spacemacs-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(doom :separator arrow :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts. This setting has no effect when
   ;; running Emacs in terminal. The font set here will be used for default and
   ;; fixed-pitch faces. The `:size' can be specified as
   ;; a non-negative integer (pixel size), or a floating-point (point size).
   ;; Point size is recommended, because it's device independent. (default 10.0)
   dotspacemacs-default-font '("Zed Plex Mono"
                               :size 13.0
                               :weight normal
                               :width normal)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m" for terminal mode, "M-<return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "M-<return>" "C-M-m")

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout t

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts t

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'original

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; It is also possible to use a posframe with the following cons cell
   ;; `(posframe . position)' where position can be one of `center',
   ;; `top-center', `bottom-center', `top-left-corner', `top-right-corner',
   ;; `top-right-corner', `bottom-left-corner' or `bottom-right-corner'
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; Whether side windows (such as those created by treemacs or neotree)
   ;; are kept or minimized by `spacemacs/toggle-maximize-window' (SPC w m).
   ;; (default t)
   dotspacemacs-maximize-window-keep-side-windows t

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default t) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' to obtain fullscreen
   ;; without external boxes. Also disables the internal border. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes the
   ;; transparency level of a frame background when it's active or selected. Transparency
   ;; can be toggled through `toggle-background-transparency'. (default 90)
   dotspacemacs-background-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Show the scroll bar while scrolling. The auto hide time can be configured
   ;; by setting this variable to a number. (default t)
   dotspacemacs-scroll-bar-while-scrolling nil

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but only visual lines are counted. For example, folded lines will not be
   ;; counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers 'relative

   ;; Code folding method. Possible values are `evil', `origami' and `vimish'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil and `dotspacemacs-activate-smartparens-mode' is also non-nil,
   ;; `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode t

   ;; If non-nil smartparens-mode will be enabled in programming modes.
   ;; (default t)
   dotspacemacs-activate-smartparens-mode t

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis t

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server t

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; The backend used for undo/redo functionality. Possible values are
   ;; `undo-fu', `undo-redo' and `undo-tree' see also `evil-undo-system'.
   ;; Note that saved undo history does not get transferred when changing
   ;; your undo system. The default is currently `undo-fu' as `undo-tree'
   ;; is not maintained anymore and `undo-redo' is very basic."
   dotspacemacs-undo-system 'undo-fu

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; If nil then Spacemacs uses default `frame-title-format' to avoid
   ;; performance issues, instead of calculating the frame title by
   ;; `spacemacs/title-prepare' all the time.
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%a@%t"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Color highlight trailing whitespace in all prog-mode and text-mode derived
   ;; modes such as c++-mode, python-mode, emacs-lisp, html-mode, rst-mode etc.
   ;; (default t)
   dotspacemacs-show-trailing-whitespace t

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; The variable `global-spacemacs-whitespace-cleanup-modes' controls
   ;; which major modes have whitespace cleanup enabled or disabled
   ;; by default.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'changed

   ;; If non-nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfere with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; Accept SPC as y for prompts if non-nil. (default nil)
   dotspacemacs-use-SPC-as-y nil

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non-nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil

   ;; If non-nil then byte-compile some of Spacemacs files.
   dotspacemacs-byte-compile nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env)
  ;; CLI tools installed by Mise
  ;; See: https://www.emacswiki.org/emacs/ExecPath
  (setenv "PATH" (concat (getenv "PATH") ":~/.local/share/mise/shims"))
  (setq exec-path (append exec-path '("~/.local/share/mise/shims")))
  )

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  (defun skip-all-siblings-but-first ()
    "Skip all entries with priority A (2000), scheduled or with deadline
     and keep the first not yet done entry."
    (defun skip-check ()
      (and (org-entry-is-todo-p)
           (not (org-get-scheduled-time nil))
           (not (org-get-deadline-time nil))
           (> 2000 (org-get-priority (thing-at-point 'line t)))))
    (let (should-skip-entry)
      (unless (skip-check)
        (setq should-skip-entry t))
      (save-excursion
        (while (and (not should-skip-entry)
                    (org-goto-sibling t))
          (when (skip-check)
            (setq should-skip-entry t))))
      (when should-skip-entry
        (or (outline-next-heading)
            (goto-char (point-max))))))

  (setq tramp-default-method "ssh")
  (setq catppuccin-flavor 'mocha)
  (spacemacs/set-leader-keys "ao;" 'helm-org-rifle-agenda-files)
  ;; (spacemacs/set-leader-keys-for-minor-mode 'anki-editor-mode "kd" 'anki-editor-delete-note-at-point)
  ;; (spacemacs/set-leader-keys-for-minor-mode 'anki-editor-mode "kp" 'anki-editor-push-note-at-point)
  ;; (spacemacs/set-leader-keys-for-minor-mode 'anki-editor-mode "kP" 'anki-editor-push-notes)
  ;; (spacemacs/set-leader-keys-for-minor-mode 'anki-editor-mode "kN" 'anki-editor-push-new-notes)
  ;; (spacemacs/set-leader-keys-for-minor-mode 'anki-editor-mode "ki" 'anki-editor-insert-note)

  (setq-default evil-escape-key-sequence "jk")
  (setq-default evil-escape-delay 0.1)
  (setq magit-delta-delta-args
        '("--24-bit-color" "always"
          "--features" "magit-delta"
          "--color-only"))
  (with-eval-after-load 'treemacs
    (defun treemacs-ignore-gitignore (file _)
      (string= file "__pycache__"))
    (push #'treemacs-ignore-gitignore treemacs-ignored-file-predicates))
  )


(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )


(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."
  (require 'org-global-capture)
  (require 'bulgarian-holidays)
  (require 'emacs-conflict)
  (require 'org-roam-logseq)
  (require 'org-macs)
  (require 'chatgpt-shell)
  (require 'ob-chatgpt-shell)
  (ob-chatgpt-shell-setup)
  (setq chatgpt-shell-openai-key (getenv "OPENAI_API_KEY"))
  (spacemacs/declare-prefix "ag" "chatgpt-shell")
  (spacemacs/set-leader-keys
    "agg" 'chatgpt-shell
    "agk" 'chatgpt-shell-clear-buffer)

  (org-roam-db-autosync-mode)

  (setq require-final-newline t)
  (setq holiday-other-holidays (cl-remove-duplicates (append holiday-other-holidays holiday-bulgarian-holidays)))
  (setq org-capture-templates '(("t" "Task" entry (file+headline "~/org/roam/pages/inbox.org" "Tasks")
                                 "* TODO %?\n  %u\n  %a")
                                ("n" "Note" entry (file+headline "~/org/roam/pages/inbox.org" "Notes")
                                 "* %?\nEntered on %U\n  %i\n  %a")
                                ("p" "Person" entry (file+headline "~/org/roam/pages/areas.org" "People")
                                 "* %(org-contacts-template-name)
:PROPERTIES:
:EMAIL: %(org-contacts-template-email)
:BIRTHDAY:
:END:")
                                ))

  (setq org-roam-capture-templates '(("d" "default"
                                      plain
                                      "%?"
                                      :target (file+head "pages/${slug}.org" "#+title: ${title}\n")
                                      :unnarrowed t)))

  (setq org-roam-dailies-capture-templates '(("d" "default"
                                              entry
                                              "* %?"
                                              :target (file+head "%<%Y_%m_%d>.org" "#+title: %<%Y-%m-%d>\n"))))

  ;; Configure org-mode to use another font
  (set-face-attribute 'org-document-title nil :font "Iosevka Aile" :weight 'bold :height 1.3)
  (dolist (face '((org-level-1 . 1.2)
                  (org-level-2 . 1.1)
                  (org-level-3 . 1.05)
                  (org-level-4 . 1.0)
                  (org-level-5 . 1.1)
                  (org-level-6 . 1.1)
                  (org-level-7 . 1.1)
                  (org-level-8 . 1.1)))
    (set-face-attribute (car face) nil :font "Iosevka Aile" :weight 'medium :height (cdr face)))

  ;; Make sure org-indent face is available
  (require 'org-indent)

  ;; Ensure that anything that should be fixed-pitch in Org files appears that way
  (set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-table nil  :inherit 'fixed-pitch)
  (set-face-attribute 'org-formula nil  :inherit 'fixed-pitch)
  (set-face-attribute 'org-code nil   :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-indent nil :inherit '(org-hide fixed-pitch))
  (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch)

  ;; Get rid of the background on column views
  (set-face-attribute 'org-column nil :background nil)
  (set-face-attribute 'org-column-title nil :background nil)

  ;; TODO: Others to consider
  ;; '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
  ;; '(org-meta-line ((t (:inherit (font-lock-comment-face fixed-pitch)))))
  ;; '(org-property-value ((t (:inherit fixed-pitch))) t)
  ;; '(org-special-keyword ((t (:inherit (font-lock-comment-face fixed-pitch)))))
  ;; '(org-table ((t (:inherit fixed-pitch :foreground "#83a598"))))
  ;; '(org-tag ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
  ;; '(org-verbatim ((t (:inherit (shadow fixed-pitch))))))

  (defun delete-trailing-whitespace-non-disruptive ()
    "Delete trailing whitespace in the buffer.
If in `evil-insert-state`, skip deleting trailing whitespace on the current line."
    (if (not (evil-insert-state-p))
        (delete-trailing-whitespace)
      ;; If in `evil-insert-state`, calculate current line boundaries and delete trailing whitespace accordingly
      (let ((current-line-beginning (max (point-min) (1- (line-beginning-position))))
            (current-line-end (min (point-max) (1+ (line-end-position)))))
        (delete-trailing-whitespace (point-min) current-line-beginning)
        (delete-trailing-whitespace current-line-end (point-max)))))

  ;; add a soft line wrap for overly long lines
  (add-hook 'org-mode-hook 'visual-line-mode)
  (add-hook 'before-save-hook 'delete-trailing-whitespace-non-disruptive)
  (add-hook 'auto-save-hook 'org-save-all-org-buffers)

  ;; bind `function.outer`(entire function block) to `f` for use in things like `vaf`, `yaf`
  (define-key evil-outer-text-objects-map "f" (evil-textobj-tree-sitter-get-textobj "function.outer"))
  ;; bind `function.inner`(function block without name and args) to `f` for use in things like `vif`, `yif`
  (define-key evil-inner-text-objects-map "f" (evil-textobj-tree-sitter-get-textobj "function.inner"))

  ;; You can also bind multiple items and we will match the first one we can find
  (define-key evil-outer-text-objects-map "a" (evil-textobj-tree-sitter-get-textobj ("conditional.outer" "loop.outer")))

  ;; Goto start of next function
  (define-key evil-normal-state-map
              (kbd "]f")
              (lambda ()
                (interactive)
                (evil-textobj-tree-sitter-goto-textobj "function.outer")))

  ;; Goto start of previous function
  (define-key evil-normal-state-map
              (kbd "[f")
              (lambda ()
                (interactive)
                (evil-textobj-tree-sitter-goto-textobj "function.outer" t)))

  ;; Goto end of next function
  (define-key evil-normal-state-map
              (kbd "]F")
              (lambda ()
                (interactive)
                (evil-textobj-tree-sitter-goto-textobj "function.outer" nil t)))

  ;; Goto end of previous function
  (define-key evil-normal-state-map
              (kbd "[F")
              (lambda ()
                (interactive)
                (evil-textobj-tree-sitter-goto-textobj "function.outer" t t)))

  (defun idanov/add-python-env ()
    "Add my Python environment to doom-modeline"
    (when (and (eq major-mode 'python-mode)
               pyvenv-virtual-env-name)
      (setq doom-modeline-env--version (concat doom-modeline-env--version " (" pyvenv-virtual-env-name ")"))
      ))
  ;; (add-hook 'doom-modeline-after-update-env-hook #'idanov/add-python-env)
  (display-time-mode t)
  (display-battery-mode t)
  (setq vc-follow-symlinks nil)
  (diff-hl-flydiff-mode '(:global t))

  ;; Support Encrypting subtrees This allows me to encrypt subtrees that are
  ;; tagged with crypt automatically. by default I want to encrypt it to myself.
  ;; but with properties entries I can encrypt to other people. which is useful in
  ;; a shared file situation
  ;; http://yenliangl.blogspot.com/2009/12/encrypt-your-important-data-in-emacs.html
  ;; http://emacs-fu.blogspot.com/2011/02/keeping-your-secrets-secret.html
  ;; https://cmdln.org/2016/04/26/how-i-org-with-spacemacs/
  ;; (require 'org-crypt)
  (org-crypt-use-before-save-magic)
  (setq org-tags-exclude-from-inheritance (quote ("crypt")))
  '(org-crypt-disable-auto-save (quote encrypt))

  ;; GPG key to use for encryption
  ;; Either the Key ID or set to nil to use symmetric encryption.
  (setq org-crypt-key "E973BBEECB9681A9")

  ;; Set the files that are searched for writing tokens
  ;; by default ~/.authinfo will be used
  (setq epg-pinentry-mode 'loopback)
  (setq auth-sources '("~/.authinfo.gpg"))

  )

(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
  (custom-set-variables
   ;; custom-set-variables was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(custom-safe-themes
     '("3793b8a8e626a24a8e6aaba21a055473990bd7f2fb69c23e75bb07014d1007c8" default))
   '(evil-want-Y-yank-to-eol nil)
   '(gptel-default-mode 'org-mode)
   '(package-selected-packages
     '(helm-mu ellama plz gptel evil-tree-edit centaur-tabs nginx-mode pcsv vmd-mode
               ansible ansible-doc company-ansible jinja2-mode company-terraform
               terraform-mode hcl-mode tree-sitter-langs ts-fold tree-sitter tsc
               cargo counsel-gtags counsel swiper ivy flycheck-rust ggtags
               helm-gtags racer ron-mode rust-mode toml-mode flyspell-popup
               magit-delta spacegray-theme import-js grizzl add-node-modules-path
               org-roam-ui diff-hl git-gutter-fringe git-gutter phpunit phpcbf
               php-extras php-auto-yasnippets npm-mode lsp-pyright lsp-origami
               origami lsp-latex geben drupal-mode csv-mode company-phpactor
               phpactor composer php-runtime company-php ac-php-core xcscope
               php-mode vimrc-mode solidity-flycheck solidity-mode dactyl-mode
               emacs-conflict persistent-scratch conda org-vcard org-roam-server
               org-roam emacsql-sqlite3 bulgarian-holidays ediprolog
               stickyfunc-enhance srefactor systemd org-global-capture
               org-capture-pop-frame pdf-tools tablist nov esxml org-sticky-header
               org-journal merlin-eldoc xterm-color vterm terminal-here shell-pop
               multi-term dap-mode posframe bui eshell-z eshell-prompt-extras
               esh-help tern yapfify yaml-mode web-beautify utop tuareg caml tide
               typescript-mode seeing-is-believing rvm ruby-tools ruby-test-mode
               ruby-refactor ruby-hash-syntax rubocopfmt rubocop rspec-mode robe
               rbenv rake pytest pyenv-mode py-isort prettier-js pippel pipenv
               pyvenv pip-requirements ocp-indent ob-elixir nodejs-repl mvn
               minitest meghanada maven-test-mode lsp-ui lsp-treemacs
               lsp-python-ms lsp-java livid-mode skewer-mode simple-httpd
               live-py-mode json-navigator hierarchy json-mode json-snatcher
               json-reformat js2-refactor multiple-cursors js2-mode js-doc
               importmagic epc ctable concurrent deferred helm-pydoc helm-lsp
               lsp-mode dash-functional groovy-mode groovy-imports pcache
               gradle-mode git-gutter-fringe+ fringe-helper git-gutter+ dash
               flycheck-ocaml merlin flycheck-credo emojify emoji-cheat-sheet-plus
               dune cython-mode company-emoji company-anaconda chruby bundler
               inf-ruby browse-at-remote blacken anaconda-mode pythonic alchemist
               elixir-mode leetcode graphql aio yasnippet-snippets treemacs-magit
               smeargle orgit org-projectile org-category-capture org-present
               org-pomodoro alert log4e gntp org-mime org-download org-cliplink
               org-brain mmm-mode markdown-toc markdown-mode magit-svn
               magit-section magit-gitflow magit-popup htmlize helm-org-rifle
               helm-org helm-gitignore helm-git-grep helm-company helm-c-yasnippet
               gnuplot gitignore-templates gitignore-mode gitconfig-mode
               gitattributes-mode git-timemachine git-messenger git-link gh-md
               fuzzy flyspell-correct-helm flyspell-correct flycheck-pos-tip
               pos-tip evil-org evil-magit magit git-commit with-editor transient
               company auto-yasnippet yasnippet auto-dictionary ac-ispell
               auto-complete ws-butler writeroom-mode winum which-key
               volatile-highlights vi-tilde-fringe uuidgen use-package
               treemacs-projectile treemacs-persp treemacs-icons-dired
               treemacs-evil toc-org symon symbol-overlay string-inflection
               spaceline-all-the-icons restart-emacs request rainbow-delimiters
               popwin pcre2el password-generator paradox overseer org-plus-contrib
               org-bullets open-junk-file nameless move-text macrostep lorem-ipsum
               link-hint indent-guide hybrid-mode hungry-delete hl-todo
               highlight-parentheses highlight-numbers highlight-indentation
               helm-xref helm-themes helm-swoop helm-purpose helm-projectile
               helm-mode-manager helm-make helm-ls-git helm-flx helm-descbinds
               google-translate golden-ratio font-lock+ flycheck-package
               flycheck-elsa flx-ido fill-column-indicator fancy-battery eyebrowse
               expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired
               evil-tutor evil-textobj-line evil-surround evil-numbers
               evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-lion
               evil-indent-plus evil-iedit-state evil-goggles evil-exchange
               evil-escape evil-ediff evil-cleverparens evil-args evil-anzu
               eval-sexp-fu emr elisp-slime-nav editorconfig dumb-jump dotenv-mode
               diminish devdocs define-word column-enforce-mode clean-aindent-mode
               centered-cursor-mode auto-highlight-symbol auto-compile
               aggressive-indent ace-link ace-jump-helm-line))
   '(safe-local-variable-values
     '((web-mode-indent-style . 2) (web-mode-block-padding . 4)
       (web-mode-script-padding . 4) (web-mode-style-padding . 4)
       (rustic-indent-offset . 4) (typescript-backend . tide)
       (typescript-backend . lsp) (javascript-backend . tide)
       (javascript-backend . tern) (javascript-backend . lsp)))
   '(warning-suppress-types '((comp) (comp) (comp))))
  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(highlight-parentheses-highlight ((nil (:weight ultra-bold))) t))
  )
