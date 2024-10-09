adding
addTree: aString
	^ self children add: (self createTree: aString)