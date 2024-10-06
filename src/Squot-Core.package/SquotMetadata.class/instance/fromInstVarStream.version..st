parsing
fromInstVarStream: aStream version: aNumber
	aNumber > self class currentVersion ifTrue: [^ SquotBrowser errorOutdated].
	aNumber = self class currentVersion
		ifTrue: [self fromCurrentVersionInstVarStream: aStream]
		ifFalse: [self fromInstVarStream: aStream oldVersion: aNumber]