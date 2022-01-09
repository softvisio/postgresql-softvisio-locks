# PostgreSQL backend locks

## Install / update / drop

```
CREATE EXTENSION IF NOT EXISTS softvisio_locks;

ALTER EXTENSION softvisio_locks UPDATE;

DROP EXTENSION IF EXISTS softvisio_locks;
```

## Build

```
gmake USE_PGXS=1 install
```

## Funcitions

### `pg_backend_id( pid? )`

-   `pid?` <int4\> Backand pid.
-   Returns: <int8\> | <null\> Backend `id`. If `pid` is not provided, returns `id` for the current backend. Returns <null\> if backend with the given `pid` is not active.

Example:

```sql
SELECT pg_backend_id();

SELECT pg_backend_id( 1234 );
```

### pg_active_backend

`pg_active_backend` view contains ids of the active backends, connected to the current database. Can be used to check if backend with the given id is currently active.

```sql
SELECT EXISTS ( SELECT FROM pg_active_backend WHERE id = pg_backend_id() );
```
