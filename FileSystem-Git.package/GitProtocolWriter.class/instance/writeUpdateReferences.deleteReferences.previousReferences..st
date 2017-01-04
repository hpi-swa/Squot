commands receive-pack
writeUpdateReferences: updateAssociations deleteReferences: deleteRefs previousReferences: oldRefsDictionary
	| clientCapabilities first |
	self assert: (updateAssociations notEmpty or: [deleteRefs notEmpty]).
	clientCapabilities := GitProtocolCapabilities reportStatus ofsDelta.
	first := true.
	updateAssociations do: [:each | | refname signature command |
		refname := each key. signature := each value asHexHash.
		command := String streamContents: [:cmd |
			(oldRefsDictionary includesKey: refname)
				ifTrue: [cmd nextPutAll: (self updateReference: refname
						from: (oldRefsDictionary at: refname) to: signature)]
				ifFalse: [signature
					ifNotNil: [cmd nextPutAll: (self createReference: refname as: signature)]].
			first ifTrue: [first := false. cmd
				nextPut: Character null;
				print: clientCapabilities]].
		self writeCommand: command withLineTerminator: true].
	deleteRefs do: [:each | | command |
		command := String streamContents: [:cmd |
			(oldRefsDictionary includesKey: each)
				ifTrue: [cmd nextPutAll: (self deleteReference: each whichWas: (oldRefsDictionary at: each))]
				ifFalse: [self error: 'Attempted to delete non-existent reference ', each].
			first ifTrue: [first := false. cmd
				nextPut: Character null;
				print: clientCapabilities]].
		self writeCommand: command withLineTerminator: true].