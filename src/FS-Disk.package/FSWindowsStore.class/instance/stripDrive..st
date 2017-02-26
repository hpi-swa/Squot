converting
stripDrive: pathElements
	pathElements ifNotEmpty: [ pathElements at: 1 put: ( (pathElements first splitBy: ':') last)  ]