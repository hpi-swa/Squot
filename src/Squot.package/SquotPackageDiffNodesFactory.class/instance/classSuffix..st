private
classSuffix: aCollection
	| classChange |
	aCollection ifEmpty: [^ ''].
	classChange := aCollection first.
	classChange definition isClassDefinition ifFalse: [^ ''].
	classChange isConflict
		ifTrue:
			[classChange operation isAddition ifTrue: [^ ' (removed/changed)'].
			classChange operation isRemoval ifTrue: [^ '(changed/removed)']]
		ifFalse: 
			[classChange isAddition ifTrue: [^ ' (added)'].
			classChange isRemoval ifTrue: [^ ' (removed)']].
	^ ''