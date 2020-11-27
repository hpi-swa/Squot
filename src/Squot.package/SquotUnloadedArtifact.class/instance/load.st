patching
load
	workingCopy unloadedArtifacts removeKey: artifact path ifAbsent: [].
	[workingCopy add: artifact]
		on: Error do:
			[:e | "Undo so the artifact is not effectively removed."
			[(workingCopy includesObjectAt: artifact path)
				ifFalse: [workingCopy addUnloaded: artifact]]
				ensure: [e pass]].