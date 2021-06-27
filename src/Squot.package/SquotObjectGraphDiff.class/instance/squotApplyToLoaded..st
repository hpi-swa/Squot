Squot-diff-patching
squotApplyToLoaded: anObjectGraph
	"Modify anObject such that it matches what I model and answer the modified object, even if it was modified in-place."
	self hasChanges ifFalse: [^ anObjectGraph].
	^ self patcherClass new
		registry: anObjectGraph;
		apply: self toLoadedGraph: anObjectGraph