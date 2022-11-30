requesting
select
	| choice |
	choice := ListMultipleChooser new
		title: 'select the Co-Authors';
		labels: (self list collect: [:gitStamp | gitStamp asStringWithoutTimestamp]);
		values: self list;
		choose.
	(choice remove: CoAuthorListEditAuthorsItem instance ifAbsent: [])
		ifNotNil:
			[(CoAuthorList class >> #default) browse].
	^ choice