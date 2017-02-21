syncing
syncPackagesAt: aPath
	aPath directories do: [ :directory|
		(directory basename endsWith: '.cls')
			ifFalse: [ self syncPackageAt: directory ]
			ifTrue: [	self syncClassAt: directory ]].