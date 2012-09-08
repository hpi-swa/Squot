initialize-release
readHeaders
	| stream |
	stream := self readStream.
	self
		verifyPackFileIdentifierFrom: stream;
		verifyPackFileVersionFrom: stream.
	objectCount := (stream next: 4) asInteger.