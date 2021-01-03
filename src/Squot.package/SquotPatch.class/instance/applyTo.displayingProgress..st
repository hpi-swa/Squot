applying
applyTo: anObjectContainer displayingProgress: progressText
	^ self privateApplyTo: anObjectContainer
		diffsDoing:
			[:changedKeys :apply |
			SquotProgress display: progressText for: changedKeys do: apply].