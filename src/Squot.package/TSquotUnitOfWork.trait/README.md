A unit of work is an ongoing operation with a repository. Whether it has any transaction semantics depends on the concrete implementation supplied by the repository. The primary purpose is to group actions on a repository together such that optimizations can be applied. Units of work must be short-lived, contrary to repositories.

If a repository receives #unitOfWork, it is expected to answer an object that implements my protocol.

These notes were writting when units of work came into existence:

How to reliably finish units of work? When are they finished?
--> When the business process says so, e. g. when a working copy operation is concluded (finished or aborted).

Some units of works are activated multiple times.
--> Retire finished units of work explicitly, so their resources may be freed (open file handles).

Finished ones may be reactivated when using a Git object.
--> Garbage collection? Are there more resources to be released next to the Git pack file handles? Currently there are not.

Finished unit of work: How to prevent that a "quicker and later" process attaches to a unit of work and finishes it before the original "owner" of the unit of work, thereby releasing it before the real work is finished?
--> By strictly using only one unit of work per process, even if it means to open multiple pack handles in parallel. The object cache at the repository still ensures that objects are not read twice.
--> If there are still "nested" clients (e. g. the save during a cherry-pick) and an inner client wants to finish, one could implement a client counting (as in reference counting) scheme, and only once the last client has finished, the unit is released. This was realized in SquotBasicUnitOfWork.
--> In a draft, finished units of work would be replaced by zombie objects via become:. How could this look in an object-oriented system without become:? Instead one could have a wrapper object for the "current" unit of work that has a state object for an inactive or an active unit of work. Activity here refers to being in progress, not being active in the dynamic environment.
-- Actually there is no dire need to zombify units of work. They will just be garbage collected along with operations and stack frames. But timely, explicit finishing could allow us to release more objects sooner.