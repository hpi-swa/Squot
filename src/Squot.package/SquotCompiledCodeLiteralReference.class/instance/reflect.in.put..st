reflection
reflect: aCompiledCode in: aMirror put: newValue
	^ aMirror reflectLiteral: self of: aCompiledCode put: newValue