as yet unclassified
newHistorianAtMonticelloVersion: aMCVersion
	versionMapFromMonticello at: aMCVersion
		ifPresent: [:squotVersion | ^ squotRepository newHistorian: '' version: squotVersion]
		ifAbsent: [^ squotRepository newHistorian: '' version: nil]