comparing
= anObject
	^ (anObject respondsTo: #rootDirectory) and: [anObject rootDirectory = rootDirectory]