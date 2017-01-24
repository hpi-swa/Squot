private
restoreObjectFrom: reference at: path using: aDeserializer
	| objectFromSnapshot |
	objects
		at: path
		ifPresent: [:object | self flag: 'will not work for classes like that?'.
			objectFromSnapshot := aDeserializer readFrom: reference.
			self restore: object to: objectFromSnapshot]
		ifAbsent: [self initializeObjectAt: path from: reference using: aDeserializer].