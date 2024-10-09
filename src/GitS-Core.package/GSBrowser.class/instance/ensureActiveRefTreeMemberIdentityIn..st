accessing
ensureActiveRefTreeMemberIdentityIn: aCollection
	"PluggableTreeMorph uses == to find the morph corresponding to the activeRef.
	since the refList might reload the refs sometimes (producing new object identities for the
	same ref name strings), ensure that activeRef is (identity-)included in refList (given as aCollection)"
	self activeRefTreeMember ifNil: [^ self].
	self activeRefTreeMember isRef ifFalse: [^ self activeRefTreeMember: nil].
	aCollection
		detect: [:each | each ref = self activeRefTreeMember ref]
		ifFound: [:member | self basicActiveRefTreeMember: member]
		ifNone: [self activeRefTreeMember: nil].