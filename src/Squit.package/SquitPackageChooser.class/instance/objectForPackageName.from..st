choosing packages
objectForPackageName: aString from: aWorkingCopy

	| package |
	package := aWorkingCopy store objectPaths detect: [:each | each endsWith: aString, '.package'].
	^ aWorkingCopy store objectAt: package