changes-creation
changeSetFromChangeSets: aCollection
	^ (SquotChangeSet allEmpty: aCollection)
		ifTrue: [SquotEmptyChangeSet withMapper: self]
		ifFalse: [SquotMetadataChangeSet
					withMapper: self
					changeSets: (aCollection reject: #isEmpty)]