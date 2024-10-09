importing
importDirectory: aReference
	| optionIfMapped basePath |
	optionIfMapped := nil.
	basePath := self initialPathRequestAnswerWithSuffix: nil.
	[| askAgain mappedPaths |
	basePath := (GSPathUtilities
					requestAbsolute: 'Base path for assets in the repository:'
					initialAnswer: basePath)
					ifNil: [^ self].
	askAgain := false.
	mappedPaths := ((aReference allFiles
						collect: [:each | basePath resolve: (each path relativeTo: aReference path)])
						reject: [:each | self activeWorkingCopy isUnmappedPath: each])
						collect: [:each | GSPathUtilities asString: each].
	mappedPaths ifNotEmpty: [| answer |
		answer := UIManager default
						chooseOptionFrom: {
							'Choose a different base path'.
							'Skip taken paths'.
							'Overwrite taken paths (if possible)'.
							'Ask for each taken path'.
							'Cancel'.
						}
						values: {#different. #skip. #overwrite. #ask. #cancel}
						title: (('{1} paths' format: {mappedPaths size}) asText
								addAttribute: (PluggableTextAttribute evalBlock: [
												self inform: (mappedPaths joinSeparatedBy: String cr)]);
								yourself), ' inside the base path are already taken.'.
		answer caseOf: {
			[#different] -> [askAgain := true].
			[#skip] -> [optionIfMapped := #skip].
			[#overwrite] -> [optionIfMapped := #overwrite].
			[#ask] -> ["fall through"].
			[#cancel] -> [^ self].
		}].
	askAgain] whileTrue.
	aReference allFiles do: [:each |
		self importFile: each getPath: [| relativePath answer |
			relativePath := each path relativeTo: aReference path.
			answer := self activeWorkingCopy
							getUnmappedPathFrom: (basePath resolve: relativePath)
							withTitle: ('Path in the respository for the imported asset {1}:' format: {relativePath})
							additionalOptions: {'Skip this file' -> #skip}
							optionIfMapped: [optionIfMapped].
			answer ifNil: [^ self "cancel entire directory import"].
			answer = #skip ifTrue: [nil] ifFalse: [answer]]].