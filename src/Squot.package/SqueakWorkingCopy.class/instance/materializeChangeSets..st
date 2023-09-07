changes-operations
materializeChangeSets: aCollection
	aCollection do: [:each | each materializeIn: self].