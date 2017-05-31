loading and unloading
loadedVersion: aVersion
	"Remember this version as the one loaded into the image. All uncommitted changes are considered to be based on this version."
	self lastLoadedHistorian version: aVersion.
	self flushPreviouslySavedArtifacts.