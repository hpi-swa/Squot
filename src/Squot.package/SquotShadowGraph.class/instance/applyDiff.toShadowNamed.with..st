patching
applyDiff: aDiff toShadowNamed: name with: aPatcher
	^ aPatcher
		apply: aDiff
		to: (self shadowNamed: name)