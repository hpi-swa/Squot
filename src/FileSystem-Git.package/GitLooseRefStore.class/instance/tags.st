accessing
tags
	| tagsDir |
	tagsDir := baseDir / 'refs' / 'tags'.
	tagsDir exists ifFalse: [^ Dictionary new].
	^ self collectTagsFromLooseRefs