configuration-private
ensureConfigOr: aBlock
	| file |
	config ifNil:
		[file := repository configFile.
		file exists ifFalse: [^ aBlock value].
		config := file readStreamDo: [:stream | stream ascii. INIFile readFrom: stream]].