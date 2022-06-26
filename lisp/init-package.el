;; === 插件部分 ===
;; 最简洁的格式 Install restart-emacs
(require 'use-package)
(use-package restart-emacs)

;; 文本编辑之自动补全
(use-package company
 ; :bind   ;; company mode 默认选择上一条和下一条候选项命令 M-n M-p
 ; (("C-n" . company-select-next)
 ;  ("C-p" . company-select-previous))
  :config 
  (setq company-dabbrev-code-everywhere t 
        company-dabbrev-code-modes t 
        company-dabbrev-code-other-buffers 'all 
        company-dabbrev-downcase nil 
        company-dabbrev-ignore-case t 
        company-dabbrev-other-buffers 'all 
        company-require-match nil 
        company-minimum-prefix-length 2 
        company-show-numbers t 
        company-tooltip-limit 20 
        company-idle-delay 0 
        company-echo-delay 0 
        company-tooltip-offset-display 'scrollbar 
        company-begin-commands '(self-insert-command)) 
  (push '(company-semantic :with company-yasnippet) company-backends) 
  :hook ((after-init . global-company-mode)))

;;通过 benchmark-init 包进行启动耗时的测量。
(use-package benchmark-init 
  :init (benchmark-init/activate) 
  :hook (after-init . benchmark-init/deactivate))

;;crux 删除当前行插件（智能删除行）绑定到 C-k
(use-package crux 
  :bind (("C-k" . crux-smart-kill-line)
         ("C-a" . crux-move-beginning-of-line)))
	 
;;上下移动行/块。可通过插件drag-stuff来辅助实现。绑定到 M-up M-down
(use-package drag-stuff 
  :bind (("<M-up>". drag-stuff-up) 
         ("<M-down>" . drag-stuff-down)))

;;ivy 搜索框架的引擎 
(use-package ivy 
  :defer 1 
  :demand 
  :hook (after-init . ivy-mode) 
  :config 
  (ivy-mode 1) 
  (setq ivy-use-virtual-buffers t 
        ivy-initial-inputs-alist nil 
        ivy-count-format "%d/%d " 
        enable-recursive-minibuffers t 
        ivy-re-builders-alist '((t . ivy--regex-ignore-order))))

;;counsel 优化了一系列Minibuffer的操作
(use-package counsel 
  :after (ivy) 
  :bind (("M-x" . counsel-M-x) 
         ("C-x C-f" . counsel-find-file) 
         ("C-c f" . counsel-recentf)
         ("C-c g" . counsel-git)))

;;swiper ivy搜索的功能调用改健代替内置 C-s C-r 
(use-package swiper 
  :after ivy 
  :bind (("C-s" . swiper) 
         ("C-r" . swiper-isearch-backward)) 
  :config (setq swiper-action-recenter t 
                swiper-include-line-number-in-search t))

;;Flycheck 语法检查
(use-package flycheck 
  :hook (after-init . global-flycheck-mode))

;;Which-Key这款插件来辅助你“记忆”
(use-package which-key 
  :defer nil 
  :config (which-key-mode))

;;这个插件可以记录我们每次调用 M-x 时输入的命令历史，然后每次将最常用的显示在前面，这对于我们短时间希望频繁输入某几个命令的场景非常有用。
(use-package amx
  :ensure t
  :init (amx-mode))

;;这个插件可以用不同颜色标记多级括号，方便看清代码块（尤其在 EmacsLisp 中）。
(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(provide 'init-package)
