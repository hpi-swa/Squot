toolbuilder
buildWith: builder
	builder parent ifNil: [self error: 'builder has no parent'].
	self children do: [:each |
		builder add: (each buildWith: builder) to: builder parent].