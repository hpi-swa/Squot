applying
prepare
	"Compute merge."
	^ self withUnitOfWorkActive:
	[self validateAncestry.
	self startUnitOfWork.
	baseVersion ifNil:
		[mergeBases := self mergeBases.
		baseVersion := self findBaseVersion].
	self flag: 'TODO: if there are multiple merge-bases, resolve conflicts recursively'.
	self shouldAddGlobalObjectsAutomatically ifTrue: [self mergeScope addAlreadyLoadedArtifacts].
	SquotProgress displayStatus: ('Merging for ', self title truncateWithElipsisTo: 80) during:
		[merge := self mergeScope prepareMerge].
	merge]