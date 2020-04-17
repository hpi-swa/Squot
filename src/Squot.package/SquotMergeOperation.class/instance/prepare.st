applying
prepare
	"Compute merge."
	^ self withUnitOfWorkActive:
	[self validateAncestry.
	self workingCopy addGlobalObjectsToStore: mergeVersion.
	('Merging for ', self title truncateWithElipsisTo: 80) displaySequentialProgress:
		[self workingCopy withCurrentSnapshot: self workingCopySnapshot do:
			[merge := SquotMerge into: self workingCopy
				merge: mergeVersion
				basedOn: baseVersion]].
	merge]