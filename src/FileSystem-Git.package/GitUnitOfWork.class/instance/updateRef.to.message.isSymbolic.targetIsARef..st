refs
updateRef: refPath to: target message: reflogMessageString isSymbolic: isSymbolicBoolean targetIsARef: targetIsARefBoolean
	"Updates the reference denoted by refPath to reference the object with the sha1 name in hexHash and adds an entry in the reflog.
	Symbolic references are resolved, so the non-symbolic reference is updated.
	If the file denoted by refPath does not yet exist it will be created."
	| oldHash targetRef hexHash refValue updaterAndTimestamp |
	repository validateReferenceOrReferenceName: refPath.
	updaterAndTimestamp := GitStamp now.
	hexHash := targetIsARefBoolean ifTrue: [self resolveRef: target] ifFalse: [target asHexHash].
	refValue := targetIsARefBoolean ifTrue: [self withRefPrefix: target] ifFalse: [target asHexHash].
	oldHash := (self resolveRef: refPath) ifNil: [0 asHexHash].
	"also update the reflogs of all symbolic references dereferenced along the way"
	[targetRef := isSymbolicBoolean
				ifTrue: [
					reflogMessageString ifNotNil: [
						(self reflogForReference: refPath)
							logUpdateFrom: oldHash
							to: hexHash
							by: updaterAndTimestamp
							message: reflogMessageString].
					refPath]
				ifFalse: [
					self followSymbolicRefs: refPath do: [:each |
						reflogMessageString ifNotNil: [
							(self reflogForReference: each)
								logUpdateFrom: oldHash
								to: hexHash
								by: updaterAndTimestamp
								message: reflogMessageString]]].
	self basicUpdateRef: targetRef to: refValue]
		on: Error do:
			[:e | (repository baseDir resolve: refPath) isDirectory
				ifTrue: [self error: 'Cannot create branch. ', refPath, ' is a directory']
				ifFalse: [e pass]]