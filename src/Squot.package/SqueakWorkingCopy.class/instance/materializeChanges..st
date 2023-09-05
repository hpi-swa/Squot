changes-operations
materializeChanges: aCollection
	aCollection do: [:each | each materializeIn: self].