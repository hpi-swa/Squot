initialize-release
initialize
	name := '(unnamed)'.
	project := SquotProject empty.
	stores := Dictionary new. "artifact id -> store"
	previouslySavedArtifactSnapshots := Dictionary new. "artifact id -> store"
	"History"
	repository := nil.
	activeHistorian := nil.
	loadedVersion := nil.
	"Upcoming version"
	additionalParentVersions := OrderedCollection new.
	newVersionMessage := nil.