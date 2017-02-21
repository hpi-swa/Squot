tests
testDefaultAuthor
	| defaultStamp author |
	defaultStamp := GitStamp now.
	(gitRepository repository baseDir / 'config') ensureDeleted.
	author := squitRepository defaultAuthor.
	self assert: defaultStamp name equals: author name.
	self assert: defaultStamp email equals: author email.
	
	gitRepository repository baseDir / 'config' writeStreamDo: [:stream |
		stream nextPutAll: '[user]'; lf;
			nextPutAll: '    name = Max Mustermann'; lf;
			nextPutAll: '    email = max.mustermann@sq.uit'; lf].
	author := squitRepository defaultAuthor.
	self assert: 'Max Mustermann' equals: author name.
	self assert: 'max.mustermann@sq.uit' equals: author email.
	
	gitRepository repository baseDir / 'config' writeStreamDo: [:stream |
		stream nextPutAll: '[user]'; lf;
			nextPutAll: '    email = max.mustermann@sq.uit'; lf].
	author := squitRepository defaultAuthor.
	self assert: defaultStamp name equals: author name.
	self assert: 'max.mustermann@sq.uit' equals: author email.