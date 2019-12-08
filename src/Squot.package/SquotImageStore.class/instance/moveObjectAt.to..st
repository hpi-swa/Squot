adding and removing
moveObjectAt: oldPath to: newPath
	| metadata object |
	object := self objectAt: oldPath.
	metadata := additionalInfo at: oldPath.
	self removeAt: oldPath;
		add: object at: newPath additionalInfo: metadata.