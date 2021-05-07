*Squot-Tools
squotIsInChangeSet: aChangeSet 
	^ aChangeSet preamble
		ifNil: [false]
		ifNotNil:
			[:preamble |
			preamble includesSubstring: '"ignore ', packageName, ' preamble"']