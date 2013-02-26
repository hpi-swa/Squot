operations
verifyPackFileVersionFrom: aStream
	| version |
	version := (aStream next: 4) asInteger.
	(#(1 2) includes: version) ifTrue: [ ^ self ].
	
	GitInvalidPackFileError signal: 'Pack file version was: ', (version asString),' but can only read versions 1 and 2'