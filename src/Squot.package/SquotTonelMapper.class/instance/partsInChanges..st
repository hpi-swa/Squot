as yet unclassified
partsInChanges: aCollection
	^ aCollection gather: [:patch |
		patch operations collect: [:operation |
			SquotChangesPart
				key: operation
				path: (self operationPath: operation)]]