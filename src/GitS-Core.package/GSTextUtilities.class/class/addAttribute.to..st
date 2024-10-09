formatting
addAttribute: aTextAttribute to: aTextOrString
	^ aTextOrString asText
		addAttribute: aTextAttribute;
		yourself