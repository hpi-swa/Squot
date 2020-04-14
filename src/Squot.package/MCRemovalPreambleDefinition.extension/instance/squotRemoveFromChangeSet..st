*Squot-Tools
squotRemoveFromChangeSet: aChangeSet 
	| newString |
	newString := ((aChangeSet preamble ifNil: [^ self])
		lines
		copyWithout: '"ignore ', packageName, ' removal preamble"')
		joinSeparatedBy: String cr.
	newString
		ifEmpty: [aChangeSet removePreamble]
		ifNotEmpty: [aChangeSet preamble: newString].