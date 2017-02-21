operations
verifyPackFileIdentifierFrom: aStream
	| id |
	id := (aStream next: 4) asString.
	id = 'PACK' ifTrue: [ ^ self ].
	
	GitInvalidPackFileError signal: 'This doesn''t seem to be a pack file. Name was: ', id, 'but should have been ''PACK'''