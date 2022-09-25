accessing
projectSelection
	self projectIndex > 1 ifFalse: [^ nil].
	^ SquitSettings useNewApi
		ifTrue: [SquotWorkingCopy2Adapter for:
					(SquotWorkingCopy2 registered at: self projectIndex - 1 ifAbsent: [^ nil])]
		ifFalse: [SquotWorkingCopy registered at: self projectIndex - 1 ifAbsent: []]