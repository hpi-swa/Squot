*Squot-trackable-capturing
squotCaptureSlotsIn: anObjectShadow with: aCapturer
	self flag: #deprecated. "Use SquotCompiledCodeMirror>>initializeSnapshot: anObjectShadow of: self with: aCapturer instead."
	anObjectShadow addInstVarNamed: #header withValue: self header with: aCapturer.
	anObjectShadow addInstVarNamed: #literals withValue: self literals with: aCapturer.
	self initialPC to: self basicSize do: [:index |
		anObjectShadow
			addVariableSlotAt: index
			withValue: (self basicAt: index)
			with: aCapturer].
	self flag: 'TODO: capture source code if available?'.