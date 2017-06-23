initialize-release
loadFrom: aStream
	| key value |
	[ aStream peek = Character lf asInteger ] whileFalse: [
		key := (aStream upTo: Character space asInteger) asString.
		value := ByteArray streamContents: [:valueStream |
			valueStream nextPutAll: (aStream upTo: Character lf asInteger).
			[aStream peekFor: Character space asInteger]
				whileTrue: [valueStream
						nextPut: Character cr asInteger;
						nextPutAll: (aStream upTo: Character lf asInteger)]].
		self loadKey: key value: value asString].
	aStream next.
	message := self tryDecodeString: aStream upToEnd asString.
	^self
