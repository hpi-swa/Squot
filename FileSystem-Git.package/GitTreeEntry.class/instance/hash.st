comparing
hash
	^ self class hash bitXor: (self mode bitXor: entryName hash)