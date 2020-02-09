patching
rebaseOn: anObjectContainer
	^ self copy
		left: (anObjectContainer artifactAt: self path);
		yourself