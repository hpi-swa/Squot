switching historians
mergeTemporaryVersionsOn: aHistorian
	| stashHistorian  |
	(self repository hasTemporaryVersionsOn: aHistorian) ifFalse: [^ self].
	stashHistorian := self repository historianForTemporaryVersionsOn: aHistorian.
	self restoreCurrentAncestryAfter:
		[[self mergeVersionInteractively: stashHistorian version ifCanceled: [^ self]]
		on: SquotSelectionOfChangesRequested do: [:request |
			"accept automatically unless there are conflicts"
			request patch hasConflicts
				ifTrue: [request pass]
				ifFalse: [request resume]]].