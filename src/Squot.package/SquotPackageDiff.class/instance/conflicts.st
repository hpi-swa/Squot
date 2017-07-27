accessing
conflicts
	^ patch squotHasConflicts ifTrue: [patch conflicts] ifFalse: [#()]