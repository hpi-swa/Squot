windows
driveNamed: driveName
	^ self filesystem: (FSFilesystem disk) path: FSPath / (driveName, ':')