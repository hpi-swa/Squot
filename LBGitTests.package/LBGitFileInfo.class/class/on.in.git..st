as yet unclassified
on: aString in: rootFSReference git: gitFSReference 

	^ self new
		path: aString;
		rootDirectory: rootFSReference;
		gitDirectory: gitFSReference;
		yourself