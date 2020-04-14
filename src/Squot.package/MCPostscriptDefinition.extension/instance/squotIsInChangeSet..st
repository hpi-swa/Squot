*Squot-Tools
squotIsInChangeSet: aChangeSet 
	^ aChangeSet postscript
		ifNil: [false]
		ifNotNil:
			[:postscript |
			postscript includesSubstring: '"ignore ', packageName, ' postscript"']