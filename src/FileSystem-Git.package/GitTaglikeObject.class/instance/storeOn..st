storing
storeOn: aStream
	self validate.
	self storeFixedKeysOn: aStream.
	properties ifNotNil: [ properties keysAndValuesDo: [ :key :value |
		self saveKey: key value: value to: aStream ] ].
	aStream 
		nextPut: Character lf asInteger;
		nextPutAll: message