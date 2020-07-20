refs
updateRef: refPath to: hexHash
	"Updates the reference denoted by refPath to reference the object with the sha1 name in hexHash.
	Symbolic references are resolved, so the non-symbolic reference is updated.
	If the file denoted by refPath does not yet exist it will be created."
	| ref |
	self assert: refPath isString.
	repository validateReferenceOrReferenceName: refPath.
	ref := self followSymbolicRefs: refPath.
	self basicUpdateRef: ref to: hexHash asHexHash.