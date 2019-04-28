as yet unclassified
hash

	^  ((self class hash
		bitXor: self objectContainer hash)
		bitXor: self rootDirectory hash)
		bitXor: trackedFiles