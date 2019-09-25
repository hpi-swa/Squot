patching
applyDiff: aDiff toObjectNamed: name with: aPatcher
	^ aDiff applyToObjectNamed: name inGraph: self with: aPatcher