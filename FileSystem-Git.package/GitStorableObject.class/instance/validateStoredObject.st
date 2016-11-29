validation
validateStoredObject
	"Make sure the stored object has the correct type code and length"
	| stream actualTypeCode expectedTypeCode length start |
	self validateHash.
	stream := self repository streamObjectNamed: self hexHash.
	expectedTypeCode := self typeCode.
	actualTypeCode := (stream next: expectedTypeCode size) asString.
	expectedTypeCode = actualTypeCode
		ifFalse: [ GitInvalidObjectError signal: 'Object has wrong type code' ].
	stream next asCharacter = Character space
		ifFalse: [ GitInvalidObjectError signal: 'Violation of object format' ].
	length := (stream upTo: 0) asString asInteger.
	start := stream position.
	stream setToEnd.
	stream position - start = length
		ifFalse: [ GitInvalidObjectError signal: 'Incorrect length (indicated ', length, ', actually ', stream position, ')'].