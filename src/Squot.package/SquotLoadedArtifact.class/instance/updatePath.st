private
updatePath
	| newPath |
	newPath := super updatePath.
	artifact := workingCopy store artifactAt: newPath.