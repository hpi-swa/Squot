ui
formatExcludedLabel: aTextOrString
	^ GSTextUtilities colorText: '( ' asText, aTextOrString, ' )' with: self excludedColor