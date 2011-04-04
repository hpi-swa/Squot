operations
copyTo: aReference
	self isDirectory
		ifTrue: [ aReference ensureDirectory ]
		ifFalse: [ 
			filesystem = aReference filesystem
				ifTrue: [ filesystem copy: path to: aReference path ]
				ifFalse: [ filesystem copy: path toReference: aReference ] ]