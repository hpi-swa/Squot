*Squot-Tools
diffTreeNodesRelativeToBase: baseTrackedObjectMetadata
	| metadataNodes absent hiddenProperties |
	hiddenProperties := #(objectsReplacedByNames). "These properties are implementation details and changes to them should not be prevented by users."
	metadataNodes := OrderedCollection new.
	absent := Object new.
	self keysAndValuesDo:
		[:key :value | | leftValue |
		leftValue := baseTrackedObjectMetadata at: key ifAbsent: [absent].
		(leftValue ~= value and: [(hiddenProperties includes: key) not]) ifTrue:
			[metadataNodes add:
				(leftValue == absent
					ifTrue: [self diffTreeNodeForAdding: key with: value]
					ifFalse: [self diffTreeNodeForChanging: key from: leftValue to: value])]].
	(baseTrackedObjectMetadata keys reject: [:each | self includesKey: each]) do:
		[:key |
		metadataNodes add:
			(self diffTreeNodeForRemoving: key with: (baseTrackedObjectMetadata at: key))].
	^ metadataNodes