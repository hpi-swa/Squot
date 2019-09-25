patching
applyDiff: aDiff toShadowNamed: name with: aPatcher
	^ aDiff applyToShadowNamed: name inGraph: self with: aPatcher