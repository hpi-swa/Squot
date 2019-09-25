patching
applyDiff: aDiff toStartShadowWith: aPatcher
	^ aPatcher
		apply: aDiff
		to: self startShadow