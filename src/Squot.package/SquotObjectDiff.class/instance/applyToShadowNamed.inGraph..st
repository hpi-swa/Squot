patching
applyToShadowNamed: name inGraph: aMutableObjectGraph
	^ self squotApplyTo: (aMutableObjectGraph shadowNamed: name)