encodings
validEncodings
	^ ImageReadWriter allSubclasses select: [:each | each typicalFileExtensions notEmpty]