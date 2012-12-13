;;; test-request.el --- Tests for request.el

;; Copyright (C) 2012 Takafumi Arakaki

;; Author: Takafumi Arakaki <aka.tkf at gmail.com>

;; This file is NOT part of GNU Emacs.

;; test-request.el is free software: you can redistribute it
;; and/or modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation, either version 3 of
;; the License, or (at your option) any later version.

;; test-request.el is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with test-request.el.
;; If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;

;;; Code:

(require 'request-testing)

(request-deftest request-simple-get ()
  (let* ((result (request-testing-sync (request-testing-url "some-path")
                                       :parser 'request-parser-json))
         (data (plist-get result :data)))
    (should (equal (assoc-default 'path data) "/some-path"))
    (should (equal (assoc-default 'method data) "GET"))))

(request-deftest request-simple-post ()
  (let* ((result (request-testing-sync (request-testing-url "some-path")
                                       :type "POST"
                                       :parser 'request-parser-json))
         (data (plist-get result :data)))
    (should (equal (assoc-default 'path data) "/some-path"))
    (should (equal (assoc-default 'method data) "POST"))))

(provide 'test-request)

;;; test-request.el ends here
