adding and removing
removeAt: path
	"stop tracking object at path and omit it from the next snapshot"
	| object |
	object := objects removeKey: path ifAbsent: [^ self].
	(paths at: object) remove: path.
	(paths at: object) ifEmpty: [paths removeKey: object].
	additionalInfo removeKey: path ifAbsent: [].
	loadOrder remove: path ifAbsent: [].