initialize-release
initialize
	super initialize.
	self
		materialized: Dictionary new;
		mappers: OrderedCollection new;
		credentials: Dictionary new.