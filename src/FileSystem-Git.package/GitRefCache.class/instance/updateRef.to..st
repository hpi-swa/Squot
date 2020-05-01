changing
updateRef: aString to: aHexHash
	| ref |
	ref := refs associationAt: aString
			ifAbsent: [refs add: (GitReference name: aString target: aHexHash)].
	ref signature: aHexHash.
	self changedRef: ref.
	