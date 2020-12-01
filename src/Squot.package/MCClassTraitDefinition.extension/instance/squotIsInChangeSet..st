*Squot-Tools
squotIsInChangeSet: aChangeSet 
	^ (aChangeSet classChangeAt: self squotName) includes: #change