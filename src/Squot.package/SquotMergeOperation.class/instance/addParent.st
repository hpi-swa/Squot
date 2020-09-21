private
addParent
	self isFastForwardPossible
		ifTrue:
			[self workingCopy loadedHistorian version: mergeVersion.
			self workingCopy loadedVersion: mergeVersion]
		ifFalse: [self workingCopy addParentVersion: mergeVersion].