initialize-release
fromPackedObjectStream: aStream type: byteTypeCode in: aRepository
	| class |
	class := self decodeClassFrom: byteTypeCode.
	^ (class in: aRepository) loadFrom: aStream