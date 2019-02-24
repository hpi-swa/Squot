as yet unclassified
squotChangeAsStringOrText

	^ self diffs inject: 'Tracked file changes
	' into: [:total :each | total, Character tab, each title, Character cr]