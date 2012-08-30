tests
testStampReading
	| str stamp |
	str := 'Tony Garnock-Jones <tonygarnockjones@gmail.com> 1266614121 +1300'.
	stamp := GitStamp fromString: str.
	self assert: str = stamp printString.