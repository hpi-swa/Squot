collecting tracked files
allFiles

	self flag: #optimize. "Filter out .package and other squot files before"
	^ ((self rootDirectory children 
		reject: [:each | each path segments last = '.git'])
		collect: [:each | each allFiles]) flatten 