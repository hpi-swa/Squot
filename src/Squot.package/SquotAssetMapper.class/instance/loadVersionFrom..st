version-creation
loadVersionFrom: aFileSystem
	^ [(aFileSystem referenceTo: self path) readStreamDo: [:stream | self readVersionFrom: stream]]
		on: Error
		do: [^ nil]