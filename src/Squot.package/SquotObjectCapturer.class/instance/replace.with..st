DataStream
replace: original with: proxy
	"From DataStream interface: We may wish to remember that in some field, the original object is being replaced by the proxy."
	replacedObjects at: original put: proxy.
	objectRegistry assign: (objectRegistry nameOf: original) to: proxy.