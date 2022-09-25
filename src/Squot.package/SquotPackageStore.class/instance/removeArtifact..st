accessing artifacts
removeArtifact: anArtifact 
	self flag: #todo. "Actually, this should unload a package. But for now, keep the old behavior of just removing the artifact from the working copy. For me as the store this means: do nothing."