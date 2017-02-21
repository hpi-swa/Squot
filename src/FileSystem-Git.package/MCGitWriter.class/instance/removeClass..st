removing
removeClass: aClassDefinition
	(self classPathForPackage: aClassDefinition category class: aClassDefinition className) delete
	