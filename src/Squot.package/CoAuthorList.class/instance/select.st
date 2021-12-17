requesting
select

	^ ListMultipleChooser new
		title: 'select the Co-Authors';
		labels: (self list collect: [:gitStamp | gitStamp asStringWithoutTimestamp]);
		values: self list;
		choose