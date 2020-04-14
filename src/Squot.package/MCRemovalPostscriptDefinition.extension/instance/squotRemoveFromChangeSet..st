*Squot-Tools
squotRemoveFromChangeSet: aChangeSet 
	| newString |
	newString := ((aChangeSet postscript ifNil: [^ self])
		lines
		copyWithout: '"ignore ', packageName, ' removal postscript"')
		joinSeparatedBy: String cr.
	newString
		ifEmpty: [aChangeSet removePostscript]
		ifNotEmpty: [aChangeSet postscript: newString].