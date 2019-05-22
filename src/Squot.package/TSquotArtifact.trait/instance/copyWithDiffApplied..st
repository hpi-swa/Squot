copying
copyWithDiffApplied: aDiff
	^ self copyWithDifferentContent: (aDiff applyTo: self content) asShadowGraph