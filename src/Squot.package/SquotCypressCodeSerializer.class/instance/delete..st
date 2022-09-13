private
delete: aMCDefinition
	aMCDefinition isMethodDefinition ifTrue: [^ self deleteMethod: aMCDefinition].
	aMCDefinition isClassDefinition ifTrue: [^ self deleteClassifier: aMCDefinition].
	"isClassDefinition is also true for MCTraitDefinition"
	aMCDefinition isScriptDefinition ifTrue: [^ self deleteScript: aMCDefinition].
	(aMCDefinition isKindOf: MCClassTraitDefinition) ifTrue: [^ self "nothing to delete, but the base trait definition must be written out"].
	self halt.
	