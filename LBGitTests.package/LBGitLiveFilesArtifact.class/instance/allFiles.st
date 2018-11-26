collecting tracked files
allFiles

	^ ((self rootDirectory children 
		reject: [:each | each path segments last = '.git'])
		collect: [:each | each allFiles]) flatten 