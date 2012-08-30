legacy
serializeVersionInfo: aVersionInfo
	^ String streamContents: [ :s |
		(MCVersionInfoWriter on: s)
			writeVersionInfo: aVersionInfo ]