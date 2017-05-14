actions
actionObjectBrowseLoaded
	| path liveObject |
	path := self objectSelection artifact path.
	liveObject := self projectSelection artifactAt: path.
	liveObject browse.