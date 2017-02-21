loading
loadType: aString
	self object typeCode = aString ifFalse: [ 
		GitInvalidObjectError signal: 'This tag points to an object which is of',
			' a different type than the tag expected',
			' (e.g. the real object is of type commit but the tag says it''s a tree).' ]