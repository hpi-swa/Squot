accessing ancestry
baseVersion
	"The baseVersion is the official HEAD version of this working copy.
	New versions will have this version as a parent.
	It is possible that the state in the working copy is not actually up-to-date with this version,
	for example, in case of an unexpected shutdown of the system. See #loadedVersion."
	^ self loadedHistorian version