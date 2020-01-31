creating new versions
saveNewVersionInteractivelyIfCanceled: cancelBlock
	| patch |
	SquotToggles enableRefactoredSave ifTrue:
		[self deprecated: 'Use newInteractiveSaveOperation instead'].
	patch := self patchRelativeToBase: self baseSnapshot.
	^ self saveNewVersionFromPatch: patch ifCanceled: cancelBlock.