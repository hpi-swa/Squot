actions
actionAuthor
	^ author ifNil: [author := GitStamp defaultName]