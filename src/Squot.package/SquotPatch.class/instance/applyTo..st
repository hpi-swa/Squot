applying
applyTo: anObjectContainer
	self privateApplyTo: anObjectContainer
		diffsDoing: [:changedKeys :apply | changedKeys do: apply
			displayingProgress: [:each | 'Applying changes to ', each]].