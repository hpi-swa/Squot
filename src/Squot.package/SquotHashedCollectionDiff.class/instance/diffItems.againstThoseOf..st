comparing
diffItems: leftDictionarySlots againstThoseOf: rightDictionaryShadow
	itemChanges := Dictionary new
		addAll: (rightDictionaryShadow diffItems: leftDictionarySlots).