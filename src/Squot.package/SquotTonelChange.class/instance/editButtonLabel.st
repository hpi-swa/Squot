ui
editButtonLabel
	^ self isInEditMode ifTrue: ['Cancel'] ifFalse: ['Edit']