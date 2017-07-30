testing
checkRestoredPackage
	self assert: classFactory packageName equals: package packageName.
	self assert: (Smalltalk at: className) isBehavior.