windows
driveNamed: driveName
	^ self filesystem: (FSFilesystem disk) path: Path / (driveName, ':')