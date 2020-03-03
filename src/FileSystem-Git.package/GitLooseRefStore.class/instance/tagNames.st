accessing
tagNames
	^ self tagsDir children collect: [:each | each basename]