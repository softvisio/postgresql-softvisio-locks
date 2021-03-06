\echo 'You need to use the following commands:'
\echo 'CREATE EXTENSION IF NOT EXISTS softvisio_locks CASCADE;'
\echo 'ALTER EXTENSION softvisio_locks UPDATE;'
\echo \quit

CREATE OR REPLACE VIEW pg_active_backend AS (
    SELECT
        ( extract( EPOCH FROM backend_start ) * 1000000 )::int8 AS id,
        pid
    FROM
        pg_stat_activity
    WHERE
        datname = current_database()
        AND backend_start IS NOT NULL
);

CREATE OR REPLACE FUNCTION pg_backend_id () RETURNS int8 STABLE AS $$
BEGIN
    RETURN ( SELECT id FROM pg_active_backend WHERE pid = pg_backend_pid() );
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION pg_backend_id ( _pid int4 ) RETURNS int8 STABLE AS $$
BEGIN
    RETURN ( SELECT id FROM pg_active_backend WHERE pid = _pid );
END;
$$ LANGUAGE plpgsql;
