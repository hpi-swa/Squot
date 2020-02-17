accessing
updateRef: refPath to: hexHash message: reflogMessageString
	"Updates the reference denoted by refPath to reference the object with the sha1 name in hexHash and adds an entry in the reflog.
	Symbolic references are resolved, so the non-symbolic reference is updated.
	If the file denoted by refPath does not yet exist it will be created."
	| oldHash target updaterAndTimestamp |
	repository validateReferenceOrReferenceName: refPath.
	updaterAndTimestamp := GitStamp now.
	oldHash := (self resolveRef: refPath) ifNil: [0 asHexHash].
	"also update the reflogs of all symbolic references dereferenced along the way"
	target := self followSymbolicRefs: refPath
		do: [:each |
			(self reflogForReference: each)
				logUpdateFrom: oldHash
				to: hexHash
				by: updaterAndTimestamp
				message: reflogMessageString].
	self basicUpdateRef: target to: hexHash asHexHash