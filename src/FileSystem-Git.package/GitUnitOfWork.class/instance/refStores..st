accessing
refStores: aCollection
	refStores := aCollection.
	refStores do: [:each | each repository: self].