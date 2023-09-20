instance creation
model: anObject get: getSelector set: setSelector buildWith: builder
	^ (self model: anObject get: getSelector set: setSelector)
		buildWith: builder