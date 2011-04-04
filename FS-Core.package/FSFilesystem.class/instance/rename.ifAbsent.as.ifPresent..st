public
rename: sourcePath ifAbsent: aBlock as: destPath ifPresent: pBlock
	"Rename the file referenced as sourcePath to the destination referred as destPath. 
	Perform associate actions in case of problems."
	
	| source destination |
	source := self resolve: sourcePath.
	destination := self resolve: destPath.
	self basicRename: source ifAbsent: aBlock as: destination ifPresent: pBlock