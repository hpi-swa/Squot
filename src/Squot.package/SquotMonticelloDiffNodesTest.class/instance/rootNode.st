running
rootNode
	| rootNode |
	rootNode :=
		((preparedWorkingCopy patchRelativeToBase: preparedWorkingCopy baseVersion)
			diffAt: self packagePath)
			asDiffTree.
	rootNode withAllChildren do: [:each | each workingCopy: preparedWorkingCopy].
	^ rootNode