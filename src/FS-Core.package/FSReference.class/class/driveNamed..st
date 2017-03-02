windows
driveNamed: driveName
	^ self filesystem: (FileSystem disk) path: Path / (driveName, ':')