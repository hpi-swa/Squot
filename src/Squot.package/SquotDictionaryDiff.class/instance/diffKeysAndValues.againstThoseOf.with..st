as yet unclassified
diffKeysAndValues: leftDictionarySlots againstThoseOf: rightDictionaryShadow with: aDiffBuilder
	itemChanges := Dictionary new
		addAll: (rightDictionaryShadow diffKeysAndValues: leftDictionarySlots with: aDiffBuilder).