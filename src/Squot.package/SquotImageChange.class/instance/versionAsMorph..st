toolbuilder
versionAsMorph: aFormOrNil
	^ (aFormOrNil
		ifNil: ['Missing' asText addAttribute: TextEmphasis italic; yourself])
		asMorph