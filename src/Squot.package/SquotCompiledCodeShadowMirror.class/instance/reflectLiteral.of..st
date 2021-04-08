reflection
reflectLiteral: aCompiledCodeLiteralReference of: aCompiledCodeShadow
	^ (aCompiledCodeShadow instVarSlotNamed: 'literals') value at: aCompiledCodeLiteralReference literalIndex