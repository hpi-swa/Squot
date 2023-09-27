ui
formatExcludedLabel: aTextOrString
	^ SquotTextUtilities colorText: '( ' asText, aTextOrString, ' )' with: self excludedColor