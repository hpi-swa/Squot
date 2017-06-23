storing
saveKey: key value: value to: aStream
	| lines |
	aStream 
		nextPutAll: key asByteArray; 
		nextPut: Character space asInteger.
	lines := value splitBy: Character cr asString.
	aStream
		nextPutAll: lines first asByteArray;
		nextPut: Character lf asInteger.
	lines allButFirstDo: [:eachLine |
		aStream
			nextPut: Character space asInteger;
			nextPutAll: eachLine asByteArray;
			nextPut: Character lf asInteger].