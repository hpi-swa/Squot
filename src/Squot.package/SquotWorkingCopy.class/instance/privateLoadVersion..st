private
privateLoadVersion: aVersion
	"Restore the snapshot of aVersion. Do not update my historian or anything else."
	| patch |
	UIManager default informUser: 'Loading ', (aVersion printStringLimitedTo: 100) during:
	[self addGlobalObjectsToStore: aVersion.
	patch := aVersion patchRelativeToBase: self lazySnapshot.
	UIManager default informUser: 'Loading objects' during:
	[store applyPatch: patch].
	self loadedVersion: aVersion].