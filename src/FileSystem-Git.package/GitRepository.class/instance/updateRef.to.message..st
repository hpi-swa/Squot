public-accessing-references
updateRef: refPath to: hexHash message: reflogMessageString
	"Updates the reference denoted by refPath to reference the object with the sha1 name in hexHash and adds an entry in the reflog.
	Symbolic references are resolved, so the non-symbolic reference is updated.
	If the file denoted by refPath does not yet exist it will be created."
	| target |
	self validateReferenceOrReferenceName: refPath.
	
	target := [(self baseDir resolve: refPath) readStreamDo: [ :stream | stream contents withBlanksTrimmed ]]
		on: FileDoesNotExist do: [:ex | ex return: nil].
		
	(self reflogForReference: refPath)
		logUpdateFrom: (target ifNil: [0 asHexHash])
		to: hexHash
		by: GitStamp now
		message: reflogMessageString.

	(target isNil not and: [target beginsWith: 'ref:']) ifTrue: [
		^ self updateRef: (target allButFirst: 4) to: hexHash ].
	
	self basicUpdateRef: refPath to: hexHash asHexHash