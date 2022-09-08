*Squot-Tools-Diffs
newSquotDiffNodes
	| metadataNodes absent hiddenProperties |
	hiddenProperties := #(objectsReplacedByNames id). "These properties are implementation details and changes to them should not be prevented by users."
	metadataNodes := OrderedCollection new.
	absent := Object new.
	right keysAndValuesDo:
		[:key :value | | leftValue |
		leftValue := left at: key ifAbsent: [absent].
		(leftValue ~= value and: [(hiddenProperties includes: key) not]) ifTrue:
			[metadataNodes add:
				(leftValue == absent
					ifTrue: [self diffTreeNodeForAdding: key]
					ifFalse: [self diffTreeNodeForChanging: key])]].
	(left keys reject: [:each | right includesKey: each]) do:
		[:key |
		metadataNodes add:
			(self diffTreeNodeForRemoving: key)].
	^ metadataNodes