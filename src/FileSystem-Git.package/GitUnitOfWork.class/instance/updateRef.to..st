refs
updateRef: refPath to: hexHash
	"Updates the reference denoted by refPath to reference the object with the sha1 name in hexHash.
	Symbolic references are resolved, so the non-symbolic reference is updated.
	If the file denoted by refPath does not yet exist it will be created."
	self updateRef: refPath to: hexHash message: nil.