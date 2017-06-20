as yet unclassified
diffKeysAndValuesAgainstThoseOf: rightDictionaryShadow in: dictionaryDiff with: aDiffBuilder
	^ dictionaryDiff
		diffKeys: keys
		andValues: values
		againstThoseOf: rightDictionaryShadow
		with: aDiffBuilder