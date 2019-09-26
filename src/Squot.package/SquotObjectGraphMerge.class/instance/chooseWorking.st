merging
chooseWorking
	containerConflicts do: [:each | each chooseWorking].
	elementMerges do: [:each | each chooseWorking].