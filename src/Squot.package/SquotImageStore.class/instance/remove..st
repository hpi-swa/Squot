adding and removing
remove: anObject
	"stop tracking anObject and omit it from the next snapshot"
	(paths removeKey: anObject) do: [:each |
		objects removeKey: each.
		additionalInfo removeKey: each].