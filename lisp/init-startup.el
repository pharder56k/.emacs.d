
(global-linum-mode 1) ;全局显示行号

;;用y/n来代替yes/no
(defalias 'yes-or-no-p 'y-or-n-p)

;;高亮当前行
(global-hl-line-mode 1)

(setq inhibit-startup-screen t) ;取消开启画面

;; 关闭工具栏，tool-bar-mode 即为一个 Minor Mode
(tool-bar-mode -1)

;; 更改光标的样式（不能生效，解决方案见第二集）
(setq-default cursor-type 'bar)

;; 快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; 这一行代码，将函数 open-init-file 绑定到 <f3> 键上
(global-set-key (kbd "<f3>") 'open-init-file)

;;设置系统的编码，避免各处的乱码。
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8) 
(set-terminal-coding-system 'utf-8) 
(set-keyboard-coding-system 'utf-8) 
(setq default-buffer-file-coding-system 'utf-8)

;;设置垃圾回收阈值，加速启动速度。
(setq gc-cons-threshold most-positive-fixnum)
(add-hook 'after-init-hook #'(lambda () (setq gc-cons-threshold 800000)))

;;关闭自动备份
(setq make-backup-files nil)

;;当你选中一段文字 之后输入一个字符会替换掉你选中部分的文字。
(delete-selection-mode 1)

(provide 'init-startup)
