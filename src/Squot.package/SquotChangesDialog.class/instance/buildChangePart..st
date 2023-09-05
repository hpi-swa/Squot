toolbuilder
buildChangePart: builder
	^ (self selectedChangePart ifNil: [^ self buildNothingSelected: builder]) buildWith: builder