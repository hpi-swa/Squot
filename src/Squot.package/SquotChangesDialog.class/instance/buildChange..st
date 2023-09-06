toolbuilder
buildChange: builder
	^ (self selectedChange ifNil: [^ self buildNothingSelected: builder]) buildWith: builder