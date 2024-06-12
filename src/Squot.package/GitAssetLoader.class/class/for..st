instance creation
for: aString
	^ GitNamedAssetLoader
		named: aString
		ifAbsent: [
			GitWorkingCopyAssetLoader
				named: aString
				ifAbsent: [
					GitMCRepositoryAssetLoader
						scanFor: aString
						ifAbsent: [
							self error: ('No project with the name {1} could be found.'
										format: {aString printString})]]]