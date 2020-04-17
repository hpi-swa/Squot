private configuration
configSections
	| config file |
	self privateDeprecatedUseUnitOfWork.
	file := self configFile.
	file exists ifFalse: [^ Array empty].
	config := file readStreamDo: [:stream | stream ascii. INIFile readFrom: stream].
	^ config sections collect: [:each | each label substrings first]