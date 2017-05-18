intercepted
rename: sourcePath ifAbsent: absentBlock to: destinationPath ifPresent: presentBlock
	wrappedFilesystem
		rename: sourcePath
		ifAbsent: [^ absentBlock value]
		to: destinationPath
		ifPresent: [^ presentBlock value].
	changedPaths add: sourcePath; add: destinationPath.