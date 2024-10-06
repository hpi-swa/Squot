accessing
ensureActiveRefIdentityIn: aCollection
	"PluggableTreeMorph uses == to find the morph corresponding to the activeRef.
	since the refList might reload the refs sometimes (producing new object identities for the
	same ref name strings), ensure that activeRef is (identity-)included in refList (given as aCollection)"
	self activeRef ifNil: [^ self].
	aCollection
		detect: [:each | each = self activeRef]
		ifFound: [:ref | self basicActiveRef: ref]
		ifNone: [self activeRef: nil].