patching
applyToShadowNamed: name inGraph: aMutableObjectGraph with: aPatcher
	^ aPatcher
		apply: self
		to: (aMutableObjectGraph shadowNamed: name)