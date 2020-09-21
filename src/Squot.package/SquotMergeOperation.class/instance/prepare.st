applying
prepare
	"Compute merge."
	^ self withUnitOfWorkActive:
	[self validateAncestry.
	self startUnitOfWork.
	mergeBases := self mergeBases.
	baseVersion ifNil: [baseVersion := self findBaseVersion].
	self flag: 'TODO: if there are multiple merge-bases, resolve conflicts recursively'.
	self workingCopy addGlobalObjectsToStore: mergeVersion.
	SquotProgress displayStatus: ('Merging for ', self title truncateWithElipsisTo: 80) during:
		[self workingCopy withCurrentSnapshot: self workingCopySnapshot do:
			[merge := SquotMerge into: self workingCopy
				merge: mergeVersion
				basedOn: baseVersion]].
	merge]