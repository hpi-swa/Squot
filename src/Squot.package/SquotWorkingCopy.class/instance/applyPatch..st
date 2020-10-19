patching
applyPatch: aPatch
	aPatch applyTo: self displayingProgress: [:each | 'Updating working copy... ', each].
	self assertConsistentLoadOrder.