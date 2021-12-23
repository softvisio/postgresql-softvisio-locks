EXTENSION = softvisio_locks
DATA =	\
	softvisio_locks--1.0.0.sql \
	softvisio_locks--1.0.0--1.0.1.sql \
	softvisio_locks--1.0.1--1.0.2.sql

PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
