initialize-release
fromPackedObjectStream: aStream type: byteTypeCode in: aRepository hash: aHash
	| class |
	class := self decodeClassFrom: byteTypeCode.
	^ (class in: aRepository hash: aHash size: aStream size) loadFrom: aStream