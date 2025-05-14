Partitioning helps speed up queries that filter by start_date, especially range queries, because:

Partition Pruning occurs: MySQL will only scan the relevant partitions (e.g., p2022, p2023) instead of scanning the entire table.

This reduces the number of rows scanned during query execution.

For large tables, this leads to faster response times and lower I/O usage.