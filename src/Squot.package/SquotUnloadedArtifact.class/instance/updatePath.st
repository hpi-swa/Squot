private
updatePath
	| newPath |
	newPath := super updatePath.
	artifact := workingCopy unloadedArtifacts at: newPath.