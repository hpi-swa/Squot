patching
applyDiff: aSquotArtifactModification toObjectAt: path
	"Note modification, but has no influence on the load order."
	self assert: (editedWorking includes: path).