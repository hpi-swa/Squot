printing
printOn: aStream
	aStream nextPutAll: 'Push failed. '.
	errors
		do: [:association |
			aStream nextPutAll: association key "ref";
				nextPutAll: ': ';
				nextPutAll: association value "message"]
		separatedBy: [aStream cr].
	successes ifNotEmpty: [aStream cr; nextPutAll: 'These refs were pushed successfully:'; cr].
	successes
		do: [:each | aStream nextPutAll: each asString]
		separatedBy: [aStream cr].