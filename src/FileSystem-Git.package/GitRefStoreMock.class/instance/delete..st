accessing
delete: aString
	refs removeKey: aString.
	accesses add: {#delete. aString}.