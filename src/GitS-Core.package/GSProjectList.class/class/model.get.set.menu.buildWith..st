instance creation
model: anObject get: getSelector set: setSelector menu: menuSelector buildWith: builder
	^ (self model: anObject get: getSelector set: setSelector menu: menuSelector)
		buildWith: builder