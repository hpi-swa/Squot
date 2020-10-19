initialize-release
setAddedPath: path merge: aSquotLoadOrderMerge
	key := path.
	base := aSquotLoadOrderMerge base.
	working := aSquotLoadOrderMerge working.
	incoming := aSquotLoadOrderMerge incoming.
	differentPositions := {working indexOf: path. incoming indexOf: path}.