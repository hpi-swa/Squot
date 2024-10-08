actions
materialize
	self isEmpty ifTrue: [^ self nothingToMaterialize].
	self shouldOpenDialog ifTrue: [^ self openDialogToMaterialize].
	^ self materializeNow