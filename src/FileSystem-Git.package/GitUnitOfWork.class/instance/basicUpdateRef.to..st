private
basicUpdateRef: refPath to: aString
	| cacheRef |
	self refStores first updateRef: refPath to: aString.
	cacheRef := GitReference name: refPath target: aString.
	refs at: refPath put: cacheRef.
	cacheRef isSymbolic
		ifTrue: [symbolicRefs at: refPath put: cacheRef]
		ifFalse: [resolvedRefs at: refPath put: cacheRef signature].
	symbolicRefs keysDo: [:each | resolvedRefs removeKey: each ifAbsent: []]. "could have been updated"