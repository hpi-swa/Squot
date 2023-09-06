as yet unclassified
partsInChanges: aCollection
	^ aCollection gather: [:patch |
		patch operations collect: [:operation |
			SquotChange
				key: operation
				path: (self operationPath: operation)]]