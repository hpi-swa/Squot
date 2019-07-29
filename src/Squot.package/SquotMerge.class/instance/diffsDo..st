Patch facade
diffsDo: aBlock
	patchBuilder diffsDo: aBlock.
	containerConflicts do: aBlock.
	self flag: #TODO. "add 'diffs' for conflicts"