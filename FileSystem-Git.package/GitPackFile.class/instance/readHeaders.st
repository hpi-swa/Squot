initialize-release
readHeaders
	| stream |
	stream := self readStream.
	((stream next: 4) asString = 'PACK') ifFalse: [
		GitInvalidPackFileError signal: 'The header of this pack file seems to be corrupted' ].
	stream skip: 4.
	objectCount := (stream next: 4) asInteger.