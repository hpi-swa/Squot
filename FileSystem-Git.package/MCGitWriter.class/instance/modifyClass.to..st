writing
modifyClass: oldDefinition to: newDefinition
	(self classPathFor: oldDefinition) delete.
	self writeClassDefinition: newDefinition.