actions on objects
actionObjectBrowseInWorkingCopy
	| path liveObject |
	path := self objectSelection artifact path.
	liveObject := self projectSelection artifactAt: path.
	liveObject browse.