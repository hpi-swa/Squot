comparing
patchRelativeToBase: aSquotProjectSnapshot
	^ (aSquotProjectSnapshot respondsTo: #snapshotArtifact:)
		ifTrue: [workingCopy patchRelativeToBase: aSquotProjectSnapshot]
		ifFalse: "It is a not a snapshot, but most likely a version."
			[(aSquotProjectSnapshot respondsTo: #parents)
				ifTrue: [workingCopy patchRelativeToBase: aSquotProjectSnapshot snapshot]
				ifFalse: [self notYetImplemented]]