initialize-release
readFrom: aStream
	"Read author, email and timeStamp from aStream.
	Also accept streams only containing the name, or only name and email."
	| secondsSince1970 sign zoneOffset |
	self name: (aStream upTo: $<).
	aStream atEnd ifTrue: [^ self].
	self name: self name allButLast. "trim the space before the e-mail address"
	self email: (aStream upTo: $>).
	aStream skipSeparators.
	aStream atEnd ifTrue: [^ self].
	secondsSince1970 := Integer readFrom: aStream.
	aStream skipSeparators.
	sign := aStream next.
	('-+' includes: sign) ifFalse: [ 
		GitInvalidObjectError signal: 'Invalid timezone sign found while loading a GitStamp object.' ].
	
	zoneOffset := Integer readFrom: aStream.
	zoneOffset := (zoneOffset // 100) hours + (zoneOffset \\ 100) minutes.
	sign = $- ifTrue: [zoneOffset := zoneOffset negated].
	
	self timeStamp: ((DateAndTime fromUnixTime: secondsSince1970) utcOffset: zoneOffset).