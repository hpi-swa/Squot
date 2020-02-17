accessing
tags
	repository tagsDir exists ifFalse: [^ Dictionary new].
	^ self collectTagsFromLooseRefs