as yet unclassified
diffKeysAndValuesAgainstThoseOf: rightDictionaryShadow in: dictionaryDiff with: aDiffBuilder
	^ dictionaryDiff
		diffKeysAndValues: itemSlots
		againstThoseOf: rightDictionaryShadow
		with: aDiffBuilder