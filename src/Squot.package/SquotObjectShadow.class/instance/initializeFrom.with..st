initialize-release
initializeFrom: anObject with: aCapturer
	originalClass := anObject class.
	(self relevantInstVarNamesOf: anObject) do: [:each |
		self addInstVarNamed: each
			withContent: (aCapturer capture: (anObject instVarNamed: each))].
	(originalClass isVariable and: [originalClass isWeak not]) ifTrue:
		[1 to: anObject basicSize do: [:index |
			self addVariableSlotAt: index
				withContent: (aCapturer capture: (anObject basicAt: index))]].