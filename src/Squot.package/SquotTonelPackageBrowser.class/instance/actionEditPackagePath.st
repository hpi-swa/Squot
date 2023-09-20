actions
actionEditPackagePath
	| mapper packageName newPath |
	mapper := self selectedMapper.
	packageName := mapper package name.
	newPath := (SquotPathUtilities
					request:
						('The package will be stored in a subdirectory of the path below, named ''{1}''. ',
						'Thus, the package is currently stored in the directory ''{2}''.' format: {
							packageName.
							SquotPathUtilities asString: mapper path / packageName.
						})
					initialAnswer: mapper path)
						ifNil: [^ self].
	mapper path: newPath.