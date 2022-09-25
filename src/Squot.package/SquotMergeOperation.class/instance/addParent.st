private
addParent
	| historian |
	self isFastForwardPossible
		ifTrue:
			[SquotToggles useNewApi
				ifTrue: [historian := self workingCopy activeHistorian]
				ifFalse: [historian := self workingCopy loadedHistorian].
			historian version: mergeVersion.
			self workingCopy loadedVersion: mergeVersion]
		ifFalse: [self workingCopy addParentVersion: mergeVersion].