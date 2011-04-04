public
copy: sourcePath ifAbsent: aBlock to: destPath ifPresent: pBlock
	"Copy the file referenced as sourcePath to the destination referred as destPath. Perform associate actions in case of problems."

	| source destination |
	source := self resolve: sourcePath.
	destination := self resolve: destPath.
	store
		basicCopy: source
		ifAbsent: aBlock
		to: destination
		ifPresent: pBlock
		filesystem: self