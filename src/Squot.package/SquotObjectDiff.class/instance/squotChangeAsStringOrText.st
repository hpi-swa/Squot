Squot-diff-converting
squotChangeAsStringOrText
	^ (changedInstVars
		ifEmpty: ['']
		ifNotEmpty: ['"changed variables:"', String cr,
				(changedInstVars keys joinSeparatedBy: String cr), String cr]),
	(changedVariablePart
		ifNil: ['']
		ifNotNil: [String cr, '"changed indices:"', String cr,
				(changedVariablePart keys joinSeparatedBy: String cr)])