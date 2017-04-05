as yet unclassified
asTreeEntryNamed: aName
	^ GitTreeEntry fileNamed: aName hash: self hash in: repository