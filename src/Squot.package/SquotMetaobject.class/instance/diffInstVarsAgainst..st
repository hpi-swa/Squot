private diffing
diffInstVarsAgainst: otherInstVars
	"Note that otherInstVars come from the left side and I am on the right side of the diff."
	| changes |
	changes := Dictionary new.
	instVars keysAndValuesDo: [:name :value | | instVarDiff |
		((otherInstVars includesKey: name) and: [(otherInstVars at: name) notNil or: [value isNil]])
			ifTrue: [instVarDiff := (otherInstVars at: name) squotDiffAgainst: value.
				instVarDiff squotHasChanges ifTrue:
					[changes at: name put: instVarDiff]]
			ifFalse: [changes at: name put: (value asSquotDiffOnlyRight)]].
	(otherInstVars keys difference: instVars keys) do: [:each |
		changes at: each put: (otherInstVars at: each) asSquotDiffOnlyLeft].
	^ changes