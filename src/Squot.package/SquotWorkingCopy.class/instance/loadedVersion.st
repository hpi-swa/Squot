private accessing
loadedVersion
	"The loaded version is the version that has evidently been loaded (or saved)
	last in this working copy. This needs not be up-to-date with our loadedHistorian's version.
	Thus, it is the inofficial (but more accurate) HEAD version of this working copy."
	^ loadedVersion ifNil: [self lastLoadedHistorian version]