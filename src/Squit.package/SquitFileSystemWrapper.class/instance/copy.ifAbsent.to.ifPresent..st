intercepted
copy: sourcePath ifAbsent: absentBlock to: destinationPath ifPresent: presentBlock
	wrappedFilesystem
		copy: sourcePath
		ifAbsent: [^ absentBlock value]
		to: destinationPath
		ifPresent: [^ presentBlock value].
	changedPaths add: destinationPath.