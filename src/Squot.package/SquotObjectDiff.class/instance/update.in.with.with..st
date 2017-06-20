patching
update: key in: dictionary with: diffContent with: aDiffBuilder
	| patched |
	diffContent squotHasChanges ifFalse: [^ self].
	patched := aDiffBuilder
			apply: diffContent
			to: (dictionary
				at: key
				ifAbsent: [diffContent right squotAbsentContent]).
	patched == SquotAbsentValue instance
		ifFalse: [dictionary
				at: key
				put: patched]
		ifTrue: [dictionary removeKey: key].