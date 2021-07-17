reflection
reflectLiteral: aCompiledCodeLiteralReference of: aCompiledCodeShadow put: newValue
	(aCompiledCodeShadow includesSlot: 'literals')
		ifFalse: [aCompiledCodeShadow addInstVarSlot: (SquotInstVarSlot key: 'literals' value: Dictionary new)].
	(aCompiledCodeShadow instVarSlotNamed: 'literals') at: aCompiledCodeLiteralReference literalIndex put: newValue.