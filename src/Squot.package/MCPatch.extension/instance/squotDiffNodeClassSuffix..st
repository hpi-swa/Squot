*Squot-diff-converting
squotDiffNodeClassSuffix: aCollection
	| classChange |
	aCollection ifEmpty: [^ ''].
	classChange := aCollection first.
	classChange definition isClassDefinition ifFalse: [^ ''].
	classChange isAddition ifTrue: [^ ' (added)'].
	classChange isRemoval ifTrue: [^ ' (removed)'].
	^ ''