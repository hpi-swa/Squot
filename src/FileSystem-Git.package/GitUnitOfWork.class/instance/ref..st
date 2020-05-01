accessing
ref: aString
	"Answer a GitReference or nil if none exists with that name."
	^ refs at: aString ifAbsentPut:
		[| ref | ref := nil.
		refStores detect: [:each | (ref := each ref: aString) notNil] ifNone: [].
		(ref notNil and: [ref isSymbolic not]) ifTrue:
			[resolvedRefs at: aString put: ref signature].
		(ref notNil and: [ref isSymbolic]) ifTrue: [symbolicRefs at: aString put: ref].
		ref "also store nil as lookup result"]