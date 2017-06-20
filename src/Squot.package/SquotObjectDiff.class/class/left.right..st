instance creation
left: leftMetaobject right: rightMetaobject
	^ self new
		diff: leftMetaobject against: rightMetaobject;
		yourself