comparing
diffItems: leftDictionarySlots againstThoseOf: rightDictionaryShadow with: aDiffBuilder
	itemChanges := Dictionary new
		addAll: (rightDictionaryShadow diffItems: leftDictionarySlots with: aDiffBuilder).