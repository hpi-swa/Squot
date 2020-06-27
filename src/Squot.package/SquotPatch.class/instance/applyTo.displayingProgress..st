applying
applyTo: anObjectContainer displayingProgress: progressText
	self privateApplyTo: anObjectContainer
		diffsDoing: [:changedKeys :apply | changedKeys do: apply displayingProgress: progressText].