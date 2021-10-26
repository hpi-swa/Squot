reflection
reflectHeader: aCompiledCodeHeaderReference of: aCompiledCodeShadow put: newValue
	^ aCompiledCodeShadow addInstVarSlot: (SquotInstVarSlot key: 'header' value: newValue)