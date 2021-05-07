*Squot-Tools
squotAddToChangeSet: aChangeSet 
	aChangeSet preamble:
		(aChangeSet preamble ifNil: ['']), String cr,
			'"ignore ', packageName, ' removal preamble"'.