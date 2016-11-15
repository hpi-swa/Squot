instance creation
readFrom: aStream
	| author email secondsSince1970 sign zoneOffset |
	author := (aStream upTo: $<) withBlanksTrimmed.
	email := (aStream upTo: $>) withBlanksTrimmed.
	aStream skipSeparators.
	secondsSince1970 := Integer readFrom: aStream.
	aStream skipSeparators.
	sign := aStream next.
	('-+' includes: sign) ifFalse: [ 
		GitInvalidObjectError signal: 'Invalid timezone sign found while loading a GitStamp object.' ].
	
	zoneOffset := Integer readFrom: aStream.
	zoneOffset := (zoneOffset // 100) hours + (zoneOffset \\ 100) minutes.
	sign = $- ifTrue: [zoneOffset := zoneOffset negated].
	
	^ self new
		name: author;
		email: email; 
		timeStamp: ((DateAndTime fromUnixTime: secondsSince1970) utcOffset: zoneOffset);
		yourself