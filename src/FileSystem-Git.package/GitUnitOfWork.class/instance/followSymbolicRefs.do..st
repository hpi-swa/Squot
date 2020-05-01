accessing
followSymbolicRefs: aString do: aBlock
	"Resolve all symbolic refs until a non-symbolic ref is encountered. Answer the non-symbolic ref. If an encountered ref does not exist, it counts as non-symbolic and will be answered. For each ref resolved along the way, evaluate aBlock with the ref name."
	| ref refName previousRefs |
	previousRefs := OrderedCollection new: 1.
	refName := aString.
	[aBlock value: refName.
	previousRefs add: refName.
	(ref := self ref: refName) notNil and: [ref isSymbolic]]
		whileTrue:
			[refName := ref targetRef.
			(previousRefs includes: refName) ifTrue: [self error: 'Recursive symbolic refs']].
	^ previousRefs last "Do not resolve the ref yet. It might not even exist (target isNil)."