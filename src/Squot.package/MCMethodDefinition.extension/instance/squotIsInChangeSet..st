*Squot-Tools
squotIsInChangeSet: aChangeSet
	^ (aChangeSet selectorsInClass: (SquotIgnoredSmalltalkCode symbolInChangeSet: self fullClassName)) includes: self selector