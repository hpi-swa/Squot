*Squot-Tools
squotRemoveFromChangeSet: aChangeSet 
	| newString |
	newString := ((aChangeSet preamble ifNil: [^ self])
		lines
		copyWithout: '"ignore ', packageName, ' preamble"')
		joinSeparatedBy: String cr.
	newString
		ifEmpty: [aChangeSet removePreamble]
		ifNotEmpty: [aChangeSet preamble: newString].