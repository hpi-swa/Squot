private
deleteClassifier: aMCClassDefinition 
	| classPath |
	classPath := aMCClassDefinition className, (aMCClassDefinition isTraitDefinition ifTrue: ['.trait'] ifFalse: ['.class']).
	self flag: #todo. "isTraitDefinition is currently provided by the MonticelloTonel package and Cypress serialization should not depend on Tonel"
	(currentDirectory resolve: classPath) deleteAll.