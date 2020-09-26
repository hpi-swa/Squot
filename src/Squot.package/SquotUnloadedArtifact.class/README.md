I wrap an artifact that is not loaded in a working copy.

Outside of my working copy you will find my artifact instead of me. That is my artifact is a regular part of snapshots of the working copy and it will participate normally in merges and the creation of new versions. But whenever some changes would be applied to the objects loaded in the working copy, no objects in the working copy will actually be modified or created. Just my shadow objects will be modified for the record instead.

If I am removed from the working copy, the effect will be roughly equivalent to loading my artifact first and then removing it, except that its objects need not really be loaded, of course.

When something is merged into the working copy, I might also receive incoming changes. That means I can have conflicts with the incoming changes if there are differences between my artifact and its edition in the common base version with the incoming changes. Since I am not loaded, the only way to solve these conflicts is via the changes chooser. To create truly merged versions (for example, of methods), users will first have to load me and then merge properly. However as long as I am unloaded, no objects will be changed in the working copy when the merge is applied.

When a new version is saved from the working copy my artifact will be saved with all the changes that were merged into me. If I was removed, my artifact will not be part of the new version.
