tools
browseWorkingCopyObjectFromSquot
	^ working isRemoval
		ifTrue: [incoming browseWorkingCopyObjectFromSquot]
		ifFalse: [working browseWorkingCopyObjectFromSquot]