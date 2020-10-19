patching
applyDiff: aSquotArtifactModification toObjectAt: path
	"Note modification, but has no influence on the load order."
	self assert: (working includes: path).