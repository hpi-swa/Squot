*Squot-diff-patching
applyToShadowNamed: name inGraph: anObjectGraph
	^ self squotApplyTo: (anObjectGraph shadowNamed: name)