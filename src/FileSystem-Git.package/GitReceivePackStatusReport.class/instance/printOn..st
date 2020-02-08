printing
printOn: aStream
	aStream nextPutAll: 'Push failed. '.
	errors
		do: [:association |
			aStream nextPutAll: association key "ref";
				nextPutAll: ': ';
				nextPutAll: association value "message"]
		separatedBy: [aStream cr].