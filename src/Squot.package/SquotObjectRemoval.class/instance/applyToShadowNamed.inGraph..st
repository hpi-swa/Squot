Squot-diff-patching
applyToShadowNamed: name inGraph: anObjectGraph
	self assert: (anObjectGraph shadowNamed: name) = object.
	anObjectGraph removeObjectNamed: name.
	^ nil