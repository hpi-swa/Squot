private
privateLoadVersion: aVersion
	"Restore the snapshot of aVersion. Do not update my historian or anything else."
	| patch |
	UIManager default informUser: 'Loading ', (aVersion printStringLimitedTo: 100) during:
	[patch := aVersion patchRelativeToBase: self lazySnapshot.
	self addGlobalObjectsToStore: patch.
	UIManager default informUser: 'Loading objects' during:
	[store applyPatch: patch].
	self loadedVersion: aVersion].