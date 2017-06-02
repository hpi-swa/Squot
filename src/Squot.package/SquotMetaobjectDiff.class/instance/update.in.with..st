patching
update: key in: dictionary with: diffContent
	diffContent squotHasChanges ifFalse: [^ self].
	dictionary
		at: key
		put: (diffContent squotApplyTo:
			(dictionary
				at: key
				ifAbsent: [diffContent right squotAbsentContent]))