accessing
getSpec
	^ (self model ifNil: [^ nil])
		perform: (self specSelector ifNil: [^ nil])
		withEnoughArguments: {self toolbuilder}