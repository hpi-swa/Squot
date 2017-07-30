testing
unloadPackage
	(MCPackage named: classFactory packageName) unload.
	self deny: (Smalltalk at: className ifAbsent: []) isBehavior.