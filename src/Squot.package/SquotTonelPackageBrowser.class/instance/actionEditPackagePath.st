actions
actionEditPackagePath
	| mapper packageName newPath |
	mapper := self selectedMapper.
	packageName := mapper package name.
	newPath := UIManager default
					request:
						('The package will be stored in a subdirectory of the path below, named ''{1}''. ',
						'Thus, the package is currently stored in the directory ''{2}''.' format: {
							packageName.
							(mapper path / packageName) asReference.
						})
					initialAnswer: mapper path asReference.
	newPath isEmptyOrNil ifTrue: [^ self].
	newPath := FSPath from: newPath delimiter: FileSystem disk delimiter.
	mapper path: newPath.