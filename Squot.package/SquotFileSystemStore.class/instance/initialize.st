initialize-release
initialize
	objects := Dictionary new. "path -> object"
	paths := IdentityDictionary new. "object -> collection of path"
	serializers := Dictionary new. "path -> serializer class"