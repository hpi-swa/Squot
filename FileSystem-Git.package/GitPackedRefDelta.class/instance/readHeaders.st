as yet unclassified
readHeaders
	super readHeaders.
	self deltaBaseName: (self sourceStream next: 20) asHexHash