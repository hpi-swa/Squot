initialize-release
initializeFrom: anObject andItsCopy: copyOfAnObject with: metaobjectBuilder
	originalClass := anObject class.
	(self relevantInstVarNamesOf: anObject) do: [:each | 
		self capture: (anObject instVarNamed: each)
			copy: (copyOfAnObject instVarNamed: each)
			with: metaobjectBuilder
			at: each into: instVars].
	originalClass isVariable ifTrue:
		[variableSizePart := Array new: anObject size.
		1 to: copyOfAnObject basicSize do: [:index | 
			self capture: (anObject at: index)
				copy: (copyOfAnObject at: index)
				with: metaobjectBuilder
				at: index into: variableSizePart]].