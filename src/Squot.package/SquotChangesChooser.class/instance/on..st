initialize-release
on: aPatch
	editedPatch := SquotToggles useNewApi ifTrue: [aPatch "is actually a merge"] ifFalse: [aPatch createNewBuilder].