changes-operations
materializeChanges: aDictionary
	aDictionary keysAndValuesDo: [:mapper :changes |
		mapper materializeChanges: changes in: self].