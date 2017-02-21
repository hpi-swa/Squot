tests-index
testWriteObjectNamesOn
	| byteStream previous |
	byteStream := (ByteArray streamContents: [ :stream | creator writeObjectNamesOn: stream ]) readStream.
	self assert: 20 * 7 equals: byteStream contents size.
	
	"make sure that object names have bee sorted"
	self deny: byteStream atEnd.
	previous := 0.
	[ byteStream atEnd ] whileFalse: [ | current |
		current := (byteStream next: 20) asInteger.
		self assert: current > previous.
		previous := current ]