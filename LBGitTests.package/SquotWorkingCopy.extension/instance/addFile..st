*LBGitTests
addFile: aString

	| path |
	path := aString. self flag: #TODO. "resolve path"
	self add: (LBGitFileInfo 
		on: path 
		in: self rootDirectory) 
	at: path.