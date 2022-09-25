accessing
updateResult
	result := working copy.
	containerModifications do:
		[:each | result value replaceFrom: each first first to: each first last with: each third].
	(containerConflicts select: [:each | each last notNil]) do:
		[:each | result value replaceFrom: each first first to: each first last with: each last].