*Squot-Tools
squotIsInChangeSet: aChangeSet
	^ (aChangeSet selectorsInClass: self fullClassName) includes: self selector