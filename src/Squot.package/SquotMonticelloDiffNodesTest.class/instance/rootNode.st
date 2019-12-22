running
rootNode
	| rootNode |
	rootNode :=
		((preparedWorkingCopy patchRelativeToBase: preparedWorkingCopy baseVersion)
			diffAt: 'package')
			asDiffTree.
	rootNode withAllChildren do: [:each | each workingCopy: preparedWorkingCopy].
	^ rootNode