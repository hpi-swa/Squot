accessing
followSymbolicRefs: aString do: aBlock
	"Resolve all symbolic refs until a non-symbolic ref is encountered. Answer the non-symbolic ref. If an encountered ref does not exist, it counts as non-symbolic and will be answered. For each ref resolved along the way, evaluate aBlock with the ref name."
	| ref previousRefs |
	previousRefs := OrderedCollection new: 1.
	ref := aString. "will be a GitReference in the middle of the loop though"
	[aBlock value: ref.
	previousRefs add: ref.
	(refStores anySatisfy: [:each | (ref := each ref: ref) notNil]) 	and: [ref isSymbolic]]
		whileTrue:
			[ref := ref targetRef.
			(previousRefs includes: ref) ifTrue: [self error: 'Recursive symbolic refs']].
	^ previousRefs last "Do not resolve the ref yet. It might not even exist (target isNil)."