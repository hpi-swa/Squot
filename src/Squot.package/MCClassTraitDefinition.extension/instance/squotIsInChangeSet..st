*Squot-Tools
squotIsInChangeSet: aChangeSet 
	^ (aChangeSet classChangeAt: self className) includes: #change