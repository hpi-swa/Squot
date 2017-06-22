as yet unclassified
diffKeysAndValues: leftDictionarySlots againstThoseOf: rightDictionaryShadow with: aDiffBuilder
	added := Dictionary new.
	removed := Dictionary new.
	modified := Dictionary new.
	rightDictionaryShadow diffKeysAndValues: leftDictionarySlots with: aDiffBuilder
		putAddedInto: added
		putRemovedInto: removed
		putModifiedInto: modified