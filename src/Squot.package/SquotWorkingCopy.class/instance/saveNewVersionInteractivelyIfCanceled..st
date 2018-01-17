creating new versions
saveNewVersionInteractivelyIfCanceled: cancelBlock
	| patch |
	patch := self lazySnapshot patchRelativeToBase: self baseSnapshot.
	self saveNewVersionFromPatch: patch ifCanceled: cancelBlock.