DataStream
replace: original with: proxy
	"From DataStream interface: We may wish to remember that in some field, the original object is being replaced by the proxy."
	convertedObjects at: original put: (proxy asSquotContentWith: self andCopy: proxy "have nothing else")