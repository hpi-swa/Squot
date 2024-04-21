git porcelain - external
externalCommand: aString
	^ (Smalltalk classNamed: #OSProcess)
		ifNotNil: [:osProcess | | pipeline err out |
			osProcess isWindows
				ifTrue: [ | tmpFile output process |
					" on windows, the osvm does not support reading stdout/stderr. as a workaround, we put the output into a file that we delete right after reading it. note that we place the file into FileDirectory default because it is likely that we can read that one (is also the place where we are saving the image to) "
					tmpFile := (FileDirectory default / (UUID new asString, '.txt')) fullName.
					output := [
						process := OSProcess waitForCommand: ('cmd.exe /c "{1} > {2} 2>&1"' format: {aString copyReplaceAll: '"' with: '\"'. tmpFile}).
						FileStream readOnlyFileNamed: tmpFile do: [:s | s contents]
					] ensure: [FileDirectory deleteFilePath: tmpFile].
					{process exitStatus = 0. output}]
				ifFalse: [
					pipeline := osProcess evaluate: aString.
					out := pipeline upToEndOfFile.
					err := pipeline errorUpToEndOfFile.
					pipeline waitForAllToComplete.
					{pipeline last exitCode = 0. out, err}]]
		ifNil: [self error: 'For external commands, OSProcess must be installed']