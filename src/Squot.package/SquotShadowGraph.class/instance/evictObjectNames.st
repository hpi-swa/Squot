copying
evictObjectNames
	"Remember only the names of my contained objects."
	objectNames removeAll.
	shadows keysAndValuesDo: [:name :shadow | objectNames at: shadow put: name].