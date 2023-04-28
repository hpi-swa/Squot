changes-creation
changesFromSnapshot: aSnapshot  toSnapshot: anotherSnapshot
	^ { anotherSnapshot patchRelativeToBase: aSnapshot }