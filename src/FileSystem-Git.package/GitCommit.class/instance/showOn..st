showing
showOn: aStream
	aStream
		nextPutAll: 'Commit ';
		nextPutAll: self hexHash.
	self basicParents
		ifNotEmpty: [aStream lf; nextPutAll: 'Parents: '];
		do: [:each | aStream nextPutAll: each]
		separatedBy: [aStream nextPutAll: ', '].
	aStream lf; nextPutAll: 'Author: '.
	self author showOn: aStream.
	aStream lf; nextPutAll: 'Committer: '.
	self committer showOn: aStream.
	aStream
		lf; lf;
		nextPutAll: self message.