accessing
isPlaying
	^ (self sound ifNil: [^ false]) isPlaying