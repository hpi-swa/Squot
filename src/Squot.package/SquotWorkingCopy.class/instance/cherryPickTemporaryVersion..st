private switching historians
cherryPickTemporaryVersion: aVersion
	| patch |
	self assert: aVersion parents size = 1
		description: 'Temporary version must have exactly one parent to restore'.
	patch := SquotMergePatchBuilder new
				patchFrom: self
				to: aVersion
				base: aVersion parents first.
	self restoreCurrentAncestryAfter: [self loadPatch: patch].