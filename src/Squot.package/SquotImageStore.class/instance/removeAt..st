adding and removing
removeAt: path
	"stop tracking object at path and omit it from the next snapshot"
	| object |
	object := objects removeKey: path ifAbsent: [^ self].
	(paths at: object) remove: path.
	additionalInfo removeKey: path ifAbsent: [].