# Psudo Code for our logic. 
## 1. Insertion:
1. Subspace number estimator:
   1. this is responsible for dividing our vectors into subspaces, dynamically.
   2. because if we have just 20M we will divide it into many subSpaces, but if we have only 1M, so we can afford to have only 1 subSpace.
   3. so this will be a dynamic number.
   4. it outputs the number of subSpaces.
2. Vectors/Pages Reader
   1. Responsible for reading the vectors from the file.
3. Vectors divisor: (momken nshelo odam)
   1. this is responsible for dividing our vectors into subspaces.
   3. e7na han2ra el vectors kolohom, w ne-build hnsw le awl goz2. 
   4. w b3den ne2ra el vectors kolohom tany, w n-build hnsw w n3ml tany goz2 w hakaza. 
   5. it outputs 
4. HNSW builder:
   1. this is responsible for building the HNSW index. (de lw7dha kessa.)
   2. it takes the part of the vector, and start inserting it inside the graph. 
   3. it outputs graph for each sub-Space.
5. Memory to Disk mapper:
   1. this is responsible for writing the graph to the disk.

## 2. Searching: 
1. vector divisor
2. Graph Reader:
   1. this is responsible for reading the graph from the disk.
3. HNSW searcher
   1. hageb el graph el awlany, adwr feh 3ala el goz2 el awalany, w hytl3ly list of candidates.
   2. ygeb el graph el tany, w ydwr feh 3ala el goz2 el tany, w hytl3ly list of candidates.
   3. wdwalek.
4. product quantizer:
   1. han-combine baa best5dam 7aga fl pq e7na lesa msh fahmenha.
### TODOS: 
1. We need to read more about PQ. 
2. 