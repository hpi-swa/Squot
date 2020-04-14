private
privateUnignoreClass: aMCDefinition
	| changeSet |
	changeSet := self changeSet.
	"See ignoreClass:"
	aMCDefinition actualClass ifNotNil: [:class | self unignoreClass: class name].