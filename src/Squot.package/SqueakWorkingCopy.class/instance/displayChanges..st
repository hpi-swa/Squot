changes-operations
displayChanges: aDictionary
	aDictionary keysAndValuesDo: [:mapper :changes |
		changes do: [:change | | morph |
			morph := mapper displayChange: change.
			morph isSystemWindow
				ifFalse: [morph openInWindow]
				ifTrue: [morph openInWorld]]].