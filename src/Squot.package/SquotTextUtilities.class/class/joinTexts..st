joining
joinTexts: aCollection
	^ aCollection reduce: [:a :b | a asText, String lf, b]