windows
driveNamed: driveName
	^ self filesystem: (FileSystem disk) path: FSPath / (driveName, ':')