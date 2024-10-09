instance creation
model: anObject child: aSelector buildWith: builder
	^ self new
		model: anObject;
		buildSelector: aSelector;
		builder: builder;
		build