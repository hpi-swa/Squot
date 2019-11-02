*Squot-tools
browseFromSquot
	^ Environment current packageOrganizer
		packageNamed: self packageName
		ifPresent:
			[:packageInfo |
			(packageInfo perform: self scriptSelector)
				openLabel: self scriptSelector, ' of package ', self packageName]
		ifAbsent: [(MCOperationsList operations: {MCAddition of: self}) browse]