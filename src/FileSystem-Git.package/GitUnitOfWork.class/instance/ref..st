refs
ref: aString
	"Answer a GitReference or nil if none exists with that name."
	^ refCache at: aString ifAbsentPut:
		[ | ref |
		refStores detect: [:each | (ref := each ref: aString) notNil] ifNone: [].
		ref "also nil as lookup result"]