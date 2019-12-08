serializing
validatePath
	"Some serializers require special path conventions (e. g., Cypress does)"
	| rewrittenPath |
	self deprecated: 'Path should be corrected explicitly using the stores.'.
	rewrittenPath :=
		((Environment current valueOf: self serializerName)
			rewritePath: self path for: self content).
	rewrittenPath ~= path ifTrue:
		[store add: object at: rewrittenPath additionalInfo: storeInfo;
			removeAt: path.
		path := rewrittenPath].