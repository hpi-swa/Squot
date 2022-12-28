patching
applyToContainer: aSquotProjectStore
	"When used to resolve artifact addition conflicts..."
	aSquotProjectStore
		removeAt: left artifact id;
		add: right artifact.