testing
isObjectDirectory: aReference
	^ aReference isDirectory and: [ aReference basename size = 2 ]