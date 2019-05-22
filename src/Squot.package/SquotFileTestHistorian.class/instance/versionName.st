private
versionName
	^ [self file contents asString]
		on: FileDoesNotExist do: [:e | e return: nil]