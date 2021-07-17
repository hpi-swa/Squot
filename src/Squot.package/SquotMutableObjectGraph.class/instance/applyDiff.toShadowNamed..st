patching
applyDiff: aDiff toShadowNamed: name
	^ aDiff applyToShadowNamed: name inGraph: self.