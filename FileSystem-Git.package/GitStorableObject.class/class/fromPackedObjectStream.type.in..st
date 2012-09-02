initialize-release
fromPackedObjectStream: aStream type: byteTypeCode in: aRepository
	| class |
	class := self types detect: [ :aClass | aClass byteTypeCode = byteTypeCode ].
	^ (class in: aRepository) loadFrom: aStream