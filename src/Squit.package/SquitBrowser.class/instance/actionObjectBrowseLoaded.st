actions
actionObjectBrowseLoaded
	| path loadedObject |
	path := self objectSelection artifact path.
	loadedObject := self projectSelection objectAt: path.
	^ loadedObject browseFromSquot