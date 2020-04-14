private
privateIsWholeClassIgnored: aMCDefinition
	^ aMCDefinition actualClass
		ifNil: [false]
		ifNotNil: [:class | self isWholeClassIgnored: class name]