commands receive-pack
writeUpdateReferences: newRefsDictionary previousReferences: oldRefsDictionary
	| first |
	self assert: newRefsDictionary isEmpty not.
	first := true.
	newRefsDictionary keysAndValuesDo: [:refname :signature | | command |
		command := String streamContents: [:cmd |
			(oldRefsDictionary includesKey: refname)
				ifTrue: [signature
					ifNil: [cmd nextPutAll: (self deleteReference: refname whichWas: (oldRefsDictionary at: refname))]
					ifNotNil: [cmd nextPutAll: (self updateReference: refname
						from: (oldRefsDictionary at: refname) to: signature)]]
				ifFalse: [signature
					ifNotNil: [cmd nextPutAll: (self createReference: refname as: signature)]].
			first ifTrue: [first := false. cmd
				nextPut: Character null;
				print: GitProtocolCapabilities reportStatus ofsDelta]].
		self writeCommand: command withLineTerminator: true].
	self flushPacket.