writing
modifyMethod: oldDefinition to: newDefinition
	(self methodPathFor: oldDefinition) delete.
	self writeMethodDefinition: newDefinition.