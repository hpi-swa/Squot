private
packsDir
	self flag: #todo. "remove if not needed any more for GitPackFileCreator>>#initializeWith:"
	self assert: GitPackFileCreator>>#initializeWith: = thisContext sender method.
	^ repository packsDir