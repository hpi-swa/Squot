accessing
readableFileNames
	"^ self repository tags keys collect: [ :tag| tag object signature hexHash, '.git' ]"
	^ self repository tags keys collect: [ :tag| (tag name, '.git') asMCVersionName ]