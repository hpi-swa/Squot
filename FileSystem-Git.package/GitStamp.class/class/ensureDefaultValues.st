accessing
ensureDefaultValues
	DefaultName ifNil: [
			self defaultName: 'John Doe'].
	DefaultEmail ifNil: [
			self defaultEmail: 'john@foo.com']