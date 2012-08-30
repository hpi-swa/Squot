initialize-release
loadFrom: aStream
	| key value |
	[ aStream peek = Character lf asInteger ] whileFalse: [
		key := (aStream upTo: Character space asInteger) asString.
		value := (aStream upTo: Character lf asInteger) asString.
		self loadKey: key value: value].
	aStream next.
	message := aStream upToEnd asString.
	^self
