bindings
getBindings
	self getBindingsSelector ifNil: [^ Dictionary new].
	^ self model perform: self getBindingsSelector