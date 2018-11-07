# partitionedcounter

Overview
--------
This is a C implementation of a partitioned counter. An instance of the
partitioned can be incremented by multiple threads simultaneously in a
thread-safe way.

API
--------
* 'pc_init(pc_t *pc, int64_t *global_counter, uint32_t num_counters, int32_t threshold)': To initialize the counter.

* 'pc_destructor(pc_t *pc)': to destroy the counter and free up resources.

* 'pc_add(pc_t *pc, int64_t count)': to increment the counter by +count.

* 'pc_sync(pc_t *pc)': to sync up partitioned counters.

Build
-------

To build on a Haswell or newer hardware:
```bash
 $ make
 $ ./test_pc 8
```


 The argument to 'test_pc' is the number of threads.
 

Contributing
------------
Contributions via GitHub pull requests are welcome.


Authors
-------
- Prashant Pandey <ppandey@cs.stonybrook.edu>
- Rob Johnson <rob@cs.stonybrook.edu>
