public-accessing-references
refTo: aGitObject
	"Search all references for one referring to aGitObject and answer it, if found.
	Answer nil if no reference refers to aGitObject."
	self privateDeprecatedUseUnitOfWork.
	self allReferencesDo: [:each | (self resolveRef: each) = aGitObject hexHash ifTrue: [^ each]].
	^ nil
	