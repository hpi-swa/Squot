instance creation
signalWith: aClass
	^ self new classWithoutPackage: aClass; signal