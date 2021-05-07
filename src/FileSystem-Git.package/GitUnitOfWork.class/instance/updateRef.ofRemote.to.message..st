remotes
updateRef: refPath ofRemote: remoteName to: hexHash message: reflogMessageString
	| refName |
	refName := self refName: refPath forRemote: remoteName.
	^ self updateRef: refName to: hexHash message: reflogMessageString