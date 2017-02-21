public-accessing
mode
	^ self isInFilemode
		ifTrue: [ self class fileMode ]
		ifFalse: [ self class dirMode ]