refs
updateRef: refPath to: hexHash message: reflogMessageString
	"Updates the reference denoted by refPath to reference the object with the sha1 name in hexHash and adds an entry in the reflog.
	Symbolic references are resolved, so the non-symbolic reference is updated.
	If the file denoted by refPath does not yet exist it will be created."
	self updateRef: refPath to: hexHash message: reflogMessageString isSymbolic: false targetIsARef: false.