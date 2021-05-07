*Squot-Tools
squotAddToChangeSet: aChangeSet 
	aChangeSet postscript:
		(aChangeSet postscript ifNil: ['']), String cr,
			'"ignore ', packageName, ' removal postscript"'.