as yet unclassified
diffKeys: leftKeys andValues: leftValues againstThoseOf: rightDictionaryShadow with: aDiffBuilder
	added := Dictionary new.
	removed := Dictionary new.
	modified := Dictionary new.
	rightDictionaryShadow diffKeys: leftKeys andValues: leftValues with: aDiffBuilder
		putAddedInto: added
		putRemovedInto: removed
		putModifiedInto: modified