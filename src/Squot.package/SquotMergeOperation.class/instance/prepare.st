applying
prepare
	"Compute merge."
	self validateAncestry.
	self workingCopy addGlobalObjectsToStore: mergeVersion.
	self workingCopy withCurrentSnapshot: self workingCopySnapshot do:
		[merge := SquotMerge into: self workingCopy
			merge: mergeVersion
			basedOn: baseVersion].
	^ merge