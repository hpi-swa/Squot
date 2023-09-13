toolbuilder
versionAsMorph: aFormOrNil
	self flag: #todo. "Morphs with height <= 20px produce a layout error"
	^ (aFormOrNil
		ifNil: [('Missing', String lf "add line to avoid <= 20px") asText addAttribute: TextEmphasis italic; yourself])
		asMorph