accessing
message
	^ [(self directory / 'message') contents asString]
		on: FileDoesNotExist do: [:e | e return: '']