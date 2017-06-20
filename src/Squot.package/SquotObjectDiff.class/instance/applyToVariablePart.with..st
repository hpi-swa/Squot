patching
applyToVariablePart: variableArray with: aDiffBuilder
	| variablePartDictionary newVariableArray |
	changedVariablePart isNil ifTrue: [^ variableArray].
	variablePartDictionary := Dictionary new.
	variableArray withIndexDo: [:each :index | variablePartDictionary at: index put: each].
	changedVariablePart keysAndValuesDo: [:index :diff |
		self update: index in: variablePartDictionary with: diff with: aDiffBuilder].
	newVariableArray := Array new: (variablePartDictionary keys ifEmpty: #(0)) max.
	variablePartDictionary keysAndValuesDo: [:index :each |
		newVariableArray at: index put: each].
	^ newVariableArray