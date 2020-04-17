public-accessing-references
updateRef: refPath to: hexHash
	"Updates the reference denoted by refPath to reference the object with the sha1 name in hexHash.
	Symbolic references are resolved, so the non-symbolic reference is updated.
	If the file denoted by refPath does not yet exist it will be created."
	| target |
	self privateDeprecatedUseUnitOfWork.
	self validateReferenceOrReferenceName: refPath.
	target := [(self baseDir resolve: refPath) readStreamDo: [ :stream | stream contents ]]
		on: FileDoesNotExist do: [:ex | ex return: nil].

	(target isNil not and: [target beginsWith: 'ref:']) ifTrue: [
		^ self updateRef: (target allButFirst: 4) withBlanksTrimmed to: hexHash ].
	
	self basicUpdateRef: refPath to: hexHash asHexHash