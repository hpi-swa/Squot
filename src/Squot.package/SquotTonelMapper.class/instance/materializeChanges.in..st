changes-operations
materializeChanges: aCollection in: aWorkingCopy
	aCollection do: [:each | each squotApplyToLoaded: self package]