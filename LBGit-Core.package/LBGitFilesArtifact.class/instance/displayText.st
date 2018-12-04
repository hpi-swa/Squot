as yet unclassified
displayText

	^'Recorded files: (', (self trackedFiles keys inject: '' into: [:sum :each | sum, each, ', ']) ,')'