applying
computePatch
	SquotToggles useNewApi ifTrue:
		[^ self workingCopySnapshot patchRelativeToBase: (self workingCopy baseVersion ifNil: [SquotProjectSnapshot empty] ifNotNil: [:version | version snapshot])].
	^ self workingCopySnapshot patchRelativeToBase: self workingCopy baseSnapshot