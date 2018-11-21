creating new versions
saveNewVersionInteractivelyIfCanceled: cancelBlock
	| patch |
	patch := self patchRelativeToBase: self baseSnapshot.
	^ self saveNewVersionFromPatch: patch ifCanceled: cancelBlock.