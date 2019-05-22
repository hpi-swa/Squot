comparing
diffTreeNodesRelativeToBase: baseTrackedObjectMetadata
	| metadataNodes absent |
	metadataNodes := OrderedCollection new.
	absent := Object new.
	self keysAndValuesDo:
		[:key :value | | leftValue |
		leftValue := baseTrackedObjectMetadata at: key ifAbsent: [absent].
		leftValue = value ifFalse:
			[metadataNodes add:
				(leftValue == absent
					ifTrue: [self diffTreeNodeForAdding: key with: value]
					ifFalse: [self diffTreeNodeForChanging: key from: leftValue to: value])]].
	(baseTrackedObjectMetadata keys reject: [:each | self includesKey: each]) do:
		[:key |
		metadataNodes add:
			(self diffTreeNodeForRemoving: key with: (baseTrackedObjectMetadata at: key))].
	^ metadataNodes