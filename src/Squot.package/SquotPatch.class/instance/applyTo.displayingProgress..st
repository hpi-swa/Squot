applying
applyTo: anObjectContainer displayingProgress: progressText
	self privateApplyTo: anObjectContainer
		diffsDoing: [:diffs :apply | diffs do: apply displayingProgress: progressText].