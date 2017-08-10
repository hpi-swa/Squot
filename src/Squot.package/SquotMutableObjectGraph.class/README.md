In contrast to my superclasses, objects and shadows can be added to me to build new graphs.

I can both assign a name bidirectionally (name <-> object) via #assign:to[Shadow]:, and assign it unidirectionally (only object -> name) via #answer:whenAskedForTheNameOf:. The latter can be used to pretend that the capturing replacement of an object has the same name as the original object.