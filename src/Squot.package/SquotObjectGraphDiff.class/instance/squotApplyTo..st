Squot-diff-patching
squotApplyTo: anObjectGraph
	^ SquotObjectPatcher new
		registry: anObjectGraph;
		apply: self toGraph: anObjectGraph mutableCopy