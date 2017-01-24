private snapshot building
generateTableOfContentsIn: aSnapshotBuilder
	| toc |
	toc := Dictionary new.
	objects keysAndValuesDo: [:path :object |
		toc at: path put: (serializers at: path) name].
	aSnapshotBuilder at: '.squot-table-of-contents' write: [:stream |
		STON put: toc onStreamPretty: stream].