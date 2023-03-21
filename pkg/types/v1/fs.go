/*
Copyright © 2022 SUSE LLC

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

package v1

import (
	"io/fs"
	"os"
	"time"
)

type FS interface {
	Open(name string) (*os.File, error)
	Chmod(name string, mode os.FileMode) error
	Create(name string) (*os.File, error)
	Mkdir(name string, perm os.FileMode) error
	Stat(name string) (os.FileInfo, error)
	Lstat(name string) (os.FileInfo, error)
	RemoveAll(path string) error
	ReadFile(filename string) ([]byte, error)
	Readlink(name string) (string, error)
	RawPath(name string) (string, error)
	ReadDir(dirname string) ([]os.FileInfo, error)
	Remove(name string) error
	OpenFile(name string, flag int, perm fs.FileMode) (*os.File, error)
	WriteFile(filename string, data []byte, perm os.FileMode) error
	Chown(name string, uid, git int) error
	Chtimes(name string, atime, mtime time.Time) error
	Glob(pattern string) ([]string, error)
	Lchown(name string, uid, git int) error
	PathSeparator() rune
	Rename(oldpath, newpath string) error
	Symlink(oldname, newname string) error
	Truncate(name string, size int64) error
}
