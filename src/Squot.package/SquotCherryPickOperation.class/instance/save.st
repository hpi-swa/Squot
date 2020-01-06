applying
save
	"Save the new version."
	^ self workingCopy
		saveNewVersionFromPatch: loadedPatch
		message: self saveOperation message