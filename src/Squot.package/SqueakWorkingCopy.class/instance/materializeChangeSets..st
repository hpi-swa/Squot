changes-operations
materializeChangeSets: aCollection
	aCollection
		do: [:each | each materializeIn: self]
		displayingProgress: [:each | 'Loading changes from {1}' format: {each mapper}].