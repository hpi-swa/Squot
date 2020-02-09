applying
applyTo: anObjectContainer
	self privateApplyTo: anObjectContainer
		diffsDoing: [:diffs :apply | diffs do: apply
			displayingProgress: [:each | 'Applying changes to ', each]].