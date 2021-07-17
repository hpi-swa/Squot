as yet unclassified
materializeItemsIn: aDictionary with: aMaterializer
	| materializedAssociations |
	self deprecated.
	materializedAssociations := Array streamContents: [:stream |
		itemSlots do: [:each | stream nextPut:
			(each materializeIn: aDictionary with: aMaterializer)]].
	(aDictionary associations copyWithoutAll: materializedAssociations)
		do: [:each | aDictionary removeKey: each key].