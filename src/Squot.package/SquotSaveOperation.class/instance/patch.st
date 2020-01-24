accessing
patch

	^ patch ifNil:
		[patch := self workingCopy patchRelativeToBase: self workingCopy baseVersion]