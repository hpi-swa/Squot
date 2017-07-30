patching
applyDiff: aDiff toStartObjectWith: aPatcher
	^ aPatcher
		apply: aDiff
		toLoaded: self startObject