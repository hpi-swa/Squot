private
privateLoadVersion: aVersion
	"Restore the snapshot of aVersion. Do not update my historian or anything else."
	| patch |
	SquotProgress displayStatus: 'Loading ', (aVersion printStringLimitedTo: 100) during:
	[self addGlobalObjectsToStore: aVersion.
	patch := self incomingPatchWhenLoading: aVersion.
	SquotProgress displayStatus: 'Loading objects' during:
	[self applyPatch: patch].
	self loadedVersion: aVersion].