accessing
at: aString ifAbsentPut: aBlock
	"Answer the ref with the given name. If none is found in the cache, evaluate the block and assume that it results in a ref that should be cached, or nil if ther ref does not exist."
	"If the ref does not exist, store a ref with the zeroSignature to remember its absence."
	| ref |
	ref := refs associationAt: aString ifAbsent:
		[ref := aBlock value
			ifNil: [refs add: (GitReference zeroRefWithName: aString)]
			ifNotNil: [:newRef | refs add: newRef].
		self assert: (ref isKindOf: GitReference).
		self changedRef: ref.
		ref].
	^ ref exists ifTrue: [ref] ifFalse: []