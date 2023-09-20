bindings
addBindings
	self getBindings keysAndValuesDo: [:name :value |
		self bindings at: name put: value copy].