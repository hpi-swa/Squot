comparing
patchRelativeToBase: aProjectSnapshot
	(aProjectSnapshot respondsTo: #baseSnapshot) ifTrue: [^ snapshot patchRelativeToBase: (SquotProjectSnapshot fromStore: aProjectSnapshot "a working copy")].
	^ snapshot patchRelativeToBase: aProjectSnapshot	