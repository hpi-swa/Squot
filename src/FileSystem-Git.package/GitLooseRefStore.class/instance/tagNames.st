accessing
tagNames
	| tagsDir |
	tagsDir := self tagsDir.
	^ tagsDir allFiles collect: [:each | self refFromFile: each relativeTo: tagsDir]