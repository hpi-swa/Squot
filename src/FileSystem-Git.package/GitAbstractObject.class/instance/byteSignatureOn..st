accessing
byteSignatureOn: aStream
	| data |
	data := self byteData.
	"format for object hash (see manual -> 'Object storage format'):
	<ascii type without space> + <space> + <ascii decimal size> + <byte\0> + <binary object data>"
	aStream
		nextPutAll: self typeCode asByteArray;
		nextPut: Character space asInteger;
		nextPutAll: data size asString asByteArray; "ASCII value for $0 is not 0 but 48!"
		nextPut: 0;
		nextPutAll: data