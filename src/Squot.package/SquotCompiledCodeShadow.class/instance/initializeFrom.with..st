initialize-release
initializeFrom: aCompiledCode with: aCapturer
	originalClass := aCompiledCode class.
	slots at: #header put: (aCapturer capture: aCompiledCode header).
	slots at: #literals put: (aCapturer capture: aCompiledCode literals).
	aCompiledCode initialPC to: aCompiledCode basicSize do: [:index |
		self addVariableSlotAt: index
			withContent: (aCapturer capture: (aCompiledCode basicAt: index))].
	self flag: 'TODO: capture source code if available'.