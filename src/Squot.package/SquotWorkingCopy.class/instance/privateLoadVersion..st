private
privateLoadVersion: aVersion
	"Restore the snapshot of aVersion. Do not update my historian or anything else."
	| patch |
	SquotProgress displayStatus: 'Loading ', (aVersion printStringLimitedTo: 100) during:
	[self addGlobalObjectsToStore: aVersion.
	patch := aVersion patchRelativeToBase: self lazySnapshot.
	SquotProgress displayStatus: 'Loading objects' during:
	[self applyPatch: patch].
	self loadedVersion: aVersion].