adding and removing
moveObjectAt: oldPath to: newPath
	[store moveObjectAt: oldPath to: newPath]
		on: KeyNotFound do:
			[:e | | artifact |
			artifact := self unloadedArtifacts at: oldPath.
			self unloadedArtifacts
				removeKey: oldPath;
				at: newPath put: (artifact copy path: newPath; yourself)].
	loadOrder replaceAll: oldPath with: newPath.