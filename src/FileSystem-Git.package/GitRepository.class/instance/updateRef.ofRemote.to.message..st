public-accessing-references
updateRef: refPath ofRemote: remoteName to: hexHash message: reflogMessageString
	| refName |
	self privateDeprecatedUseUnitOfWork.
	refName := self refName: refPath forRemote: remoteName.
	^ self updateRef: refName to: hexHash message: reflogMessageString