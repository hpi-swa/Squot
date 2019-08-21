testing
squotHasChanges
	^ operations notEmpty or: [conflicts anySatisfy: [:each | each remoteChosen]]