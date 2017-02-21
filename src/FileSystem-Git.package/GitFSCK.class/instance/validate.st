public-validating
validate
	self collectObjects.
	referenceContext := thisContext.
	errors := Dictionary new.
	unreachable := all copy.
	reachable := Set new.
	self validateHead.
	self validateBranches.
	self validateTags.
	
	self validateUnreachableObjects.
	
	errors ifEmpty: [ ^ self ].
	GitInvalidRepositoryError signal: 'GitFSCK found errors in the validated repository.'