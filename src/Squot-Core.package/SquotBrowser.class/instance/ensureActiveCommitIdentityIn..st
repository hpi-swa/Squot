accessing
ensureActiveCommitIdentityIn: aCollection
	"PluggableTreeMorph uses == to find the morph corresponding to the activeCommit.
	since the commitList might reload the commits sometimes (producing new object identities for the
	same commits), ensure that activeCommit is (identity-)included in commitList (given as aCollection)"
	self activeCommit ifNil: [^ self].
	aCollection
		detect: [:each | each = self activeCommit]
		ifFound: [:commit | self basicActiveCommit: commit]
		ifNone: [self activeCommit: nil].