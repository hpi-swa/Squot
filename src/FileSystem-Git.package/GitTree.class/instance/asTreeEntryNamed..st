as yet unclassified
asTreeEntryNamed: aName
	^ GitTreeEntry directoryNamed: aName hash: self hash in: repository