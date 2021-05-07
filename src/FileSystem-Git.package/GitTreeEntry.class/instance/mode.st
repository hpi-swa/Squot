public-accessing
mode
	(#(fileMode dirMode executableFileMode symlinkMode submoduleMode) includes: mode)
		ifFalse: [self error: 'Illegal mode'].
	^ self class perform: mode