initialize-release
initializeFrom: anObject with: aCapturer
	originalClass := anObject class.
	(self relevantInstVarNamesOf: anObject) do: [:each |
		self addInstVarNamed: each
			withValue: (anObject instVarNamed: each)
			with: aCapturer].
	(originalClass isVariable and: [originalClass isWeak not]) ifTrue:
		[1 to: anObject basicSize do: [:index |
			self addVariableSlotAt: index
				withValue: (anObject basicAt: index)
				with: aCapturer]].