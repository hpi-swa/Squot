toolbuilder
buildWith: builder
	| built |
	built := self innerSpec buildWith: builder.
	[self buildChildrenInto: built with: builder] fork.
	^ built