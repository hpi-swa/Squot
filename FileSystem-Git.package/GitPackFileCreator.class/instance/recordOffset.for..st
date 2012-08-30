accessing
recordOffset: anInteger for: anObject
	self hashDict at: anObject hash put: (anInteger asByteArrayOfSize: 4)