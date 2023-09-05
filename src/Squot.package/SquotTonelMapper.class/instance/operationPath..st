as yet unclassified
operationPath: anOperation
	| definition |
	definition := anOperation definition.
	^ self path segments, {self package name}, definition squotChangePath