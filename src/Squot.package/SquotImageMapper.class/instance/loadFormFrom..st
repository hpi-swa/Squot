form-creation
loadFormFrom: aFileSystem
	^ [(aFileSystem referenceTo: self path) readStreamDo: [:stream | ImageReadWriter formFromStream: stream]]
		on: Error
		do: [^ nil]