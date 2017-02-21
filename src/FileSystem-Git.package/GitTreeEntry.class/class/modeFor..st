public
modeFor: aReference
	^ aReference isDirectory 
		ifTrue: [ self dirMode ]
		ifFalse: [ self fileMode ]