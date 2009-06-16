(provide 'xml-util)

(defun make-xml-pretty ()
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (flush-lines "^[[:blank:]]*$")
    (goto-char (point-min))
    (replace-regexp ">[[:blank:]]*" ">")
    (goto-char (point-min))
    (replace-regexp "[[:blank:]]*<" "<")
    (goto-char (point-min))
    (replace-string "><" ">\n<")
    (indent-region (point-min) (point-max))))

(define-key nxml-mode-map (kbd "C-x c")  'make-xml-pretty)
