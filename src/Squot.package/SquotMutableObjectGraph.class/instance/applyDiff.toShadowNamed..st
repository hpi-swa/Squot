patching
applyDiff: aDiff toShadowNamed: name
	| changed |
	changed := aDiff applyToShadowNamed: name inGraph: self.
	self assign: name toShadow: changed undecorated.