instance creation
working: workingPackageShadow incoming: incomingPackageShadow base: basePackageShadow modifications: operationsCollection conflicts: conflictsCollection
	^ self new
		setWorking: workingPackageShadow
		incoming: incomingPackageShadow
		base: basePackageShadow
		modifications: operationsCollection
		conflicts: conflictsCollection;
		yourself