accessing
result
	^ choice caseOf:
		{[#working] -> [working].
		[#incoming] -> [incoming]}
		otherwise: []