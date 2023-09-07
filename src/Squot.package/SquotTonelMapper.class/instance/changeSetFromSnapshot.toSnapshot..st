changes-creation
changeSetFromSnapshot: aSnapshot  toSnapshot: anotherSnapshot
	^ SquotTonelChangeSet withMapper: self patch: (anotherSnapshot patchRelativeToBase: aSnapshot)