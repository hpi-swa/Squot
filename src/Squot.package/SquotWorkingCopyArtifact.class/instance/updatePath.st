private
updatePath
	| oldPath newPath |
	oldPath := artifact path.
	newPath := workingCopy validatePath: oldPath for: artifact.
	newPath ~= oldPath ifTrue:
		[workingCopy moveObjectAt: oldPath to: newPath].
	^ newPath