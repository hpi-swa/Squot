objects-private
hasLooseObject: aHexHash
	"Only used for pack file unpacking. Do not use this in your code."
	^ (objectStores
		detect: [:each | each isMemberOf: GitLooseObjectStore]
		ifNone: [^ false])
		hasObject: aHexHash