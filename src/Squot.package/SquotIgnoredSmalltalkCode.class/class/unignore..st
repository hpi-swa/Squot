accessing
unignore: aMCDefinition
	"Stop ignoring changes to the object captured by aMCDefinition."
	self privateUnignoreClass: aMCDefinition.
	aMCDefinition squotRemoveFromChangeSet: self changeSet.