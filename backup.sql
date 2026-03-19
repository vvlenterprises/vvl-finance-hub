--
-- PostgreSQL database dump
--

\restrict Y8BFhYbF38q9577ieHEtyzSkvm1NpFcxC1YzCRoWc2GjDe52MSfrn6HCx9hpZTr

-- Dumped from database version 17.6
-- Dumped by pg_dump version 18.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: auth; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA auth;


ALTER SCHEMA auth OWNER TO supabase_admin;

--
-- Name: extensions; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA extensions;


ALTER SCHEMA extensions OWNER TO postgres;

--
-- Name: graphql; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql;


ALTER SCHEMA graphql OWNER TO supabase_admin;

--
-- Name: graphql_public; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql_public;


ALTER SCHEMA graphql_public OWNER TO supabase_admin;

--
-- Name: pgbouncer; Type: SCHEMA; Schema: -; Owner: pgbouncer
--

CREATE SCHEMA pgbouncer;


ALTER SCHEMA pgbouncer OWNER TO pgbouncer;

--
-- Name: realtime; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA realtime;


ALTER SCHEMA realtime OWNER TO supabase_admin;

--
-- Name: storage; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA storage;


ALTER SCHEMA storage OWNER TO supabase_admin;

--
-- Name: vault; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA vault;


ALTER SCHEMA vault OWNER TO supabase_admin;

--
-- Name: pg_graphql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_graphql WITH SCHEMA graphql;


--
-- Name: EXTENSION pg_graphql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_graphql IS 'pg_graphql: GraphQL support';


--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA extensions;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA extensions;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: supabase_vault; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS supabase_vault WITH SCHEMA vault;


--
-- Name: EXTENSION supabase_vault; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION supabase_vault IS 'Supabase Vault Extension';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA extensions;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: aal_level; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.aal_level AS ENUM (
    'aal1',
    'aal2',
    'aal3'
);


ALTER TYPE auth.aal_level OWNER TO supabase_auth_admin;

--
-- Name: code_challenge_method; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.code_challenge_method AS ENUM (
    's256',
    'plain'
);


ALTER TYPE auth.code_challenge_method OWNER TO supabase_auth_admin;

--
-- Name: factor_status; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_status AS ENUM (
    'unverified',
    'verified'
);


ALTER TYPE auth.factor_status OWNER TO supabase_auth_admin;

--
-- Name: factor_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_type AS ENUM (
    'totp',
    'webauthn',
    'phone'
);


ALTER TYPE auth.factor_type OWNER TO supabase_auth_admin;

--
-- Name: oauth_authorization_status; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_authorization_status AS ENUM (
    'pending',
    'approved',
    'denied',
    'expired'
);


ALTER TYPE auth.oauth_authorization_status OWNER TO supabase_auth_admin;

--
-- Name: oauth_client_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_client_type AS ENUM (
    'public',
    'confidential'
);


ALTER TYPE auth.oauth_client_type OWNER TO supabase_auth_admin;

--
-- Name: oauth_registration_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_registration_type AS ENUM (
    'dynamic',
    'manual'
);


ALTER TYPE auth.oauth_registration_type OWNER TO supabase_auth_admin;

--
-- Name: oauth_response_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_response_type AS ENUM (
    'code'
);


ALTER TYPE auth.oauth_response_type OWNER TO supabase_auth_admin;

--
-- Name: one_time_token_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.one_time_token_type AS ENUM (
    'confirmation_token',
    'reauthentication_token',
    'recovery_token',
    'email_change_token_new',
    'email_change_token_current',
    'phone_change_token'
);


ALTER TYPE auth.one_time_token_type OWNER TO supabase_auth_admin;

--
-- Name: app_role; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.app_role AS ENUM (
    'admin',
    'agent',
    'manager'
);


ALTER TYPE public.app_role OWNER TO postgres;

--
-- Name: action; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.action AS ENUM (
    'INSERT',
    'UPDATE',
    'DELETE',
    'TRUNCATE',
    'ERROR'
);


ALTER TYPE realtime.action OWNER TO supabase_admin;

--
-- Name: equality_op; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.equality_op AS ENUM (
    'eq',
    'neq',
    'lt',
    'lte',
    'gt',
    'gte',
    'in'
);


ALTER TYPE realtime.equality_op OWNER TO supabase_admin;

--
-- Name: user_defined_filter; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.user_defined_filter AS (
	column_name text,
	op realtime.equality_op,
	value text
);


ALTER TYPE realtime.user_defined_filter OWNER TO supabase_admin;

--
-- Name: wal_column; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_column AS (
	name text,
	type_name text,
	type_oid oid,
	value jsonb,
	is_pkey boolean,
	is_selectable boolean
);


ALTER TYPE realtime.wal_column OWNER TO supabase_admin;

--
-- Name: wal_rls; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_rls AS (
	wal jsonb,
	is_rls_enabled boolean,
	subscription_ids uuid[],
	errors text[]
);


ALTER TYPE realtime.wal_rls OWNER TO supabase_admin;

--
-- Name: buckettype; Type: TYPE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TYPE storage.buckettype AS ENUM (
    'STANDARD',
    'ANALYTICS',
    'VECTOR'
);


ALTER TYPE storage.buckettype OWNER TO supabase_storage_admin;

--
-- Name: email(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.email() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.email', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'email')
  )::text
$$;


ALTER FUNCTION auth.email() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION email(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.email() IS 'Deprecated. Use auth.jwt() -> ''email'' instead.';


--
-- Name: jwt(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.jwt() RETURNS jsonb
    LANGUAGE sql STABLE
    AS $$
  select 
    coalesce(
        nullif(current_setting('request.jwt.claim', true), ''),
        nullif(current_setting('request.jwt.claims', true), '')
    )::jsonb
$$;


ALTER FUNCTION auth.jwt() OWNER TO supabase_auth_admin;

--
-- Name: role(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.role() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.role', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'role')
  )::text
$$;


ALTER FUNCTION auth.role() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION role(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.role() IS 'Deprecated. Use auth.jwt() -> ''role'' instead.';


--
-- Name: uid(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.uid() RETURNS uuid
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.sub', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'sub')
  )::uuid
$$;


ALTER FUNCTION auth.uid() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION uid(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.uid() IS 'Deprecated. Use auth.jwt() -> ''sub'' instead.';


--
-- Name: grant_pg_cron_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_cron_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_cron'
  )
  THEN
    grant usage on schema cron to postgres with grant option;

    alter default privileges in schema cron grant all on tables to postgres with grant option;
    alter default privileges in schema cron grant all on functions to postgres with grant option;
    alter default privileges in schema cron grant all on sequences to postgres with grant option;

    alter default privileges for user supabase_admin in schema cron grant all
        on sequences to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on tables to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on functions to postgres with grant option;

    grant all privileges on all tables in schema cron to postgres with grant option;
    revoke all on table cron.job from postgres;
    grant select on table cron.job to postgres with grant option;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_cron_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_cron_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_cron_access() IS 'Grants access to pg_cron';


--
-- Name: grant_pg_graphql_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_graphql_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
DECLARE
    func_is_graphql_resolve bool;
BEGIN
    func_is_graphql_resolve = (
        SELECT n.proname = 'resolve'
        FROM pg_event_trigger_ddl_commands() AS ev
        LEFT JOIN pg_catalog.pg_proc AS n
        ON ev.objid = n.oid
    );

    IF func_is_graphql_resolve
    THEN
        -- Update public wrapper to pass all arguments through to the pg_graphql resolve func
        DROP FUNCTION IF EXISTS graphql_public.graphql;
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language sql
        as $$
            select graphql.resolve(
                query := query,
                variables := coalesce(variables, '{}'),
                "operationName" := "operationName",
                extensions := extensions
            );
        $$;

        -- This hook executes when `graphql.resolve` is created. That is not necessarily the last
        -- function in the extension so we need to grant permissions on existing entities AND
        -- update default permissions to any others that are created after `graphql.resolve`
        grant usage on schema graphql to postgres, anon, authenticated, service_role;
        grant select on all tables in schema graphql to postgres, anon, authenticated, service_role;
        grant execute on all functions in schema graphql to postgres, anon, authenticated, service_role;
        grant all on all sequences in schema graphql to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on tables to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on functions to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on sequences to postgres, anon, authenticated, service_role;

        -- Allow postgres role to allow granting usage on graphql and graphql_public schemas to custom roles
        grant usage on schema graphql_public to postgres with grant option;
        grant usage on schema graphql to postgres with grant option;
    END IF;

END;
$_$;


ALTER FUNCTION extensions.grant_pg_graphql_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_graphql_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_graphql_access() IS 'Grants access to pg_graphql';


--
-- Name: grant_pg_net_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_net_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_net'
  )
  THEN
    IF NOT EXISTS (
      SELECT 1
      FROM pg_roles
      WHERE rolname = 'supabase_functions_admin'
    )
    THEN
      CREATE USER supabase_functions_admin NOINHERIT CREATEROLE LOGIN NOREPLICATION;
    END IF;

    GRANT USAGE ON SCHEMA net TO supabase_functions_admin, postgres, anon, authenticated, service_role;

    IF EXISTS (
      SELECT FROM pg_extension
      WHERE extname = 'pg_net'
      -- all versions in use on existing projects as of 2025-02-20
      -- version 0.12.0 onwards don't need these applied
      AND extversion IN ('0.2', '0.6', '0.7', '0.7.1', '0.8', '0.10.0', '0.11.0')
    ) THEN
      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;

      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;

      REVOKE ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
      REVOKE ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;

      GRANT EXECUTE ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
      GRANT EXECUTE ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
    END IF;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_net_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_net_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_net_access() IS 'Grants access to pg_net';


--
-- Name: pgrst_ddl_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_ddl_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  cmd record;
BEGIN
  FOR cmd IN SELECT * FROM pg_event_trigger_ddl_commands()
  LOOP
    IF cmd.command_tag IN (
      'CREATE SCHEMA', 'ALTER SCHEMA'
    , 'CREATE TABLE', 'CREATE TABLE AS', 'SELECT INTO', 'ALTER TABLE'
    , 'CREATE FOREIGN TABLE', 'ALTER FOREIGN TABLE'
    , 'CREATE VIEW', 'ALTER VIEW'
    , 'CREATE MATERIALIZED VIEW', 'ALTER MATERIALIZED VIEW'
    , 'CREATE FUNCTION', 'ALTER FUNCTION'
    , 'CREATE TRIGGER'
    , 'CREATE TYPE', 'ALTER TYPE'
    , 'CREATE RULE'
    , 'COMMENT'
    )
    -- don't notify in case of CREATE TEMP table or other objects created on pg_temp
    AND cmd.schema_name is distinct from 'pg_temp'
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_ddl_watch() OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_drop_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  obj record;
BEGIN
  FOR obj IN SELECT * FROM pg_event_trigger_dropped_objects()
  LOOP
    IF obj.object_type IN (
      'schema'
    , 'table'
    , 'foreign table'
    , 'view'
    , 'materialized view'
    , 'function'
    , 'trigger'
    , 'type'
    , 'rule'
    )
    AND obj.is_temporary IS false -- no pg_temp objects
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_drop_watch() OWNER TO supabase_admin;

--
-- Name: set_graphql_placeholder(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.set_graphql_placeholder() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
    DECLARE
    graphql_is_dropped bool;
    BEGIN
    graphql_is_dropped = (
        SELECT ev.schema_name = 'graphql_public'
        FROM pg_event_trigger_dropped_objects() AS ev
        WHERE ev.schema_name = 'graphql_public'
    );

    IF graphql_is_dropped
    THEN
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language plpgsql
        as $$
            DECLARE
                server_version float;
            BEGIN
                server_version = (SELECT (SPLIT_PART((select version()), ' ', 2))::float);

                IF server_version >= 14 THEN
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql extension is not enabled.'
                            )
                        )
                    );
                ELSE
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql is only available on projects running Postgres 14 onwards.'
                            )
                        )
                    );
                END IF;
            END;
        $$;
    END IF;

    END;
$_$;


ALTER FUNCTION extensions.set_graphql_placeholder() OWNER TO supabase_admin;

--
-- Name: FUNCTION set_graphql_placeholder(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.set_graphql_placeholder() IS 'Reintroduces placeholder function for graphql_public.graphql';


--
-- Name: get_auth(text); Type: FUNCTION; Schema: pgbouncer; Owner: supabase_admin
--

CREATE FUNCTION pgbouncer.get_auth(p_usename text) RETURNS TABLE(username text, password text)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO ''
    AS $_$
  BEGIN
      RAISE DEBUG 'PgBouncer auth request: %', p_usename;

      RETURN QUERY
      SELECT
          rolname::text,
          CASE WHEN rolvaliduntil < now()
              THEN null
              ELSE rolpassword::text
          END
      FROM pg_authid
      WHERE rolname=$1 and rolcanlogin;
  END;
  $_$;


ALTER FUNCTION pgbouncer.get_auth(p_usename text) OWNER TO supabase_admin;

--
-- Name: generate_loan_display_id(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.generate_loan_display_id() RETURNS trigger
    LANGUAGE plpgsql
    SET search_path TO 'public'
    AS $$
DECLARE v_mobile text; v_count integer;
BEGIN
  SELECT mobile INTO v_mobile FROM customers WHERE id = NEW.customer_id;
  SELECT COUNT(*) INTO v_count FROM loans WHERE customer_id = NEW.customer_id;
  NEW.loan_display_id := 'VVL' || v_mobile || LPAD(v_count::text, 4, '0');
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.generate_loan_display_id() OWNER TO postgres;

--
-- Name: get_agent_daily_stats(date); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_agent_daily_stats(p_date date DEFAULT CURRENT_DATE) RETURNS TABLE(agent_id uuid, agent_name text, total_collected numeric, total_pending numeric, customer_count bigint, paid_count bigint, not_paid_count bigint, promised_count bigint, total_target numeric)
    LANGUAGE sql STABLE SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
  SELECT ur.user_id, p.name,
    COALESCE(SUM(CASE WHEN pay.status='paid' AND pay.date=p_date THEN pay.amount ELSE 0 END),0),
    COALESCE(SUM(CASE WHEN pay.status='not_paid' AND pay.date=p_date THEN pay.amount ELSE 0 END),0),
    COUNT(DISTINCT c.id),
    COUNT(DISTINCT CASE WHEN pay.status='paid' AND pay.date=p_date THEN c.id END),
    COUNT(DISTINCT CASE WHEN pay.status='not_paid' AND pay.date=p_date THEN c.id END),
    COUNT(DISTINCT CASE WHEN pay.promised_date=p_date THEN c.id END),
    COALESCE(SUM(DISTINCT c.daily_amount),0)
  FROM public.user_roles ur
  JOIN public.profiles p ON p.user_id=ur.user_id AND p.is_deleted=FALSE
  LEFT JOIN public.customers c ON c.assigned_agent_id=ur.user_id AND c.is_deleted=FALSE AND c.status='active'
  LEFT JOIN public.payments pay ON pay.customer_id=c.id AND pay.is_deleted=FALSE
  WHERE ur.role IN ('agent','manager') AND ur.is_active=TRUE
    AND (has_role(auth.uid(),'admin'::app_role) OR (has_role(auth.uid(),'manager'::app_role) AND (ur.user_id=auth.uid() OR ur.user_id IN (SELECT pr.user_id FROM profiles pr WHERE pr.reporting_to=auth.uid() AND pr.is_deleted=FALSE))))
  GROUP BY ur.user_id, p.name
$$;


ALTER FUNCTION public.get_agent_daily_stats(p_date date) OWNER TO postgres;

--
-- Name: get_agent_stats_range(date, date); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_agent_stats_range(p_from date DEFAULT CURRENT_DATE, p_to date DEFAULT CURRENT_DATE) RETURNS TABLE(agent_id uuid, agent_name text, total_collected numeric, total_pending numeric, customer_count bigint, paid_count bigint, not_paid_count bigint, promised_count bigint, total_target numeric)
    LANGUAGE sql STABLE SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
  SELECT ur.user_id, p.name,
    COALESCE(SUM(CASE WHEN pay.status='paid' AND pay.date>=p_from AND pay.date<=p_to THEN pay.amount ELSE 0 END),0),
    COALESCE(SUM(CASE WHEN pay.status='not_paid' AND pay.date>=p_from AND pay.date<=p_to THEN pay.amount ELSE 0 END),0),
    COUNT(DISTINCT c.id),
    COUNT(DISTINCT CASE WHEN pay.status='paid' AND pay.date>=p_from AND pay.date<=p_to THEN c.id END),
    COUNT(DISTINCT CASE WHEN pay.status='not_paid' AND pay.date>=p_from AND pay.date<=p_to THEN c.id END),
    COUNT(DISTINCT CASE WHEN pay.promised_date>=p_from AND pay.promised_date<=p_to THEN c.id END),
    COALESCE(SUM(DISTINCT c.daily_amount),0)
  FROM public.user_roles ur
  JOIN public.profiles p ON p.user_id=ur.user_id AND p.is_deleted=FALSE
  LEFT JOIN public.customers c ON c.assigned_agent_id=ur.user_id AND c.is_deleted=FALSE AND c.status='active'
  LEFT JOIN public.payments pay ON pay.customer_id=c.id AND pay.is_deleted=FALSE
  WHERE ur.role IN ('agent','manager') AND ur.is_active=TRUE
    AND (has_role(auth.uid(),'admin'::app_role) OR (has_role(auth.uid(),'manager'::app_role) AND (ur.user_id=auth.uid() OR ur.user_id IN (SELECT pr.user_id FROM profiles pr WHERE pr.reporting_to=auth.uid() AND pr.is_deleted=FALSE))))
  GROUP BY ur.user_id, p.name
$$;


ALTER FUNCTION public.get_agent_stats_range(p_from date, p_to date) OWNER TO postgres;

--
-- Name: get_user_role(uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_user_role(_user_id uuid) RETURNS public.app_role
    LANGUAGE sql STABLE SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
  SELECT role FROM public.user_roles WHERE user_id = _user_id AND is_active = true LIMIT 1
$$;


ALTER FUNCTION public.get_user_role(_user_id uuid) OWNER TO postgres;

--
-- Name: handle_new_user(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.handle_new_user() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
BEGIN
  INSERT INTO public.profiles (user_id, name, mobile)
  VALUES (NEW.id, COALESCE(NEW.raw_user_meta_data->>'name', 'User'), COALESCE(NEW.raw_user_meta_data->>'mobile', NEW.phone, ''));
  INSERT INTO public.user_roles (user_id, role) VALUES (NEW.id, 'agent'::app_role);
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.handle_new_user() OWNER TO postgres;

--
-- Name: has_role(uuid, public.app_role); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.has_role(_user_id uuid, _role public.app_role) RETURNS boolean
    LANGUAGE sql STABLE SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
  SELECT EXISTS (SELECT 1 FROM public.user_roles WHERE user_id = _user_id AND role = _role AND is_active = true)
$$;


ALTER FUNCTION public.has_role(_user_id uuid, _role public.app_role) OWNER TO postgres;

--
-- Name: log_audit(text, text, uuid, jsonb, jsonb); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.log_audit(p_action text, p_table_name text, p_record_id uuid, p_old_data jsonb DEFAULT NULL::jsonb, p_new_data jsonb DEFAULT NULL::jsonb) RETURNS uuid
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
DECLARE v_log_id UUID;
BEGIN
  INSERT INTO public.audit_logs (user_id, action, table_name, record_id, old_data, new_data)
  VALUES (auth.uid(), p_action, p_table_name, p_record_id, p_old_data, p_new_data) RETURNING id INTO v_log_id;
  RETURN v_log_id;
END;
$$;


ALTER FUNCTION public.log_audit(p_action text, p_table_name text, p_record_id uuid, p_old_data jsonb, p_new_data jsonb) OWNER TO postgres;

--
-- Name: restore_record(text, uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.restore_record(p_table_name text, p_record_id uuid) RETURNS boolean
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $_$
BEGIN
  IF NOT has_role(auth.uid(), 'admin'::app_role) THEN RAISE EXCEPTION 'Only admins can restore deleted records'; END IF;
  EXECUTE format('UPDATE public.%I SET is_deleted = FALSE, deleted_at = NULL, deleted_by = NULL WHERE id = $1', p_table_name) USING p_record_id;
  PERFORM public.log_audit('RESTORE', p_table_name, p_record_id, NULL, jsonb_build_object('restored_by', auth.uid()));
  RETURN TRUE;
END;
$_$;


ALTER FUNCTION public.restore_record(p_table_name text, p_record_id uuid) OWNER TO postgres;

--
-- Name: rls_auto_enable(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.rls_auto_enable() RETURNS event_trigger
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'pg_catalog'
    AS $$
DECLARE
  cmd record;
BEGIN
  FOR cmd IN
    SELECT *
    FROM pg_event_trigger_ddl_commands()
    WHERE command_tag IN ('CREATE TABLE', 'CREATE TABLE AS', 'SELECT INTO')
      AND object_type IN ('table','partitioned table')
  LOOP
     IF cmd.schema_name IS NOT NULL AND cmd.schema_name IN ('public') AND cmd.schema_name NOT IN ('pg_catalog','information_schema') AND cmd.schema_name NOT LIKE 'pg_toast%' AND cmd.schema_name NOT LIKE 'pg_temp%' THEN
      BEGIN
        EXECUTE format('alter table if exists %s enable row level security', cmd.object_identity);
        RAISE LOG 'rls_auto_enable: enabled RLS on %', cmd.object_identity;
      EXCEPTION
        WHEN OTHERS THEN
          RAISE LOG 'rls_auto_enable: failed to enable RLS on %', cmd.object_identity;
      END;
     ELSE
        RAISE LOG 'rls_auto_enable: skip % (either system schema or not in enforced list: %.)', cmd.object_identity, cmd.schema_name;
     END IF;
  END LOOP;
END;
$$;


ALTER FUNCTION public.rls_auto_enable() OWNER TO postgres;

--
-- Name: soft_delete(text, uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.soft_delete(p_table_name text, p_record_id uuid) RETURNS boolean
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $_$
BEGIN
  EXECUTE format('UPDATE public.%I SET is_deleted = TRUE, deleted_at = now(), deleted_by = $1 WHERE id = $2', p_table_name) USING auth.uid(), p_record_id;
  PERFORM public.log_audit('SOFT_DELETE', p_table_name, p_record_id, NULL, jsonb_build_object('deleted_by', auth.uid()));
  RETURN TRUE;
END;
$_$;


ALTER FUNCTION public.soft_delete(p_table_name text, p_record_id uuid) OWNER TO postgres;

--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    SET search_path TO 'public'
    AS $$
BEGIN NEW.updated_at = now(); RETURN NEW; END;
$$;


ALTER FUNCTION public.update_updated_at_column() OWNER TO postgres;

--
-- Name: apply_rls(jsonb, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer DEFAULT (1024 * 1024)) RETURNS SETOF realtime.wal_rls
    LANGUAGE plpgsql
    AS $$
declare
-- Regclass of the table e.g. public.notes
entity_ regclass = (quote_ident(wal ->> 'schema') || '.' || quote_ident(wal ->> 'table'))::regclass;

-- I, U, D, T: insert, update ...
action realtime.action = (
    case wal ->> 'action'
        when 'I' then 'INSERT'
        when 'U' then 'UPDATE'
        when 'D' then 'DELETE'
        else 'ERROR'
    end
);

-- Is row level security enabled for the table
is_rls_enabled bool = relrowsecurity from pg_class where oid = entity_;

subscriptions realtime.subscription[] = array_agg(subs)
    from
        realtime.subscription subs
    where
        subs.entity = entity_
        -- Filter by action early - only get subscriptions interested in this action
        -- action_filter column can be: '*' (all), 'INSERT', 'UPDATE', or 'DELETE'
        and (subs.action_filter = '*' or subs.action_filter = action::text);

-- Subscription vars
roles regrole[] = array_agg(distinct us.claims_role::text)
    from
        unnest(subscriptions) us;

working_role regrole;
claimed_role regrole;
claims jsonb;

subscription_id uuid;
subscription_has_access bool;
visible_to_subscription_ids uuid[] = '{}';

-- structured info for wal's columns
columns realtime.wal_column[];
-- previous identity values for update/delete
old_columns realtime.wal_column[];

error_record_exceeds_max_size boolean = octet_length(wal::text) > max_record_bytes;

-- Primary jsonb output for record
output jsonb;

begin
perform set_config('role', null, true);

columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'columns') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

old_columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'identity') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

for working_role in select * from unnest(roles) loop

    -- Update `is_selectable` for columns and old_columns
    columns =
        array_agg(
            (
                c.name,
                c.type_name,
                c.type_oid,
                c.value,
                c.is_pkey,
                pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
            )::realtime.wal_column
        )
        from
            unnest(columns) c;

    old_columns =
            array_agg(
                (
                    c.name,
                    c.type_name,
                    c.type_oid,
                    c.value,
                    c.is_pkey,
                    pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
                )::realtime.wal_column
            )
            from
                unnest(old_columns) c;

    if action <> 'DELETE' and count(1) = 0 from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            -- subscriptions is already filtered by entity
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 400: Bad Request, no primary key']
        )::realtime.wal_rls;

    -- The claims role does not have SELECT permission to the primary key of entity
    elsif action <> 'DELETE' and sum(c.is_selectable::int) <> count(1) from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 401: Unauthorized']
        )::realtime.wal_rls;

    else
        output = jsonb_build_object(
            'schema', wal ->> 'schema',
            'table', wal ->> 'table',
            'type', action,
            'commit_timestamp', to_char(
                ((wal ->> 'timestamp')::timestamptz at time zone 'utc'),
                'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"'
            ),
            'columns', (
                select
                    jsonb_agg(
                        jsonb_build_object(
                            'name', pa.attname,
                            'type', pt.typname
                        )
                        order by pa.attnum asc
                    )
                from
                    pg_attribute pa
                    join pg_type pt
                        on pa.atttypid = pt.oid
                where
                    attrelid = entity_
                    and attnum > 0
                    and pg_catalog.has_column_privilege(working_role, entity_, pa.attname, 'SELECT')
            )
        )
        -- Add "record" key for insert and update
        || case
            when action in ('INSERT', 'UPDATE') then
                jsonb_build_object(
                    'record',
                    (
                        select
                            jsonb_object_agg(
                                -- if unchanged toast, get column name and value from old record
                                coalesce((c).name, (oc).name),
                                case
                                    when (c).name is null then (oc).value
                                    else (c).value
                                end
                            )
                        from
                            unnest(columns) c
                            full outer join unnest(old_columns) oc
                                on (c).name = (oc).name
                        where
                            coalesce((c).is_selectable, (oc).is_selectable)
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                    )
                )
            else '{}'::jsonb
        end
        -- Add "old_record" key for update and delete
        || case
            when action = 'UPDATE' then
                jsonb_build_object(
                        'old_record',
                        (
                            select jsonb_object_agg((c).name, (c).value)
                            from unnest(old_columns) c
                            where
                                (c).is_selectable
                                and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                        )
                    )
            when action = 'DELETE' then
                jsonb_build_object(
                    'old_record',
                    (
                        select jsonb_object_agg((c).name, (c).value)
                        from unnest(old_columns) c
                        where
                            (c).is_selectable
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                            and ( not is_rls_enabled or (c).is_pkey ) -- if RLS enabled, we can't secure deletes so filter to pkey
                    )
                )
            else '{}'::jsonb
        end;

        -- Create the prepared statement
        if is_rls_enabled and action <> 'DELETE' then
            if (select 1 from pg_prepared_statements where name = 'walrus_rls_stmt' limit 1) > 0 then
                deallocate walrus_rls_stmt;
            end if;
            execute realtime.build_prepared_statement_sql('walrus_rls_stmt', entity_, columns);
        end if;

        visible_to_subscription_ids = '{}';

        for subscription_id, claims in (
                select
                    subs.subscription_id,
                    subs.claims
                from
                    unnest(subscriptions) subs
                where
                    subs.entity = entity_
                    and subs.claims_role = working_role
                    and (
                        realtime.is_visible_through_filters(columns, subs.filters)
                        or (
                          action = 'DELETE'
                          and realtime.is_visible_through_filters(old_columns, subs.filters)
                        )
                    )
        ) loop

            if not is_rls_enabled or action = 'DELETE' then
                visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
            else
                -- Check if RLS allows the role to see the record
                perform
                    -- Trim leading and trailing quotes from working_role because set_config
                    -- doesn't recognize the role as valid if they are included
                    set_config('role', trim(both '"' from working_role::text), true),
                    set_config('request.jwt.claims', claims::text, true);

                execute 'execute walrus_rls_stmt' into subscription_has_access;

                if subscription_has_access then
                    visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
                end if;
            end if;
        end loop;

        perform set_config('role', null, true);

        return next (
            output,
            is_rls_enabled,
            visible_to_subscription_ids,
            case
                when error_record_exceeds_max_size then array['Error 413: Payload Too Large']
                else '{}'
            end
        )::realtime.wal_rls;

    end if;
end loop;

perform set_config('role', null, true);
end;
$$;


ALTER FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: broadcast_changes(text, text, text, text, text, record, record, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text DEFAULT 'ROW'::text) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    -- Declare a variable to hold the JSONB representation of the row
    row_data jsonb := '{}'::jsonb;
BEGIN
    IF level = 'STATEMENT' THEN
        RAISE EXCEPTION 'function can only be triggered for each row, not for each statement';
    END IF;
    -- Check the operation type and handle accordingly
    IF operation = 'INSERT' OR operation = 'UPDATE' OR operation = 'DELETE' THEN
        row_data := jsonb_build_object('old_record', OLD, 'record', NEW, 'operation', operation, 'table', table_name, 'schema', table_schema);
        PERFORM realtime.send (row_data, event_name, topic_name);
    ELSE
        RAISE EXCEPTION 'Unexpected operation type: %', operation;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'Failed to process the row: %', SQLERRM;
END;

$$;


ALTER FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) OWNER TO supabase_admin;

--
-- Name: build_prepared_statement_sql(text, regclass, realtime.wal_column[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) RETURNS text
    LANGUAGE sql
    AS $$
      /*
      Builds a sql string that, if executed, creates a prepared statement to
      tests retrive a row from *entity* by its primary key columns.
      Example
          select realtime.build_prepared_statement_sql('public.notes', '{"id"}'::text[], '{"bigint"}'::text[])
      */
          select
      'prepare ' || prepared_statement_name || ' as
          select
              exists(
                  select
                      1
                  from
                      ' || entity || '
                  where
                      ' || string_agg(quote_ident(pkc.name) || '=' || quote_nullable(pkc.value #>> '{}') , ' and ') || '
              )'
          from
              unnest(columns) pkc
          where
              pkc.is_pkey
          group by
              entity
      $$;


ALTER FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) OWNER TO supabase_admin;

--
-- Name: cast(text, regtype); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime."cast"(val text, type_ regtype) RETURNS jsonb
    LANGUAGE plpgsql IMMUTABLE
    AS $$
declare
  res jsonb;
begin
  if type_::text = 'bytea' then
    return to_jsonb(val);
  end if;
  execute format('select to_jsonb(%L::'|| type_::text || ')', val) into res;
  return res;
end
$$;


ALTER FUNCTION realtime."cast"(val text, type_ regtype) OWNER TO supabase_admin;

--
-- Name: check_equality_op(realtime.equality_op, regtype, text, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) RETURNS boolean
    LANGUAGE plpgsql IMMUTABLE
    AS $$
      /*
      Casts *val_1* and *val_2* as type *type_* and check the *op* condition for truthiness
      */
      declare
          op_symbol text = (
              case
                  when op = 'eq' then '='
                  when op = 'neq' then '!='
                  when op = 'lt' then '<'
                  when op = 'lte' then '<='
                  when op = 'gt' then '>'
                  when op = 'gte' then '>='
                  when op = 'in' then '= any'
                  else 'UNKNOWN OP'
              end
          );
          res boolean;
      begin
          execute format(
              'select %L::'|| type_::text || ' ' || op_symbol
              || ' ( %L::'
              || (
                  case
                      when op = 'in' then type_::text || '[]'
                      else type_::text end
              )
              || ')', val_1, val_2) into res;
          return res;
      end;
      $$;


ALTER FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) OWNER TO supabase_admin;

--
-- Name: is_visible_through_filters(realtime.wal_column[], realtime.user_defined_filter[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$
    /*
    Should the record be visible (true) or filtered out (false) after *filters* are applied
    */
        select
            -- Default to allowed when no filters present
            $2 is null -- no filters. this should not happen because subscriptions has a default
            or array_length($2, 1) is null -- array length of an empty array is null
            or bool_and(
                coalesce(
                    realtime.check_equality_op(
                        op:=f.op,
                        type_:=coalesce(
                            col.type_oid::regtype, -- null when wal2json version <= 2.4
                            col.type_name::regtype
                        ),
                        -- cast jsonb to text
                        val_1:=col.value #>> '{}',
                        val_2:=f.value
                    ),
                    false -- if null, filter does not match
                )
            )
        from
            unnest(filters) f
            join unnest(columns) col
                on f.column_name = col.name;
    $_$;


ALTER FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) OWNER TO supabase_admin;

--
-- Name: list_changes(name, name, integer, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) RETURNS SETOF realtime.wal_rls
    LANGUAGE sql
    SET log_min_messages TO 'fatal'
    AS $$
      with pub as (
        select
          concat_ws(
            ',',
            case when bool_or(pubinsert) then 'insert' else null end,
            case when bool_or(pubupdate) then 'update' else null end,
            case when bool_or(pubdelete) then 'delete' else null end
          ) as w2j_actions,
          coalesce(
            string_agg(
              realtime.quote_wal2json(format('%I.%I', schemaname, tablename)::regclass),
              ','
            ) filter (where ppt.tablename is not null and ppt.tablename not like '% %'),
            ''
          ) w2j_add_tables
        from
          pg_publication pp
          left join pg_publication_tables ppt
            on pp.pubname = ppt.pubname
        where
          pp.pubname = publication
        group by
          pp.pubname
        limit 1
      ),
      w2j as (
        select
          x.*, pub.w2j_add_tables
        from
          pub,
          pg_logical_slot_get_changes(
            slot_name, null, max_changes,
            'include-pk', 'true',
            'include-transaction', 'false',
            'include-timestamp', 'true',
            'include-type-oids', 'true',
            'format-version', '2',
            'actions', pub.w2j_actions,
            'add-tables', pub.w2j_add_tables
          ) x
      )
      select
        xyz.wal,
        xyz.is_rls_enabled,
        xyz.subscription_ids,
        xyz.errors
      from
        w2j,
        realtime.apply_rls(
          wal := w2j.data::jsonb,
          max_record_bytes := max_record_bytes
        ) xyz(wal, is_rls_enabled, subscription_ids, errors)
      where
        w2j.w2j_add_tables <> ''
        and xyz.subscription_ids[1] is not null
    $$;


ALTER FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: quote_wal2json(regclass); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.quote_wal2json(entity regclass) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
      select
        (
          select string_agg('' || ch,'')
          from unnest(string_to_array(nsp.nspname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
        )
        || '.'
        || (
          select string_agg('' || ch,'')
          from unnest(string_to_array(pc.relname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
          )
      from
        pg_class pc
        join pg_namespace nsp
          on pc.relnamespace = nsp.oid
      where
        pc.oid = entity
    $$;


ALTER FUNCTION realtime.quote_wal2json(entity regclass) OWNER TO supabase_admin;

--
-- Name: send(jsonb, text, text, boolean); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  generated_id uuid;
  final_payload jsonb;
BEGIN
  BEGIN
    -- Generate a new UUID for the id
    generated_id := gen_random_uuid();

    -- Check if payload has an 'id' key, if not, add the generated UUID
    IF payload ? 'id' THEN
      final_payload := payload;
    ELSE
      final_payload := jsonb_set(payload, '{id}', to_jsonb(generated_id));
    END IF;

    -- Set the topic configuration
    EXECUTE format('SET LOCAL realtime.topic TO %L', topic);

    -- Attempt to insert the message
    INSERT INTO realtime.messages (id, payload, event, topic, private, extension)
    VALUES (generated_id, final_payload, event, topic, private, 'broadcast');
  EXCEPTION
    WHEN OTHERS THEN
      -- Capture and notify the error
      RAISE WARNING 'ErrorSendingBroadcastMessage: %', SQLERRM;
  END;
END;
$$;


ALTER FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) OWNER TO supabase_admin;

--
-- Name: subscription_check_filters(); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.subscription_check_filters() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    /*
    Validates that the user defined filters for a subscription:
    - refer to valid columns that the claimed role may access
    - values are coercable to the correct column type
    */
    declare
        col_names text[] = coalesce(
                array_agg(c.column_name order by c.ordinal_position),
                '{}'::text[]
            )
            from
                information_schema.columns c
            where
                format('%I.%I', c.table_schema, c.table_name)::regclass = new.entity
                and pg_catalog.has_column_privilege(
                    (new.claims ->> 'role'),
                    format('%I.%I', c.table_schema, c.table_name)::regclass,
                    c.column_name,
                    'SELECT'
                );
        filter realtime.user_defined_filter;
        col_type regtype;

        in_val jsonb;
    begin
        for filter in select * from unnest(new.filters) loop
            -- Filtered column is valid
            if not filter.column_name = any(col_names) then
                raise exception 'invalid column for filter %', filter.column_name;
            end if;

            -- Type is sanitized and safe for string interpolation
            col_type = (
                select atttypid::regtype
                from pg_catalog.pg_attribute
                where attrelid = new.entity
                      and attname = filter.column_name
            );
            if col_type is null then
                raise exception 'failed to lookup type for column %', filter.column_name;
            end if;

            -- Set maximum number of entries for in filter
            if filter.op = 'in'::realtime.equality_op then
                in_val = realtime.cast(filter.value, (col_type::text || '[]')::regtype);
                if coalesce(jsonb_array_length(in_val), 0) > 100 then
                    raise exception 'too many values for `in` filter. Maximum 100';
                end if;
            else
                -- raises an exception if value is not coercable to type
                perform realtime.cast(filter.value, col_type);
            end if;

        end loop;

        -- Apply consistent order to filters so the unique constraint on
        -- (subscription_id, entity, filters) can't be tricked by a different filter order
        new.filters = coalesce(
            array_agg(f order by f.column_name, f.op, f.value),
            '{}'
        ) from unnest(new.filters) f;

        return new;
    end;
    $$;


ALTER FUNCTION realtime.subscription_check_filters() OWNER TO supabase_admin;

--
-- Name: to_regrole(text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.to_regrole(role_name text) RETURNS regrole
    LANGUAGE sql IMMUTABLE
    AS $$ select role_name::regrole $$;


ALTER FUNCTION realtime.to_regrole(role_name text) OWNER TO supabase_admin;

--
-- Name: topic(); Type: FUNCTION; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE FUNCTION realtime.topic() RETURNS text
    LANGUAGE sql STABLE
    AS $$
select nullif(current_setting('realtime.topic', true), '')::text;
$$;


ALTER FUNCTION realtime.topic() OWNER TO supabase_realtime_admin;

--
-- Name: can_insert_object(text, text, uuid, jsonb); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO "storage"."objects" ("bucket_id", "name", "owner", "metadata") VALUES (bucketid, name, owner, metadata);
  -- hack to rollback the successful insert
  RAISE sqlstate 'PT200' using
  message = 'ROLLBACK',
  detail = 'rollback successful insert';
END
$$;


ALTER FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) OWNER TO supabase_storage_admin;

--
-- Name: enforce_bucket_name_length(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.enforce_bucket_name_length() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
    if length(new.name) > 100 then
        raise exception 'bucket name "%" is too long (% characters). Max is 100.', new.name, length(new.name);
    end if;
    return new;
end;
$$;


ALTER FUNCTION storage.enforce_bucket_name_length() OWNER TO supabase_storage_admin;

--
-- Name: extension(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.extension(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
_filename text;
BEGIN
	select string_to_array(name, '/') into _parts;
	select _parts[array_length(_parts,1)] into _filename;
	-- @todo return the last part instead of 2
	return reverse(split_part(reverse(_filename), '.', 1));
END
$$;


ALTER FUNCTION storage.extension(name text) OWNER TO supabase_storage_admin;

--
-- Name: filename(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.filename(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[array_length(_parts,1)];
END
$$;


ALTER FUNCTION storage.filename(name text) OWNER TO supabase_storage_admin;

--
-- Name: foldername(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.foldername(name text) RETURNS text[]
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[1:array_length(_parts,1)-1];
END
$$;


ALTER FUNCTION storage.foldername(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_common_prefix(text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_common_prefix(p_key text, p_prefix text, p_delimiter text) RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $$
SELECT CASE
    WHEN position(p_delimiter IN substring(p_key FROM length(p_prefix) + 1)) > 0
    THEN left(p_key, length(p_prefix) + position(p_delimiter IN substring(p_key FROM length(p_prefix) + 1)))
    ELSE NULL
END;
$$;


ALTER FUNCTION storage.get_common_prefix(p_key text, p_prefix text, p_delimiter text) OWNER TO supabase_storage_admin;

--
-- Name: get_size_by_bucket(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_size_by_bucket() RETURNS TABLE(size bigint, bucket_id text)
    LANGUAGE plpgsql
    AS $$
BEGIN
    return query
        select sum((metadata->>'size')::int) as size, obj.bucket_id
        from "storage".objects as obj
        group by obj.bucket_id;
END
$$;


ALTER FUNCTION storage.get_size_by_bucket() OWNER TO supabase_storage_admin;

--
-- Name: list_multipart_uploads_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, next_key_token text DEFAULT ''::text, next_upload_token text DEFAULT ''::text) RETURNS TABLE(key text, id text, created_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(key COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                        substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1)))
                    ELSE
                        key
                END AS key, id, created_at
            FROM
                storage.s3_multipart_uploads
            WHERE
                bucket_id = $5 AND
                key ILIKE $1 || ''%'' AND
                CASE
                    WHEN $4 != '''' AND $6 = '''' THEN
                        CASE
                            WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                                substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                key COLLATE "C" > $4
                            END
                    ELSE
                        true
                END AND
                CASE
                    WHEN $6 != '''' THEN
                        id COLLATE "C" > $6
                    ELSE
                        true
                    END
            ORDER BY
                key COLLATE "C" ASC, created_at ASC) as e order by key COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_key_token, bucket_id, next_upload_token;
END;
$_$;


ALTER FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, next_key_token text, next_upload_token text) OWNER TO supabase_storage_admin;

--
-- Name: list_objects_with_delimiter(text, text, text, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_objects_with_delimiter(_bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, start_after text DEFAULT ''::text, next_token text DEFAULT ''::text, sort_order text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, metadata jsonb, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone)
    LANGUAGE plpgsql STABLE
    AS $_$
DECLARE
    v_peek_name TEXT;
    v_current RECORD;
    v_common_prefix TEXT;

    -- Configuration
    v_is_asc BOOLEAN;
    v_prefix TEXT;
    v_start TEXT;
    v_upper_bound TEXT;
    v_file_batch_size INT;

    -- Seek state
    v_next_seek TEXT;
    v_count INT := 0;

    -- Dynamic SQL for batch query only
    v_batch_query TEXT;

BEGIN
    -- ========================================================================
    -- INITIALIZATION
    -- ========================================================================
    v_is_asc := lower(coalesce(sort_order, 'asc')) = 'asc';
    v_prefix := coalesce(prefix_param, '');
    v_start := CASE WHEN coalesce(next_token, '') <> '' THEN next_token ELSE coalesce(start_after, '') END;
    v_file_batch_size := LEAST(GREATEST(max_keys * 2, 100), 1000);

    -- Calculate upper bound for prefix filtering (bytewise, using COLLATE "C")
    IF v_prefix = '' THEN
        v_upper_bound := NULL;
    ELSIF right(v_prefix, 1) = delimiter_param THEN
        v_upper_bound := left(v_prefix, -1) || chr(ascii(delimiter_param) + 1);
    ELSE
        v_upper_bound := left(v_prefix, -1) || chr(ascii(right(v_prefix, 1)) + 1);
    END IF;

    -- Build batch query (dynamic SQL - called infrequently, amortized over many rows)
    IF v_is_asc THEN
        IF v_upper_bound IS NOT NULL THEN
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND o.name COLLATE "C" >= $2 ' ||
                'AND o.name COLLATE "C" < $3 ORDER BY o.name COLLATE "C" ASC LIMIT $4';
        ELSE
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND o.name COLLATE "C" >= $2 ' ||
                'ORDER BY o.name COLLATE "C" ASC LIMIT $4';
        END IF;
    ELSE
        IF v_upper_bound IS NOT NULL THEN
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND o.name COLLATE "C" < $2 ' ||
                'AND o.name COLLATE "C" >= $3 ORDER BY o.name COLLATE "C" DESC LIMIT $4';
        ELSE
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND o.name COLLATE "C" < $2 ' ||
                'ORDER BY o.name COLLATE "C" DESC LIMIT $4';
        END IF;
    END IF;

    -- ========================================================================
    -- SEEK INITIALIZATION: Determine starting position
    -- ========================================================================
    IF v_start = '' THEN
        IF v_is_asc THEN
            v_next_seek := v_prefix;
        ELSE
            -- DESC without cursor: find the last item in range
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_next_seek FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" >= v_prefix AND o.name COLLATE "C" < v_upper_bound
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            ELSIF v_prefix <> '' THEN
                SELECT o.name INTO v_next_seek FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" >= v_prefix
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            ELSE
                SELECT o.name INTO v_next_seek FROM storage.objects o
                WHERE o.bucket_id = _bucket_id
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            END IF;

            IF v_next_seek IS NOT NULL THEN
                v_next_seek := v_next_seek || delimiter_param;
            ELSE
                RETURN;
            END IF;
        END IF;
    ELSE
        -- Cursor provided: determine if it refers to a folder or leaf
        IF EXISTS (
            SELECT 1 FROM storage.objects o
            WHERE o.bucket_id = _bucket_id
              AND o.name COLLATE "C" LIKE v_start || delimiter_param || '%'
            LIMIT 1
        ) THEN
            -- Cursor refers to a folder
            IF v_is_asc THEN
                v_next_seek := v_start || chr(ascii(delimiter_param) + 1);
            ELSE
                v_next_seek := v_start || delimiter_param;
            END IF;
        ELSE
            -- Cursor refers to a leaf object
            IF v_is_asc THEN
                v_next_seek := v_start || delimiter_param;
            ELSE
                v_next_seek := v_start;
            END IF;
        END IF;
    END IF;

    -- ========================================================================
    -- MAIN LOOP: Hybrid peek-then-batch algorithm
    -- Uses STATIC SQL for peek (hot path) and DYNAMIC SQL for batch
    -- ========================================================================
    LOOP
        EXIT WHEN v_count >= max_keys;

        -- STEP 1: PEEK using STATIC SQL (plan cached, very fast)
        IF v_is_asc THEN
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" >= v_next_seek AND o.name COLLATE "C" < v_upper_bound
                ORDER BY o.name COLLATE "C" ASC LIMIT 1;
            ELSE
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" >= v_next_seek
                ORDER BY o.name COLLATE "C" ASC LIMIT 1;
            END IF;
        ELSE
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" < v_next_seek AND o.name COLLATE "C" >= v_prefix
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            ELSIF v_prefix <> '' THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" < v_next_seek AND o.name COLLATE "C" >= v_prefix
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            ELSE
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" < v_next_seek
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            END IF;
        END IF;

        EXIT WHEN v_peek_name IS NULL;

        -- STEP 2: Check if this is a FOLDER or FILE
        v_common_prefix := storage.get_common_prefix(v_peek_name, v_prefix, delimiter_param);

        IF v_common_prefix IS NOT NULL THEN
            -- FOLDER: Emit and skip to next folder (no heap access needed)
            name := rtrim(v_common_prefix, delimiter_param);
            id := NULL;
            updated_at := NULL;
            created_at := NULL;
            last_accessed_at := NULL;
            metadata := NULL;
            RETURN NEXT;
            v_count := v_count + 1;

            -- Advance seek past the folder range
            IF v_is_asc THEN
                v_next_seek := left(v_common_prefix, -1) || chr(ascii(delimiter_param) + 1);
            ELSE
                v_next_seek := v_common_prefix;
            END IF;
        ELSE
            -- FILE: Batch fetch using DYNAMIC SQL (overhead amortized over many rows)
            -- For ASC: upper_bound is the exclusive upper limit (< condition)
            -- For DESC: prefix is the inclusive lower limit (>= condition)
            FOR v_current IN EXECUTE v_batch_query USING _bucket_id, v_next_seek,
                CASE WHEN v_is_asc THEN COALESCE(v_upper_bound, v_prefix) ELSE v_prefix END, v_file_batch_size
            LOOP
                v_common_prefix := storage.get_common_prefix(v_current.name, v_prefix, delimiter_param);

                IF v_common_prefix IS NOT NULL THEN
                    -- Hit a folder: exit batch, let peek handle it
                    v_next_seek := v_current.name;
                    EXIT;
                END IF;

                -- Emit file
                name := v_current.name;
                id := v_current.id;
                updated_at := v_current.updated_at;
                created_at := v_current.created_at;
                last_accessed_at := v_current.last_accessed_at;
                metadata := v_current.metadata;
                RETURN NEXT;
                v_count := v_count + 1;

                -- Advance seek past this file
                IF v_is_asc THEN
                    v_next_seek := v_current.name || delimiter_param;
                ELSE
                    v_next_seek := v_current.name;
                END IF;

                EXIT WHEN v_count >= max_keys;
            END LOOP;
        END IF;
    END LOOP;
END;
$_$;


ALTER FUNCTION storage.list_objects_with_delimiter(_bucket_id text, prefix_param text, delimiter_param text, max_keys integer, start_after text, next_token text, sort_order text) OWNER TO supabase_storage_admin;

--
-- Name: operation(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.operation() RETURNS text
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    RETURN current_setting('storage.operation', true);
END;
$$;


ALTER FUNCTION storage.operation() OWNER TO supabase_storage_admin;

--
-- Name: protect_delete(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.protect_delete() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    -- Check if storage.allow_delete_query is set to 'true'
    IF COALESCE(current_setting('storage.allow_delete_query', true), 'false') != 'true' THEN
        RAISE EXCEPTION 'Direct deletion from storage tables is not allowed. Use the Storage API instead.'
            USING HINT = 'This prevents accidental data loss from orphaned objects.',
                  ERRCODE = '42501';
    END IF;
    RETURN NULL;
END;
$$;


ALTER FUNCTION storage.protect_delete() OWNER TO supabase_storage_admin;

--
-- Name: search(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
DECLARE
    v_peek_name TEXT;
    v_current RECORD;
    v_common_prefix TEXT;
    v_delimiter CONSTANT TEXT := '/';

    -- Configuration
    v_limit INT;
    v_prefix TEXT;
    v_prefix_lower TEXT;
    v_is_asc BOOLEAN;
    v_order_by TEXT;
    v_sort_order TEXT;
    v_upper_bound TEXT;
    v_file_batch_size INT;

    -- Dynamic SQL for batch query only
    v_batch_query TEXT;

    -- Seek state
    v_next_seek TEXT;
    v_count INT := 0;
    v_skipped INT := 0;
BEGIN
    -- ========================================================================
    -- INITIALIZATION
    -- ========================================================================
    v_limit := LEAST(coalesce(limits, 100), 1500);
    v_prefix := coalesce(prefix, '') || coalesce(search, '');
    v_prefix_lower := lower(v_prefix);
    v_is_asc := lower(coalesce(sortorder, 'asc')) = 'asc';
    v_file_batch_size := LEAST(GREATEST(v_limit * 2, 100), 1000);

    -- Validate sort column
    CASE lower(coalesce(sortcolumn, 'name'))
        WHEN 'name' THEN v_order_by := 'name';
        WHEN 'updated_at' THEN v_order_by := 'updated_at';
        WHEN 'created_at' THEN v_order_by := 'created_at';
        WHEN 'last_accessed_at' THEN v_order_by := 'last_accessed_at';
        ELSE v_order_by := 'name';
    END CASE;

    v_sort_order := CASE WHEN v_is_asc THEN 'asc' ELSE 'desc' END;

    -- ========================================================================
    -- NON-NAME SORTING: Use path_tokens approach (unchanged)
    -- ========================================================================
    IF v_order_by != 'name' THEN
        RETURN QUERY EXECUTE format(
            $sql$
            WITH folders AS (
                SELECT path_tokens[$1] AS folder
                FROM storage.objects
                WHERE objects.name ILIKE $2 || '%%'
                  AND bucket_id = $3
                  AND array_length(objects.path_tokens, 1) <> $1
                GROUP BY folder
                ORDER BY folder %s
            )
            (SELECT folder AS "name",
                   NULL::uuid AS id,
                   NULL::timestamptz AS updated_at,
                   NULL::timestamptz AS created_at,
                   NULL::timestamptz AS last_accessed_at,
                   NULL::jsonb AS metadata FROM folders)
            UNION ALL
            (SELECT path_tokens[$1] AS "name",
                   id, updated_at, created_at, last_accessed_at, metadata
             FROM storage.objects
             WHERE objects.name ILIKE $2 || '%%'
               AND bucket_id = $3
               AND array_length(objects.path_tokens, 1) = $1
             ORDER BY %I %s)
            LIMIT $4 OFFSET $5
            $sql$, v_sort_order, v_order_by, v_sort_order
        ) USING levels, v_prefix, bucketname, v_limit, offsets;
        RETURN;
    END IF;

    -- ========================================================================
    -- NAME SORTING: Hybrid skip-scan with batch optimization
    -- ========================================================================

    -- Calculate upper bound for prefix filtering
    IF v_prefix_lower = '' THEN
        v_upper_bound := NULL;
    ELSIF right(v_prefix_lower, 1) = v_delimiter THEN
        v_upper_bound := left(v_prefix_lower, -1) || chr(ascii(v_delimiter) + 1);
    ELSE
        v_upper_bound := left(v_prefix_lower, -1) || chr(ascii(right(v_prefix_lower, 1)) + 1);
    END IF;

    -- Build batch query (dynamic SQL - called infrequently, amortized over many rows)
    IF v_is_asc THEN
        IF v_upper_bound IS NOT NULL THEN
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND lower(o.name) COLLATE "C" >= $2 ' ||
                'AND lower(o.name) COLLATE "C" < $3 ORDER BY lower(o.name) COLLATE "C" ASC LIMIT $4';
        ELSE
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND lower(o.name) COLLATE "C" >= $2 ' ||
                'ORDER BY lower(o.name) COLLATE "C" ASC LIMIT $4';
        END IF;
    ELSE
        IF v_upper_bound IS NOT NULL THEN
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND lower(o.name) COLLATE "C" < $2 ' ||
                'AND lower(o.name) COLLATE "C" >= $3 ORDER BY lower(o.name) COLLATE "C" DESC LIMIT $4';
        ELSE
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND lower(o.name) COLLATE "C" < $2 ' ||
                'ORDER BY lower(o.name) COLLATE "C" DESC LIMIT $4';
        END IF;
    END IF;

    -- Initialize seek position
    IF v_is_asc THEN
        v_next_seek := v_prefix_lower;
    ELSE
        -- DESC: find the last item in range first (static SQL)
        IF v_upper_bound IS NOT NULL THEN
            SELECT o.name INTO v_peek_name FROM storage.objects o
            WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" >= v_prefix_lower AND lower(o.name) COLLATE "C" < v_upper_bound
            ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
        ELSIF v_prefix_lower <> '' THEN
            SELECT o.name INTO v_peek_name FROM storage.objects o
            WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" >= v_prefix_lower
            ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
        ELSE
            SELECT o.name INTO v_peek_name FROM storage.objects o
            WHERE o.bucket_id = bucketname
            ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
        END IF;

        IF v_peek_name IS NOT NULL THEN
            v_next_seek := lower(v_peek_name) || v_delimiter;
        ELSE
            RETURN;
        END IF;
    END IF;

    -- ========================================================================
    -- MAIN LOOP: Hybrid peek-then-batch algorithm
    -- Uses STATIC SQL for peek (hot path) and DYNAMIC SQL for batch
    -- ========================================================================
    LOOP
        EXIT WHEN v_count >= v_limit;

        -- STEP 1: PEEK using STATIC SQL (plan cached, very fast)
        IF v_is_asc THEN
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" >= v_next_seek AND lower(o.name) COLLATE "C" < v_upper_bound
                ORDER BY lower(o.name) COLLATE "C" ASC LIMIT 1;
            ELSE
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" >= v_next_seek
                ORDER BY lower(o.name) COLLATE "C" ASC LIMIT 1;
            END IF;
        ELSE
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" < v_next_seek AND lower(o.name) COLLATE "C" >= v_prefix_lower
                ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
            ELSIF v_prefix_lower <> '' THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" < v_next_seek AND lower(o.name) COLLATE "C" >= v_prefix_lower
                ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
            ELSE
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" < v_next_seek
                ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
            END IF;
        END IF;

        EXIT WHEN v_peek_name IS NULL;

        -- STEP 2: Check if this is a FOLDER or FILE
        v_common_prefix := storage.get_common_prefix(lower(v_peek_name), v_prefix_lower, v_delimiter);

        IF v_common_prefix IS NOT NULL THEN
            -- FOLDER: Handle offset, emit if needed, skip to next folder
            IF v_skipped < offsets THEN
                v_skipped := v_skipped + 1;
            ELSE
                name := split_part(rtrim(storage.get_common_prefix(v_peek_name, v_prefix, v_delimiter), v_delimiter), v_delimiter, levels);
                id := NULL;
                updated_at := NULL;
                created_at := NULL;
                last_accessed_at := NULL;
                metadata := NULL;
                RETURN NEXT;
                v_count := v_count + 1;
            END IF;

            -- Advance seek past the folder range
            IF v_is_asc THEN
                v_next_seek := lower(left(v_common_prefix, -1)) || chr(ascii(v_delimiter) + 1);
            ELSE
                v_next_seek := lower(v_common_prefix);
            END IF;
        ELSE
            -- FILE: Batch fetch using DYNAMIC SQL (overhead amortized over many rows)
            -- For ASC: upper_bound is the exclusive upper limit (< condition)
            -- For DESC: prefix_lower is the inclusive lower limit (>= condition)
            FOR v_current IN EXECUTE v_batch_query
                USING bucketname, v_next_seek,
                    CASE WHEN v_is_asc THEN COALESCE(v_upper_bound, v_prefix_lower) ELSE v_prefix_lower END, v_file_batch_size
            LOOP
                v_common_prefix := storage.get_common_prefix(lower(v_current.name), v_prefix_lower, v_delimiter);

                IF v_common_prefix IS NOT NULL THEN
                    -- Hit a folder: exit batch, let peek handle it
                    v_next_seek := lower(v_current.name);
                    EXIT;
                END IF;

                -- Handle offset skipping
                IF v_skipped < offsets THEN
                    v_skipped := v_skipped + 1;
                ELSE
                    -- Emit file
                    name := split_part(v_current.name, v_delimiter, levels);
                    id := v_current.id;
                    updated_at := v_current.updated_at;
                    created_at := v_current.created_at;
                    last_accessed_at := v_current.last_accessed_at;
                    metadata := v_current.metadata;
                    RETURN NEXT;
                    v_count := v_count + 1;
                END IF;

                -- Advance seek past this file
                IF v_is_asc THEN
                    v_next_seek := lower(v_current.name) || v_delimiter;
                ELSE
                    v_next_seek := lower(v_current.name);
                END IF;

                EXIT WHEN v_count >= v_limit;
            END LOOP;
        END IF;
    END LOOP;
END;
$_$;


ALTER FUNCTION storage.search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- Name: search_by_timestamp(text, text, integer, integer, text, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_by_timestamp(p_prefix text, p_bucket_id text, p_limit integer, p_level integer, p_start_after text, p_sort_order text, p_sort_column text, p_sort_column_after text) RETURNS TABLE(key text, name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
DECLARE
    v_cursor_op text;
    v_query text;
    v_prefix text;
BEGIN
    v_prefix := coalesce(p_prefix, '');

    IF p_sort_order = 'asc' THEN
        v_cursor_op := '>';
    ELSE
        v_cursor_op := '<';
    END IF;

    v_query := format($sql$
        WITH raw_objects AS (
            SELECT
                o.name AS obj_name,
                o.id AS obj_id,
                o.updated_at AS obj_updated_at,
                o.created_at AS obj_created_at,
                o.last_accessed_at AS obj_last_accessed_at,
                o.metadata AS obj_metadata,
                storage.get_common_prefix(o.name, $1, '/') AS common_prefix
            FROM storage.objects o
            WHERE o.bucket_id = $2
              AND o.name COLLATE "C" LIKE $1 || '%%'
        ),
        -- Aggregate common prefixes (folders)
        -- Both created_at and updated_at use MIN(obj_created_at) to match the old prefixes table behavior
        aggregated_prefixes AS (
            SELECT
                rtrim(common_prefix, '/') AS name,
                NULL::uuid AS id,
                MIN(obj_created_at) AS updated_at,
                MIN(obj_created_at) AS created_at,
                NULL::timestamptz AS last_accessed_at,
                NULL::jsonb AS metadata,
                TRUE AS is_prefix
            FROM raw_objects
            WHERE common_prefix IS NOT NULL
            GROUP BY common_prefix
        ),
        leaf_objects AS (
            SELECT
                obj_name AS name,
                obj_id AS id,
                obj_updated_at AS updated_at,
                obj_created_at AS created_at,
                obj_last_accessed_at AS last_accessed_at,
                obj_metadata AS metadata,
                FALSE AS is_prefix
            FROM raw_objects
            WHERE common_prefix IS NULL
        ),
        combined AS (
            SELECT * FROM aggregated_prefixes
            UNION ALL
            SELECT * FROM leaf_objects
        ),
        filtered AS (
            SELECT *
            FROM combined
            WHERE (
                $5 = ''
                OR ROW(
                    date_trunc('milliseconds', %I),
                    name COLLATE "C"
                ) %s ROW(
                    COALESCE(NULLIF($6, '')::timestamptz, 'epoch'::timestamptz),
                    $5
                )
            )
        )
        SELECT
            split_part(name, '/', $3) AS key,
            name,
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
        FROM filtered
        ORDER BY
            COALESCE(date_trunc('milliseconds', %I), 'epoch'::timestamptz) %s,
            name COLLATE "C" %s
        LIMIT $4
    $sql$,
        p_sort_column,
        v_cursor_op,
        p_sort_column,
        p_sort_order,
        p_sort_order
    );

    RETURN QUERY EXECUTE v_query
    USING v_prefix, p_bucket_id, p_level, p_limit, p_start_after, p_sort_column_after;
END;
$_$;


ALTER FUNCTION storage.search_by_timestamp(p_prefix text, p_bucket_id text, p_limit integer, p_level integer, p_start_after text, p_sort_order text, p_sort_column text, p_sort_column_after text) OWNER TO supabase_storage_admin;

--
-- Name: search_v2(text, text, integer, integer, text, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_v2(prefix text, bucket_name text, limits integer DEFAULT 100, levels integer DEFAULT 1, start_after text DEFAULT ''::text, sort_order text DEFAULT 'asc'::text, sort_column text DEFAULT 'name'::text, sort_column_after text DEFAULT ''::text) RETURNS TABLE(key text, name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $$
DECLARE
    v_sort_col text;
    v_sort_ord text;
    v_limit int;
BEGIN
    -- Cap limit to maximum of 1500 records
    v_limit := LEAST(coalesce(limits, 100), 1500);

    -- Validate and normalize sort_order
    v_sort_ord := lower(coalesce(sort_order, 'asc'));
    IF v_sort_ord NOT IN ('asc', 'desc') THEN
        v_sort_ord := 'asc';
    END IF;

    -- Validate and normalize sort_column
    v_sort_col := lower(coalesce(sort_column, 'name'));
    IF v_sort_col NOT IN ('name', 'updated_at', 'created_at') THEN
        v_sort_col := 'name';
    END IF;

    -- Route to appropriate implementation
    IF v_sort_col = 'name' THEN
        -- Use list_objects_with_delimiter for name sorting (most efficient: O(k * log n))
        RETURN QUERY
        SELECT
            split_part(l.name, '/', levels) AS key,
            l.name AS name,
            l.id,
            l.updated_at,
            l.created_at,
            l.last_accessed_at,
            l.metadata
        FROM storage.list_objects_with_delimiter(
            bucket_name,
            coalesce(prefix, ''),
            '/',
            v_limit,
            start_after,
            '',
            v_sort_ord
        ) l;
    ELSE
        -- Use aggregation approach for timestamp sorting
        -- Not efficient for large datasets but supports correct pagination
        RETURN QUERY SELECT * FROM storage.search_by_timestamp(
            prefix, bucket_name, v_limit, levels, start_after,
            v_sort_ord, v_sort_col, sort_column_after
        );
    END IF;
END;
$$;


ALTER FUNCTION storage.search_v2(prefix text, bucket_name text, limits integer, levels integer, start_after text, sort_order text, sort_column text, sort_column_after text) OWNER TO supabase_storage_admin;

--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW; 
END;
$$;


ALTER FUNCTION storage.update_updated_at_column() OWNER TO supabase_storage_admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: audit_log_entries; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.audit_log_entries (
    instance_id uuid,
    id uuid NOT NULL,
    payload json,
    created_at timestamp with time zone,
    ip_address character varying(64) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE auth.audit_log_entries OWNER TO supabase_auth_admin;

--
-- Name: TABLE audit_log_entries; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.audit_log_entries IS 'Auth: Audit trail for user actions.';


--
-- Name: custom_oauth_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.custom_oauth_providers (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    provider_type text NOT NULL,
    identifier text NOT NULL,
    name text NOT NULL,
    client_id text NOT NULL,
    client_secret text NOT NULL,
    acceptable_client_ids text[] DEFAULT '{}'::text[] NOT NULL,
    scopes text[] DEFAULT '{}'::text[] NOT NULL,
    pkce_enabled boolean DEFAULT true NOT NULL,
    attribute_mapping jsonb DEFAULT '{}'::jsonb NOT NULL,
    authorization_params jsonb DEFAULT '{}'::jsonb NOT NULL,
    enabled boolean DEFAULT true NOT NULL,
    email_optional boolean DEFAULT false NOT NULL,
    issuer text,
    discovery_url text,
    skip_nonce_check boolean DEFAULT false NOT NULL,
    cached_discovery jsonb,
    discovery_cached_at timestamp with time zone,
    authorization_url text,
    token_url text,
    userinfo_url text,
    jwks_uri text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT custom_oauth_providers_authorization_url_https CHECK (((authorization_url IS NULL) OR (authorization_url ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_authorization_url_length CHECK (((authorization_url IS NULL) OR (char_length(authorization_url) <= 2048))),
    CONSTRAINT custom_oauth_providers_client_id_length CHECK (((char_length(client_id) >= 1) AND (char_length(client_id) <= 512))),
    CONSTRAINT custom_oauth_providers_discovery_url_length CHECK (((discovery_url IS NULL) OR (char_length(discovery_url) <= 2048))),
    CONSTRAINT custom_oauth_providers_identifier_format CHECK ((identifier ~ '^[a-z0-9][a-z0-9:-]{0,48}[a-z0-9]$'::text)),
    CONSTRAINT custom_oauth_providers_issuer_length CHECK (((issuer IS NULL) OR ((char_length(issuer) >= 1) AND (char_length(issuer) <= 2048)))),
    CONSTRAINT custom_oauth_providers_jwks_uri_https CHECK (((jwks_uri IS NULL) OR (jwks_uri ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_jwks_uri_length CHECK (((jwks_uri IS NULL) OR (char_length(jwks_uri) <= 2048))),
    CONSTRAINT custom_oauth_providers_name_length CHECK (((char_length(name) >= 1) AND (char_length(name) <= 100))),
    CONSTRAINT custom_oauth_providers_oauth2_requires_endpoints CHECK (((provider_type <> 'oauth2'::text) OR ((authorization_url IS NOT NULL) AND (token_url IS NOT NULL) AND (userinfo_url IS NOT NULL)))),
    CONSTRAINT custom_oauth_providers_oidc_discovery_url_https CHECK (((provider_type <> 'oidc'::text) OR (discovery_url IS NULL) OR (discovery_url ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_oidc_issuer_https CHECK (((provider_type <> 'oidc'::text) OR (issuer IS NULL) OR (issuer ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_oidc_requires_issuer CHECK (((provider_type <> 'oidc'::text) OR (issuer IS NOT NULL))),
    CONSTRAINT custom_oauth_providers_provider_type_check CHECK ((provider_type = ANY (ARRAY['oauth2'::text, 'oidc'::text]))),
    CONSTRAINT custom_oauth_providers_token_url_https CHECK (((token_url IS NULL) OR (token_url ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_token_url_length CHECK (((token_url IS NULL) OR (char_length(token_url) <= 2048))),
    CONSTRAINT custom_oauth_providers_userinfo_url_https CHECK (((userinfo_url IS NULL) OR (userinfo_url ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_userinfo_url_length CHECK (((userinfo_url IS NULL) OR (char_length(userinfo_url) <= 2048)))
);


ALTER TABLE auth.custom_oauth_providers OWNER TO supabase_auth_admin;

--
-- Name: flow_state; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.flow_state (
    id uuid NOT NULL,
    user_id uuid,
    auth_code text,
    code_challenge_method auth.code_challenge_method,
    code_challenge text,
    provider_type text NOT NULL,
    provider_access_token text,
    provider_refresh_token text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    authentication_method text NOT NULL,
    auth_code_issued_at timestamp with time zone,
    invite_token text,
    referrer text,
    oauth_client_state_id uuid,
    linking_target_id uuid,
    email_optional boolean DEFAULT false NOT NULL
);


ALTER TABLE auth.flow_state OWNER TO supabase_auth_admin;

--
-- Name: TABLE flow_state; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.flow_state IS 'Stores metadata for all OAuth/SSO login flows';


--
-- Name: identities; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.identities (
    provider_id text NOT NULL,
    user_id uuid NOT NULL,
    identity_data jsonb NOT NULL,
    provider text NOT NULL,
    last_sign_in_at timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    email text GENERATED ALWAYS AS (lower((identity_data ->> 'email'::text))) STORED,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE auth.identities OWNER TO supabase_auth_admin;

--
-- Name: TABLE identities; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.identities IS 'Auth: Stores identities associated to a user.';


--
-- Name: COLUMN identities.email; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.identities.email IS 'Auth: Email is a generated column that references the optional email property in the identity_data';


--
-- Name: instances; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.instances (
    id uuid NOT NULL,
    uuid uuid,
    raw_base_config text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE auth.instances OWNER TO supabase_auth_admin;

--
-- Name: TABLE instances; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.instances IS 'Auth: Manages users across multiple sites.';


--
-- Name: mfa_amr_claims; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_amr_claims (
    session_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    authentication_method text NOT NULL,
    id uuid NOT NULL
);


ALTER TABLE auth.mfa_amr_claims OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_amr_claims; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_amr_claims IS 'auth: stores authenticator method reference claims for multi factor authentication';


--
-- Name: mfa_challenges; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_challenges (
    id uuid NOT NULL,
    factor_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    verified_at timestamp with time zone,
    ip_address inet NOT NULL,
    otp_code text,
    web_authn_session_data jsonb
);


ALTER TABLE auth.mfa_challenges OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_challenges; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_challenges IS 'auth: stores metadata about challenge requests made';


--
-- Name: mfa_factors; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_factors (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    friendly_name text,
    factor_type auth.factor_type NOT NULL,
    status auth.factor_status NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    secret text,
    phone text,
    last_challenged_at timestamp with time zone,
    web_authn_credential jsonb,
    web_authn_aaguid uuid,
    last_webauthn_challenge_data jsonb
);


ALTER TABLE auth.mfa_factors OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_factors; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_factors IS 'auth: stores metadata about factors';


--
-- Name: COLUMN mfa_factors.last_webauthn_challenge_data; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.mfa_factors.last_webauthn_challenge_data IS 'Stores the latest WebAuthn challenge data including attestation/assertion for customer verification';


--
-- Name: oauth_authorizations; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_authorizations (
    id uuid NOT NULL,
    authorization_id text NOT NULL,
    client_id uuid NOT NULL,
    user_id uuid,
    redirect_uri text NOT NULL,
    scope text NOT NULL,
    state text,
    resource text,
    code_challenge text,
    code_challenge_method auth.code_challenge_method,
    response_type auth.oauth_response_type DEFAULT 'code'::auth.oauth_response_type NOT NULL,
    status auth.oauth_authorization_status DEFAULT 'pending'::auth.oauth_authorization_status NOT NULL,
    authorization_code text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    expires_at timestamp with time zone DEFAULT (now() + '00:03:00'::interval) NOT NULL,
    approved_at timestamp with time zone,
    nonce text,
    CONSTRAINT oauth_authorizations_authorization_code_length CHECK ((char_length(authorization_code) <= 255)),
    CONSTRAINT oauth_authorizations_code_challenge_length CHECK ((char_length(code_challenge) <= 128)),
    CONSTRAINT oauth_authorizations_expires_at_future CHECK ((expires_at > created_at)),
    CONSTRAINT oauth_authorizations_nonce_length CHECK ((char_length(nonce) <= 255)),
    CONSTRAINT oauth_authorizations_redirect_uri_length CHECK ((char_length(redirect_uri) <= 2048)),
    CONSTRAINT oauth_authorizations_resource_length CHECK ((char_length(resource) <= 2048)),
    CONSTRAINT oauth_authorizations_scope_length CHECK ((char_length(scope) <= 4096)),
    CONSTRAINT oauth_authorizations_state_length CHECK ((char_length(state) <= 4096))
);


ALTER TABLE auth.oauth_authorizations OWNER TO supabase_auth_admin;

--
-- Name: oauth_client_states; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_client_states (
    id uuid NOT NULL,
    provider_type text NOT NULL,
    code_verifier text,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE auth.oauth_client_states OWNER TO supabase_auth_admin;

--
-- Name: TABLE oauth_client_states; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.oauth_client_states IS 'Stores OAuth states for third-party provider authentication flows where Supabase acts as the OAuth client.';


--
-- Name: oauth_clients; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_clients (
    id uuid NOT NULL,
    client_secret_hash text,
    registration_type auth.oauth_registration_type NOT NULL,
    redirect_uris text NOT NULL,
    grant_types text NOT NULL,
    client_name text,
    client_uri text,
    logo_uri text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    client_type auth.oauth_client_type DEFAULT 'confidential'::auth.oauth_client_type NOT NULL,
    token_endpoint_auth_method text NOT NULL,
    CONSTRAINT oauth_clients_client_name_length CHECK ((char_length(client_name) <= 1024)),
    CONSTRAINT oauth_clients_client_uri_length CHECK ((char_length(client_uri) <= 2048)),
    CONSTRAINT oauth_clients_logo_uri_length CHECK ((char_length(logo_uri) <= 2048)),
    CONSTRAINT oauth_clients_token_endpoint_auth_method_check CHECK ((token_endpoint_auth_method = ANY (ARRAY['client_secret_basic'::text, 'client_secret_post'::text, 'none'::text])))
);


ALTER TABLE auth.oauth_clients OWNER TO supabase_auth_admin;

--
-- Name: oauth_consents; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_consents (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    client_id uuid NOT NULL,
    scopes text NOT NULL,
    granted_at timestamp with time zone DEFAULT now() NOT NULL,
    revoked_at timestamp with time zone,
    CONSTRAINT oauth_consents_revoked_after_granted CHECK (((revoked_at IS NULL) OR (revoked_at >= granted_at))),
    CONSTRAINT oauth_consents_scopes_length CHECK ((char_length(scopes) <= 2048)),
    CONSTRAINT oauth_consents_scopes_not_empty CHECK ((char_length(TRIM(BOTH FROM scopes)) > 0))
);


ALTER TABLE auth.oauth_consents OWNER TO supabase_auth_admin;

--
-- Name: one_time_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.one_time_tokens (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    token_type auth.one_time_token_type NOT NULL,
    token_hash text NOT NULL,
    relates_to text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT one_time_tokens_token_hash_check CHECK ((char_length(token_hash) > 0))
);


ALTER TABLE auth.one_time_tokens OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.refresh_tokens (
    instance_id uuid,
    id bigint NOT NULL,
    token character varying(255),
    user_id character varying(255),
    revoked boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    parent character varying(255),
    session_id uuid
);


ALTER TABLE auth.refresh_tokens OWNER TO supabase_auth_admin;

--
-- Name: TABLE refresh_tokens; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.refresh_tokens IS 'Auth: Store of tokens used to refresh JWT tokens once they expire.';


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE; Schema: auth; Owner: supabase_auth_admin
--

CREATE SEQUENCE auth.refresh_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE auth.refresh_tokens_id_seq OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: supabase_auth_admin
--

ALTER SEQUENCE auth.refresh_tokens_id_seq OWNED BY auth.refresh_tokens.id;


--
-- Name: saml_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_providers (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    entity_id text NOT NULL,
    metadata_xml text NOT NULL,
    metadata_url text,
    attribute_mapping jsonb,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    name_id_format text,
    CONSTRAINT "entity_id not empty" CHECK ((char_length(entity_id) > 0)),
    CONSTRAINT "metadata_url not empty" CHECK (((metadata_url = NULL::text) OR (char_length(metadata_url) > 0))),
    CONSTRAINT "metadata_xml not empty" CHECK ((char_length(metadata_xml) > 0))
);


ALTER TABLE auth.saml_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_providers IS 'Auth: Manages SAML Identity Provider connections.';


--
-- Name: saml_relay_states; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_relay_states (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    request_id text NOT NULL,
    for_email text,
    redirect_to text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    flow_state_id uuid,
    CONSTRAINT "request_id not empty" CHECK ((char_length(request_id) > 0))
);


ALTER TABLE auth.saml_relay_states OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_relay_states; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_relay_states IS 'Auth: Contains SAML Relay State information for each Service Provider initiated login.';


--
-- Name: schema_migrations; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE auth.schema_migrations OWNER TO supabase_auth_admin;

--
-- Name: TABLE schema_migrations; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.schema_migrations IS 'Auth: Manages updates to the auth system.';


--
-- Name: sessions; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sessions (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    factor_id uuid,
    aal auth.aal_level,
    not_after timestamp with time zone,
    refreshed_at timestamp without time zone,
    user_agent text,
    ip inet,
    tag text,
    oauth_client_id uuid,
    refresh_token_hmac_key text,
    refresh_token_counter bigint,
    scopes text,
    CONSTRAINT sessions_scopes_length CHECK ((char_length(scopes) <= 4096))
);


ALTER TABLE auth.sessions OWNER TO supabase_auth_admin;

--
-- Name: TABLE sessions; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sessions IS 'Auth: Stores session data associated to a user.';


--
-- Name: COLUMN sessions.not_after; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.not_after IS 'Auth: Not after is a nullable column that contains a timestamp after which the session should be regarded as expired.';


--
-- Name: COLUMN sessions.refresh_token_hmac_key; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.refresh_token_hmac_key IS 'Holds a HMAC-SHA256 key used to sign refresh tokens for this session.';


--
-- Name: COLUMN sessions.refresh_token_counter; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.refresh_token_counter IS 'Holds the ID (counter) of the last issued refresh token.';


--
-- Name: sso_domains; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_domains (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    domain text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "domain not empty" CHECK ((char_length(domain) > 0))
);


ALTER TABLE auth.sso_domains OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_domains; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_domains IS 'Auth: Manages SSO email address domain mapping to an SSO Identity Provider.';


--
-- Name: sso_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_providers (
    id uuid NOT NULL,
    resource_id text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    disabled boolean,
    CONSTRAINT "resource_id not empty" CHECK (((resource_id = NULL::text) OR (char_length(resource_id) > 0)))
);


ALTER TABLE auth.sso_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_providers IS 'Auth: Manages SSO identity provider information; see saml_providers for SAML.';


--
-- Name: COLUMN sso_providers.resource_id; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sso_providers.resource_id IS 'Auth: Uniquely identifies a SSO provider according to a user-chosen resource ID (case insensitive), useful in infrastructure as code.';


--
-- Name: users; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.users (
    instance_id uuid,
    id uuid NOT NULL,
    aud character varying(255),
    role character varying(255),
    email character varying(255),
    encrypted_password character varying(255),
    email_confirmed_at timestamp with time zone,
    invited_at timestamp with time zone,
    confirmation_token character varying(255),
    confirmation_sent_at timestamp with time zone,
    recovery_token character varying(255),
    recovery_sent_at timestamp with time zone,
    email_change_token_new character varying(255),
    email_change character varying(255),
    email_change_sent_at timestamp with time zone,
    last_sign_in_at timestamp with time zone,
    raw_app_meta_data jsonb,
    raw_user_meta_data jsonb,
    is_super_admin boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    phone text DEFAULT NULL::character varying,
    phone_confirmed_at timestamp with time zone,
    phone_change text DEFAULT ''::character varying,
    phone_change_token character varying(255) DEFAULT ''::character varying,
    phone_change_sent_at timestamp with time zone,
    confirmed_at timestamp with time zone GENERATED ALWAYS AS (LEAST(email_confirmed_at, phone_confirmed_at)) STORED,
    email_change_token_current character varying(255) DEFAULT ''::character varying,
    email_change_confirm_status smallint DEFAULT 0,
    banned_until timestamp with time zone,
    reauthentication_token character varying(255) DEFAULT ''::character varying,
    reauthentication_sent_at timestamp with time zone,
    is_sso_user boolean DEFAULT false NOT NULL,
    deleted_at timestamp with time zone,
    is_anonymous boolean DEFAULT false NOT NULL,
    CONSTRAINT users_email_change_confirm_status_check CHECK (((email_change_confirm_status >= 0) AND (email_change_confirm_status <= 2)))
);


ALTER TABLE auth.users OWNER TO supabase_auth_admin;

--
-- Name: TABLE users; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.users IS 'Auth: Stores user login data within a secure schema.';


--
-- Name: COLUMN users.is_sso_user; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.users.is_sso_user IS 'Auth: Set this column to true when the account comes from SSO. These accounts can have duplicate emails.';


--
-- Name: audit_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.audit_logs (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL,
    action text NOT NULL,
    table_name text NOT NULL,
    record_id uuid,
    old_data jsonb,
    new_data jsonb,
    ip_address text,
    user_agent text,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.audit_logs OWNER TO postgres;

--
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL,
    mobile text NOT NULL,
    area text NOT NULL,
    loan_amount numeric DEFAULT 0 NOT NULL,
    daily_amount numeric DEFAULT 0 NOT NULL,
    start_date date DEFAULT CURRENT_DATE NOT NULL,
    end_date date,
    status text DEFAULT 'active'::text NOT NULL,
    assigned_agent_id uuid,
    created_by uuid NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false,
    deleted_at timestamp with time zone,
    deleted_by uuid,
    pan_number text,
    aadhaar_number text,
    bank_name text,
    bank_account_number text,
    ifsc_code text,
    aadhaar_file_url text,
    pan_file_url text,
    photo_url text,
    other_file_url text,
    other_file_name text
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- Name: feature_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.feature_permissions (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    feature_key text NOT NULL,
    feature_name text NOT NULL,
    description text,
    admin_access boolean DEFAULT true NOT NULL,
    manager_access boolean DEFAULT false NOT NULL,
    agent_access boolean DEFAULT false NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.feature_permissions OWNER TO postgres;

--
-- Name: fund_transactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fund_transactions (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    type text NOT NULL,
    amount numeric DEFAULT 0 NOT NULL,
    description text,
    reference_table text,
    reference_id uuid,
    created_by uuid NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false,
    deleted_at timestamp with time zone,
    deleted_by uuid
);


ALTER TABLE public.fund_transactions OWNER TO postgres;

--
-- Name: loans_loan_number_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.loans_loan_number_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.loans_loan_number_seq OWNER TO postgres;

--
-- Name: loans; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.loans (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    customer_id uuid NOT NULL,
    loan_number integer DEFAULT nextval('public.loans_loan_number_seq'::regclass) NOT NULL,
    loan_display_id text,
    loan_amount numeric DEFAULT 0 NOT NULL,
    daily_amount numeric DEFAULT 0 NOT NULL,
    interest_rate numeric DEFAULT 12.5 NOT NULL,
    processing_fee_rate numeric DEFAULT 0 NOT NULL,
    other_deductions numeric DEFAULT 0 NOT NULL,
    other_deduction_remarks text,
    include_charges_in_outstanding boolean DEFAULT false NOT NULL,
    disbursal_amount numeric DEFAULT 0 NOT NULL,
    outstanding_amount numeric DEFAULT 0 NOT NULL,
    start_date date DEFAULT CURRENT_DATE NOT NULL,
    end_date date,
    status text DEFAULT 'active'::text NOT NULL,
    created_by uuid NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false,
    deleted_at timestamp with time zone,
    deleted_by uuid
);


ALTER TABLE public.loans OWNER TO postgres;

--
-- Name: payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payments (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    customer_id uuid NOT NULL,
    loan_id uuid,
    agent_id uuid NOT NULL,
    date date DEFAULT CURRENT_DATE NOT NULL,
    amount numeric DEFAULT 0 NOT NULL,
    mode text DEFAULT 'cash'::text NOT NULL,
    status text DEFAULT 'paid'::text NOT NULL,
    promised_date date,
    remarks text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false,
    deleted_at timestamp with time zone,
    deleted_by uuid,
    CONSTRAINT payments_mode_check CHECK ((mode = ANY (ARRAY['cash'::text, 'online'::text]))),
    CONSTRAINT payments_status_check CHECK ((status = ANY (ARRAY['paid'::text, 'not_paid'::text])))
);


ALTER TABLE public.payments OWNER TO postgres;

--
-- Name: profiles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profiles (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL,
    name text NOT NULL,
    mobile text NOT NULL,
    whatsapp_number text,
    avatar_url text,
    reporting_to uuid,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false,
    deleted_at timestamp with time zone,
    deleted_by uuid
);


ALTER TABLE public.profiles OWNER TO postgres;

--
-- Name: user_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_roles (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL,
    role public.app_role NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.user_roles OWNER TO postgres;

--
-- Name: messages; Type: TABLE; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE TABLE realtime.messages (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
)
PARTITION BY RANGE (inserted_at);


ALTER TABLE realtime.messages OWNER TO supabase_realtime_admin;

--
-- Name: schema_migrations; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE realtime.schema_migrations OWNER TO supabase_admin;

--
-- Name: subscription; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.subscription (
    id bigint NOT NULL,
    subscription_id uuid NOT NULL,
    entity regclass NOT NULL,
    filters realtime.user_defined_filter[] DEFAULT '{}'::realtime.user_defined_filter[] NOT NULL,
    claims jsonb NOT NULL,
    claims_role regrole GENERATED ALWAYS AS (realtime.to_regrole((claims ->> 'role'::text))) STORED NOT NULL,
    created_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    action_filter text DEFAULT '*'::text,
    CONSTRAINT subscription_action_filter_check CHECK ((action_filter = ANY (ARRAY['*'::text, 'INSERT'::text, 'UPDATE'::text, 'DELETE'::text])))
);


ALTER TABLE realtime.subscription OWNER TO supabase_admin;

--
-- Name: subscription_id_seq; Type: SEQUENCE; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE realtime.subscription ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME realtime.subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: buckets; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets (
    id text NOT NULL,
    name text NOT NULL,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    public boolean DEFAULT false,
    avif_autodetection boolean DEFAULT false,
    file_size_limit bigint,
    allowed_mime_types text[],
    owner_id text,
    type storage.buckettype DEFAULT 'STANDARD'::storage.buckettype NOT NULL
);


ALTER TABLE storage.buckets OWNER TO supabase_storage_admin;

--
-- Name: COLUMN buckets.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.buckets.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: buckets_analytics; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets_analytics (
    name text NOT NULL,
    type storage.buckettype DEFAULT 'ANALYTICS'::storage.buckettype NOT NULL,
    format text DEFAULT 'ICEBERG'::text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE storage.buckets_analytics OWNER TO supabase_storage_admin;

--
-- Name: buckets_vectors; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets_vectors (
    id text NOT NULL,
    type storage.buckettype DEFAULT 'VECTOR'::storage.buckettype NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.buckets_vectors OWNER TO supabase_storage_admin;

--
-- Name: migrations; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.migrations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    hash character varying(40) NOT NULL,
    executed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE storage.migrations OWNER TO supabase_storage_admin;

--
-- Name: objects; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.objects (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    bucket_id text,
    name text,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    last_accessed_at timestamp with time zone DEFAULT now(),
    metadata jsonb,
    path_tokens text[] GENERATED ALWAYS AS (string_to_array(name, '/'::text)) STORED,
    version text,
    owner_id text,
    user_metadata jsonb
);


ALTER TABLE storage.objects OWNER TO supabase_storage_admin;

--
-- Name: COLUMN objects.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.objects.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: s3_multipart_uploads; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads (
    id text NOT NULL,
    in_progress_size bigint DEFAULT 0 NOT NULL,
    upload_signature text NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    version text NOT NULL,
    owner_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_metadata jsonb
);


ALTER TABLE storage.s3_multipart_uploads OWNER TO supabase_storage_admin;

--
-- Name: s3_multipart_uploads_parts; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads_parts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    upload_id text NOT NULL,
    size bigint DEFAULT 0 NOT NULL,
    part_number integer NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    etag text NOT NULL,
    owner_id text,
    version text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.s3_multipart_uploads_parts OWNER TO supabase_storage_admin;

--
-- Name: vector_indexes; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.vector_indexes (
    id text DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL COLLATE pg_catalog."C",
    bucket_id text NOT NULL,
    data_type text NOT NULL,
    dimension integer NOT NULL,
    distance_metric text NOT NULL,
    metadata_configuration jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.vector_indexes OWNER TO supabase_storage_admin;

--
-- Name: refresh_tokens id; Type: DEFAULT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens ALTER COLUMN id SET DEFAULT nextval('auth.refresh_tokens_id_seq'::regclass);


--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.audit_log_entries (instance_id, id, payload, created_at, ip_address) FROM stdin;
\.


--
-- Data for Name: custom_oauth_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.custom_oauth_providers (id, provider_type, identifier, name, client_id, client_secret, acceptable_client_ids, scopes, pkce_enabled, attribute_mapping, authorization_params, enabled, email_optional, issuer, discovery_url, skip_nonce_check, cached_discovery, discovery_cached_at, authorization_url, token_url, userinfo_url, jwks_uri, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.flow_state (id, user_id, auth_code, code_challenge_method, code_challenge, provider_type, provider_access_token, provider_refresh_token, created_at, updated_at, authentication_method, auth_code_issued_at, invite_token, referrer, oauth_client_state_id, linking_target_id, email_optional) FROM stdin;
\.


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id) FROM stdin;
c5dbe63c-3054-481f-ad4b-4dab2dd7dc8d	c5dbe63c-3054-481f-ad4b-4dab2dd7dc8d	{"sub": "c5dbe63c-3054-481f-ad4b-4dab2dd7dc8d", "email": "9003845516@vvlenterprises.in", "email_verified": false, "phone_verified": false}	email	2026-02-23 16:15:43.78549+00	2026-02-23 16:15:43.785552+00	2026-02-23 16:15:43.785552+00	b4bee031-ffbb-4b28-bec7-ffbe327b13cc
548bf3d4-4ce0-44b3-880f-5ed7df62647d	548bf3d4-4ce0-44b3-880f-5ed7df62647d	{"sub": "548bf3d4-4ce0-44b3-880f-5ed7df62647d", "email": "8682041077@vvlenterprises.in", "email_verified": false, "phone_verified": false}	email	2026-02-23 18:14:10.443538+00	2026-02-23 18:14:10.443607+00	2026-02-23 18:14:10.443607+00	123d6ced-9272-415e-9c4e-3580c078124e
dedfbdd2-f9d5-447e-91d8-a9e808c3fe0e	dedfbdd2-f9d5-447e-91d8-a9e808c3fe0e	{"sub": "dedfbdd2-f9d5-447e-91d8-a9e808c3fe0e", "email": "9965750385@vvlenterprises.in", "email_verified": false, "phone_verified": false}	email	2026-02-23 18:19:00.544937+00	2026-02-23 18:19:00.545+00	2026-02-23 18:19:00.545+00	5d9d7345-4860-41d1-adbf-2b4d81565937
ec23a138-6a85-40dc-80b3-47bfb474959c	ec23a138-6a85-40dc-80b3-47bfb474959c	{"sub": "ec23a138-6a85-40dc-80b3-47bfb474959c", "email": "9199620283@vvlenterprises.in", "email_verified": false, "phone_verified": false}	email	2026-02-24 09:08:22.940879+00	2026-02-24 09:08:22.940951+00	2026-02-24 09:08:22.940951+00	73331fad-0a2f-43ff-9727-acfdcaf995c9
96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	{"sub": "96f6fa4a-af51-4aff-a9e1-5d65077bb7b0", "email": "9962028302@vvlenterprises.in", "email_verified": false, "phone_verified": false}	email	2026-02-24 13:19:24.371883+00	2026-02-24 13:19:24.371939+00	2026-02-24 13:19:24.371939+00	7b3046cb-323c-4206-9a12-bb0ba041dd20
\.


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.instances (id, uuid, raw_base_config, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_amr_claims (session_id, created_at, updated_at, authentication_method, id) FROM stdin;
cb8592e5-da1c-403e-aa51-f0ba00e72e65	2026-03-15 13:05:13.008356+00	2026-03-15 13:05:13.008356+00	password	0b7357c1-cc51-4aca-8f79-b3514bbbb724
39d875e4-53d6-4184-a559-21738127a1e9	2026-03-15 13:27:22.575692+00	2026-03-15 13:27:22.575692+00	password	3081547c-c0d8-4910-85c6-a92c4cd4dfde
50b0b32b-ace0-4343-b6d5-89508b41bb42	2026-03-18 05:06:48.618383+00	2026-03-18 05:06:48.618383+00	password	d7582c64-e961-40fd-be0d-c80fa9a041df
1bfee83c-1270-4cd5-8fa1-c1f2b566f770	2026-03-18 06:28:17.623647+00	2026-03-18 06:28:17.623647+00	password	0325e140-14a3-4ebe-9270-20f7c5c7dc5f
439dc2d1-035e-4b57-abb9-f85f9c8154d3	2026-03-18 06:48:59.657203+00	2026-03-18 06:48:59.657203+00	password	b97bcfc0-4d89-4676-a61a-ecd060192f6d
9ba7f60a-0a66-4ca8-b3b2-217fc38db346	2026-03-19 04:58:49.916154+00	2026-03-19 04:58:49.916154+00	password	7e765c7a-05e4-4510-a6c7-aaba9648fe01
c48b0f1e-70b4-4de5-a713-12421991daa5	2026-03-19 05:29:07.291244+00	2026-03-19 05:29:07.291244+00	password	b7aad624-79c8-4303-88d9-c676421f9d3c
\.


--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_challenges (id, factor_id, created_at, verified_at, ip_address, otp_code, web_authn_session_data) FROM stdin;
\.


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_factors (id, user_id, friendly_name, factor_type, status, created_at, updated_at, secret, phone, last_challenged_at, web_authn_credential, web_authn_aaguid, last_webauthn_challenge_data) FROM stdin;
\.


--
-- Data for Name: oauth_authorizations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_authorizations (id, authorization_id, client_id, user_id, redirect_uri, scope, state, resource, code_challenge, code_challenge_method, response_type, status, authorization_code, created_at, expires_at, approved_at, nonce) FROM stdin;
\.


--
-- Data for Name: oauth_client_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_client_states (id, provider_type, code_verifier, created_at) FROM stdin;
\.


--
-- Data for Name: oauth_clients; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_clients (id, client_secret_hash, registration_type, redirect_uris, grant_types, client_name, client_uri, logo_uri, created_at, updated_at, deleted_at, client_type, token_endpoint_auth_method) FROM stdin;
\.


--
-- Data for Name: oauth_consents; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_consents (id, user_id, client_id, scopes, granted_at, revoked_at) FROM stdin;
\.


--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.one_time_tokens (id, user_id, token_type, token_hash, relates_to, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.refresh_tokens (instance_id, id, token, user_id, revoked, created_at, updated_at, parent, session_id) FROM stdin;
00000000-0000-0000-0000-000000000000	255	mja7xpr2oup5	548bf3d4-4ce0-44b3-880f-5ed7df62647d	f	2026-03-15 13:05:12.986517+00	2026-03-15 13:05:12.986517+00	\N	cb8592e5-da1c-403e-aa51-f0ba00e72e65
00000000-0000-0000-0000-000000000000	256	htfddqqpwo73	548bf3d4-4ce0-44b3-880f-5ed7df62647d	f	2026-03-15 13:27:22.554466+00	2026-03-15 13:27:22.554466+00	\N	39d875e4-53d6-4184-a559-21738127a1e9
00000000-0000-0000-0000-000000000000	287	p5abeeh5gqkj	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-03-18 05:06:48.605544+00	2026-03-18 06:48:57.618803+00	\N	50b0b32b-ace0-4343-b6d5-89508b41bb42
00000000-0000-0000-0000-000000000000	290	xvzzltttvppv	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	f	2026-03-18 06:48:57.637405+00	2026-03-18 06:48:57.637405+00	p5abeeh5gqkj	50b0b32b-ace0-4343-b6d5-89508b41bb42
00000000-0000-0000-0000-000000000000	289	hvggp3t63mgs	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-03-18 06:28:17.589625+00	2026-03-18 07:29:06.709155+00	\N	1bfee83c-1270-4cd5-8fa1-c1f2b566f770
00000000-0000-0000-0000-000000000000	292	5ufmdoe3l3jz	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-03-18 07:29:06.736492+00	2026-03-18 12:52:55.45894+00	hvggp3t63mgs	1bfee83c-1270-4cd5-8fa1-c1f2b566f770
00000000-0000-0000-0000-000000000000	293	3xefh6ueez2l	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-03-18 12:52:55.483088+00	2026-03-18 14:07:01.098526+00	5ufmdoe3l3jz	1bfee83c-1270-4cd5-8fa1-c1f2b566f770
00000000-0000-0000-0000-000000000000	294	24o4hdro6fe7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-03-18 14:07:01.116414+00	2026-03-18 15:15:43.503042+00	3xefh6ueez2l	1bfee83c-1270-4cd5-8fa1-c1f2b566f770
00000000-0000-0000-0000-000000000000	295	x6hdagz6igv2	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-03-18 15:15:43.533345+00	2026-03-18 16:13:58.348278+00	24o4hdro6fe7	1bfee83c-1270-4cd5-8fa1-c1f2b566f770
00000000-0000-0000-0000-000000000000	296	4okzw6o2zhxb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-03-18 16:13:58.362832+00	2026-03-19 01:43:16.65493+00	x6hdagz6igv2	1bfee83c-1270-4cd5-8fa1-c1f2b566f770
00000000-0000-0000-0000-000000000000	297	anmxlbh5rqr5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-03-19 01:43:16.684861+00	2026-03-19 04:50:35.45709+00	4okzw6o2zhxb	1bfee83c-1270-4cd5-8fa1-c1f2b566f770
00000000-0000-0000-0000-000000000000	298	jhcs7gurmqrd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	f	2026-03-19 04:50:35.478699+00	2026-03-19 04:50:35.478699+00	anmxlbh5rqr5	1bfee83c-1270-4cd5-8fa1-c1f2b566f770
00000000-0000-0000-0000-000000000000	291	fuvkviu2vlpj	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-03-18 06:48:59.655998+00	2026-03-19 04:58:47.29138+00	\N	439dc2d1-035e-4b57-abb9-f85f9c8154d3
00000000-0000-0000-0000-000000000000	299	k7s4jd7awqoi	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	f	2026-03-19 04:58:47.297269+00	2026-03-19 04:58:47.297269+00	fuvkviu2vlpj	439dc2d1-035e-4b57-abb9-f85f9c8154d3
00000000-0000-0000-0000-000000000000	300	4iodxqem2tru	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	f	2026-03-19 04:58:49.913662+00	2026-03-19 04:58:49.913662+00	\N	9ba7f60a-0a66-4ca8-b3b2-217fc38db346
00000000-0000-0000-0000-000000000000	301	gbm27betzbqu	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	f	2026-03-19 05:29:07.261342+00	2026-03-19 05:29:07.261342+00	\N	c48b0f1e-70b4-4de5-a713-12421991daa5
\.


--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_providers (id, sso_provider_id, entity_id, metadata_xml, metadata_url, attribute_mapping, created_at, updated_at, name_id_format) FROM stdin;
\.


--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_relay_states (id, sso_provider_id, request_id, for_email, redirect_to, created_at, updated_at, flow_state_id) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.schema_migrations (version) FROM stdin;
20171026211738
20171026211808
20171026211834
20180103212743
20180108183307
20180119214651
20180125194653
00
20210710035447
20210722035447
20210730183235
20210909172000
20210927181326
20211122151130
20211124214934
20211202183645
20220114185221
20220114185340
20220224000811
20220323170000
20220429102000
20220531120530
20220614074223
20220811173540
20221003041349
20221003041400
20221011041400
20221020193600
20221021073300
20221021082433
20221027105023
20221114143122
20221114143410
20221125140132
20221208132122
20221215195500
20221215195800
20221215195900
20230116124310
20230116124412
20230131181311
20230322519590
20230402418590
20230411005111
20230508135423
20230523124323
20230818113222
20230914180801
20231027141322
20231114161723
20231117164230
20240115144230
20240214120130
20240306115329
20240314092811
20240427152123
20240612123726
20240729123726
20240802193726
20240806073726
20241009103726
20250717082212
20250731150234
20250804100000
20250901200500
20250903112500
20250904133000
20250925093508
20251007112900
20251104100000
20251111201300
20251201000000
20260115000000
20260121000000
20260219120000
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sessions (id, user_id, created_at, updated_at, factor_id, aal, not_after, refreshed_at, user_agent, ip, tag, oauth_client_id, refresh_token_hmac_key, refresh_token_counter, scopes) FROM stdin;
c48b0f1e-70b4-4de5-a713-12421991daa5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19 05:29:07.220582+00	2026-03-19 05:29:07.220582+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	115.97.225.42	\N	\N	\N	\N	\N
50b0b32b-ace0-4343-b6d5-89508b41bb42	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18 05:06:48.589281+00	2026-03-18 06:48:57.662315+00	\N	aal1	\N	2026-03-18 06:48:57.660932	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	115.97.225.42	\N	\N	\N	\N	\N
1bfee83c-1270-4cd5-8fa1-c1f2b566f770	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18 06:28:17.555088+00	2026-03-19 04:50:35.505739+00	\N	aal1	\N	2026-03-19 04:50:35.505579	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Mobile Safari/537.36	115.99.80.169	\N	\N	\N	\N	\N
439dc2d1-035e-4b57-abb9-f85f9c8154d3	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18 06:48:59.651192+00	2026-03-19 04:58:47.312052+00	\N	aal1	\N	2026-03-19 04:58:47.31192	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	115.97.225.42	\N	\N	\N	\N	\N
9ba7f60a-0a66-4ca8-b3b2-217fc38db346	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19 04:58:49.898984+00	2026-03-19 04:58:49.898984+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	115.97.225.42	\N	\N	\N	\N	\N
cb8592e5-da1c-403e-aa51-f0ba00e72e65	548bf3d4-4ce0-44b3-880f-5ed7df62647d	2026-03-15 13:05:12.963546+00	2026-03-15 13:05:12.963546+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0	49.205.84.25	\N	\N	\N	\N	\N
39d875e4-53d6-4184-a559-21738127a1e9	548bf3d4-4ce0-44b3-880f-5ed7df62647d	2026-03-15 13:27:22.539048+00	2026-03-15 13:27:22.539048+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0	49.205.84.25	\N	\N	\N	\N	\N
\.


--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_domains (id, sso_provider_id, domain, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_providers (id, resource_id, created_at, updated_at, disabled) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, invited_at, confirmation_token, confirmation_sent_at, recovery_token, recovery_sent_at, email_change_token_new, email_change, email_change_sent_at, last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at, phone, phone_confirmed_at, phone_change, phone_change_token, phone_change_sent_at, email_change_token_current, email_change_confirm_status, banned_until, reauthentication_token, reauthentication_sent_at, is_sso_user, deleted_at, is_anonymous) FROM stdin;
00000000-0000-0000-0000-000000000000	c5dbe63c-3054-481f-ad4b-4dab2dd7dc8d	authenticated	authenticated	9003845516@vvlenterprises.in	$2a$10$FPpTb6j4rYFV9iztQjLp.O.2S7seUZ3beTh17ammH8BI9ElbJMHSi	2026-02-23 16:15:43.789609+00	\N		\N		\N			\N	2026-03-18 05:39:13.849267+00	{"provider": "email", "providers": ["email"]}	{"email_verified": true}	\N	2026-02-23 16:15:43.777872+00	2026-03-18 05:39:13.913675+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	548bf3d4-4ce0-44b3-880f-5ed7df62647d	authenticated	authenticated	8682041077@vvlenterprises.in	$2a$10$LJPP9PrDTi3MPnj.GWK6P.sR2jqPvjXfXg3cwtsi7BrIyQLibpUlq	2026-02-23 18:14:10.448233+00	\N		\N		\N			\N	2026-03-15 13:27:22.538962+00	{"provider": "email", "providers": ["email"]}	{"name": "JORAT", "role": "manager", "mobile": "8682041077", "reporting_to": "c5dbe63c-3054-481f-ad4b-4dab2dd7dc8d", "email_verified": true, "whatsapp_number": "8682041077"}	\N	2026-02-23 18:14:10.420548+00	2026-03-15 13:27:22.571126+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	dedfbdd2-f9d5-447e-91d8-a9e808c3fe0e	authenticated	authenticated	9965750385@vvlenterprises.in	$2a$10$HEwL0CqnLi2vuuRr6xHB0ePnfmNv6D17BVHSFhmwZIEtR4QaXl6eW	2026-02-23 18:19:00.549872+00	\N		\N		\N			\N	2026-02-24 14:45:25.966338+00	{"provider": "email", "providers": ["email"]}	{"name": "AK", "role": "agent", "mobile": "9965750385", "reporting_to": "548bf3d4-4ce0-44b3-880f-5ed7df62647d", "email_verified": true, "whatsapp_number": "9965750385"}	\N	2026-02-23 18:19:00.536708+00	2026-02-24 14:45:25.972581+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	ec23a138-6a85-40dc-80b3-47bfb474959c	authenticated	authenticated	9199620283@vvlenterprises.in	$2a$10$QsNmNRU6hVRRDH42iHQt2.WfveOc469pF.WFR.JH9k7WE/TfJ0T/W	2026-02-24 09:08:22.947492+00	\N		\N		\N			\N	2026-02-24 13:16:44.268825+00	{"provider": "email", "providers": ["email"]}	{"name": "Saranraj", "role": "manager", "mobile": "9199620283", "reporting_to": "c5dbe63c-3054-481f-ad4b-4dab2dd7dc8d", "email_verified": true, "whatsapp_number": null}	\N	2026-02-24 09:08:22.921381+00	2026-02-24 14:54:20.455218+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	authenticated	authenticated	9962028302@vvlenterprises.in	$2a$10$Ui6geUZCbxqjpwRGRddIiei3qzT8f52oaWIQ9H1NzjTdzsJq8AjmC	2026-02-24 13:19:24.377948+00	\N		\N		\N			\N	2026-03-19 05:29:07.220484+00	{"provider": "email", "providers": ["email"]}	{"name": "Saran Raj", "role": "manager", "mobile": "9962028302", "reporting_to": "c5dbe63c-3054-481f-ad4b-4dab2dd7dc8d", "email_verified": true, "whatsapp_number": "9003845516"}	\N	2026-02-24 13:19:24.352791+00	2026-03-19 05:29:07.28805+00	\N	\N			\N		0	\N		\N	f	\N	f
\.


--
-- Data for Name: audit_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.audit_logs (id, user_id, action, table_name, record_id, old_data, new_data, ip_address, user_agent, created_at) FROM stdin;
de634427-f30e-4130-a989-f4a6d11428d4	548bf3d4-4ce0-44b3-880f-5ed7df62647d	admin_password_reset	auth.users	ec23a138-6a85-40dc-80b3-47bfb474959c	\N	{"reset_by": "548bf3d4-4ce0-44b3-880f-5ed7df62647d", "target_user": "ec23a138-6a85-40dc-80b3-47bfb474959c"}	\N	\N	2026-02-24 14:54:20.844105+00
\.


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (id, name, mobile, area, loan_amount, daily_amount, start_date, end_date, status, assigned_agent_id, created_by, created_at, updated_at, is_deleted, deleted_at, deleted_by, pan_number, aadhaar_number, bank_name, bank_account_number, ifsc_code, aadhaar_file_url, pan_file_url, photo_url, other_file_url, other_file_name) FROM stdin;
8926b943-bda3-4c36-aa29-4f8576e75e90	Ramesh(Pori)	9094097266	No 4 Siva Vishnu Kovil Street M.G.R Nagar Chennai	20000	200	2026-02-19	2026-05-29	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-24 15:20:15.293094+00	2026-02-24 15:20:15.293094+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
c9a697e2-d1d0-4f48-9f8b-b0a12d06de0d	Hari(Arvind)	8778936354	No. 15/5 Kalaivanar Street M.G.R Nagar	10000	100	2026-02-19	2026-05-29	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-24 15:26:02.431792+00	2026-02-24 15:26:02.431792+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
bcb87a68-a59d-438f-b81a-e5a4a6b666c1	Varanasi.Ayyer.	9840554602	No.15/A 13/A Annal Gandhi Street M.G.R.Nagar 	50000	500	2026-02-19	2026-05-29	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-24 15:32:36.394772+00	2026-02-24 15:32:36.394772+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
f5064908-4ea0-42c7-8a63-0ddfc2a80531	Lakshmi.(Tiffin)	6382449330	No 17/50 Durgai Amman Kovil Street Soolai Pallam	40000	400	2026-02-19	2026-05-29	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-24 16:17:31.004408+00	2026-02-24 16:17:31.004408+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
27559805-98ca-4b40-a167-933eea4a69bb	Thangam.Akka	9361744237	Kurinji Nagar Salem	30000	300	2026-02-19	2026-05-29	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-24 16:22:23.756166+00	2026-02-24 16:22:23.756166+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
93906c36-47ae-41bb-bb4c-a594f08896b3	Hamsa	9884554593	No 60 Pachaiyappan Street 	60000	600	2026-02-20	2026-05-30	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-24 16:24:08.62439+00	2026-02-24 16:24:08.62439+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
b55df5ce-674c-47c2-9c54-73bed3e8e571	Rajagopalan	9789040565	No.5/2 87th Street Ashok Nagar 	30000	300	2026-02-20	2026-05-30	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 07:00:13.560145+00	2026-02-25 07:00:13.560145+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4bf7d91d-6da6-4d5d-9db0-30b196a13651	Ramanathan(Soop)	7708877832	No.28/30 Pulidevan 1 st cross Street 	30000	300	2026-02-20	2026-05-30	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 07:03:58.597653+00	2026-02-25 07:03:58.597653+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
e00a821e-300f-432b-8519-5ef03b42b09c	D.Shankar	8838743407	No.22.pugazhanthi Street 	30000	300	2026-02-20	2026-05-30	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 07:13:59.222966+00	2026-02-25 07:13:59.222966+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6aac96ea-eb26-460a-8340-ffb355953ae0	Karthikeyan	9514171828	No.14/21 shasthiri Nagar Vadapalani	40000	400	2026-02-22	2026-06-01	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 07:17:51.733616+00	2026-02-25 07:17:51.733616+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
bee2c977-93c0-44ef-874e-a76e53e40a51	Sriman	8667656704	No.12 Kattabomman Street M.G.R Nagar 	40000	400	2026-02-22	2026-06-01	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 07:21:25.66172+00	2026-02-25 07:21:25.66172+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
63a8b08e-b8dd-451a-bb89-b38b0bb2d9b2	S.Murugan.(Sekar)	9840236553	No.4/21 Periyar Street Bharati Nagar Nesapaakam	10000	100	2026-02-22	2026-06-01	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 07:25:18.802725+00	2026-02-25 07:25:18.802725+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
72e0cd6d-f353-4cbc-b59f-e63ee38dd833	M.Ramesh	8939585791	No.21/11 Devaraj Street M.G.R Nagar 	30000	300	2026-02-22	2026-06-01	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 07:27:05.699844+00	2026-02-25 07:27:05.699844+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
89d5c659-aa6c-4a99-b0fc-f737d9e8e0e4	Thangapandy	8124460810	No.13.Surendhiran Street 	150000	1500	2026-02-23	2026-06-02	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 07:30:45.978187+00	2026-02-25 07:30:45.978187+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
064b4a2b-34b6-4da3-9286-a5d88700fe07	Raja (auto)	9884487431	No.26 Karunanidhi 1 st Street Anagaputthur	10000	100	2026-02-25	2026-06-04	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 07:33:53.260684+00	2026-02-25 07:33:53.260684+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1ca2f5d0-fc1b-49ab-8443-25574737d3cf	Divya (poo kadai)	8939380181	No.4 Dhamothara vinaiyakar Kovil Street 	10000	100	2026-02-25	2026-06-04	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 07:36:21.020541+00	2026-02-25 07:36:21.020541+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
c8e35247-1c57-4290-9904-8553d3c7cad5	Teja	6383326296	No. Auvaiyar Street M.G.R Nagar 	60000	600	2026-02-26	2026-06-05	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 16:05:41.347609+00	2026-02-25 16:05:41.347609+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
ba9ab57b-e2d8-4c2a-902d-effb7b810b03	Brijesh	9361406727	No.15 Sanjai Gandhi Street M.G.R Nagar 	100000	1000	2026-02-26	2026-06-05	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 16:09:14.402962+00	2026-02-25 16:09:14.402962+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
e9d54922-42db-42b1-ab59-8dd42d68af4c	Kumaravel.megic	8148484499	No.13 Ragul Gandhi Street Choolaipallam	30000	300	2026-03-01	2026-06-08	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-28 13:23:52.105668+00	2026-02-28 13:23:52.105668+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
860f25ca-39ff-42f0-bacb-e409bd6007d7	Vengatesh.Mec	6369149065	No.C5 Raaga Ganapathy Flat Royala Nagar Govur	20000	200	2026-03-01	2026-06-08	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-28 13:26:52.872844+00	2026-02-28 13:26:52.872844+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
aed1fa37-b39e-453a-96ac-b79ba3f4889c	Valli	8072758463	No.16.John Kennedy Street S.M.block	35000	350	2026-03-01	2026-06-08	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-28 15:54:44.48244+00	2026-02-28 15:55:56.442474+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
02889b17-5d17-4dc1-ace1-381b0d733984	Ramya(Murugan T kadai) 	9962142133	No.3 Pugazhanthi Street 	25000	250	2026-03-02	2026-06-09	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-01 15:29:09.938994+00	2026-03-01 15:29:09.938994+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
67eb359b-25a2-481e-ae53-c208688f5940	R.Kumar (Yazhini)	9514501183	No.6 Anna Veedhi 4th Street M.G.R Nagar 	30000	300	2026-03-02	2026-06-09	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-01 15:34:38.760681+00	2026-03-01 15:34:38.760681+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1cac3c77-d86c-41b8-ba55-2b1f74410661	Rubini	9790783930	No 51/25 Nedunchazhiyan Street M.G.R Nagar 	20000	200	2026-03-02	2026-06-09	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-01 15:54:05.772322+00	2026-03-01 15:54:05.772322+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
cb5975f3-72b1-4cc9-bd02-81342334cb40	N.Manikandan	9789053456	No.12C West Vanniyar Street Nesappakkam	20000	200	2026-03-03	2026-06-10	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-02 15:25:03.211737+00	2026-03-02 15:25:03.211737+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
eec56395-bc3e-4592-8a21-7b694944b6eb	Ilaiyaraja (Auto)	9841422072	No.10/7 Kannaki Street Choolaipallam	20000	200	2026-03-03	2026-06-10	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-02 15:39:50.066484+00	2026-03-02 15:39:50.066484+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
ac85d0d3-a358-46b8-bf3e-4f4468ca5670	Sendhil (Sathiyanagar)	9841533361	No.15 Annai Sathiyanagar 2st Street 	30000	300	2026-03-03	2026-06-10	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-02 15:45:01.224983+00	2026-03-02 15:45:01.224983+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8d648ef9-92ca-4513-8639-f0b3ec50a392	UMA.(Teacher)	9150294017	No.9/16 Sekkizhar Street Rajiv Gandhi Nagar	20000	200	2026-03-03	2026-06-10	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-02 16:10:25.951392+00	2026-03-02 16:10:25.951392+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
b9bd3700-24a0-4fa2-9afa-ca0827c26188	Veeramani (vaiko)	9677162973	No.48 Thangavel Street 	20000	200	2026-03-05	2026-06-12	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-04 15:27:18.728618+00	2026-03-04 15:27:18.728618+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
c5f80bd8-670e-4df5-8c6a-ac7378801077	Vasu (iyyar)	9003292811	No.15/A Annal Gandhi Street 	50000	500	2026-03-05	2026-06-12	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-04 15:34:01.517249+00	2026-03-04 15:34:01.517249+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3765d341-7b06-463d-82fa-add7d738b854	Rajesh ( Elc )	8248575621	No.1/1 Kannagi Street Choolaipallam 	15000	150	2026-03-05	2026-06-12	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-04 15:39:33.275993+00	2026-03-04 15:39:33.275993+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
c62f3118-4803-4149-8621-2473aec070c1	P.Mariyappan	8668113805	No.38 Thamarai Vinayagar Kovil Street 	20000	200	2026-03-05	2026-06-12	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-04 15:59:45.589743+00	2026-03-04 15:59:45.589743+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
de282179-bb22-45ff-b75f-6bb22109cb12	Jegan (Car)	9345945331	No.3/47 Valluvar Salai Ramapuram 	60000	600	2026-03-06	2026-06-13	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-05 14:05:46.700557+00	2026-03-05 14:05:46.700557+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
30e2e57d-801d-4c86-9ecc-5df01dfc0696	Murugan(Tingar)	7200179731	No.5 Michal Gardan Hariharan 2th Street Ramapuram 	60000	600	2026-03-06	2026-06-13	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-05 14:11:18.095508+00	2026-03-05 14:11:18.095508+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6cf22fba-6b26-402d-bb6f-abe871f7f809	Jegadesh	9344469845	No.54, V.O.C. Street, M.G.R.Nagar, Ch - 78.	20000	200	2026-03-06	2026-06-13	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-05 06:30:22.403148+00	2026-03-05 14:13:33.409727+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
35038458-ade9-412d-877d-814bb95adf5d	Sathya (Tailor)	6374243933	No.51, 85 St Sivalingapuram	20000	200	2026-03-09	2026-06-16	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-08 08:15:41.898712+00	2026-03-08 08:15:41.898712+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
dede5547-d440-4d63-a9ac-ad427b2895c9	Stella Mery	9943664573	No.2/3 Dr.Nikamudhal Street Triplecane	20000	200	2026-03-09	2026-06-16	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-08 13:22:12.776911+00	2026-03-08 13:22:12.776911+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
271816e2-6379-480d-92c3-c5f6fc561298	Murugan(mec)	9003104358	No 19/16 C block Manjugardan Pillaiyar Kovil Street  Nesappakkam 	15000	150	2026-03-09	2026-06-16	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-08 13:40:48.975778+00	2026-03-08 13:40:48.975778+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9ef2ed06-c135-411b-9768-fe38919bf751	Karunakaran	9176867715	No 88/36 Periyar Street M.G.R Nagar 	20000	200	2026-03-09	2026-06-16	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-08 13:46:42.111032+00	2026-03-08 13:46:42.111032+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
f35169da-5d69-4e7e-a35e-ed6237a94cff	Karthi.Suba	9710733263	No.11 Dhamothara Vinaiyakar Kovil Street 	50000	500	2026-03-09	2026-06-16	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-08 13:50:10.645636+00	2026-03-08 13:50:10.645636+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
db6c8835-21b0-4c54-b4ff-2e6ec0441891	Nandhini	8939133942	No.5/1 Vishnu Kovil Street 	20000	200	2026-03-09	2026-06-16	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-08 15:43:02.84816+00	2026-03-08 15:43:02.84816+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
80752817-7c75-426b-a97e-361b246ec563	Selvam.Ration	9884173431	No.60/96 Periyar Street M.G.R Nagar 	30000	300	2026-03-10	2026-06-17	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-09 14:26:10.845048+00	2026-03-09 14:26:10.845048+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
0d8641d3-1860-4dac-8f9c-a7362226fe97	Sudhagar	9444578078	No.48/82 Periyar Street M.G.R Nagar 	30000	300	2026-03-10	2026-06-17	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-09 14:34:35.99348+00	2026-03-09 14:34:35.99348+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
32e40b35-8c4b-4552-b8b8-7c233d31c03d	R.Murugan(Auto)	9962307933	No.15 Raja Raja chozan Street M.G.R Nagar 	25000	250	2026-03-10	2026-06-17	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-09 14:39:35.95898+00	2026-03-09 14:39:35.95898+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
b2f4bd25-a426-4b1a-b0f6-3ef0115ba281	Bhavani (Vijayakumar)	8428447730	No.133/2 Kanniga Puram 1st Street 	50000	500	2026-03-11	2026-06-18	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-10 05:57:13.261467+00	2026-03-10 05:57:13.261467+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
84cf3d8e-64cc-4a90-8b33-12c94640d00b	Chandran.(Malathi)	7010478505	No.10 Jeeva Road Periyar Nagar Nergundram 	70000	700	2026-03-11	2026-06-18	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-10 06:04:18.264146+00	2026-03-10 06:04:18.264146+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
d59ecb10-5af9-4f75-8f43-dfc52d537f0c	Jaffer	9940384253	No.33 Srinivasa Perumal Kovil Street koduingaiyur	20000	200	2026-03-12	2026-06-19	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11 07:43:34.929+00	2026-03-11 07:43:34.929+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
cf301afd-a3ed-4bea-9794-b4fe432d8861	Baai ( Thaadi )	9176464040	No.F2 Block Green Nagar Ramapuram Hari Appartment 	60000	600	2026-03-12	2026-06-19	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11 14:06:39.594785+00	2026-03-11 14:06:39.594785+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
a0d4dce0-9bdd-4cf1-ad5d-1c95cf18e2dd	Gopal (Veg)	9790801667	No.11 West Vanniyar Street k.k.nagar 	30000	300	2026-03-12	2026-06-19	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11 15:07:36.249415+00	2026-03-11 15:07:36.249415+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
34977a0a-e657-40cb-840d-a6df47bba8d3	Magesh(mec)	9380606727	No.29 Kabilar Street M.G.R Nagar 	10000	100	2026-03-12	2026-06-19	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11 15:58:44.963427+00	2026-03-11 15:58:44.963427+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
b16866ff-ba34-412f-aeea-fa734ccf88a1	E.Saravanan	8681072153	No.54 V.O.C Street 	50000	500	2026-03-13	2026-06-20	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-12 06:38:45.589659+00	2026-03-12 06:38:45.589659+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
e3325ec8-264a-41e1-a2d5-84fb33eb4412	Mani (Magic)	9789069288	No.19/16 Manju Appartment 3rd Floor Pillaiyar Kovil Street Nesappakkam 	50000	500	2026-03-13	2026-06-20	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-12 07:16:17.772063+00	2026-03-12 07:16:17.772063+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6340050f-5246-43c5-9297-d14267b9bad0	S.K.Sendhil	9940010438	No.19 Thamarai Vinayagar Kovil Street 	40000	400	2026-03-13	2026-06-20	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-12 13:50:57.150288+00	2026-03-12 13:50:57.150288+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
f8e88dc3-4e2d-4526-b66d-743bc434bc6e	Karthi (School)	9841621345	No.104/54 Annai Sathya Street M.G.R Nager 	40000	400	2026-03-13	2026-06-20	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-12 15:52:48.201714+00	2026-03-12 15:52:48.201714+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
cf6ae0f5-381e-455f-8bda-1dda692f14a4	Chizhyan. DMDK	8939037510	No.29/7 Ilango Nager 3rd Street Virugambakam 	20000	200	2026-03-15	2026-06-22	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-14 14:09:18.904928+00	2026-03-14 14:14:35.089044+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
e0fca0e1-df99-497f-87e4-41be32ec1780	R.Gopi (Auto)	7358563374	No.78 Saraswathi Nagar Main Road Alwarthiru Nagar 	50000	500	2026-03-15	2026-06-22	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-14 15:18:22.635655+00	2026-03-14 15:18:22.635655+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
b86ae36d-afe4-41a9-8d69-af6178efda6c	Prathaban.R.O.Water	9840677798	No.F 214 Vivacity Kannivakkam Guduvanchery	20000	200	2026-03-16	2026-06-23	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-15 15:24:50.297021+00	2026-03-15 15:24:50.297021+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6245a2e8-2eb5-4d5f-8b8a-aac817bfee18	Balamurali (sekar)	7397397536	No.6 Kambar Street M.G.R Nagar 	20000	200	2026-03-16	2026-06-23	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-15 15:36:43.094483+00	2026-03-15 15:36:43.094483+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22d10045-ef1c-4807-9278-c35dbb01d73f	Rajaselvam	8072425226	No.30 Sangaralinganar Street M.G.R Nagar 	20000	200	2026-03-16	2026-06-23	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-15 15:58:15.971839+00	2026-03-15 15:58:15.971839+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
fb079db0-2262-4017-bd24-5d42ca326ff9	Manipaul	7845032033	No.47 Rangarajapuram Main Road	20000	200	2026-03-17	2026-06-24	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16 06:58:20.853235+00	2026-03-16 06:58:20.853235+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3292a221-dac6-489f-9624-6f993ac28f7d	Magesh.sekar	8838682230	No.6 Seethalai Sathanar Street M.G.R Nagar 	20000	200	2026-03-17	2026-06-24	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16 07:20:20.756907+00	2026-03-16 07:20:20.756907+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2d860b86-e289-45b9-b108-3ecc32fafe18	Uma (Elumalai)	9790249837	No.2 Nagappan Street Jaferkhanpet 	50000	500	2026-03-17	2026-06-24	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16 14:30:47.139086+00	2026-03-16 14:30:47.139086+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9920fe35-b725-4a78-802d-61689d6993b2	Udhayakumar(Sekar)	9789857095	No.5/8 Subramani Salai Munusamy Street Saidhapet	30000	300	2026-03-17	2026-06-24	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16 15:22:40.422745+00	2026-03-16 15:22:40.422745+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23ac8ae5-7452-4182-b51c-a70026bbe0d8	Karthi (Veg)	9363981384	No.54 K.K.Salai	5000	50	2026-03-18	2026-06-25	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-17 12:54:39.233463+00	2026-03-17 12:54:39.233463+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
db40f757-c1ca-42a3-bb92-2df13793998d	Shankar.ilaiyaraja	7200287138	No.206 Pragasam Salai Valasarvakkam	10000	100	2026-03-19	2026-06-26	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18 14:24:49.53306+00	2026-03-18 14:24:49.53306+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
cb86aae2-de85-41b5-bf5f-20645840e270	Iliyas	7338799523	No.5/11 D.S.Lakshmanan Street	5000	50	2026-03-19	2026-06-26	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18 14:30:44.18339+00	2026-03-18 14:56:02.958632+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6d60857f-7cd1-437e-a536-c9d04949b1c7	Anitha	7305664084	No.20 Pugazhalenthi Street 	50000	500	2026-03-19	2026-06-26	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18 15:59:54.47753+00	2026-03-18 15:59:54.47753+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
56da2e53-1358-4168-8c6e-cee12fe29c59	Gokul (Magic)	8608667656	No.127 East Vanniyar Street West K.K Nagar 	50000	500	2026-03-19	2026-06-26	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18 16:09:52.628257+00	2026-03-18 16:09:52.628257+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: feature_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.feature_permissions (id, feature_key, feature_name, description, admin_access, manager_access, agent_access, created_at, updated_at) FROM stdin;
e2138120-bf7a-40f7-8456-3971b3088169	payment_update	Update Payment	Ability to update payment records	t	t	f	2026-02-04 18:31:57.775524+00	2026-02-04 18:31:57.775524+00
01815f7c-c196-4e98-83c1-6ed2e3ba22ac	view_dashboard	View Dashboard	Access to main dashboard	t	t	t	2026-02-04 18:31:57.775524+00	2026-02-04 18:31:57.775524+00
4e24e9a0-46f8-47a2-8dfa-4b8948e996ef	view_agent_report	View Agent Report	Access to agent performance reports	t	t	f	2026-02-04 18:31:57.775524+00	2026-02-04 18:31:57.775524+00
b79edf2e-e8c8-4a43-9cd8-c28f653a7d3c	view_customer_ledger	View Customer Ledger	Access to customer payment history	t	t	t	2026-02-04 18:31:57.775524+00	2026-02-04 18:31:57.775524+00
b88e417d-3b9d-42a9-ac22-d59731e2d79f	view_all_customers	View All Customers	See all customers regardless of assignment	t	t	f	2026-02-04 18:31:57.775524+00	2026-02-04 18:31:57.775524+00
d3587ef3-83e7-47fc-bff8-2b725be0e99a	user_create	Create User	Ability to create new users	t	t	f	2026-02-04 18:31:57.775524+00	2026-02-04 18:58:16.173344+00
de2d10ec-7398-4617-8f6a-1c88d9bced99	user_update	Update User	Ability to update user details	t	t	f	2026-02-04 18:31:57.775524+00	2026-02-04 18:58:19.325015+00
bb8d5238-02d4-47e5-aa57-563a1d89f00f	payment_delete	Delete Payment	Ability to soft delete payments	t	t	f	2026-02-04 18:31:57.775524+00	2026-02-07 11:44:21.762036+00
44f3da27-80f8-449b-9d9e-91b22fda062e	payment_same_day_only	Same Day Payment Only	Restrict payment updates to same day	t	t	t	2026-02-04 18:31:57.775524+00	2026-02-07 16:19:10.888448+00
43d7f65a-3ad7-45e2-afea-2ed04a0996b2	payment_update_own	Update Own Payments	Ability to update own payment records	t	t	t	2026-02-04 18:31:57.775524+00	2026-02-07 16:19:54.761448+00
acc26a14-37d4-43ff-ac39-e7a49fbac691	customer_update	Update Customer	Ability to update customer details	t	t	f	2026-02-04 18:31:57.775524+00	2026-02-14 08:53:40.175818+00
0511b258-4d54-48fe-8545-4ef7d280375f	customer_create	Create Customer	Ability to create new customers	t	t	f	2026-02-04 18:31:57.775524+00	2026-02-14 13:48:45.946271+00
c7215767-44ae-499e-8f68-e82a746fadad	user_delete	Delete User	Ability to soft delete users	t	t	f	2026-02-04 18:31:57.775524+00	2026-02-23 15:57:55.014371+00
d4be7656-0f6c-4b0c-91ea-79dd2f3247e8	payment_create	Create Payment	Ability to record new payments	t	t	t	2026-02-04 18:31:57.775524+00	2026-02-24 09:09:19.487944+00
19202b65-208f-4c99-9834-ec06a4fefbce	fund_manage	Fund Management	Add, withdraw, and manage organizational funds	t	f	f	2026-02-23 17:45:50+00	2026-02-24 09:09:29.15063+00
e6a12aa6-323f-40c2-8122-30fadc4deb79	fund_view	View Fund Balance	View current fund balance and transaction history	t	f	f	2026-02-08 09:26:10.949707+00	2026-02-24 09:09:31.543385+00
c89889dc-e8b9-42e7-89c0-6cc8cab43cf3	customer_delete	Delete Customer	Ability to soft delete customers	t	t	f	2026-02-04 18:31:57.775524+00	2026-02-27 04:32:46.875645+00
\.


--
-- Data for Name: fund_transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fund_transactions (id, type, amount, description, reference_table, reference_id, created_by, created_at, is_deleted, deleted_at, deleted_by) FROM stdin;
86e95adc-4ed1-4904-a230-65c8e8f443ae	credit	500000	Initial amount	\N	\N	c5dbe63c-3054-481f-ad4b-4dab2dd7dc8d	2026-02-24 15:18:12.118261+00	f	\N	\N
76e5fe9f-a9f3-4c37-8fb5-abed774da23b	loan_disbursement	17500	Loan disbursed to Ramesh(Pori)	customers	8926b943-bda3-4c36-aa29-4f8576e75e90	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-24 15:20:15.935575+00	f	\N	\N
0a1b7b5e-4f0c-4827-a684-907465f2eb46	loan_repayment	200	Loan repayment from Ramesh(Pori)	payments	2dbe8ccd-1e20-485d-b670-032eabae41d6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-24 15:21:11.97979+00	f	\N	\N
6bde98c4-7a02-48bb-adbb-79ec5ee3b44b	loan_repayment	200	Loan repayment from Ramesh(Pori)	payments	eca16f9d-297e-4eca-9938-93d4974c8ecd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-24 15:21:43.543648+00	f	\N	\N
f2aab3ef-990d-4ed9-a6d0-05d1eb2ba760	loan_repayment	200	Loan repayment from Ramesh(Pori)	payments	ccfc44fe-14c0-4f59-92c5-bbe524e0e65c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-24 15:22:02.668983+00	f	\N	\N
577c3fc5-440e-469c-bf2c-8664ed4ed9ed	loan_repayment	200	Loan repayment from Ramesh(Pori)	payments	4efba7cb-ac70-4ceb-9aeb-06ae7c2b74b4	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-24 15:22:19.704137+00	f	\N	\N
f4144385-a177-4daf-966b-0867efe35e1b	loan_repayment	200	Loan repayment from Ramesh(Pori)	payments	1cfe2a4f-4595-4ff7-aaf5-65bd54b9687f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-24 15:22:38.82093+00	f	\N	\N
adf9e514-ad3b-4fc7-a709-d11b92f87580	loan_repayment	200	Loan repayment from Ramesh(Pori)	payments	8d2b9a24-6b85-4cc1-b720-d40af55c7030	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-24 15:22:53.745755+00	f	\N	\N
a068d811-0f22-4389-ab8c-5ced3754bdf3	loan_disbursement	8500	Loan disbursed to Hari(Arvind)	customers	c9a697e2-d1d0-4f48-9f8b-b0a12d06de0d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-24 15:26:03.013721+00	f	\N	\N
4e70654e-7ec9-43cc-82e9-43c2c3abb588	loan_repayment	100	Loan repayment from Hari(Arvind)	payments	44f4eb57-eec8-4aaa-aa11-59be033efd6c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-24 15:26:38.115357+00	f	\N	\N
17184554-fa5c-47e9-a2b3-36000cde0fb7	loan_repayment	100	Loan repayment from Hari(Arvind)	payments	11b12b08-2839-4998-a8b1-9a75c307c3d5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-24 15:27:34.54661+00	f	\N	\N
60ebb52d-ef6a-41bc-8325-f905cc6e281b	loan_disbursement	42500	Loan disbursed to Varanasi.Ayyer.	customers	bcb87a68-a59d-438f-b81a-e5a4a6b666c1	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-24 15:32:37.025879+00	f	\N	\N
a07c931d-dc77-40a6-9a8e-de717a887b1d	loan_repayment	2000	Loan repayment from Varanasi.Ayyer.	payments	0ad6be81-8c9c-4a5d-b8c1-a92165a126d6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-24 15:33:12.85554+00	f	\N	\N
d1aeda75-a516-45a4-abac-c20af68b061f	loan_repayment	1000	Loan repayment from Varanasi.Ayyer.	payments	06b6d205-bb4b-4ea9-a6d3-6e5068212230	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-24 15:33:43.475976+00	f	\N	\N
81e8e6c2-cae6-4bb1-8dbe-d40df1362106	loan_disbursement	34000	Loan disbursed to Lakshmi.(Tiffin)	customers	f5064908-4ea0-42c7-8a63-0ddfc2a80531	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-24 16:17:31.552791+00	f	\N	\N
5c3cfbce-4821-4d14-ba20-4b5255c49bd9	loan_repayment	500	Loan repayment from Lakshmi.(Tiffin)	payments	725af9fb-77f1-4929-9c9d-841ae46044f3	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-24 16:17:55.035129+00	f	\N	\N
e0b32635-66f2-4739-b12f-468316d3e79c	loan_repayment	400	Loan repayment from Lakshmi.(Tiffin)	payments	f7312eb1-25e6-4738-88e7-ec4b27a3da1c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-24 16:18:12.756423+00	f	\N	\N
b25420a1-5385-496b-bd34-f612494d4625	loan_repayment	400	Loan repayment from Lakshmi.(Tiffin)	payments	55a96e13-006f-48b0-89e6-8c75a74a2901	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-24 16:18:41.446518+00	f	\N	\N
8f3080db-5913-4f2b-85b2-6b9e679aa17a	loan_repayment	400	Loan repayment from Lakshmi.(Tiffin)	payments	59d2f233-d9d8-4237-acb9-d40dab07d8e1	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-24 16:19:00.142723+00	f	\N	\N
32d97dde-8dc4-49b9-81ac-e17c052177a7	loan_repayment	400	Loan repayment from Lakshmi.(Tiffin)	payments	b51e2333-091b-41d5-99d8-3eff3241c8db	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-24 16:19:34.388632+00	f	\N	\N
0f796e66-2069-4c96-ac04-20862c1432f5	loan_repayment	400	Loan repayment from Lakshmi.(Tiffin)	payments	0f56e78d-b837-4f19-9bc6-b5f81f02459c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-24 16:19:55.051979+00	f	\N	\N
a653307d-bf34-4dc5-b52d-d3945ae86d0c	loan_disbursement	25500	Loan disbursed to Thangam.Akka	customers	27559805-98ca-4b40-a167-933eea4a69bb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-24 16:22:24.250103+00	f	\N	\N
0735068e-f8bc-421e-a795-8972674a6460	loan_disbursement	51000	Loan disbursed to Hamsa	customers	93906c36-47ae-41bb-bb4c-a594f08896b3	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-24 16:24:09.229647+00	f	\N	\N
b8872174-ea42-4eec-9b2f-c69eb0760218	loan_repayment	500	Loan repayment from Hamsa	payments	825bc3d7-e89e-475e-9329-806647f41441	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-24 16:24:31.742407+00	f	\N	\N
292800c9-bdad-4e9e-83a3-09e02efd2348	loan_repayment	500	Loan repayment from Hamsa	payments	b10f39c5-7749-46ff-b741-ca37e6370066	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-24 16:24:53.862145+00	f	\N	\N
c4919dc1-0e91-4a9b-a098-a3f581773932	loan_disbursement	25500	Loan disbursed to Rajagopalan	customers	b55df5ce-674c-47c2-9c54-73bed3e8e571	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 07:00:14.200178+00	f	\N	\N
93587bcc-0aa4-431d-929d-89e42634e4ce	loan_repayment	600	Loan repayment from Rajagopalan	payments	d06d734e-209f-4bde-ad1a-fb01649ce979	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 07:00:41.778906+00	f	\N	\N
a8181b1a-00d9-4737-847e-58eb5d4776ce	loan_repayment	600	Loan repayment from Rajagopalan	payments	525f64de-e092-4a80-b9d3-111894fe9993	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 07:01:08.679805+00	f	\N	\N
76140bbd-b0af-4747-9ac0-d0097d9b1f7b	loan_disbursement	25500	Loan disbursed to Ramanathan(Soop)	customers	4bf7d91d-6da6-4d5d-9db0-30b196a13651	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 07:03:59.286556+00	f	\N	\N
eef4036e-b3e0-4192-ba6d-6b56cd76fd28	loan_repayment	300	Loan repayment from Ramanathan(Soop)	payments	ba4509b0-2d24-4fa3-80bf-738d954b8717	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 07:04:29.734344+00	f	\N	\N
f957292b-461b-4488-8c0a-e247d80269a3	loan_repayment	300	Loan repayment from Ramanathan(Soop)	payments	e9059823-3a60-4f63-ad05-52e2423ea100	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 07:04:52.665892+00	f	\N	\N
a9629815-b2c5-41c5-9042-125bcee721f0	loan_repayment	300	Loan repayment from Ramanathan(Soop)	payments	6712233d-40e3-4904-a101-2b31711708f8	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 07:05:17.85132+00	f	\N	\N
67fde8cf-4d9a-4b80-85ee-7654cb908783	loan_repayment	300	Loan repayment from Ramanathan(Soop)	payments	120f21c5-f402-48b8-b32a-a6b5cc6b1ab3	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 07:05:33.802033+00	f	\N	\N
159a24ff-17fa-489a-9840-cbad54fae5f6	loan_disbursement	25500	Loan disbursed to D.Shankar	customers	e00a821e-300f-432b-8519-5ef03b42b09c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 07:13:59.863064+00	f	\N	\N
6333022a-dadc-4baf-b0c1-4a1e4274179b	loan_repayment	600	Loan repayment from D.Shankar	payments	6685279e-7d36-4e7c-9ec5-92bb4d0c52c0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 07:14:38.283526+00	f	\N	\N
e35ab615-a434-47b1-ae8e-81b2ac16e976	loan_repayment	300	Loan repayment from D.Shankar	payments	69fa37c5-cd9f-4a15-961c-0046c9352f3f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 07:15:12.093812+00	f	\N	\N
3057ece7-4086-4cfb-a2fd-7d68dadbe3c9	loan_repayment	600	Loan repayment from D.Shankar	payments	53a3eac4-bc9f-432b-96de-158920d08dd9	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 07:15:30.710417+00	f	\N	\N
e2637bab-8913-4e24-b3fb-7e789d83852a	loan_disbursement	34000	Loan disbursed to Karthikeyan	customers	6aac96ea-eb26-460a-8340-ffb355953ae0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 07:17:52.231613+00	f	\N	\N
bd8b81fe-8f8f-4161-9b68-f3d4106a1541	loan_repayment	400	Loan repayment from Karthikeyan	payments	ccac25cd-c148-439e-9e14-5b7885e1553a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 07:18:15.17836+00	f	\N	\N
a22b003d-8d98-4fd2-a447-05f66b70f074	loan_repayment	400	Loan repayment from Karthikeyan	payments	50e1cec6-fe54-4819-bfc1-960fca42e9b9	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 07:18:36.874057+00	f	\N	\N
ca368f7a-5501-457e-a4c0-705686e5510a	loan_repayment	400	Loan repayment from Karthikeyan	payments	b55185f6-ac8e-4326-9de6-9695eed80776	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 07:18:52.885856+00	f	\N	\N
88227932-31ba-482b-91eb-dab6336a1d1b	loan_disbursement	34000	Loan disbursed to Sriman	customers	bee2c977-93c0-44ef-874e-a76e53e40a51	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 07:21:26.371813+00	f	\N	\N
55061fe5-d815-45e5-bf6f-2416b5158e28	loan_repayment	400	Loan repayment from Sriman	payments	71037484-3673-4136-a968-279da88f07dd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 07:21:47.126775+00	f	\N	\N
3d2b1260-9b72-4712-9eb2-697060be0a0f	loan_repayment	400	Loan repayment from Sriman	payments	51e85c22-787f-4566-94a3-3dd16eb45194	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 07:22:04.656975+00	f	\N	\N
7dea8182-6566-4455-98c3-3c9c706dc009	loan_repayment	400	Loan repayment from Sriman	payments	adc82173-b58b-4298-941f-8f53c25f0043	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 07:22:48.37786+00	f	\N	\N
857a578f-534d-41f2-858c-37d5ca32d082	loan_disbursement	8500	Loan disbursed to S.Murugan.(Sekar)	customers	63a8b08e-b8dd-451a-bb89-b38b0bb2d9b2	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 07:25:19.370195+00	f	\N	\N
2fc71428-1557-4f79-88d3-140621d1b5aa	loan_disbursement	25500	Loan disbursed to M.Ramesh	customers	72e0cd6d-f353-4cbc-b59f-e63ee38dd833	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 07:27:06.206077+00	f	\N	\N
8d532b83-e8dc-4126-a6ec-2f2ab7f051ce	loan_repayment	300	Loan repayment from M.Ramesh	payments	108af3be-2054-4d2d-a4ac-74662737c454	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 07:27:31.09827+00	f	\N	\N
911ef45e-49d8-433d-9c0d-5f7c9857c700	loan_repayment	300	Loan repayment from M.Ramesh	payments	cee059bd-6774-4640-8163-612103b1da73	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 07:27:48.3093+00	f	\N	\N
aaa1d450-495b-4e9b-9e6f-e5ec4b077f5b	loan_repayment	300	Loan repayment from M.Ramesh	payments	fd6abf77-c74b-4414-a7a7-866db5953f02	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 07:28:08.390454+00	f	\N	\N
b6889ed5-6a86-4be2-b05b-d24f03f7fb6e	loan_disbursement	127500	Loan disbursed to Thangapandy	customers	89d5c659-aa6c-4a99-b0fc-f737d9e8e0e4	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 07:30:46.602195+00	f	\N	\N
4c956c14-63af-428b-880c-c31d287a2a47	loan_disbursement	8500	Loan disbursed to Raja (auto)	customers	064b4a2b-34b6-4da3-9286-a5d88700fe07	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 07:33:53.875714+00	f	\N	\N
a6de4352-6ff8-4886-bb86-1276404007a3	loan_repayment	500	Loan repayment from Raja (auto)	payments	8d666abd-cfd4-4bf4-b322-3d2719319549	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 07:34:13.871347+00	f	\N	\N
6f71ed8a-bd68-48da-9027-de74b23ecf12	loan_disbursement	8500	Loan disbursed to Divya (poo kadai)	customers	1ca2f5d0-fc1b-49ab-8443-25574737d3cf	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 07:36:21.636556+00	f	\N	\N
a49418b1-ecc2-459d-af76-02eebce0745a	loan_repayment	300	Loan repayment from M.Ramesh	payments	e1bff1fe-2524-4efd-be5e-fb8d3717574a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 13:38:13.418954+00	f	\N	\N
fa57b407-03e3-4cc6-a6b6-281f3925008a	loan_repayment	4500	Loan repayment from Thangapandy	payments	da9b2d03-8aeb-440a-adb6-6567a5ed5873	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 13:38:44.489107+00	f	\N	\N
8c883582-4ba0-4098-bc24-876de02d24fc	loan_repayment	500	Loan repayment from Varanasi.Ayyer.	payments	bce53459-3903-4f75-b2f4-fd906d35f268	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 13:39:05.193563+00	f	\N	\N
64538f54-b5b9-4b02-b5bd-3e65aa1b6551	loan_repayment	300	Loan repayment from D.Shankar	payments	816bf01d-06ad-482f-a90b-d62feb7d962a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 13:39:19.719301+00	f	\N	\N
55ff9c2b-755e-4828-a64d-173de8ceddad	loan_repayment	400	Loan repayment from Karthikeyan	payments	4f969ee3-4e36-4d03-8968-67e4724c4a4c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 13:39:34.653653+00	f	\N	\N
d59a7bde-3e56-4d3b-b802-80934a4240db	loan_repayment	400	Loan repayment from Lakshmi.(Tiffin)	payments	2d939fd7-99c1-43c6-a8ee-07aa7b8e8e16	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 15:29:51.068946+00	f	\N	\N
cc2b0629-4471-4f01-b029-7f72cd01efc1	loan_repayment	200	Loan repayment from Ramesh(Pori)	payments	b4be5c98-99fe-483c-9662-aef371092252	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 15:30:24.694776+00	f	\N	\N
c74d5cb0-6c95-4d29-81f4-79561e0e3993	loan_repayment	300	Loan repayment from Ramanathan(Soop)	payments	e2843faf-8809-44d2-9ca0-7b21eac969ee	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 15:30:47.311048+00	f	\N	\N
b6da5cf2-d76e-493f-ba04-5b02914bbc2b	loan_repayment	300	Loan repayment from Hari(Arvind)	payments	1d67dee5-15c9-4879-8277-be5be739afeb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 15:40:58.666793+00	f	\N	\N
82227a49-207d-4cc6-9663-0078aeeb193c	credit	5000000	2nd Payment	\N	\N	c5dbe63c-3054-481f-ad4b-4dab2dd7dc8d	2026-02-25 16:00:38.323238+00	f	\N	\N
cbfc793e-b4ec-4cee-96b6-ced70315e462	loan_disbursement	51000	Loan disbursed to Teja	customers	c8e35247-1c57-4290-9904-8553d3c7cad5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 16:05:41.924199+00	f	\N	\N
93928f49-1b49-4527-a76f-9aeb8f4d13c2	loan_disbursement	85000	Loan disbursed to Brijesh	customers	ba9ab57b-e2d8-4c2a-902d-effb7b810b03	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 16:09:14.895534+00	f	\N	\N
d2fd7202-cb73-4d7b-8bdc-f0df508321e1	loan_repayment	400	Loan repayment from Sriman	payments	ad7bc930-0b74-4a4e-8580-e85287c30c5a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-26 08:22:36.096456+00	f	\N	\N
87296c5e-eb38-4d1b-95ac-27f3e6a7971b	loan_repayment	300	Loan repayment from M.Ramesh	payments	f05d6965-6eb4-45e1-8e8d-f4c87b0154bb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-26 08:23:25.602503+00	f	\N	\N
77effd07-4dca-4c37-8094-7726e7c09f72	loan_repayment	1500	Loan repayment from Thangapandy	payments	c9c30689-1f92-444a-9185-0f795d2a7659	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-26 13:30:08.035636+00	f	\N	\N
cd28ab16-00ce-4ed7-a176-d432c4390c57	loan_repayment	500	Loan repayment from S.Murugan.(Sekar)	payments	9da99c3f-2525-4967-8457-5a422b3fc8ae	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-26 13:30:34.631611+00	f	\N	\N
d54801ba-d513-42e8-80bf-be4f69a0640f	loan_repayment	400	Loan repayment from Karthikeyan	payments	c323f022-5906-4a6d-8754-8f84e4e7fb70	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-26 13:47:44.58568+00	f	\N	\N
0fc6225e-e649-4e48-8b1c-b32c448e5046	loan_repayment	400	Loan repayment from Sriman	payments	2b2ede50-3f73-4018-940c-a27a17883db3	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-26 14:29:27.440937+00	f	\N	\N
1a0fd0d4-60c2-4b38-8507-328e449f14f1	loan_repayment	1200	Loan repayment from Rajagopalan	payments	e0fe9fe5-ca4f-4c11-8614-0baab10a7b2c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-26 14:32:03.715684+00	f	\N	\N
8f449420-ad5d-4eae-879d-3ed85ddc84a3	loan_repayment	400	Loan repayment from Lakshmi.(Tiffin)	payments	a2aa2e66-94d1-413f-ab6b-74de4b7e84bc	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-26 15:52:15.620976+00	f	\N	\N
f6ab7c07-70dd-49ee-9122-7ef0becfffbb	loan_repayment	200	Loan repayment from Ramesh(Pori)	payments	9aa86fb4-17ed-4c6a-b200-52ce87bcfe19	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-26 15:52:54.942648+00	f	\N	\N
1d38d2cd-272c-4449-b1e5-fb5c45d20eb1	loan_repayment	500	Loan repayment from Hamsa	payments	10331285-fde5-4c3b-b63f-8aaa17d6a327	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-26 15:53:29.73132+00	f	\N	\N
5850e26d-707d-46bf-9b59-205dc6982e02	loan_repayment	300	Loan repayment from Ramanathan(Soop)	payments	c3c7de36-a817-46c3-8972-160acd3e188e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-26 15:55:27.351329+00	f	\N	\N
302f0a35-97f6-4f69-9ee4-3ce7c3fa13ab	loan_repayment	1000	Loan repayment from Brijesh	payments	c38118b7-1b10-4a8a-9b55-4e5c4dad9287	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-26 16:09:22.204448+00	f	\N	\N
7f0bc547-e48b-452d-a297-2035bc0f04c5	loan_repayment	1200	Loan repayment from Teja	payments	0fcdc0c9-2a07-492b-a23f-0d7f8472b9ce	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-26 16:24:30.601115+00	f	\N	\N
86d8acda-7e8c-4218-9f89-cdc61722b75c	loan_repayment	500	Loan repayment from Varanasi.Ayyer.	payments	1329753b-9db2-46b7-b49e-5388367dbc45	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-26 16:34:20.450347+00	f	\N	\N
744c94f4-63c5-472d-9e21-bde8f26633a4	loan_repayment	300	Loan repayment from Raja (auto)	payments	c0a99574-d286-43e7-a78f-4abf21af8cb1	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-26 17:02:17.394694+00	f	\N	\N
b08cbaa7-4140-4dbf-ac59-5c1a571333f3	credit	500000	Initial payment	\N	\N	c5dbe63c-3054-481f-ad4b-4dab2dd7dc8d	2026-02-26 17:46:49.74122+00	f	\N	\N
8026ba3a-eb00-4746-b8fb-3f4379b6f0f7	credit	5000000	Initial payment	\N	\N	c5dbe63c-3054-481f-ad4b-4dab2dd7dc8d	2026-02-26 17:49:26.215211+00	f	\N	\N
ac3ae4f3-dc9a-4043-8ff5-321743589030	loan_repayment	1500	Loan repayment from Thangapandy	payments	76bbda5d-069b-4822-9029-9a248e1ed156	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-27 14:03:49.561013+00	f	\N	\N
24f4bc94-0f98-4830-ba95-f99e9bcef617	loan_repayment	300	Loan repayment from M.Ramesh	payments	df181aef-2738-4904-a903-be36c4699797	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-27 14:04:17.713866+00	f	\N	\N
8611dcaf-465a-4b3a-b452-2f27df38dfeb	loan_repayment	600	Loan repayment from D.Shankar	payments	2b82ef59-b28f-4acf-bada-9870c794a627	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-27 14:04:50.91597+00	f	\N	\N
540f84e5-6b34-45c2-a485-f79a6ffbacfe	loan_repayment	400	Loan repayment from Lakshmi.(Tiffin)	payments	57a4494d-a46e-452c-8b98-d464e9cacf3f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-27 15:52:13.586+00	f	\N	\N
78a5657e-d7b5-4cd9-b636-99e7b33e28a1	loan_repayment	200	Loan repayment from Ramesh(Pori)	payments	8389806d-8d36-4bc9-8c04-96c09ac14458	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-27 15:52:59.19529+00	f	\N	\N
6b408440-db23-479d-acb8-5b5e0e22292c	loan_repayment	300	Loan repayment from Ramanathan(Soop)	payments	3210c797-5c44-4c72-9f17-757224996dcd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-27 15:53:43.534319+00	f	\N	\N
f558b5fe-ab20-4f77-9227-40908d3f0ece	loan_repayment	400	Loan repayment from Sriman	payments	097cf845-0e83-4e68-816b-fc3e533dfe68	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-27 15:54:03.808391+00	f	\N	\N
472b5cae-5b5c-4616-a16a-304690cce069	loan_repayment	300	Loan repayment from Raja (auto)	payments	3e42a531-8d09-432c-aca8-4904e1d03b53	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-27 17:32:59.764525+00	f	\N	\N
feda2567-1197-4554-bc6e-889ebc7bf334	loan_repayment	1000	Loan repayment from Brijesh	payments	971c8fe1-7575-481f-9ba3-de575a8261bb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-28 08:17:19.713963+00	f	\N	\N
6730cb80-9172-41fe-9d51-ddae758a3797	loan_repayment	500	Loan repayment from Hamsa	payments	121ba753-ee33-402c-8522-2c6128c180dd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-28 08:17:36.060998+00	f	\N	\N
29529970-259f-45e5-b163-58c758b56a66	loan_repayment	300	Loan repayment from M.Ramesh	payments	29eb93cc-bf5f-44a8-a441-55ef508ed762	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-28 08:31:56.150033+00	f	\N	\N
912deec3-6a22-4a05-ba08-238e36e85582	loan_repayment	1500	Loan repayment from Thangapandy	payments	6bda7573-bae8-497e-9ce2-5570b2e6cf3a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-28 10:49:03.388417+00	f	\N	\N
2848537f-cf91-4d36-a254-8a2568a93863	loan_disbursement	25500	Loan disbursed to Kumaravel.megic	customers	e9d54922-42db-42b1-ab59-8dd42d68af4c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-28 13:23:52.636317+00	f	\N	\N
affd0c9c-c697-4810-9214-951fef51833d	loan_disbursement	17000	Loan disbursed to Vengatesh.Mec	customers	860f25ca-39ff-42f0-bacb-e409bd6007d7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-28 13:26:53.513316+00	f	\N	\N
a09dc148-9b0c-4e37-8573-de3bd0b1858a	loan_repayment	400	Loan repayment from Vengatesh.Mec	payments	7e72bcff-86da-407c-8868-26371b13a5e7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-28 13:27:29.918673+00	f	\N	\N
19277b8e-4b20-404e-aa01-5c022f975981	loan_repayment	1000	Loan repayment from Varanasi.Ayyer.	payments	a35081b3-7494-4fd5-9342-491b3610c355	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-28 14:28:51.489544+00	f	\N	\N
63924cf3-2a6b-4411-a028-c3770e01a052	loan_repayment	200	Loan repayment from Divya (poo kadai)	payments	df537e2a-4780-4ffe-b000-322f4f0b6fc6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-28 14:59:06.345262+00	f	\N	\N
3506b516-5b99-42ae-8eef-d1e20b211686	loan_repayment	400	Loan repayment from Lakshmi.(Tiffin)	payments	653f3103-231d-4dbe-ba17-f5d1f04e9076	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-28 14:59:28.9021+00	f	\N	\N
71a6c10c-f271-4248-93b4-832ed6fe1db0	loan_repayment	200	Loan repayment from Ramesh(Pori)	payments	72abaa66-0d7d-4e0f-9616-968bbbd8c6f3	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-28 15:00:05.793365+00	f	\N	\N
b15d3ef9-e065-4ecb-9ed2-19a566ae4217	loan_repayment	400	Loan repayment from Karthikeyan	payments	facd0b99-704c-4895-98c5-638e05c0ed8b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-28 15:00:42.770997+00	f	\N	\N
a5b68a8d-2c1e-4c07-a66e-7d7451d1e664	loan_disbursement	29750	Loan disbursed to Valli	customers	aed1fa37-b39e-453a-96ac-b79ba3f4889c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-28 15:54:45.204267+00	f	\N	\N
96775e15-4d0d-4627-b49e-f4a82042b800	loan_repayment	300	Loan repayment from Raja (auto)	payments	91363b29-9f2d-473e-a00c-3274dd54191b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-28 17:37:52.349532+00	f	\N	\N
58ee5d71-820c-4af7-b22c-4419d60196d8	loan_repayment	2000	Loan repayment from Brijesh	payments	7b114fea-960e-41f2-b3d5-89dadb1a21c1	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-01 05:32:29.357156+00	f	\N	\N
ac0031f6-4c07-449f-a722-eff32c31f362	loan_repayment	3500	Loan repayment from Valli	payments	ba0b2245-fbc5-4fdb-8ea9-94f41b24af39	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-01 05:55:29.278209+00	f	\N	\N
d2139f3b-8544-474d-81d9-6b6d85747b22	loan_repayment	1500	Loan repayment from Thangapandy	payments	2179020c-3396-42d2-bbcb-2abd36469672	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-01 13:45:47.434005+00	f	\N	\N
96b81508-5a67-492b-96a5-f2174bd12818	loan_repayment	400	Loan repayment from Karthikeyan	payments	89460b67-0530-4014-8e2a-4c79d1f2030e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-01 14:57:16.328267+00	f	\N	\N
886a7ea7-2d5a-410f-93f3-74ee3669d3fd	loan_disbursement	21250	Loan disbursed to Ramya(Murugan T kadai) 	customers	02889b17-5d17-4dc1-ace1-381b0d733984	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-01 15:29:10.507924+00	f	\N	\N
832fe767-fb4c-46e7-acdb-b8e337835226	loan_disbursement	25500	Loan disbursed to R.Kumar (Yazhini)	customers	67eb359b-25a2-481e-ae53-c208688f5940	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-01 15:34:39.31911+00	f	\N	\N
b24e7ecb-63ed-47ed-9d7f-3fd797ff6949	loan_repayment	100	Loan repayment from Divya (poo kadai)	payments	0a7cb3cc-a59a-4851-9638-11c90b05e322	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-01 15:46:48.508587+00	f	\N	\N
cfb3c8d8-0a4d-4131-a033-ac6a8287e23b	loan_repayment	400	Loan repayment from Lakshmi.(Tiffin)	payments	25422301-4987-4a43-94ac-099d7a2320d0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-01 15:47:09.778949+00	f	\N	\N
538ae029-5b27-4490-9b3c-e1bdc4c03810	loan_repayment	200	Loan repayment from Ramesh(Pori)	payments	53f9a130-89fa-4175-93b3-7d1e970b96ed	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-01 15:47:46.617951+00	f	\N	\N
81f2da87-ca0d-492a-936c-8b352fc8f1d3	loan_repayment	1000	Loan repayment from Brijesh	payments	c99013d5-f844-4428-8b06-0382f577cd38	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-01 15:48:10.479397+00	f	\N	\N
221f8814-6b07-4f7f-9976-f64b9099f8c2	loan_repayment	300	Loan repayment from Kumaravel.megic	payments	e710f78c-d844-435c-bea4-5600738fc402	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-01 15:48:28.832456+00	f	\N	\N
f632d1df-4a23-412a-aac9-158b5592a0f8	loan_repayment	1200	Loan repayment from Teja	payments	5e80fb86-93f2-48c7-877e-d91f00fb406b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-01 15:49:12.389307+00	f	\N	\N
67c90261-83ae-4e59-bc68-9920bc8e564f	loan_disbursement	17000	Loan disbursed to Rubini	customers	1cac3c77-d86c-41b8-ba55-2b1f74410661	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-01 15:54:06.38134+00	f	\N	\N
0c33df8a-584f-427c-bb20-924d3e3e89fb	loan_repayment	500	Loan repayment from Varanasi.Ayyer.	payments	a854d598-8420-4b47-8b72-200e8816a6bf	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-01 17:43:22.470837+00	f	\N	\N
cfd092bc-3b97-471f-b1a8-09f12c419dc8	loan_repayment	400	Loan repayment from Sriman	payments	f92952ec-9432-44c2-b553-72f9ab6d8ddc	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-02 01:58:19.929389+00	f	\N	\N
baf6d225-bb8a-4f95-baee-e08b58407557	loan_repayment	400	Loan repayment from Sriman	payments	5f4c09cb-0691-49c1-b306-7b05e1c781d2	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-02 08:13:05.26121+00	f	\N	\N
df556bc6-7358-45dd-bea7-babdeeba9ba7	loan_repayment	300	Loan repayment from M.Ramesh	payments	7303c960-ab05-467f-9b6e-4791e589affa	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-02 08:13:40.02293+00	f	\N	\N
2267ca34-b54c-4599-9c9f-9bcee48ec502	loan_repayment	200	Loan repayment from Rubini	payments	33566942-7568-40b9-8e1d-62819698ca55	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-02 14:43:13.554112+00	f	\N	\N
25052912-6c71-43fc-8b90-0cd23f6ecb32	loan_repayment	1500	Loan repayment from Thangapandy	payments	34a3693a-83ed-42aa-8758-cd53b15e9165	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-02 15:10:48.623066+00	f	\N	\N
7a1966bc-6932-447d-9ec9-001e73bf1720	loan_repayment	500	Loan repayment from Varanasi.Ayyer.	payments	ad2a6318-5c9b-4468-b2c1-9a801e0d8e09	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-02 15:11:25.604851+00	f	\N	\N
beeac1c5-3254-4913-b890-d899f3275df1	loan_repayment	400	Loan repayment from Sriman	payments	0a92b319-deac-47fe-a5ed-32149abac3aa	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-02 15:11:53.798349+00	f	\N	\N
7e7278ef-57fd-480a-b8cc-a7c0b9100927	loan_repayment	100	Loan repayment from Divya (poo kadai)	payments	507fd15e-34f5-46d8-bb4c-fabb464d63e5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-02 15:12:32.454143+00	f	\N	\N
ef5e6b17-6a7a-4a8a-9b70-fc28c4bc245a	loan_repayment	200	Loan repayment from Ramesh(Pori)	payments	0816f90f-13c3-4e6b-acd4-1c11051d8272	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-02 15:12:54.738217+00	f	\N	\N
4f855a91-f005-451e-b70c-b5d0bf95d3a0	loan_repayment	300	Loan repayment from Kumaravel.megic	payments	3ee20d20-a6f5-42a5-a391-8ba3047a444e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-02 15:13:16.857773+00	f	\N	\N
d1855f45-2f55-405f-b361-e1729a1108ce	loan_disbursement	17000	Loan disbursed to N.Manikandan	customers	cb5975f3-72b1-4cc9-bd02-81342334cb40	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-02 15:25:03.773907+00	f	\N	\N
52a2a485-4399-40cd-837d-508487282804	loan_repayment	200	Loan repayment from N.Manikandan	payments	89ef6ec4-f5dd-457c-92b7-2eda299f39d8	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-02 15:29:26.517045+00	f	\N	\N
60defdcc-6b37-41e9-91d4-664a107997a3	loan_repayment	300	Loan repayment from Hari(Arvind)	payments	aaddeff6-0557-4994-b6dc-737191629c8a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-02 15:32:37.410561+00	f	\N	\N
c43f6d8f-fd25-4474-aea3-7d9886d96bb7	loan_repayment	1000	Loan repayment from Brijesh	payments	9d35b8f1-5f17-474c-9174-10fd2f60688d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-02 15:33:28.458161+00	f	\N	\N
239f9ab0-0464-47fd-beed-ee85a3283643	loan_disbursement	17000	Loan disbursed to Ilaiyaraja (Auto)	customers	eec56395-bc3e-4592-8a21-7b694944b6eb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-02 15:39:50.547275+00	f	\N	\N
c7026d16-3850-4ea9-81ba-7990aadabd8d	loan_disbursement	25500	Loan disbursed to Sendhil (Sathiyanagar)	customers	ac85d0d3-a358-46b8-bf3e-4f4468ca5670	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-02 15:45:01.85029+00	f	\N	\N
b7133cb1-2cbb-45c9-9573-a7fba2367c2d	loan_disbursement	17000	Loan disbursed to UMA.(Teacher)	customers	8d648ef9-92ca-4513-8639-f0b3ec50a392	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-02 16:10:26.52204+00	f	\N	\N
09c0416b-91a6-4a69-9f57-6b3864a818f2	loan_repayment	250	Loan repayment from Ramya(Murugan T kadai) 	payments	1f7ca92a-876d-4ba0-9deb-255ee67e4074	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-02 17:01:32.366445+00	f	\N	\N
2e6bc5ea-863e-43ea-b49f-b52b803f0f0e	loan_repayment	300	Loan repayment from Raja (auto)	payments	213b6333-ead3-4ec0-83b0-a88654d3ffe5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-04 15:05:42.889296+00	f	\N	\N
c8ec7f85-08bd-49d4-b1f7-01563057dc80	loan_repayment	400	Loan repayment from Lakshmi.(Tiffin)	payments	a02af1d6-0047-4700-98ff-8041ac40486f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-04 15:06:35.91552+00	f	\N	\N
970d0bab-7923-4783-9162-bddec1bd6057	loan_repayment	200	Loan repayment from Ramesh(Pori)	payments	4e1c6e19-5e06-45a4-9556-b25bc0c746d4	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-04 15:07:06.409221+00	f	\N	\N
ec33d52c-a4d8-4bb6-a97a-86069e20a8f6	loan_repayment	100	Loan repayment from Divya (poo kadai)	payments	49497684-30bf-4748-b8c4-1517cbafe54e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-04 15:08:02.183989+00	f	\N	\N
b60168e0-5160-4bdc-9ac3-8c61f2d713dd	loan_repayment	300	Loan repayment from Raja (auto)	payments	f068dae4-ae1f-4de4-b5fb-c1009134d94d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-04 15:09:36.643809+00	f	\N	\N
02721bb0-a0f8-495c-a06a-bbe6695120eb	loan_repayment	600	Loan repayment from D.Shankar	payments	8b1df0dc-4fc9-4ca8-af12-461f91b6a72c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-04 15:10:12.577218+00	f	\N	\N
5699eaac-0eec-4e64-b794-f3d9b60dd5c8	loan_repayment	200	Loan repayment from Vengatesh.Mec	payments	1e1ea377-0c01-4727-a547-e4b21d0797ae	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-04 15:10:39.243726+00	f	\N	\N
246e7a59-cd34-42bc-b98b-cd7339485c2f	loan_repayment	200	Loan repayment from Rubini	payments	af20df17-1724-4af8-a6e1-3627c7998dc0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-04 15:11:14.252992+00	f	\N	\N
bd194c40-5ca4-401a-a15b-552211706f5a	loan_repayment	1000	Loan repayment from Brijesh	payments	0313ccb0-1d9f-4775-8e56-6bf17e7c5900	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-04 15:12:00.943113+00	f	\N	\N
edd4a17a-82e2-4e50-8444-caf79ffd27f4	loan_repayment	1500	Loan repayment from Thangapandy	payments	eea93a39-d925-4088-af28-875a9051e8c3	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-04 15:12:31.020282+00	f	\N	\N
dbe738cc-51c3-4d7a-81a1-bec9bc31afe7	loan_repayment	400	Loan repayment from Sriman	payments	fa4f72e7-f06a-43a1-9f22-b250cb79a59d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-04 15:12:52.692076+00	f	\N	\N
10a74e2d-ad59-451a-8583-10a346e19ce8	loan_repayment	500	Loan repayment from Varanasi.Ayyer.	payments	487e69bd-46b5-46d7-ad1c-b16044c873f4	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-04 15:13:19.684986+00	f	\N	\N
9174eb58-d31f-4637-aab6-e51a3a09ad7c	loan_repayment	200	Loan repayment from UMA.(Teacher)	payments	619e8275-ef4b-4ee7-a130-686ecb6049c9	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-04 15:13:41.229239+00	f	\N	\N
26f3f418-4083-4a19-97fc-e2596ee503e1	loan_disbursement	17000	Loan disbursed to Veeramani (vaiko)	customers	b9bd3700-24a0-4fa2-9afa-ca0827c26188	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-04 15:27:19.257693+00	f	\N	\N
d2578c71-14d0-4d9d-b0e8-be7f6812cce2	loan_disbursement	42500	Loan disbursed to Vasu (iyyar)	customers	c5f80bd8-670e-4df5-8c6a-ac7378801077	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-04 15:34:02.190735+00	f	\N	\N
2ca5026a-a1d9-4110-a44b-d6cecdb09046	loan_disbursement	12750	Loan disbursed to Rajesh ( Elc )	customers	3765d341-7b06-463d-82fa-add7d738b854	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-04 15:39:33.784328+00	f	\N	\N
191d7ac3-5e17-4e38-aa0e-77fc0ff33d7a	loan_repayment	200	Loan repayment from Rubini	payments	ab5f6e68-c8ab-4670-bf47-89ca274eb0d2	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-04 15:51:40.912946+00	f	\N	\N
bbe9c2f9-92b8-41d1-85eb-1d4b51ec1600	loan_repayment	100	Loan repayment from Divya (poo kadai)	payments	4861c430-8739-44f7-8959-8dcb0e67e993	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-04 15:52:10.153258+00	f	\N	\N
e50f637e-b5ee-426e-aa71-4e5b62e99598	loan_repayment	400	Loan repayment from Lakshmi.(Tiffin)	payments	727e56ef-b45b-4caf-b487-32b421646cf2	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-04 15:52:27.226026+00	f	\N	\N
6b336e07-858c-4ec8-9489-d1335824a64f	loan_repayment	400	Loan repayment from Sriman	payments	d38adcd9-3e71-4a6e-80ef-c8dd4ae96c5a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-04 15:56:02.358314+00	f	\N	\N
8a936fd6-6f92-4696-8758-415a0c14ddcc	loan_repayment	1200	Loan repayment from Rajagopalan	payments	effb6af9-551c-40dd-a770-eab0fe193fd2	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-04 15:56:50.087286+00	f	\N	\N
1d291486-7847-42e9-be9b-49b9d5472d83	loan_repayment	800	Loan repayment from Karthikeyan	payments	63427235-c8af-4de4-bed1-9d113319bc55	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-04 15:57:10.651007+00	f	\N	\N
b15703d1-7676-40ea-9b35-b04eb8dbdc14	loan_repayment	200	Loan repayment from Vengatesh.Mec	payments	77142fd2-1e0f-4f20-b062-28ce62e28b37	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-04 15:57:32.618226+00	f	\N	\N
a688a2c8-450f-4661-8e3e-955e4da89b0b	loan_disbursement	17000	Loan disbursed to P.Mariyappan	customers	c62f3118-4803-4149-8621-2473aec070c1	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-04 15:59:46.064281+00	f	\N	\N
e7ac6eba-82ce-40f9-b409-7900bed5341f	loan_repayment	1500	Loan repayment from Thangapandy	payments	1cb25ae3-7ba9-4f62-80ab-f1709738517d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-05 02:33:20.98482+00	f	\N	\N
f7527c5d-6712-4193-84d4-d1753d16a691	loan_repayment	200	Loan repayment from N.Manikandan	payments	0f81224b-bfd9-452e-a849-f515945a1d90	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-05 02:33:46.23988+00	f	\N	\N
b30449e3-f809-4b2c-ba97-6fea3ed73194	loan_repayment	200	Loan repayment from UMA.(Teacher)	payments	bc23d4ec-af8e-431a-bd92-3ff081a34a16	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-05 02:34:12.354758+00	f	\N	\N
485ad422-efa2-4790-87b2-650fb7b6475b	loan_disbursement	17000	Loan disbursed to Jagadesh	customers	6cf22fba-6b26-402d-bb6f-abe871f7f809	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-05 06:30:22.957387+00	f	\N	\N
bd2933b4-4d1c-4866-af6e-e27435f7e33e	loan_repayment	500	Loan repayment from Ramya(Murugan T kadai) 	payments	fe2c3c90-c7b9-4e97-ae0a-664e0686af87	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-05 06:52:50.551532+00	f	\N	\N
2636920e-3dc0-49a5-9d4c-ecd3a7d188b7	loan_repayment	1000	Loan repayment from Varanasi.Ayyer.	payments	bbbb3135-f55c-4fd4-8518-e81ac20a4f91	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-05 07:34:46.018154+00	f	\N	\N
a69578d7-40ba-4ebc-9513-db7e7887cecd	loan_repayment	900	Loan repayment from R.Kumar (Yazhini)	payments	5011c8e6-280f-4561-b357-6a855d389a98	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-05 07:35:16.196839+00	f	\N	\N
40c733be-0798-4092-956e-ae65aea3b64b	loan_repayment	400	Loan repayment from Veeramani (vaiko)	payments	e1e1471a-8898-4328-b2fb-c188d5e03933	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-05 13:47:19.544366+00	f	\N	\N
d15d1bd9-a45b-41d8-8538-1085dd42953c	loan_repayment	1000	Loan repayment from Brijesh	payments	8dc5b867-5d5d-4a51-9ba8-367c1d2d8907	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-05 13:47:47.701779+00	f	\N	\N
23410060-fb36-47d6-8aea-33bfda933c1e	loan_repayment	500	Loan repayment from Hamsa	payments	2e289e8e-8942-4d0e-a3a1-b7f05394f9ed	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-05 13:48:14.353082+00	f	\N	\N
b4f17d2c-6e6e-4641-84f3-b845c517780f	loan_repayment	1500	Loan repayment from Thangapandy	payments	46928bac-c719-4209-8063-5bdcad607431	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-05 13:48:38.593209+00	f	\N	\N
ddc81913-69a5-401b-88ec-d1764d34cb92	loan_disbursement	51000	Loan disbursed to Jegan (Car)	customers	de282179-bb22-45ff-b75f-6bb22109cb12	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-05 14:05:47.333377+00	f	\N	\N
8ce19273-ff3c-43fa-871e-07fa464e086a	loan_disbursement	51000	Loan disbursed to Murugan(Tingar)	customers	30e2e57d-801d-4c86-9ecc-5df01dfc0696	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-05 14:11:18.665278+00	f	\N	\N
3876ec29-53f6-41af-9621-49c541df0766	loan_repayment	500	Loan repayment from Vasu (iyyar)	payments	dbe183b8-61ef-42bc-9f78-745295fb901e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-05 14:41:09.41162+00	f	\N	\N
5eefa5fa-9507-4bfe-9a8a-accbc6b80655	loan_repayment	200	Loan repayment from Rubini	payments	3cfed9b8-e63d-475e-b93f-0e7f2cf3f3c1	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-05 15:16:13.290373+00	f	\N	\N
d2452c39-7a33-4b78-aeb1-906a63c89c21	loan_repayment	100	Loan repayment from Divya (poo kadai)	payments	4a17d95d-96a7-4753-8e20-87256c084bd1	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-05 15:42:32.176461+00	f	\N	\N
5a3512c8-b196-4f0f-a6c7-9a4d92dd8e86	loan_repayment	300	Loan repayment from Kumaravel.megic	payments	3432e039-c634-4e38-b7a6-7812c5f1137a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-05 15:42:55.508478+00	f	\N	\N
04732287-ccf6-40b6-aded-da7fe5cf416c	loan_repayment	600	Loan repayment from D.Shankar	payments	b469506c-e73a-4f67-ad59-e0a3e7919de5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-05 15:43:13.947641+00	f	\N	\N
a92d7177-7208-422d-80b6-50007be879d7	loan_repayment	100	Loan repayment from Raja (auto)	payments	4f24f8e7-1d06-4ae6-9391-fa57638c7e4e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-05 15:54:43.929616+00	f	\N	\N
16e6c577-15f8-414a-9003-07c689554fe0	loan_repayment	200	Loan repayment from Raja (auto)	payments	5c2dc993-91ee-48df-8ff7-d5f839221a1e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-05 16:04:12.044021+00	f	\N	\N
8418d1a5-6182-4d7a-82df-b7d8f1dc6436	loan_repayment	200	Loan repayment from Hari(Arvind)	payments	9a352355-7844-448c-92ef-938db71704f4	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-05 16:15:13.677336+00	f	\N	\N
eb36a8c0-c09e-4d9b-abe4-9b41ff940de2	loan_repayment	200	Loan repayment from Vengatesh.Mec	payments	9262d0c7-2a40-488d-bd8f-a41db8583f7e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-05 17:07:52.537159+00	f	\N	\N
04229d4e-dc88-4433-b21f-e39fa81cfd19	loan_repayment	400	Loan repayment from Sriman	payments	71e0b5e8-2df8-4e4f-97b5-bad893d382d3	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-05 17:08:10.790861+00	f	\N	\N
fc58e27b-717c-41bc-80d8-f6f98bfae69f	loan_repayment	200	Loan repayment from UMA.(Teacher)	payments	abba6c9c-7d4e-4bfe-bf93-cbeea2c80637	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-06 00:52:15.022154+00	f	\N	\N
ea6279cd-7355-442f-aee4-bf521fe10cd9	loan_repayment	500	Loan repayment from Ramya(Murugan T kadai) 	payments	bd198765-7313-4f41-9803-1bc99ee05bd6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-06 12:54:04.483852+00	f	\N	\N
8c71bfd6-ac8d-4d51-bc83-7af0d6a37548	loan_repayment	1500	Loan repayment from Thangapandy	payments	ab0242fe-548e-4d74-83a4-78a0267c1314	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-06 13:02:44.74395+00	f	\N	\N
f29a8363-3ae6-47ec-818e-8fca643b256c	loan_repayment	1200	Loan repayment from M.Ramesh	payments	61d6f3e9-bcfb-4724-ab6b-8930f8e2891a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-06 13:03:05.514491+00	f	\N	\N
bfce7fe3-fec2-4a4f-b174-5752b99cd80f	loan_repayment	500	Loan repayment from Vasu (iyyar)	payments	52be84d8-b53d-40bd-9192-8ec8ba9deb7e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-06 13:16:41.06642+00	f	\N	\N
71296a98-c045-4168-9106-e6ed87537048	loan_repayment	400	Loan repayment from Veeramani (vaiko)	payments	77b4e62c-1d49-44e0-a384-d7e39494f5c5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-06 13:40:14.144362+00	f	\N	\N
1f110302-dc09-4766-8aa9-7a559d16e04c	loan_repayment	500	Loan repayment from Hamsa	payments	e5a2ceaf-0b5e-4eb4-ae9e-130887c6f7c2	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-06 13:47:41.169302+00	f	\N	\N
f08b8473-b32b-4de0-9101-d990fa15d489	loan_repayment	1200	Loan repayment from Teja	payments	94ac53de-7a4f-4870-8dd6-a582deb6835d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-06 13:51:11.050745+00	f	\N	\N
c2a573ec-7a32-4b17-a0e5-ee0a03203dd3	loan_repayment	600	Loan repayment from Murugan(Tingar)	payments	b2f39ad6-a557-4663-9f1e-c7a24eeaf752	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-06 14:39:20.49181+00	f	\N	\N
aa55ac44-6d79-4290-825e-9aed0cdfb7af	loan_repayment	200	Loan repayment from N.Manikandan	payments	0847de22-7cbc-43fc-b362-c940aab05717	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-06 14:48:50.457198+00	f	\N	\N
0c18366e-1246-4c06-9593-cbbf457264fd	loan_repayment	200	Loan repayment from Rubini	payments	bff31b0d-2cc7-4b97-8c98-efd6ae649fec	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-06 14:53:35.883252+00	f	\N	\N
6843b918-72fd-41f7-91a0-b36e1f2fd3a2	loan_repayment	2000	Loan repayment from Ilaiyaraja (Auto)	payments	3eb9e7a8-0cb9-42a1-937e-4fbfc532eb08	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-06 15:13:03.169686+00	f	\N	\N
4f055ef9-01d4-4450-8e98-3010ae67ca02	loan_repayment	100	Loan repayment from Ilaiyaraja (Auto)	payments	5c87ee5a-b241-4441-aed9-5321cf127236	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-06 15:31:13.967318+00	f	\N	\N
e8be3d5f-85c0-49df-910c-d6db7b34178d	loan_repayment	400	Loan repayment from Lakshmi.(Tiffin)	payments	6ae5dee2-274a-4d19-a52c-cdbc573de0bf	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-06 15:31:36.70635+00	f	\N	\N
79a87fbd-e7e2-4ffe-963e-4fd70921ba2a	loan_repayment	600	Loan repayment from Ramesh(Pori)	payments	64dcf2ba-9257-4308-815e-c4d40c58cb7e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-06 15:31:57.996127+00	f	\N	\N
883e9ad5-5881-49e1-9d93-30d01a13b4d6	loan_repayment	1500	Loan repayment from Ramanathan(Soop)	payments	7cac54b8-dd30-4acb-ba3f-0c16ff5aed2d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-06 15:32:27.242276+00	f	\N	\N
dcb7a377-1160-4035-adca-f406832a7c71	loan_repayment	100	Loan repayment from Raja (auto)	payments	540f83a1-ef23-4eb6-85f0-aefdcb74a08e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-06 16:03:06.010894+00	f	\N	\N
5552e225-12ac-4bf3-94c6-d6b936659cb3	loan_repayment	1000	Loan repayment from Brijesh	payments	447ef24a-3c4e-49de-bfbd-7b35b98c4c59	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-07 00:56:20.540109+00	f	\N	\N
48440623-acab-4bb2-b584-8d4c6a8d32c3	loan_repayment	400	Loan repayment from Karthikeyan	payments	b1452233-6b40-4744-8c9b-bb99086ffd78	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-07 02:08:55.078745+00	f	\N	\N
cefb9ddb-8d19-4932-a897-f9a7d573763e	loan_repayment	1500	Loan repayment from Thangapandy	payments	4b820fda-6d04-449d-ace9-ae41a31f8715	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-07 13:38:54.42882+00	f	\N	\N
17e03e31-790e-4e7f-9715-81570039418c	loan_repayment	200	Loan repayment from Vengatesh.Mec	payments	13a4cddf-8eff-401a-bde4-706963688c5c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-07 13:40:57.046978+00	f	\N	\N
7fc1a27b-31cc-4cfe-b66e-6edd51784ae9	loan_repayment	200	Loan repayment from Rubini	payments	9aed1f15-2bd1-483a-b0a6-60d4effc457a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-07 15:04:46.730371+00	f	\N	\N
08e02396-d0e4-4699-9290-7b48112b1c3a	loan_repayment	900	Loan repayment from Ramanathan(Soop)	payments	5bacd099-7929-4fdd-96f7-3e1201f93637	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-07 15:06:20.234712+00	f	\N	\N
d846a302-3594-4d6c-8188-f597d273bcf1	loan_repayment	200	Loan repayment from Ramesh(Pori)	payments	46735147-7984-43b0-bb29-4fcdb1593056	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-07 15:09:47.628131+00	f	\N	\N
60b6bb96-1e76-4096-beb5-1334fe26d7df	loan_repayment	400	Loan repayment from Lakshmi.(Tiffin)	payments	46daac85-44f0-4a4f-88d1-e4bf01fcb604	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-07 15:10:29.256081+00	f	\N	\N
70de8a11-78ce-429e-8a61-ceb79cf01b3a	loan_repayment	500	Loan repayment from Vasu (iyyar)	payments	769b7927-9ec0-4bbd-9079-5751c99f47a1	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-07 15:59:01.69594+00	f	\N	\N
9fb5ab4a-a6d3-4789-a82e-76bf03edad05	loan_repayment	1000	Loan repayment from Brijesh	payments	de64d63a-4a0d-41e7-9392-f2310060047a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-07 17:30:51.408053+00	f	\N	\N
8e384e3f-cd51-43f8-a178-529edfd97929	loan_repayment	200	Loan repayment from N.Manikandan	payments	e8d8e95c-a8e5-4a1d-942b-8fe7824e2274	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-07 17:31:17.409167+00	f	\N	\N
8fb505ba-3d06-4842-b0d8-75f1fb1ab49f	loan_repayment	200	Loan repayment from Raja (auto)	payments	aca025cd-bc1c-441b-850a-19169670ebd4	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-08 01:13:25.300442+00	f	\N	\N
5c02b822-da2c-446e-b32f-27218e68f510	loan_repayment	100	Loan repayment from Raja (auto)	payments	9dc4e9d8-c0ff-46cf-8030-29509d6f7473	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-08 05:07:49.523255+00	f	\N	\N
0dcc4b71-adc1-4c45-a136-b13a9b14c47c	loan_repayment	400	Loan repayment from UMA.(Teacher)	payments	7f1f524f-8b67-4b3a-b6e1-ec7bfb273e12	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-08 05:08:08.522537+00	f	\N	\N
231fdada-04fa-4fb8-9d84-b2a6c2a53ff7	loan_repayment	250	Loan repayment from Ramya(Murugan T kadai) 	payments	8b43111b-35e6-40e0-a24c-def20536a0cf	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-08 06:28:31.434354+00	f	\N	\N
4b2b1c97-97c6-49bf-8219-48b82d333edf	loan_disbursement	17000	Loan disbursed to Sathya (Tailor)	customers	35038458-ade9-412d-877d-814bb95adf5d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-08 08:15:42.440085+00	f	\N	\N
561ce197-131a-46ba-9b42-9ee70a1ca649	loan_repayment	200	Loan repayment from Vengatesh.Mec	payments	1a39912c-e307-4b94-9f67-d1a2cce91b7d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-08 13:09:38.682843+00	f	\N	\N
a65c3208-505c-4064-bad9-319bed0d6913	loan_disbursement	17000	Loan disbursed to Stella Mery	customers	dede5547-d440-4d63-a9ac-ad427b2895c9	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-08 13:22:13.369978+00	f	\N	\N
05a63e2a-c037-451f-8905-f662119bbd3d	loan_repayment	600	Loan repayment from Murugan(Tingar)	payments	2534076d-9248-4e25-8587-a21bdf3c8001	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-08 13:25:34.314122+00	f	\N	\N
c65b94f5-17cb-49eb-8d90-55fad19660d4	loan_disbursement	12750	Loan disbursed to Murugan(mec)	customers	271816e2-6379-480d-92c3-c5f6fc561298	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-08 13:40:49.545972+00	f	\N	\N
0a67ea69-ee8b-419c-8b4a-5c3bef0bd290	loan_disbursement	17000	Loan disbursed to Karunakaran	customers	9ef2ed06-c135-411b-9768-fe38919bf751	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-08 13:46:42.658629+00	f	\N	\N
afc7c48d-9d85-4e6b-9c21-3a811ad6b0d7	loan_disbursement	42500	Loan disbursed to Karthi.Suba	customers	f35169da-5d69-4e7e-a35e-ed6237a94cff	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-08 13:50:11.205047+00	f	\N	\N
bf4c19e5-6804-46b3-a63a-dbb131ea668c	loan_repayment	1000	Loan repayment from P.Mariyappan	payments	7a65fa46-d5f5-4d1f-967f-21d8dd97f967	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-08 14:01:30.220643+00	f	\N	\N
2ff4160c-08d7-4afb-a1c9-f8c4924a1a8f	loan_repayment	200	Loan repayment from Rubini	payments	497b9003-53d0-4b32-8d9f-f8cbb95bd06e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-08 14:56:14.457794+00	f	\N	\N
218c408b-203e-40ea-a8fa-c814eb7c6a8e	loan_repayment	900	Loan repayment from D.Shankar	payments	19903755-dffd-43bd-adb6-664a2d9fdbe9	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-08 14:59:27.276366+00	f	\N	\N
510d9831-84c5-4f95-88b2-6ac47d7460ae	loan_repayment	1000	Loan repayment from Varanasi.Ayyer.	payments	de627be6-871b-469d-a550-398e883917a8	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-08 15:05:02.365063+00	f	\N	\N
d7dea99d-e421-42e4-b762-cb9309ee8e8e	loan_repayment	400	Loan repayment from Lakshmi.(Tiffin)	payments	db550ffc-356b-4ea2-a08a-cd105f6efe2d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-08 15:18:54.2953+00	f	\N	\N
2a49d4a6-50b9-4be5-8bb4-9b46b3c421dc	loan_repayment	1500	Loan repayment from Thangapandy	payments	96d7e673-3604-4629-9d9f-b404ae694bfe	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-08 15:25:20.940395+00	f	\N	\N
48c9496d-08a8-4c3e-8ef5-4956e3d33d22	loan_disbursement	17000	Loan disbursed to Nandhini	customers	db6c8835-21b0-4c54-b4ff-2e6ec0441891	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-08 15:43:03.436435+00	f	\N	\N
11ea32f4-9bd3-4d8f-8cdb-ecebe9913608	loan_repayment	500	Loan repayment from Vasu (iyyar)	payments	0a34c205-dbd0-45fb-b5b0-7cb6b929f5a6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-08 15:45:34.803729+00	f	\N	\N
bcbfedee-7280-4b35-a227-0d17bd506e62	loan_repayment	1000	Loan repayment from Brijesh	payments	2540a1ba-ae90-41e3-a444-398c30f88825	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-08 16:28:24.912459+00	f	\N	\N
4ac8b551-4202-449c-afc2-db43ca230861	loan_repayment	400	Loan repayment from Veeramani (vaiko)	payments	ca89b9fb-00a7-43f7-bc45-b9dbab51c838	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-08 16:28:55.731977+00	f	\N	\N
2fb4bf24-e98f-4460-9a3c-9e0ebf230a4f	loan_repayment	300	Loan repayment from Raja (auto)	payments	5e731031-2f01-42c9-8a93-472563c77003	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-09 05:47:10.256237+00	f	\N	\N
577b9d06-c9a8-4c44-9438-2cd26d70fd44	loan_repayment	1200	Loan repayment from Sriman	payments	0bb22d22-9a8e-4d20-b85d-4750e2d26fab	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-09 06:46:25.117546+00	f	\N	\N
356881db-e799-4c36-91d4-9b0774b02313	loan_repayment	600	Loan repayment from R.Kumar (Yazhini)	payments	0623ca02-4592-41a4-b9b1-7694c0d663b3	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-09 09:17:39.534203+00	f	\N	\N
eb42c7e5-6570-49ae-8d4d-307ebae0a375	loan_repayment	400	Loan repayment from S.Murugan.(Sekar)	payments	a20c87c6-1dbf-4a97-81d7-a079c669075c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-09 13:18:41.721328+00	f	\N	\N
15c565d6-ca8e-4aec-b6a8-b0b06d319656	loan_repayment	500	Loan repayment from Vasu (iyyar)	payments	86dbd770-459b-4673-8652-39f687146923	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-09 13:51:31.13044+00	f	\N	\N
26dfc976-119c-47ad-96c7-fc6bf2304f92	loan_repayment	300	Loan repayment from Raja (auto)	payments	7809976f-7c08-48f8-8e65-fe1df29af835	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-09 14:14:01.999644+00	f	\N	\N
65b3f92c-e0b2-44ad-9b20-4a7028775829	loan_repayment	600	Loan repayment from Murugan(Tingar)	payments	8666f60a-50a3-4567-9974-8d6dda3ba247	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-09 14:18:21.989031+00	f	\N	\N
8c8813a8-4b31-4d27-93f4-2b78793882e4	loan_disbursement	25500	Loan disbursed to Selvam.Ration	customers	80752817-7c75-426b-a97e-361b246ec563	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-09 14:26:11.420075+00	f	\N	\N
24f7799e-391c-43cc-9b56-7d8b1b021ffa	loan_disbursement	25500	Loan disbursed to Sudhagar	customers	0d8641d3-1860-4dac-8f9c-a7362226fe97	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-09 14:34:36.663518+00	f	\N	\N
b73667ce-ce37-4c63-8921-e5e478be8769	loan_disbursement	21250	Loan disbursed to R.Murugan(Auto)	customers	32e40b35-8c4b-4552-b8b8-7c233d31c03d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-09 14:39:36.395087+00	f	\N	\N
6d707638-27f5-4bf6-a1a4-16c748d39c24	loan_repayment	400	Loan repayment from Karthikeyan	payments	02e83fee-4827-48c9-9a94-74df2e5c0b1b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-09 14:45:12.445322+00	f	\N	\N
afb1bc19-26c7-4cb2-adf5-7e9892fec5cb	loan_repayment	1500	Loan repayment from Thangapandy	payments	c6966fb7-1efe-4ca6-9f2d-be2aef2330d7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-09 14:45:47.996217+00	f	\N	\N
b1f1f569-4796-43e6-b83e-1f1dcdf6a796	loan_repayment	100	Loan repayment from Divya (poo kadai)	payments	e303f872-8dca-4f5a-aab9-a2d8ed40e37e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-09 14:57:12.744295+00	f	\N	\N
d3d8489a-4923-4a48-b16b-dcd419f85e55	loan_repayment	200	Loan repayment from Divya (poo kadai)	payments	32b55bc7-774b-4782-b801-1613b3f8b3b1	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-09 14:57:55.568281+00	f	\N	\N
413db58c-d6d2-4e2d-a060-27c55209332b	loan_repayment	400	Loan repayment from Lakshmi.(Tiffin)	payments	0392bb2b-948e-4d22-a5ac-3f3558a59559	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-09 14:59:13.082199+00	f	\N	\N
f56a293a-6cbc-4398-a59b-b04af17f0afc	loan_repayment	250	Loan repayment from Ramya(Murugan T kadai) 	payments	eaa254fa-0a7b-471a-92fd-1f7638ec632d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-09 15:09:07.955376+00	f	\N	\N
c12132cc-0644-4223-9e0f-40f920d206bc	loan_repayment	400	Loan repayment from Sathya (Tailor)	payments	b2f770fd-bcb0-4e7c-ba82-6605a036b1bc	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-10 04:11:14.586551+00	f	\N	\N
415dc19f-e0c7-4ce0-9a78-5eb2c5f02c84	loan_repayment	2000	Loan repayment from Brijesh	payments	526fa40c-4ba1-469f-bb46-64dbe672647c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-10 05:40:29.889695+00	f	\N	\N
504aefa2-1102-48a2-8127-daaeeb1b0d31	loan_disbursement	42500	Loan disbursed to Bhavani (Vijayakumar)	customers	b2f4bd25-a426-4b1a-b0f6-3ef0115ba281	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-10 05:57:13.793805+00	f	\N	\N
c89c53c3-ff18-4e69-9db1-11f806c700ec	loan_disbursement	59500	Loan disbursed to Chandran.(Malathi)	customers	84cf3d8e-64cc-4a90-8b33-12c94640d00b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-10 06:04:18.74435+00	f	\N	\N
bc68ffc4-c3f5-41a5-91c8-3bb966ca5da4	loan_repayment	1200	Loan repayment from Teja	payments	8a770b0f-be2a-4340-86c4-a0126a64388b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-10 14:27:52.688427+00	f	\N	\N
c32fafe4-f0f3-404e-a049-e7f98a6664f3	loan_repayment	200	Loan repayment from Vengatesh.Mec	payments	f35376b3-507a-4345-8295-059b5c7aacfe	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-10 14:30:52.46157+00	f	\N	\N
f3cf2569-50a0-438d-aed2-e16a01686d33	loan_repayment	250	Loan repayment from R.Murugan(Auto)	payments	d1f017a6-1a46-4a5f-9092-0e6e23402759	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-10 14:48:42.149082+00	f	\N	\N
0d7f0fea-e802-40dc-ab79-cb6c0aa131be	loan_repayment	900	Loan repayment from D.Shankar	payments	5649349c-f1d1-495c-a4fb-6e314c9e3a87	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-10 14:50:59.067041+00	f	\N	\N
97e0511e-4e30-4811-91bc-c2b2064f647b	loan_repayment	200	Loan repayment from Ramesh(Pori)	payments	b2a344be-70f6-4316-93b3-983519f0e0dc	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-10 15:01:13.639943+00	f	\N	\N
190ffe8a-d2ea-49f8-9f00-59769effb6e6	loan_repayment	400	Loan repayment from Ramesh(Pori)	payments	8ed20cdc-8e04-4fe9-8692-868850a8029b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-10 15:02:34.424239+00	f	\N	\N
03516d09-172b-4ef4-9387-e4c3280bb980	loan_repayment	100	Loan repayment from Divya (poo kadai)	payments	e61462c0-de47-4256-8192-7baf418ac88b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-10 15:03:37.834947+00	f	\N	\N
1c69c43e-8441-40eb-b91e-5d6a20c424f1	loan_repayment	400	Loan repayment from Lakshmi.(Tiffin)	payments	f4689d11-0f87-498e-b239-27995f230be3	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-10 15:04:17.811332+00	f	\N	\N
c4dc2243-d6bd-488a-9851-507a6afe79d2	loan_repayment	600	Loan repayment from Ramanathan(Soop)	payments	64b41276-f894-4656-bd28-244b361980fe	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-10 15:05:58.801678+00	f	\N	\N
af244b58-7b50-4824-b027-23b4d92c033e	loan_repayment	400	Loan repayment from Karthikeyan	payments	14d7315c-afde-4911-87fd-88f66c9a5238	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-10 15:39:33.517234+00	f	\N	\N
f8f7405c-4753-43aa-8631-d862c9fcf7a1	loan_repayment	300	Loan repayment from Sudhagar	payments	62fed903-aa85-4044-8dd7-60b6d71e8d14	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-10 15:39:59.082963+00	f	\N	\N
634ed079-b769-460f-a925-f39ce56c65aa	loan_repayment	200	Loan repayment from Rubini	payments	ddfd4e04-a089-402e-ae40-ddd2693b318c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-10 15:43:13.2054+00	f	\N	\N
7ba09923-bee8-4df5-bf83-87c21f48cbf3	loan_repayment	100	Loan repayment from Raja (auto)	payments	077a876c-0558-4052-b47e-ca96f3fabd41	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-10 16:11:21.735304+00	f	\N	\N
d4449bce-e92a-4a5c-9621-e248a2376813	loan_repayment	400	Loan repayment from Veeramani (vaiko)	payments	c7ea0c52-f911-4ba8-b506-537521acc88f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-10 16:27:49.060184+00	f	\N	\N
86fb18f0-7d2e-432d-9568-56f31e740f80	loan_repayment	500	Loan repayment from Varanasi.Ayyer.	payments	97820943-ec29-48d9-a421-0e89cbb08661	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-10 17:10:58.496607+00	f	\N	\N
57baba86-9da6-4283-9270-3f3dae6e10ea	loan_repayment	1500	Loan repayment from Thangapandy	payments	cef2e994-9897-4b9c-a3ab-e0e2e8c330ba	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-10 17:12:15.800958+00	f	\N	\N
c6d82859-1226-40ab-b377-75099ebd26a3	loan_repayment	200	Loan repayment from Sathya (Tailor)	payments	bb93453d-4540-46ad-80bf-2bb7938e2203	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11 00:58:11.961606+00	f	\N	\N
08f2d9c2-8730-4cad-9e5c-8a857ac72829	loan_repayment	200	Loan repayment from Hari(Arvind)	payments	df47fbed-f7c5-4af7-a3f7-afd88249f105	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11 04:59:14.324833+00	f	\N	\N
45db957c-27af-4046-a043-320f83699ca7	loan_repayment	1500	Loan repayment from R.Kumar (Yazhini)	payments	44c0856c-8f77-4d60-b902-8427582d7348	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11 06:02:57.845654+00	f	\N	\N
2e4eb641-dae6-443f-a7c0-e335d8ab4920	loan_disbursement	17000	Loan disbursed to Jaffer	customers	d59ecb10-5af9-4f75-8f43-dfc52d537f0c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11 07:43:35.749035+00	f	\N	\N
40ad45a8-b52f-4eb5-842f-c54e10aecd6b	loan_repayment	600	Loan repayment from Murugan(mec)	payments	97274fbc-e38b-470c-9572-8781650b02d5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11 12:58:35.437084+00	f	\N	\N
2822758b-8bd0-4c08-aeef-53f574136c8c	loan_repayment	200	Loan repayment from Raja (auto)	payments	3b2c75be-5400-45d6-8262-fd9520fefedd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11 12:59:08.868403+00	f	\N	\N
e65bd130-5d68-4670-a173-887b092b1461	loan_repayment	200	Loan repayment from N.Manikandan	payments	3ea553fd-fed7-4ec5-9869-4156903abcd5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11 12:59:52.610674+00	f	\N	\N
5da75715-76de-44d4-a417-e3c8983a642c	loan_repayment	200	Loan repayment from S.Murugan.(Sekar)	payments	cba19104-5a88-46b4-b53e-ffee4378d3e0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11 13:00:33.958316+00	f	\N	\N
27914c61-b860-4ff5-abb2-a396d75efd11	loan_repayment	400	Loan repayment from Karthikeyan	payments	490f4fed-dccc-46de-b142-5500b6d17a3a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11 13:01:06.935373+00	f	\N	\N
8859b94b-e72a-480d-8117-179bec30b835	loan_repayment	500	Loan repayment from Karthi.Suba	payments	37b59b92-82c0-4b90-8a11-2b4f0e17b465	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11 13:01:46.783642+00	f	\N	\N
941c237f-aa3e-4cf7-b03f-455f1a757a8b	loan_repayment	500	Loan repayment from Hamsa	payments	f42f44d0-6b46-4303-ac5c-9c991caa73f7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11 13:02:19.875087+00	f	\N	\N
aaf3e9ba-0726-4e80-a103-0b2547cd5f24	loan_repayment	2400	Loan repayment from Sendhil (Sathiyanagar)	payments	f0b5657d-120b-4b19-9896-70e9c559c25d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11 13:11:22.578794+00	f	\N	\N
46e6fcf8-ce47-4001-87e7-0560305cf8ae	loan_repayment	700	Loan repayment from S.Murugan.(Sekar)	payments	67af91cb-d8d9-4e91-a354-29e894c425ba	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11 13:13:37.535332+00	f	\N	\N
05ec2c72-e8b4-4313-8b4f-ef471050fb04	loan_repayment	250	Loan repayment from R.Murugan(Auto)	payments	8c2a967a-d789-42c5-a4e0-2fd729a9f38c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11 13:17:03.221618+00	f	\N	\N
cfc6a7c1-fe23-4ffe-8fa3-4c9ac97a1604	loan_repayment	3000	Loan repayment from Rajagopalan	payments	3a83bc8d-f3f9-47c8-93e3-659bedbefa4a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11 13:42:09.385379+00	f	\N	\N
0d2dce7b-8de1-464f-aabd-ded4e85cbbbc	loan_repayment	300	Loan repayment from Sudhagar	payments	d9414b0e-d575-4b4a-9352-b80b7e35989a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11 14:02:02.912971+00	f	\N	\N
a313d492-aa93-4bfd-9243-6501a231ef82	loan_disbursement	51000	Loan disbursed to Baai ( Thaadi )	customers	cf301afd-a3ed-4bea-9794-b4fe432d8861	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11 14:06:40.19513+00	f	\N	\N
590fed2b-810a-478d-8a9e-937e9e14cf74	loan_repayment	300	Loan repayment from Sudhagar	payments	3837afe6-7aad-48a0-a327-18610f82fdac	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11 14:14:43.744486+00	f	\N	\N
6cad75c3-ee2f-45c5-9267-85cc62baf2a1	loan_repayment	1500	Loan repayment from Kumaravel.megic	payments	4d1c4be6-b166-409a-af2a-2c22c8049677	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11 14:42:22.244706+00	f	\N	\N
06c6216e-e944-498e-a95f-9592b6d22457	loan_repayment	1000	Loan repayment from Brijesh	payments	125d046e-f6e5-434f-8aa3-a714a5d9098d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11 14:44:10.658073+00	f	\N	\N
7b996731-0720-4d36-94dc-59491c8304e6	loan_disbursement	25500	Loan disbursed to Gopal (Veg)	customers	a0d4dce0-9bdd-4cf1-ad5d-1c95cf18e2dd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11 15:07:36.727884+00	f	\N	\N
b79d037a-3e29-4384-a825-4594f81dc86b	loan_repayment	500	Loan repayment from P.Mariyappan	payments	71f84a6b-18f5-4db2-a4c2-0c16f5ac2468	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11 15:09:35.721384+00	f	\N	\N
556584d1-2b54-4c68-9485-67e2c460284e	loan_repayment	200	Loan repayment from Rubini	payments	bf586be8-4695-4678-abe5-fc859cb94954	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11 15:09:57.19745+00	f	\N	\N
4692016a-0239-495b-bb10-17ab2c48451b	loan_repayment	3500	Loan repayment from Valli	payments	334515ff-b573-49cd-ba3f-122942b89e09	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11 15:32:41.348895+00	f	\N	\N
d644232e-0f72-4d0c-929c-35e489c6d20c	loan_repayment	300	Loan repayment from Ramanathan(Soop)	payments	6ac0ae33-6ac8-44d2-aa22-8f76bcc51961	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11 15:34:18.844775+00	f	\N	\N
22eedd83-2985-4484-bb4a-fcb30abccbdb	loan_repayment	500	Loan repayment from Bhavani (Vijayakumar)	payments	3847c586-b12e-47ed-bf6e-78f86ed71dd0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11 15:34:39.715781+00	f	\N	\N
ab741a6e-4666-4e78-b51f-66bdb40251ad	loan_repayment	1000	Loan repayment from Nandhini	payments	fd434d5c-11b4-43bd-87ff-e1388dfaf99e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11 15:35:06.560334+00	f	\N	\N
52120edd-a123-4559-94dd-90773dab2de9	loan_repayment	400	Loan repayment from Lakshmi.(Tiffin)	payments	c9b97046-e8b0-43c1-9344-8173884f5681	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11 15:35:35.020124+00	f	\N	\N
ad7142a2-6f7f-4e71-baeb-608b5ae0a36e	loan_repayment	100	Loan repayment from Divya (poo kadai)	payments	9e9a2bf1-a8fe-4c22-bae6-1608da73a8d4	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11 15:36:03.996352+00	f	\N	\N
ff5c9f21-da55-4048-b5d4-217205bf6c96	loan_repayment	1500	Loan repayment from Thangapandy	payments	466ef5f9-7beb-4930-8050-86f05b3dc1ab	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11 15:51:24.550451+00	f	\N	\N
1f736568-a190-45d9-b241-a53d8f36ee5e	loan_repayment	800	Loan repayment from Sriman	payments	e93b4ddd-ac21-454e-99ae-9d0d82f2be76	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11 15:51:58.295018+00	f	\N	\N
c4824a64-504a-4a00-8089-8cf55fc212c5	loan_disbursement	8500	Loan disbursed to Magesh(mec)	customers	34977a0a-e657-40cb-840d-a6df47bba8d3	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11 15:58:45.522586+00	f	\N	\N
02247900-eb27-4c29-9467-4b9792f7deb6	loan_repayment	400	Loan repayment from Veeramani (vaiko)	payments	0aa202b7-4155-45b5-a841-0b2808ab4373	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11 16:16:58.394052+00	f	\N	\N
a708439a-74e4-4327-a8e6-a15acb5d2427	loan_repayment	200	Loan repayment from Vengatesh.Mec	payments	35f2ef45-869c-4f42-b5da-bdcedfe2e7cb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11 17:06:09.641159+00	f	\N	\N
9ec8bccb-298c-4406-babe-d1f7e6d6cb72	loan_repayment	1000	Loan repayment from Vasu (iyyar)	payments	d632c3dc-8471-4f97-89b8-4314cab0db86	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11 17:15:13.181416+00	f	\N	\N
330f7ffb-55bc-4f14-a024-f7df2218871c	loan_repayment	200	Loan repayment from Sathya (Tailor)	payments	6df54090-3a4c-465f-952c-8aee8bbb51d4	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-12 04:59:50.180392+00	f	\N	\N
dfbd9b23-76a9-476b-81af-06b6df1785c1	loan_repayment	200	Loan repayment from Hari(Arvind)	payments	c580b97f-8153-4493-b5ec-aa950bf2ae8d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-12 05:20:51.427629+00	f	\N	\N
9984166b-7dd5-4912-b8a3-8ec5b3edc702	loan_repayment	600	Loan repayment from Baai ( Thaadi )	payments	40f1744b-e303-48a2-a568-8455adca08c3	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-12 06:11:45.631728+00	f	\N	\N
e873c49c-fb85-435a-923e-37b389072165	loan_disbursement	42500	Loan disbursed to E.Saravanan	customers	b16866ff-ba34-412f-aeea-fa734ccf88a1	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-12 06:38:46.199966+00	f	\N	\N
37cd341d-168a-42a6-a5c1-928ebbe2cce8	loan_repayment	2500	Loan repayment from E.Saravanan	payments	513165d3-10e6-46c4-a9af-20f94a98b382	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-12 06:43:58.809352+00	f	\N	\N
6b27bef2-b4ea-4fc5-be6b-e1073bc0ffd2	loan_disbursement	42500	Loan disbursed to Mani (Magic)	customers	e3325ec8-264a-41e1-a2d5-84fb33eb4412	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-12 07:16:18.264371+00	f	\N	\N
41c543d7-6f21-4be9-bf2b-11da4c8e430f	loan_repayment	300	Loan repayment from Gopal (Veg)	payments	08c0fd44-4577-4cdb-bbc1-a584899b246c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-12 08:02:40.3998+00	f	\N	\N
31ae36bf-78a6-42d0-b5eb-93b1ad517dd1	loan_repayment	900	Loan repayment from M.Ramesh	payments	c9ca384d-95ec-4f4b-9f2f-309bfb270edf	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-12 08:35:41.77289+00	f	\N	\N
fe76ce3b-ccbe-4523-9cad-49304085aa95	loan_disbursement	34000	Loan disbursed to S.K.Sendhil	customers	6340050f-5246-43c5-9297-d14267b9bad0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-12 13:50:57.74968+00	f	\N	\N
6059a4d6-2f07-4ea0-a7b5-fffc73a1d87f	loan_repayment	200	Loan repayment from Rubini	payments	fc206363-c0ed-4bb5-8784-d75881abc291	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-12 14:39:43.326562+00	f	\N	\N
9d9bce94-75f3-430c-839a-d6b47dd6459f	loan_repayment	300	Loan repayment from Kumaravel.megic	payments	0bd0a60b-3860-4635-a818-e945134b0bb5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-12 15:17:19.625279+00	f	\N	\N
24608ac1-8162-40af-95fb-abade9ae4595	loan_repayment	300	Loan repayment from Ramanathan(Soop)	payments	7b32a6b9-338a-44f9-a9cc-64b985db8850	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-12 15:17:53.74429+00	f	\N	\N
d5a384b2-138e-4a3c-b6f7-c02067b3734e	loan_repayment	200	Loan repayment from Ramesh(Pori)	payments	66d17daf-b316-4d48-9d3d-b1a492574354	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-12 15:18:26.461553+00	f	\N	\N
4160f4cc-e6af-414b-acfb-c39a7602e7eb	loan_repayment	400	Loan repayment from Lakshmi.(Tiffin)	payments	48615d17-6bd9-419d-baae-862fbdf34b96	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-12 15:18:56.191142+00	f	\N	\N
01a0553f-babb-4d5b-bdd1-89df20b0f3d0	loan_repayment	100	Loan repayment from Divya (poo kadai)	payments	6388b20f-ba02-4570-8223-e19041ef4b3e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-12 15:19:35.171288+00	f	\N	\N
98aff4f0-e448-4ecb-9f15-9a63e39e58a2	loan_repayment	500	Loan repayment from Bhavani (Vijayakumar)	payments	1731abe9-62f5-42a4-8d40-52f9d39ecee7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-12 15:19:53.117174+00	f	\N	\N
0965897f-6caf-44a9-a5ce-6a0f1b969dd9	loan_repayment	200	Loan repayment from Jaffer	payments	c0826dea-91d6-45fc-9b4d-7f04984ac48e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-12 15:20:19.93407+00	f	\N	\N
3e116c65-c05c-490a-b412-136db7b711ba	loan_repayment	250	Loan repayment from R.Murugan(Auto)	payments	b9bd993d-d580-45d7-8e78-31e077ed49d1	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-12 15:22:59.969735+00	f	\N	\N
0c775720-681d-4274-b594-401e3310c3ee	loan_repayment	200	Loan repayment from Raja (auto)	payments	dcc6f3c3-e4f7-41fc-af81-95c93d4a3412	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-12 15:23:30.462015+00	f	\N	\N
7ea6c95c-e97a-4d7c-b646-450b05814207	loan_repayment	500	Loan repayment from Hamsa	payments	714244c7-1c63-474a-a677-20a7fa539879	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-12 15:36:31.846094+00	f	\N	\N
bd53368d-43d2-473f-a7ab-fe18bce3976c	loan_disbursement	34000	Loan disbursed to Karthi (School)	customers	f8e88dc3-4e2d-4526-b66d-743bc434bc6e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-12 15:52:48.740981+00	f	\N	\N
0144623d-7237-45bc-9d0f-cce223c8de49	loan_repayment	1500	Loan repayment from Thangapandy	payments	0ff86a11-923e-4af2-960e-114dd27d80c4	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-12 16:12:55.121627+00	f	\N	\N
8feadd2e-d97f-4d18-8098-af49d7a71eec	loan_repayment	500	Loan repayment from Ramya(Murugan T kadai) 	payments	7963ebc0-3114-4fc4-8a0b-82e65f7eb44c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-12 17:10:15.847254+00	f	\N	\N
6728b115-0116-4870-a0e6-20143a512c91	loan_repayment	600	Loan repayment from UMA.(Teacher)	payments	d126674b-eead-4e36-b77a-82c07de02eb6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-13 02:14:53.724708+00	f	\N	\N
a489e2e6-68ca-47a9-b150-55e0bdf668c8	loan_repayment	1000	Loan repayment from Varanasi.Ayyer.	payments	3e3d0c79-a211-4396-90a1-0ce082eeec5a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-13 02:15:46.365833+00	f	\N	\N
f229072a-1bcc-4af4-8249-8dd6a78eaca9	loan_repayment	100	Loan repayment from Magesh(mec)	payments	16af34d1-4f9b-4904-9aa6-91180cf38014	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-13 02:16:38.589988+00	f	\N	\N
a6000656-6f6a-481d-a364-ae2de9bc1fd4	loan_repayment	600	Loan repayment from Sudhagar	payments	6b222d4d-95c4-44d0-b201-8f4fe7678325	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-13 04:58:14.920726+00	f	\N	\N
53cddccf-3621-4675-bbcc-d385612a3367	loan_repayment	400	Loan repayment from Karthikeyan	payments	e5960bdd-d1f3-4744-bc53-525eb618d8f1	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-13 04:59:14.376217+00	f	\N	\N
f72d6c5e-f3db-4bcc-837f-816e76010487	loan_repayment	500	Loan repayment from Mani (Magic)	payments	7358bfa9-c160-4280-896d-cdc8f5c4fd6b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-13 07:20:33.508194+00	f	\N	\N
a14fdc56-6692-4b16-bae4-5c1f8c6a0923	loan_repayment	600	Loan repayment from Ilaiyaraja (Auto)	payments	4a4cf73a-c012-4fff-8621-7c58e1c6921b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-13 07:20:59.930198+00	f	\N	\N
c07738f3-43f4-441a-aa3c-917902129aec	loan_repayment	300	Loan repayment from Gopal (Veg)	payments	06927fb7-36a1-4686-a03c-6613be48d686	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-13 12:30:12.254342+00	f	\N	\N
66fe55f4-48d0-423f-8228-1732ca33daf4	loan_repayment	100	Loan repayment from Magesh(mec)	payments	03753064-10ee-452a-b097-2980c427fc27	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-13 12:31:01.61951+00	f	\N	\N
79309c4b-c1f5-4547-a178-64b4a0f42e0d	loan_repayment	300	Loan repayment from Raja (auto)	payments	5b8d13bc-5ce6-4d77-8d3a-968cfbf997c1	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-13 12:32:07.796401+00	f	\N	\N
3904c856-fda0-44ef-983d-5a04548b5a64	loan_repayment	1200	Loan repayment from Sriman	payments	4d25b1fa-1dae-4f4f-980c-a9f2f74df95a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-13 12:33:06.379515+00	f	\N	\N
c9c66538-4973-4ff3-b313-866a21b587ea	loan_repayment	1000	Loan repayment from Vasu (iyyar)	payments	4f15c35d-4aad-4b17-8d2c-7ac31c18e641	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-13 13:17:45.469361+00	f	\N	\N
95a16c27-ab3a-4ad0-bb6a-94f67ff6cb00	loan_repayment	200	Loan repayment from Vengatesh.Mec	payments	2b4c0065-2a38-4cf7-a462-db612f4fecc8	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-13 13:18:57.851548+00	f	\N	\N
23ef14da-1595-476b-9b95-7cc697bb32d0	loan_repayment	250	Loan repayment from R.Murugan(Auto)	payments	51cd875b-288e-4b4e-a750-ff53ececec99	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-13 13:40:26.376725+00	f	\N	\N
70d9b5eb-c2c9-4ad0-9de1-3e8ed93763ce	loan_repayment	2000	Loan repayment from Brijesh	payments	17c8fa75-2127-4420-a8c8-8f6b13c06d7e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-13 13:41:21.180164+00	f	\N	\N
d097d271-7a99-4657-94b8-452054ca2c7c	loan_repayment	600	Loan repayment from Sudhagar	payments	7242928a-aea1-4660-86b2-659913d7ad76	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-17 13:18:57.4653+00	f	\N	\N
d06d0c4f-c9ee-4175-bc46-43985ca8f4d1	loan_repayment	600	Loan repayment from Baai ( Thaadi )	payments	877dbd71-cf76-4873-b56a-5a6370c5bf7c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-13 14:19:35.346699+00	f	\N	\N
d0ee2758-47ff-4d18-a43f-f37d95843757	loan_repayment	200	Loan repayment from Rubini	payments	ba9b3ab8-e9f0-44a3-bc38-e23e4930e0e6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-13 14:22:15.702568+00	f	\N	\N
ace2ef22-7169-4b61-a679-8ea12a2122bd	loan_repayment	400	Loan repayment from S.K.Sendhil	payments	b300d930-9290-4dac-bc13-d16ad47df643	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-13 14:38:42.898103+00	f	\N	\N
a0ce5b6f-f0bc-41a5-824b-05017cd36562	loan_repayment	400	Loan repayment from Veeramani (vaiko)	payments	1527867b-5386-46e6-8bee-ef3e524c01e0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-13 14:46:34.822985+00	f	\N	\N
d04c3b3e-e0d8-4698-8c4b-f008b7695500	loan_repayment	100	Loan repayment from Divya (poo kadai)	payments	555ded46-890c-4337-a16a-fb812e4272df	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-13 14:48:20.334577+00	f	\N	\N
85149670-ad9c-4ffc-a0d2-1e35316bb53f	loan_repayment	400	Loan repayment from Lakshmi.(Tiffin)	payments	a0801d37-083c-4ea6-9915-072bedec79f1	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-13 14:48:45.028237+00	f	\N	\N
dd034e59-d6cf-49a1-9b5f-b32a12be848d	loan_repayment	200	Loan repayment from Ramesh(Pori)	payments	14bcfb50-9d65-41a1-b952-0afb100863f0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-13 14:49:10.206825+00	f	\N	\N
22f99b7b-e35e-4abc-87fa-d31a6401e822	loan_repayment	300	Loan repayment from Kumaravel.megic	payments	13ac0eaa-2e00-4915-a87f-cd812738abee	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-13 14:49:49.888716+00	f	\N	\N
85cd7b0a-63ed-421d-935e-4719a63708a7	loan_repayment	500	Loan repayment from Karthi.Suba	payments	4f40010e-6b16-48e0-8e97-71dc06f5fc08	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-13 15:46:42.612021+00	f	\N	\N
84967c2b-a7e2-4522-a37a-923e1601cb22	loan_repayment	1500	Loan repayment from Thangapandy	payments	fa4d10dc-1222-449c-bc46-bd69e94a15a8	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-13 16:50:00.714279+00	f	\N	\N
1bfbb3c8-1593-4a35-9d82-db29fe4d0775	loan_repayment	200	Loan repayment from N.Manikandan	payments	ebc0623a-dc30-476d-8744-581380609654	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-14 00:24:45.078615+00	f	\N	\N
30f23d56-644c-46e7-9349-9a7b885a0c19	loan_repayment	300	Loan repayment from Gopal (Veg)	payments	2a98d597-08db-4117-b7ec-dd82a447bbe2	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-14 07:27:32.68516+00	f	\N	\N
97d1d5f3-d7d4-4cd3-9add-ffcbc77be3f2	loan_repayment	1200	Loan repayment from Selvam.Ration	payments	ea1319d5-0f67-4c82-b42a-c57ce32b53f5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-14 08:21:00.204438+00	f	\N	\N
dd25eb55-88b5-4be8-b0bc-5fabc612b7ea	loan_repayment	200	Loan repayment from UMA.(Teacher)	payments	50c2bca4-c7fb-4c91-8f67-4882b7aa0a45	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-14 13:41:57.357699+00	f	\N	\N
f23a6155-8eed-478e-9b88-ab972fbbd45c	loan_repayment	900	Loan repayment from D.Shankar	payments	6f8d4fb5-ead4-4b3f-9671-43abda4d0564	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-14 13:47:05.574323+00	f	\N	\N
6a2b92bb-4e08-4576-a1ea-234bca7cd621	loan_disbursement	17000	Loan disbursed to Chizhan. DMDK	customers	cf6ae0f5-381e-455f-8bda-1dda692f14a4	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-14 14:09:19.45901+00	f	\N	\N
3cfc3bd6-6eb8-4729-a915-a154aff30ba7	loan_repayment	250	Loan repayment from R.Murugan(Auto)	payments	ad885a32-e2d4-4f65-8fe4-1099faf905ae	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-14 14:11:07.51585+00	f	\N	\N
2855a3c8-f765-45e2-a317-8ac171a77c6d	loan_repayment	200	Loan repayment from Rubini	payments	e3d889f8-e122-4be1-b96d-87c122ccefc8	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-14 14:41:29.042499+00	f	\N	\N
1805997f-828e-4a12-aa12-695e966bf88a	loan_repayment	200	Loan repayment from Jaffer	payments	3329f0d9-1bb8-43e7-b6a1-010b1ae14e0d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-14 14:50:14.350616+00	f	\N	\N
cd03e651-ca59-4456-afbf-7782311c069a	loan_repayment	100	Loan repayment from Divya (poo kadai)	payments	cf72b313-50d7-4422-880c-020ebf187a8e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-14 14:50:46.482986+00	f	\N	\N
7bfd584c-527d-4372-8a4b-17c7c8d8b330	loan_repayment	200	Loan repayment from Ramesh(Pori)	payments	751084fa-4f53-4444-a10b-a5420a756b7a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-14 14:51:09.140153+00	f	\N	\N
f467dbcc-03cf-4046-b276-0abf449b4433	loan_repayment	200	Loan repayment from Veeramani (vaiko)	payments	1d70d34d-dcec-44ab-bbee-bf0ac8279ef8	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-14 14:58:51.756614+00	f	\N	\N
8379477d-e437-491c-b843-6a6937f82031	loan_repayment	200	Loan repayment from Sathya (Tailor)	payments	7ed544c9-b2c1-48b6-a07f-db23e59a837a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-14 15:12:04.096183+00	f	\N	\N
b2b03408-932a-45f7-88eb-3d10daad207b	loan_repayment	400	Loan repayment from Karthikeyan	payments	01776f43-6b89-4461-9e92-bc4ecfba9bc2	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-14 15:12:34.338835+00	f	\N	\N
ad9ba349-177b-47c9-acd5-8e311e43c648	loan_disbursement	42500	Loan disbursed to R.Gopi (Auto)	customers	e0fca0e1-df99-497f-87e4-41be32ec1780	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-14 15:18:23.201547+00	f	\N	\N
c2f80350-eb26-4736-a8fd-5ec7ec6df8a8	loan_repayment	1000	Loan repayment from R.Gopi (Auto)	payments	1e16cfdb-7596-4ae3-ad0d-bbebb130b713	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-14 15:27:48.268128+00	f	\N	\N
89ae85de-0fc1-456b-9e46-e9dd052dba7f	loan_repayment	100	Loan repayment from Raja (auto)	payments	8aa7dc44-2acc-4344-937f-47dfcc90ad5d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-14 15:28:52.043567+00	f	\N	\N
f24bd98c-5093-4172-a4b0-33d05d9d1b34	loan_repayment	1000	Loan repayment from R.Gopi (Auto)	payments	f4d77a74-d4e0-4c9f-b55f-09296fdcca9d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-14 15:31:03.209108+00	f	\N	\N
5f071d15-ee07-4131-860f-0faecd35d2c2	loan_repayment	500	Loan repayment from Karthi.Suba	payments	696f2560-ba62-4a5c-b4c4-a3bf54f11c67	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-14 15:44:56.255847+00	f	\N	\N
cce70ef7-3b7a-4bf6-97c2-8f83f7b598ae	loan_repayment	1500	Loan repayment from Thangapandy	payments	219d14db-ae44-4f87-bc74-5d2980d3ddcb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-14 15:45:28.450363+00	f	\N	\N
56f23446-e6a4-40a2-86a0-ee8b49bac722	loan_repayment	200	Loan repayment from N.Manikandan	payments	0a10d42a-29d6-45a8-a830-bd63594631c9	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-15 00:38:23.543749+00	f	\N	\N
190359a1-2e15-47d6-a029-c9f13e73e439	loan_repayment	100	Loan repayment from Magesh(mec)	payments	8c2f5b37-cdd8-4724-9299-4cf8ca192252	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-15 00:39:34.034785+00	f	\N	\N
aff2ef23-b90f-46fd-ae34-a63f2daeccc1	loan_repayment	1200	Loan repayment from Sriman	payments	709e18a6-c483-4df5-a5bb-513667887e11	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-15 02:31:40.42773+00	f	\N	\N
1e11801d-7fec-4518-a4d2-3a1eca4aeeec	loan_repayment	800	Loan repayment from S.K.Sendhil	payments	9057df1b-b15a-4d43-a774-44dd2adf1c8f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-15 06:29:21.05492+00	f	\N	\N
4e255fe0-c715-4b2a-bb74-f8e4efd1f526	loan_repayment	1200	Loan repayment from R.Kumar (Yazhini)	payments	31d76446-9fd6-41bf-8b72-e45b28c33d2c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-15 06:30:15.82146+00	f	\N	\N
113c1a06-fd39-4367-84e6-eb1f547b4f18	loan_repayment	300	Loan repayment from Gopal (Veg)	payments	c8d68d12-6606-40aa-b8fa-7febdb351b0d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-15 08:14:20.253085+00	f	\N	\N
338ce1c0-f5bd-499a-a6e3-0f541391bf5e	loan_repayment	200	Loan repayment from N.Manikandan	payments	adac8564-7043-411a-bd1e-7399705d3ddb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-15 13:37:35.87746+00	f	\N	\N
a4bbc5e1-ef72-4507-9d33-69c4dff4972a	loan_repayment	1500	Loan repayment from Thangapandy	payments	70b7e0f6-c925-4509-8ee4-8fab03eeef50	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-15 13:38:18.922229+00	f	\N	\N
b56e57af-0c47-47b3-b90d-9434fdc0c9eb	loan_repayment	100	Loan repayment from Magesh(mec)	payments	85d4fdfd-3a4d-43c0-b717-0ca401f639ee	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-15 13:38:52.067774+00	f	\N	\N
ac4614c7-0fdc-436a-9490-7dcc42354ac6	loan_repayment	1000	Loan repayment from Mani (Magic)	payments	ac0db5e9-373b-4bc1-ac55-1978d5acd487	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-15 13:42:36.762886+00	f	\N	\N
8ed240e2-314e-4ed0-ae41-6612a30fbe42	loan_repayment	250	Loan repayment from R.Murugan(Auto)	payments	af711b83-3fd9-4d43-973b-fc3a7db50997	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-15 14:26:50.669493+00	f	\N	\N
318a1a77-bddc-4033-a00d-1ecdd60e3ccd	loan_repayment	200	Loan repayment from Rubini	payments	0e2ec9ce-03c5-4d3d-bf73-6f1d9bb671d1	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-15 14:28:08.719187+00	f	\N	\N
a4f9df24-3842-4095-bf1e-e2c56a0f349d	loan_repayment	1200	Loan repayment from Baai ( Thaadi )	payments	e29bd665-0633-4420-87ac-14b128ad81a4	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-15 14:51:47.813921+00	f	\N	\N
8addfe7a-3b16-4be6-93b0-7c591e6b0f41	loan_repayment	300	Loan repayment from Murugan(mec)	payments	8f7d646e-ffe1-4939-82e4-b9226016f546	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-15 15:09:01.093754+00	f	\N	\N
0fd11b0d-d418-4794-8d1a-b88005919fab	loan_repayment	100	Loan repayment from Divya (poo kadai)	payments	0bc50568-7bd3-4819-9f6b-187ca8818b0d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-15 15:09:22.429856+00	f	\N	\N
77352e1e-9b2c-4f2e-b125-260d278b92d9	loan_repayment	200	Loan repayment from Ramesh(Pori)	payments	40dfbc91-85db-4264-8985-b321f9b321a9	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-15 15:09:39.631286+00	f	\N	\N
daf83427-e13c-43d5-b830-57ff3f2785d2	loan_repayment	400	Loan repayment from Lakshmi.(Tiffin)	payments	fb6b5211-5c62-41a9-b156-02b1f840b42b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-15 15:09:56.51244+00	f	\N	\N
9245d426-d2dc-48ad-8efd-69736442525a	loan_disbursement	17000	Loan disbursed to Prathaban.R.O.Water	customers	b86ae36d-afe4-41a9-8d69-af6178efda6c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-15 15:24:50.81723+00	f	\N	\N
ac71b5a2-eef3-4336-b012-552e2f4cf9b6	loan_repayment	200	Loan repayment from Vengatesh.Mec	payments	e82aa8a2-d6c3-4c6e-b405-cbef50fb00cb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-15 15:25:31.708287+00	f	\N	\N
a79808b4-4cdc-4028-a4ba-63dab2f871ca	loan_disbursement	17000	Loan disbursed to Balamurali (sekar)	customers	6245a2e8-2eb5-4d5f-8b8a-aac817bfee18	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-15 15:36:43.648335+00	f	\N	\N
3be79abe-58a8-4dc7-ba47-dd78481e0ede	loan_repayment	100	Loan repayment from Raja (auto)	payments	68dc72a3-0b94-4d55-bae5-732dfdd4aa4b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-15 15:44:09.323841+00	f	\N	\N
fe3d32e0-e27b-41f1-9ec2-992f021c44bc	loan_repayment	200	Loan repayment from Veeramani (vaiko)	payments	dfe63303-efea-4c50-b5b3-e62d81a57610	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-15 15:49:26.568166+00	f	\N	\N
20d432e8-587d-4ba0-8e38-706ca01cadf3	loan_disbursement	17000	Loan disbursed to Rajaselvam	customers	22d10045-ef1c-4807-9278-c35dbb01d73f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-15 15:58:16.475156+00	f	\N	\N
b05a9b8c-7c48-4f26-92f5-0f4dbd677345	loan_repayment	200	Loan repayment from UMA.(Teacher)	payments	3aee0178-ec99-4b05-ad53-930ff09a5e54	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16 00:53:50.82011+00	f	\N	\N
e038afb3-c543-4956-8b2f-b1bb68b13c78	loan_repayment	500	Loan repayment from Karthi.Suba	payments	1c4f1fee-ddc0-48cf-bf65-4f44ddf8b612	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16 00:54:55.242991+00	f	\N	\N
f842a7d8-af58-4982-906e-7c0434ac1ae3	loan_repayment	400	Loan repayment from S.K.Sendhil	payments	cbf65da6-d47d-4127-9db9-c18b53c6a461	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16 05:51:20.982061+00	f	\N	\N
4279ca76-3c95-4e6f-ab2d-60d09742d4fe	loan_repayment	1500	Loan repayment from R.Kumar (Yazhini)	payments	4b4b0e35-f049-471b-998a-b6eb414b9f42	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16 05:52:09.293519+00	f	\N	\N
5999596c-1e98-42ad-a692-e50bb4dee490	loan_repayment	300	Loan repayment from Gopal (Veg)	payments	02ce3201-4317-4654-8706-c194d6fc9a74	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16 06:29:07.515749+00	f	\N	\N
7f942790-7561-4d1a-9d47-cdda64690afe	loan_disbursement	17000	Loan disbursed to Manipaul	customers	fb079db0-2262-4017-bd24-5d42ca326ff9	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16 06:58:21.451681+00	f	\N	\N
eb69e178-e975-4bd5-9a21-96f0ad226378	loan_disbursement	17000	Loan disbursed to Magesh.sekar	customers	3292a221-dac6-489f-9624-6f993ac28f7d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16 07:20:21.350221+00	f	\N	\N
b6f9912f-2906-475f-94e3-9cfddd3f0576	loan_repayment	300	Loan repayment from Selvam.Ration	payments	cec7e085-dce2-4f49-b5ec-994b72935c11	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16 07:44:14.684942+00	f	\N	\N
6498ab44-12aa-456f-a584-e78f4c872219	loan_repayment	300	Loan repayment from Murugan(mec)	payments	05f239d9-15c9-4cfb-a780-def1b8963440	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16 08:01:57.279496+00	f	\N	\N
8068b0d2-36fe-4deb-a783-3df241d1f5e3	loan_repayment	1000	Loan repayment from Ramya(Murugan T kadai) 	payments	58201442-d696-42bd-a23f-ea6fbf92b770	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16 08:05:46.430267+00	f	\N	\N
b744732b-115d-44cc-94bb-f6f8bbd897d2	loan_repayment	1000	Loan repayment from Stella Mery	payments	13772ea1-911b-4dec-9c54-088d895b9ca0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16 08:35:42.227247+00	f	\N	\N
63d725d9-7c7a-4f3b-8468-d6e4254293e8	loan_repayment	3000	Loan repayment from Brijesh	payments	5f173cb3-6182-49a5-89b6-3da8dff8e926	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16 13:03:59.784109+00	f	\N	\N
36907db4-6f77-4b18-bee2-3635967185bb	loan_repayment	200	Loan repayment from Balamurali (sekar)	payments	2f31c31a-8a41-4f4a-b42f-fbd14cf08ad7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16 13:04:26.657969+00	f	\N	\N
819c4717-b202-4843-8e7f-519bf878c6f0	loan_repayment	200	Loan repayment from Sathya (Tailor)	payments	8ac7231d-f52f-4616-a547-b207acfb76f6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16 13:04:47.165647+00	f	\N	\N
9be17b05-1544-48d0-83e4-d84b092c81d6	loan_repayment	2000	Loan repayment from Rajesh ( Elc )	payments	94214d05-6875-42db-a44f-894a64a06958	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16 13:51:04.833297+00	f	\N	\N
144e0ec6-4220-4d5e-90c3-a165da35502e	loan_repayment	100	Loan repayment from Magesh(mec)	payments	a7b86ae9-d883-4c8a-9e3a-1da4b55f1ba5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16 14:13:09.822727+00	f	\N	\N
f8dcab40-3051-4c31-9f88-409c7e9aa27a	loan_repayment	250	Loan repayment from R.Murugan(Auto)	payments	eec7691d-f8c3-4c0a-a414-81de42d11fd8	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16 14:13:50.327369+00	f	\N	\N
fe165881-180b-4635-a9d3-2cfc2d84fc49	loan_repayment	200	Loan repayment from Rajaselvam	payments	861c564d-e6a5-4312-8f86-7e8fd37cff3f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16 14:28:18.285235+00	f	\N	\N
bc84cfb2-a4b0-48da-8cd0-d4559a353be7	loan_disbursement	42500	Loan disbursed to Uma (Elumalai)	customers	2d860b86-e289-45b9-b108-3ecc32fafe18	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16 14:30:48.272425+00	f	\N	\N
0af44201-f35e-4a44-a7ac-4bc69cd5256e	loan_repayment	700	Loan repayment from Chandran.(Malathi)	payments	3583f61a-be90-45a2-aa41-37aa196f248f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16 14:47:43.274218+00	f	\N	\N
4f2f364e-6b92-4543-a709-30a9758cadb5	loan_repayment	200	Loan repayment from Jaffer	payments	4256ad06-82c8-48ab-93e7-13648176a1a4	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16 14:48:36.117742+00	f	\N	\N
1ee50c81-52e4-48c9-8667-7aff3178bc9a	loan_repayment	100	Loan repayment from Divya (poo kadai)	payments	b6979f9d-ae18-4132-800a-13466f498357	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16 14:49:01.827585+00	f	\N	\N
e93b3ffc-703a-4302-8c4e-70593b867dff	loan_repayment	400	Loan repayment from Lakshmi.(Tiffin)	payments	98dda507-ef11-4f85-b5fe-50ed95d09e36	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16 14:49:26.09164+00	f	\N	\N
196b616d-d680-41aa-b413-f71b4013c637	loan_repayment	200	Loan repayment from Ramesh(Pori)	payments	ec1d61d1-1b17-4fe8-a6aa-1cc26622402c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16 14:49:42.916342+00	f	\N	\N
b285ddc5-6a32-4135-b96f-901199e2f12e	loan_repayment	200	Loan repayment from Rubini	payments	fa945ac0-e776-4bdb-87e2-4fdb1cbf1cb0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16 14:50:24.863031+00	f	\N	\N
2dbba4ba-96f1-49c9-aa1f-a2d652d285bd	loan_repayment	500	Loan repayment from Hamsa	payments	3a0348aa-b3be-451f-8ba2-dacca9f1d1f3	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16 14:58:25.02343+00	f	\N	\N
aa13bd38-2944-4d70-9d1c-1c520bea3a14	loan_repayment	600	Loan repayment from Kumaravel.megic	payments	063e4a25-e25b-497b-8fc1-3832176aa5cf	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16 14:58:47.63327+00	f	\N	\N
ec83a0fe-6757-44b1-9c08-f6eb9c93e04e	loan_disbursement	25500	Loan disbursed to Udhayakumar(Sekar)	customers	9920fe35-b725-4a78-802d-61689d6993b2	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16 15:22:41.213915+00	f	\N	\N
e1e1e27d-c88d-4155-81b7-a74ab31d9a65	loan_repayment	500	Loan repayment from Bhavani (Vijayakumar)	payments	b9c4626c-43f9-4d9a-8a7c-4811112b7aa8	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16 15:58:48.25702+00	f	\N	\N
4b304755-4cb3-4d99-922b-75e0d7000fa4	loan_repayment	500	Loan repayment from Karthi.Suba	payments	71d2eaee-fb5b-4776-b16c-4bcc2dccadd1	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16 16:22:19.139532+00	f	\N	\N
beea0e02-ccf2-4a1f-b443-e8b3ae187c86	loan_repayment	200	Loan repayment from Veeramani (vaiko)	payments	5a3ee3dc-599c-4afe-9b25-07d91868cd54	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16 17:20:45.197044+00	f	\N	\N
a8a51419-ac85-4657-9f74-f863f4720318	loan_repayment	400	Loan repayment from Sriman	payments	39b55bae-93c3-4884-ae47-fd05d1e4493c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16 17:21:51.829036+00	f	\N	\N
16346c60-6202-4313-ba4b-795d9298deed	loan_repayment	1500	Loan repayment from Thangapandy	payments	0133642c-910e-4d9d-8575-2eea35bc92af	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-17 01:02:08.23474+00	f	\N	\N
b9f4fdae-5cf1-41db-ab5e-1514bd57f373	loan_repayment	2100	Loan repayment from Sendhil (Sathiyanagar)	payments	ac9a7fe6-9e34-47f1-8a04-3422b689391f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-17 04:30:29.137377+00	f	\N	\N
0dbcca94-196c-4733-97c9-6aa14779284f	loan_repayment	400	Loan repayment from Karthikeyan	payments	a25897c8-6b78-44c7-8e03-d74dca39bd47	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-17 07:24:56.306556+00	f	\N	\N
f5dd6574-0fd1-41a4-8d91-0303b08eaf09	loan_repayment	2000	Loan repayment from Varanasi.Ayyer.	payments	ba726f59-b566-4b6c-81b0-f0a988c71d10	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-17 07:36:00.648582+00	f	\N	\N
73699559-a9c0-41de-88a1-7db95a940aeb	loan_repayment	300	Loan repayment from Gopal (Veg)	payments	f41cdf26-99df-4d45-95a1-8ecbca2f4e88	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-17 07:36:43.975127+00	f	\N	\N
9ecf2a5a-6f8a-42cb-98ac-a32c1ead62c8	loan_repayment	400	Loan repayment from N.Manikandan	payments	b30efad8-ef9c-42e5-a382-870857142348	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-17 08:36:27.281436+00	f	\N	\N
3438d06b-4549-47d9-8e0f-b1aaf181212d	loan_repayment	400	Loan repayment from Prathaban.R.O.Water	payments	859cddc1-7b53-4a50-a02f-ad1716b3dec9	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-17 08:37:20.300559+00	f	\N	\N
4c8770e7-12e1-48f6-8efa-fa9659b7c305	loan_repayment	150	Loan repayment from Murugan(mec)	payments	e0a39a16-f392-4a47-a18e-fc32610528c0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-17 12:48:34.243368+00	f	\N	\N
532561af-4731-4af1-b491-7adfb6307862	loan_disbursement	4250	Loan disbursed to Karthi (Veg)	customers	23ac8ae5-7452-4182-b51c-a70026bbe0d8	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-17 12:54:39.787736+00	f	\N	\N
266e1ead-6c93-4801-bfd8-646763735af5	loan_repayment	300	Loan repayment from Selvam.Ration	payments	722d395e-9c8c-4255-a99c-761049a1081d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-17 12:55:59.53467+00	f	\N	\N
22f9fdc4-1ab3-4d58-836b-1b252a98c229	loan_repayment	600	Loan repayment from S.Murugan.(Sekar)	payments	f6ad955e-8679-4ed1-b6ad-2351261460c7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-17 13:13:23.93384+00	f	\N	\N
c7d9f114-7af5-4386-a08e-2f87b5c6ad5d	loan_repayment	600	Loan repayment from Chizhyan. DMDK	payments	589c768f-3089-4fb7-a9d5-f60ffc9ed189	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-17 13:18:33.428156+00	f	\N	\N
ccb6d437-1f87-45cf-b7a8-4ea0ee7cfeee	loan_repayment	500	Loan repayment from E.Saravanan	payments	15296225-956f-4080-81ac-7d736c78bf36	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-17 14:15:03.993535+00	f	\N	\N
c131c924-fa86-49aa-91b8-fc1b7ef4962f	loan_repayment	1000	Loan repayment from Brijesh	payments	21079aa0-ded9-4c83-8b61-64784d76be53	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-17 14:15:36.805511+00	f	\N	\N
84086f5c-212f-42d9-85e6-d5753cf5b9c1	loan_repayment	200	Loan repayment from Balamurali (sekar)	payments	1a39109c-d1dd-4c95-a14c-df561cc0b7c7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-17 14:53:41.834633+00	f	\N	\N
8a30c35c-881e-4529-a7d9-43b2a72420fc	loan_repayment	700	Loan repayment from Chandran.(Malathi)	payments	9e164ced-139e-459e-8397-1de08a363e4f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-17 14:54:15.254422+00	f	\N	\N
c68d7e0b-aece-4232-bee9-637b03f9562b	loan_repayment	200	Loan repayment from Rubini	payments	a4d2ff8e-7ea6-4306-b4c1-006b6e420072	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-17 14:54:44.748242+00	f	\N	\N
5f35fc95-4e9d-4262-a450-51ece24a16b2	loan_repayment	2000	Loan repayment from Vasu (iyyar)	payments	4137acc8-a858-4aec-a012-077e1bbf2484	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-17 14:56:25.966725+00	f	\N	\N
c1a9c7ec-f255-4e45-9a95-8455b1357095	loan_repayment	100	Loan repayment from Magesh(mec)	payments	be576bf0-b8e9-411d-9b21-3884aa80e351	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-17 14:57:02.866064+00	f	\N	\N
80da1cc5-cbc8-4a05-9ec9-8aad1136e47f	loan_repayment	1200	Loan repayment from Teja	payments	bec07b3c-1369-4ddf-bde4-e92662e64db1	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-17 15:07:58.415268+00	f	\N	\N
c96b6d32-65a6-4452-9638-5f8f4c160bfd	loan_repayment	250	Loan repayment from R.Murugan(Auto)	payments	ac5dd7c8-6b54-4adb-89ba-a9273ee00b66	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-17 15:09:09.580816+00	f	\N	\N
88aab14e-11b4-4897-9259-bbc317b133c0	loan_repayment	100	Loan repayment from Divya (poo kadai)	payments	900fc3d7-381b-47fa-89f9-f0889a988fd8	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-17 15:32:32.993743+00	f	\N	\N
3d48c21b-1775-496b-a5f4-ebceceac855e	loan_repayment	400	Loan repayment from Lakshmi.(Tiffin)	payments	91a2378e-eeba-408e-87a4-aa4170f9ecb1	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-17 15:33:19.481041+00	f	\N	\N
0d4acd21-aa96-4a80-81bb-d63f63f89b5f	loan_repayment	500	Loan repayment from Hamsa	payments	65fbbcfd-5e59-49f1-ab32-d53769bc097f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-17 15:33:43.287544+00	f	\N	\N
11c25683-4d93-4d33-b324-33c81d106712	loan_repayment	400	Loan repayment from Uma (Elumalai)	payments	431e7d1c-73d8-4100-ae1d-103e6bcfffd6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-17 15:34:09.52377+00	f	\N	\N
dcbf66ea-9f45-43ef-81ff-1893347ed4f1	loan_repayment	300	Loan repayment from Kumaravel.megic	payments	70428241-4d1d-4665-867a-c075fd290c9b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-17 15:34:34.512082+00	f	\N	\N
febe18c2-b713-40b4-a09d-7565a02880e0	loan_repayment	500	Loan repayment from Karthi.Suba	payments	b840e2d6-4bb1-4eb1-a09c-9d060a037b4c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-17 16:25:05.959679+00	f	\N	\N
768b22bf-2ad0-43bd-b430-c459ee422e42	loan_repayment	1500	Loan repayment from Thangapandy	payments	362d4031-4612-467c-9154-a9dd2da3fa16	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-17 17:54:09.710634+00	f	\N	\N
93c769c9-aa47-4d64-89f7-5b88e092567c	loan_repayment	300	Loan repayment from Udhayakumar(Sekar)	payments	4b546c64-429a-4048-b430-519cb30175fd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18 06:29:29.327845+00	f	\N	\N
37bcf266-e8c7-4ba6-bf74-75a6cafa8d8e	loan_repayment	300	Loan repayment from Selvam.Ration	payments	8f9abd25-fd80-454d-a44f-b0ce11a97858	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18 07:29:21.443649+00	f	\N	\N
b6d09a1e-06a4-495b-a799-54b2147c78b7	loan_repayment	6000	Loan repayment from Thangam.Akka	payments	f98f2837-ad5e-4b0c-aa96-2d5297eb73f5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18 08:07:37.815015+00	f	\N	\N
dc67ac0c-c834-4b84-9a73-6b7406aad333	loan_repayment	200	Loan repayment from Sathya (Tailor)	payments	91a71dca-3398-470f-b29f-c06aaaec2392	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18 08:08:12.252342+00	f	\N	\N
602fa576-c7d4-4fcd-b671-e9665aa3b15c	loan_repayment	3000	Loan repayment from Jegan (Car)	payments	22f2f7ec-d815-4633-959c-245907ee884e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18 08:08:43.104015+00	f	\N	\N
981618f2-fd33-4ea7-84a4-a91a821009e1	loan_repayment	500	Loan repayment from Mani (Magic)	payments	89b595a3-f708-43f6-9a45-4d673ae126e3	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18 08:09:26.106475+00	f	\N	\N
9121f91a-29a1-461b-bd01-db0ecd54b01c	loan_repayment	400	Loan repayment from Hari(Arvind)	payments	98177f86-a812-4d00-9c81-9f7242812028	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18 12:53:13.932948+00	f	\N	\N
4a752b7e-aa11-4724-850d-3eef0917c783	loan_repayment	400	Loan repayment from Sriman	payments	4c7e2a7a-cc0a-4e7f-9d03-ebbd92b7d509	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18 12:54:09.206127+00	f	\N	\N
5caebd6f-5a98-43f8-9f5f-c4a43b3f7918	loan_repayment	300	Loan repayment from Gopal (Veg)	payments	aaeb8eaf-2b23-435a-9be1-caf2471a190d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18 12:54:50.899994+00	f	\N	\N
de0771a2-b370-4ab6-950f-385f530636f3	loan_repayment	1500	Loan repayment from Thangapandy	payments	2c93d05c-cce0-4ccc-9298-4554d748ea4d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18 13:33:28.824421+00	f	\N	\N
f1c63afb-4bca-4762-830f-c7327dba0641	loan_repayment	1000	Loan repayment from Brijesh	payments	8b453637-f9c9-48e4-adf7-b2b8b7e92bb6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18 13:47:50.849129+00	f	\N	\N
c63ede44-f585-44da-9b79-7e69bd9f472b	loan_repayment	200	Loan repayment from Balamurali (sekar)	payments	fc6b5514-3209-4d3a-93cc-8774a73bd101	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18 13:49:19.771523+00	f	\N	\N
c1ae6b14-13c8-4fda-81e3-77f60fddb55f	loan_repayment	500	Loan repayment from Ramya(Murugan T kadai) 	payments	158d7341-2c0a-4737-aefb-b87f83907249	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18 14:07:13.703092+00	f	\N	\N
a5dbc9f5-1754-4846-befe-b42007ade3ad	loan_disbursement	8500	Loan disbursed to Shankar.ilaiyaraja	customers	db40f757-c1ca-42a3-bb92-2df13793998d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18 14:24:50.119484+00	f	\N	\N
692355e5-baa0-4622-8967-167c27613b0b	loan_disbursement	4250	Loan disbursed to Eliyas	customers	cb86aae2-de85-41b5-bf5f-20645840e270	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18 14:30:45.819221+00	f	\N	\N
188fd9e3-0fb9-43fa-99cf-d7b7df98554b	loan_repayment	1200	Loan repayment from Baai ( Thaadi )	payments	ef2ac3f0-1560-467e-a998-1cd8d081260a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18 14:33:39.50106+00	f	\N	\N
8dbbd244-9404-439b-a1ab-6702789bad20	loan_repayment	200	Loan repayment from Rajaselvam	payments	736cf073-e6bc-471e-a331-a18fe40bf809	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18 14:52:30.130245+00	f	\N	\N
f6e3fb29-313d-43c3-b74a-1e2c17696043	loan_repayment	100	Loan repayment from Divya (poo kadai)	payments	4c8581fa-e432-4004-b8c4-41bad793a2c9	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18 15:16:10.511962+00	f	\N	\N
2e28de8e-0799-4c8e-a904-3f96fe31321e	loan_repayment	400	Loan repayment from Lakshmi.(Tiffin)	payments	5e94ab4b-e528-4856-b19f-c3f364de29b8	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18 15:16:56.883446+00	f	\N	\N
7a1977ca-21bc-465e-b6ed-412f583d4eff	loan_repayment	600	Loan repayment from Ramesh(Pori)	payments	88a0f4c8-5e67-4189-97cc-2baa07cde6db	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18 15:18:34.059633+00	f	\N	\N
e9dc2930-57d8-486b-8548-480f7513582f	loan_repayment	1500	Loan repayment from Ramanathan(Soop)	payments	4ff71d8c-f377-4c36-be84-313109641197	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18 15:19:12.230701+00	f	\N	\N
5e7e6fb9-6f01-43c3-a5b1-e42a76819df2	loan_repayment	300	Loan repayment from Kumaravel.megic	payments	3b1f2954-edc2-4f8c-8850-f02b9ff3b5b3	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18 15:21:31.622935+00	f	\N	\N
70cf9051-b7f2-477f-8ba6-c8ecf094a38d	loan_repayment	700	Loan repayment from Chandran.(Malathi)	payments	44949dc7-22fb-405c-909d-a2da84342780	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18 15:22:18.140758+00	f	\N	\N
3a7fc9d6-c24f-4cdb-a6d1-e9dec63705ca	loan_repayment	400	Loan repayment from Jaffer	payments	891e6492-50db-4799-83a3-71d210153b94	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18 15:22:39.019032+00	f	\N	\N
11c63c5f-a094-46b9-bf34-d880aa3c518c	loan_repayment	250	Loan repayment from R.Murugan(Auto)	payments	74aee401-a4dc-46d5-a035-1814f28220e7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18 15:27:54.305549+00	f	\N	\N
fb289779-a4a7-4aac-be56-72529380953f	loan_disbursement	42500	Loan disbursed to Anitha	customers	6d60857f-7cd1-437e-a536-c9d04949b1c7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18 15:59:55.01402+00	f	\N	\N
8a4fba68-e258-4f39-a3d2-76d44830bfc6	loan_repayment	400	Loan repayment from Karthikeyan	payments	2a98c7a7-a311-4723-9ce3-8299bb6a4171	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18 16:00:29.123017+00	f	\N	\N
742fd4c5-de91-4dfc-b14d-f4bd63bf7af9	loan_disbursement	42500	Loan disbursed to Gokul (Magic)	customers	56da2e53-1358-4168-8c6e-cee12fe29c59	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18 16:09:53.302154+00	f	\N	\N
1a223599-17ae-430d-bffa-6040e2210921	loan_repayment	500	Loan repayment from E.Saravanan	payments	a7bb8f54-687c-411a-909d-79dd513c60b8	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18 16:13:43.471041+00	f	\N	\N
53519c0c-9213-4e88-891d-86290233069c	loan_repayment	200	Loan repayment from Vengatesh.Mec	payments	7bb1f5b3-8bca-4198-8b90-7b3495d49458	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18 16:14:35.065043+00	f	\N	\N
076fc991-d5ef-4bcd-9d47-d4fc421384c2	loan_repayment	100	Loan repayment from Magesh(mec)	payments	399ba774-07f5-4092-a380-4275bbb88605	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18 16:30:57.647183+00	f	\N	\N
cc88fa70-b8b5-4de5-89cb-f0d9eba6e017	loan_repayment	400	Loan repayment from Prathaban.R.O.Water	payments	f7d1bd05-397f-41db-a637-0986e9757c18	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19 01:44:01.651677+00	f	\N	\N
bf3a6964-34ba-4df6-918d-4605e51fa292	loan_repayment	300	Loan repayment from Udhayakumar(Sekar)	payments	ccf39281-62fd-453a-aff8-c419866aca24	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19 04:50:59.046536+00	f	\N	\N
\.


--
-- Data for Name: loans; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.loans (id, customer_id, loan_number, loan_display_id, loan_amount, daily_amount, interest_rate, processing_fee_rate, other_deductions, other_deduction_remarks, include_charges_in_outstanding, disbursal_amount, outstanding_amount, start_date, end_date, status, created_by, created_at, updated_at, is_deleted, deleted_at, deleted_by) FROM stdin;
18d2e760-ed6d-44b0-af27-6b7cb9d6ddbb	1ca2f5d0-fc1b-49ab-8443-25574737d3cf	19	VVL89393801810000	10000	100	12.5	2.5	0	\N	f	8500	8100	2026-02-25	2026-06-04	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 07:36:21.356271+00	2026-03-18 15:16:10.730608+00	f	\N	\N
abf45939-1742-4ed0-adf6-0a8813234da2	6cf22fba-6b26-402d-bb6f-abe871f7f809	36	VVL93444698450000	20000	200	12.5	2.5	0	\N	f	17000	20000	2026-03-06	2026-06-13	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-05 06:30:22.714388+00	2026-03-05 06:30:22.714388+00	f	\N	\N
8d22f5f4-95f7-41a5-9819-ca25a18de27f	30e2e57d-801d-4c86-9ecc-5df01dfc0696	38	VVL72001797310000	60000	600	12.5	2.5	0	\N	f	51000	58200	2026-03-06	2026-06-13	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-05 14:11:18.3869+00	2026-03-09 14:18:22.193232+00	f	\N	\N
6ded35ce-a2e8-4856-827d-ab18be14743b	dede5547-d440-4d63-a9ac-ad427b2895c9	40	VVL99436645730000	20000	200	12.5	2.5	0	\N	f	17000	19000	2026-03-09	2026-06-16	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-08 13:22:13.076748+00	2026-03-16 08:35:42.555251+00	f	\N	\N
6f37b184-d886-4b91-a179-60f467b3e51d	4bf7d91d-6da6-4d5d-9db0-30b196a13651	11	VVL77088778320000	30000	300	12.5	2.5	0	\N	f	25500	22800	2026-02-20	2026-05-30	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 07:03:58.952315+00	2026-03-18 15:19:12.443049+00	f	\N	\N
b4a8d905-3198-4d75-8ee3-3800ec8f2b40	bcb87a68-a59d-438f-b81a-e5a4a6b666c1	6	VVL98405546020000	50000	500	12.5	2.5	0	\N	f	42500	38000	2026-02-19	2026-05-29	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-24 15:32:36.764296+00	2026-03-17 07:36:00.863712+00	f	\N	\N
ecb49778-5d46-4840-9796-12a3fbe11412	064b4a2b-34b6-4da3-9286-a5d88700fe07	18	VVL98844874310000	10000	100	12.5	2.5	0	\N	f	8500	5700	2026-02-25	2026-06-04	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 07:33:53.578612+00	2026-03-15 15:44:09.550463+00	f	\N	\N
6edc184d-553a-4ab7-b3bc-924f1ea007d6	e00a821e-300f-432b-8519-5ef03b42b09c	12	VVL88387434070000	30000	300	12.5	2.5	0	\N	f	25500	23700	2026-02-20	2026-05-30	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 07:13:59.559014+00	2026-03-14 13:47:05.800306+00	f	\N	\N
a3f57a0f-8bdf-47f7-a94d-819924cdc08a	ba9ab57b-e2d8-4c2a-902d-effb7b810b03	21	VVL93614067270000	100000	1000	12.5	2.5	0	\N	f	85000	79000	2026-02-26	2026-06-05	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 16:09:14.632845+00	2026-03-18 13:47:51.087732+00	f	\N	\N
fe889acf-38cf-4a1f-8fce-804d5304f246	e9d54922-42db-42b1-ab59-8dd42d68af4c	22	VVL81484844990000	30000	300	12.5	2.5	0	\N	f	25500	25800	2026-03-01	2026-06-08	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-28 13:23:52.378254+00	2026-03-18 15:21:31.854101+00	f	\N	\N
7a331756-19b2-4a9f-a2ee-2b3f6a641e72	ac85d0d3-a358-46b8-bf3e-4f4468ca5670	30	VVL98415333610000	30000	300	12.5	2.5	0	\N	f	25500	25500	2026-03-03	2026-06-10	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-02 15:45:01.541999+00	2026-03-17 04:30:31.566843+00	f	\N	\N
191731f2-5b78-401c-8cec-590024f34df2	aed1fa37-b39e-453a-96ac-b79ba3f4889c	24	VVL80727584630000	35000	350	12.5	2.5	0	\N	f	29750	28000	2026-02-28	2026-06-07	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-28 15:54:44.817465+00	2026-03-11 15:32:41.580561+00	f	\N	\N
dc623009-9752-43d7-b22a-384740599eb7	f5064908-4ea0-42c7-8a63-0ddfc2a80531	7	VVL63824493300000	40000	400	12.5	2.5	0	\N	f	34000	29900	2026-02-19	2026-05-29	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-24 16:17:31.331279+00	2026-03-18 15:16:57.209026+00	f	\N	\N
6043f054-834d-437f-860a-7f9269935958	cb5975f3-72b1-4cc9-bd02-81342334cb40	28	VVL97890534560000	20000	200	12.5	2.5	0	\N	f	17000	18000	2026-03-03	2026-06-10	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-02 15:25:03.535017+00	2026-03-17 08:36:27.673981+00	f	\N	\N
eab03433-a240-440d-8140-9be3f7ccf9a7	3765d341-7b06-463d-82fa-add7d738b854	34	VVL82485756210000	15000	150	12.5	2.5	0	\N	f	12750	13000	2026-03-05	2026-06-12	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-04 15:39:33.537781+00	2026-03-16 13:51:06.551819+00	f	\N	\N
111a604f-46f8-4271-8912-ccbe479ab3ef	89d5c659-aa6c-4a99-b0fc-f737d9e8e0e4	17	VVL81244608100000	150000	1500	12.5	2.5	0	\N	f	127500	114000	2026-02-23	2026-06-02	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 07:30:46.307809+00	2026-03-18 13:33:29.110457+00	f	\N	\N
aa68ef20-1754-401b-9bfc-b8f2c49b0a4e	bee2c977-93c0-44ef-874e-a76e53e40a51	14	VVL86676567040000	40000	400	12.5	2.5	0	\N	f	34000	30000	2026-02-22	2026-06-01	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 07:21:26.074348+00	2026-03-18 12:54:09.448416+00	f	\N	\N
3a181c18-8f9e-4467-96a8-c09687ebea27	c5f80bd8-670e-4df5-8c6a-ac7378801077	33	VVL90032928110000	50000	500	12.5	2.5	0	\N	f	42500	43500	2026-03-05	2026-06-12	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-04 15:34:01.838702+00	2026-03-17 14:56:26.284667+00	f	\N	\N
010a0aaf-0be5-46b5-a0dc-f5fcc85ed2cf	c8e35247-1c57-4290-9904-8553d3c7cad5	20	VVL63833262960000	60000	600	12.5	2.5	0	\N	f	51000	54000	2026-02-26	2026-06-05	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 16:05:41.671543+00	2026-03-17 15:07:58.655613+00	f	\N	\N
9b9a19c0-f88e-46eb-afd6-b823511a12e9	271816e2-6379-480d-92c3-c5f6fc561298	41	VVL90031043580000	15000	150	12.5	2.5	0	\N	f	12750	13650	2026-03-09	2026-06-16	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-08 13:40:49.279451+00	2026-03-17 12:48:34.479057+00	f	\N	\N
eed1102c-8dcc-4caf-9239-6a9cd7332ccc	8d648ef9-92ca-4513-8639-f0b3ec50a392	31	VVL91502940170000	20000	200	12.5	2.5	0	\N	f	17000	18000	2026-03-03	2026-06-10	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-02 16:10:26.239064+00	2026-03-16 00:53:55.256329+00	f	\N	\N
27e0e2f9-8d55-4cf8-a605-3a1b95f3c368	93906c36-47ae-41bb-bb4c-a594f08896b3	9	VVL98845545930000	60000	600	12.5	2.5	0	\N	f	51000	55000	2026-02-20	2026-05-30	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-24 16:24:08.955639+00	2026-03-17 15:33:43.602879+00	f	\N	\N
0d99cdf2-2edc-4baa-bf1a-14c97c0df949	db6c8835-21b0-4c54-b4ff-2e6ec0441891	44	VVL89391339420000	20000	200	12.5	2.5	0	\N	f	17000	19000	2026-03-09	2026-06-16	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-08 15:43:03.177188+00	2026-03-11 15:35:06.777904+00	f	\N	\N
bd6c3241-ee7a-49a4-8f31-6ca7af5980d8	eec56395-bc3e-4592-8a21-7b694944b6eb	29	VVL98414220720000	20000	200	12.5	2.5	0	\N	f	17000	17300	2026-03-03	2026-06-10	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-02 15:39:50.314274+00	2026-03-13 07:21:00.145979+00	f	\N	\N
0df2b337-87db-4802-a5f9-6944970e2ff5	b55df5ce-674c-47c2-9c54-73bed3e8e571	10	VVL97890405650000	30000	300	12.5	2.5	0	\N	f	25500	23400	2026-02-20	2026-05-30	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 07:00:13.893306+00	2026-03-11 13:42:09.614658+00	f	\N	\N
696b495b-35b0-4393-b4ec-68ed91e19550	72e0cd6d-f353-4cbc-b59f-e63ee38dd833	16	VVL89395857910000	30000	300	12.5	2.5	0	\N	f	25500	25500	2026-02-22	2026-06-01	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 07:27:05.927459+00	2026-03-12 08:35:41.995195+00	f	\N	\N
5dbe34e7-1ce9-4640-b617-a2529d3479d8	63a8b08e-b8dd-451a-bb89-b38b0bb2d9b2	15	VVL98402365530000	10000	100	12.5	2.5	0	\N	f	8500	7600	2026-02-22	2026-06-01	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 07:25:19.118612+00	2026-03-17 13:13:24.142275+00	f	\N	\N
3271ace3-8b99-4f7c-bf11-2d83f9ae9711	9ef2ed06-c135-411b-9768-fe38919bf751	42	VVL91768677150000	20000	200	12.5	2.5	0	\N	f	17000	20000	2026-03-09	2026-06-16	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-08 13:46:42.338374+00	2026-03-08 13:46:42.338374+00	f	\N	\N
7ebb952f-b8ce-452d-a076-36b5efc9d1c5	67eb359b-25a2-481e-ae53-c208688f5940	26	VVL95145011830000	30000	300	12.5	2.5	0	\N	f	25500	24300	2026-03-02	2026-06-09	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-01 15:34:39.055736+00	2026-03-16 05:52:09.619891+00	f	\N	\N
71d81887-5e21-4486-97e6-faea2c876cff	860f25ca-39ff-42f0-bacb-e409bd6007d7	23	VVL63691490650000	20000	200	12.5	2.5	0	\N	f	17000	17600	2026-03-01	2026-06-08	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-28 13:26:53.248377+00	2026-03-18 16:14:35.44138+00	f	\N	\N
9c2457d7-dd54-4968-bf51-e43a0ecb49f3	27559805-98ca-4b40-a167-933eea4a69bb	8	VVL93617442370000	30000	300	12.5	2.5	0	\N	f	25500	24000	2026-02-19	2026-05-29	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-24 16:22:23.990339+00	2026-03-18 08:07:38.096585+00	f	\N	\N
804dc780-cd95-46c8-a131-47013ca5eb56	de282179-bb22-45ff-b75f-6bb22109cb12	37	VVL93459453310000	60000	600	12.5	2.5	0	\N	f	51000	57000	2026-03-06	2026-06-13	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-05 14:05:47.062269+00	2026-03-18 08:08:43.32527+00	f	\N	\N
43615615-48b3-4cb6-b3ff-cfcb63bb8a20	c62f3118-4803-4149-8621-2473aec070c1	35	VVL86681138050000	20000	200	12.5	2.5	0	\N	f	17000	18500	2026-03-05	2026-06-12	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-04 15:59:45.830094+00	2026-03-11 15:09:36.010713+00	f	\N	\N
6398b3f9-45c4-45b0-a7fc-0e3e1ced4173	f35169da-5d69-4e7e-a35e-ed6237a94cff	43	VVL97107332630000	50000	500	12.5	2.5	0	\N	f	42500	47000	2026-03-09	2026-06-16	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-08 13:50:10.936838+00	2026-03-17 16:25:06.235236+00	f	\N	\N
135460a0-56bf-4c17-a4a8-5e66f29b52f6	80752817-7c75-426b-a97e-361b246ec563	45	VVL98841734310000	30000	300	12.5	2.5	0	\N	f	25500	27900	2026-03-10	2026-06-17	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-09 14:26:11.151281+00	2026-03-18 07:29:21.665499+00	f	\N	\N
def4d986-3767-4793-a6e8-c767351fd93f	02889b17-5d17-4dc1-ace1-381b0d733984	25	VVL99621421330000	25000	250	12.5	2.5	0	\N	f	21250	21250	2026-03-02	2026-06-09	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-01 15:29:10.206863+00	2026-03-18 14:07:13.93741+00	f	\N	\N
b80d47c9-3d98-41cd-9037-7ddcdac87f0c	b9bd3700-24a0-4fa2-9afa-ca0827c26188	32	VVL96771629730000	20000	200	12.5	2.5	0	\N	f	17000	17000	2026-03-05	2026-06-12	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-04 15:27:18.989393+00	2026-03-16 17:20:45.424783+00	f	\N	\N
5d640f92-1900-47f5-bb7e-a6ab5061d564	1cac3c77-d86c-41b8-ba55-2b1f74410661	27	VVL97907839300000	20000	200	12.5	2.5	0	\N	f	17000	17000	2026-03-02	2026-06-09	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-01 15:54:06.145208+00	2026-03-17 14:54:45.090156+00	f	\N	\N
735cd1ad-a76d-4026-87dc-60f501454b7a	8926b943-bda3-4c36-aa29-4f8576e75e90	4	VVL90940972660000	20000	200	12.5	0	0	\N	f	17500	14400	2026-02-19	2026-05-29	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-24 15:20:15.626848+00	2026-03-18 15:18:34.287126+00	f	\N	\N
794af05e-0e94-449e-90ee-691d82534c27	35038458-ade9-412d-877d-814bb95adf5d	39	VVL63742439330000	20000	200	12.5	2.5	0	\N	f	17000	18600	2026-03-09	2026-06-16	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-08 08:15:42.176192+00	2026-03-18 08:08:12.479904+00	f	\N	\N
6778d224-f980-48ed-801f-bef1220cd43c	c9a697e2-d1d0-4f48-9f8b-b0a12d06de0d	5	VVL87789363540000	10000	100	12.5	2.5	0	\N	f	8500	8200	2026-02-19	2026-05-29	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-24 15:26:02.760791+00	2026-03-18 12:53:14.167912+00	f	\N	\N
55efd7cf-1188-4423-9a53-8ee2c53002fa	6245a2e8-2eb5-4d5f-8b8a-aac817bfee18	61	VVL73973975360000	20000	200	12.5	2.5	0	\N	f	17000	19400	2026-03-16	2026-06-23	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-15 15:36:43.396499+00	2026-03-18 13:49:19.997826+00	f	\N	\N
249ae28b-3ceb-4a1c-a279-a9affb4d8090	db40f757-c1ca-42a3-bb92-2df13793998d	68	VVL72002871380000	10000	100	12.5	2.5	0	\N	f	8500	10000	2026-03-19	2026-06-26	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18 14:24:49.872195+00	2026-03-18 14:24:49.872195+00	f	\N	\N
c18d8b95-c031-4110-85c8-b265a89efc50	e0fca0e1-df99-497f-87e4-41be32ec1780	59	VVL73585633740000	50000	500	12.5	2.5	0	\N	f	42500	48000	2026-03-15	2026-06-22	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-14 15:18:22.97556+00	2026-03-14 15:31:03.523055+00	f	\N	\N
61588824-28f6-4f24-b902-3044b3b05a19	b2f4bd25-a426-4b1a-b0f6-3ef0115ba281	48	VVL84284477300000	50000	500	12.5	2.5	0	\N	f	42500	48500	2026-03-11	2026-06-18	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-10 05:57:13.554562+00	2026-03-16 15:58:48.493305+00	f	\N	\N
a22b5f37-a3d4-48de-a5d3-5717343478be	cb86aae2-de85-41b5-bf5f-20645840e270	69	VVL73387995230000	5000	50	12.5	2.5	0	\N	f	4250	5000	2026-03-19	2026-06-26	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18 14:30:45.150939+00	2026-03-18 14:30:45.150939+00	f	\N	\N
8419a9be-df12-416f-81ce-3570f9a82a4c	cf301afd-a3ed-4bea-9794-b4fe432d8861	51	VVL91764640400000	60000	600	12.5	2.5	0	\N	f	51000	56400	2026-03-12	2026-06-19	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11 14:06:39.907644+00	2026-03-18 14:33:39.73005+00	f	\N	\N
db261798-826e-4d7b-9fc7-a4dba55df1f3	22d10045-ef1c-4807-9278-c35dbb01d73f	62	VVL80724252260000	20000	200	12.5	2.5	0	\N	f	17000	19600	2026-03-16	2026-06-23	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-15 15:58:16.209479+00	2026-03-18 14:52:30.354293+00	f	\N	\N
ebc8c94f-09bf-41ca-8522-f81f98fb1469	84cf3d8e-64cc-4a90-8b33-12c94640d00b	49	VVL70104785050000	70000	700	12.5	2.5	0	\N	f	59500	67900	2026-03-11	2026-06-18	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-10 06:04:18.517217+00	2026-03-18 15:22:18.357211+00	f	\N	\N
bbc128c4-c3e1-4281-82c7-652d7065c721	23ac8ae5-7452-4182-b51c-a70026bbe0d8	67	VVL93639813840000	5000	50	12.5	2.5	0	\N	f	4250	5000	2026-03-18	2026-06-25	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-17 12:54:39.559138+00	2026-03-17 12:54:39.559138+00	f	\N	\N
7a03a63d-e3f1-48dd-b082-63ea18330321	f8e88dc3-4e2d-4526-b66d-743bc434bc6e	57	VVL98416213450000	40000	400	12.5	2.5	0	\N	f	34000	40000	2026-03-13	2026-06-20	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-12 15:52:48.502006+00	2026-03-12 15:52:48.502006+00	f	\N	\N
400fb688-b2dd-42c2-b2f6-c2c3a6bff5bd	d59ecb10-5af9-4f75-8f43-dfc52d537f0c	50	VVL99403842530000	20000	200	12.5	2.5	0	\N	f	17000	19000	2026-03-12	2026-06-19	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11 07:43:35.39292+00	2026-03-18 15:22:39.251957+00	f	\N	\N
e425ae02-2a03-4e18-af85-4b3990eefd11	cf6ae0f5-381e-455f-8bda-1dda692f14a4	58	VVL89390375100000	20000	200	12.5	2.5	0	\N	f	17000	19400	2026-03-15	2026-06-22	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-14 14:09:19.191983+00	2026-03-17 13:18:33.654996+00	f	\N	\N
682ad2e5-1d22-4c44-a132-b8580c165d1d	0d8641d3-1860-4dac-8f9c-a7362226fe97	46	VVL94445780780000	30000	300	12.5	2.5	0	\N	f	25500	27900	2026-03-10	2026-06-17	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-09 14:34:36.363735+00	2026-03-17 13:18:57.692589+00	f	\N	\N
17f01068-23e4-438e-8322-5e4a12f3f332	6340050f-5246-43c5-9297-d14267b9bad0	56	VVL99400104380000	40000	400	12.5	2.5	0	\N	f	34000	38400	2026-03-13	2026-06-20	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-12 13:50:57.469964+00	2026-03-16 05:51:21.206409+00	f	\N	\N
757d4684-58bf-40d2-bfdd-ec9921ff94d7	32e40b35-8c4b-4552-b8b8-7c233d31c03d	47	VVL99623079330000	25000	250	12.5	2.5	0	\N	f	21250	22750	2026-03-10	2026-06-17	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-09 14:39:36.176242+00	2026-03-18 15:27:54.51358+00	f	\N	\N
9ca88703-194e-4620-9685-63969504382a	fb079db0-2262-4017-bd24-5d42ca326ff9	63	VVL78450320330000	20000	200	12.5	2.5	0	\N	f	17000	20000	2026-03-17	2026-06-24	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16 06:58:21.181581+00	2026-03-16 06:58:21.181581+00	f	\N	\N
4de5c872-61eb-4f7e-9c00-c5b032e1fcf7	3292a221-dac6-489f-9624-6f993ac28f7d	64	VVL88386822300000	20000	200	12.5	2.5	0	\N	f	17000	20000	2026-03-17	2026-06-24	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16 07:20:21.102576+00	2026-03-16 07:20:21.102576+00	f	\N	\N
d6c5de5c-32f1-4075-bce2-9a151bb80cb0	6d60857f-7cd1-437e-a536-c9d04949b1c7	70	VVL73056640840000	50000	500	12.5	2.5	0	\N	f	42500	50000	2026-03-19	2026-06-26	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18 15:59:54.779972+00	2026-03-18 15:59:54.779972+00	f	\N	\N
8e423e8d-c1ce-4d07-9860-fd7df34eaf44	6aac96ea-eb26-460a-8340-ffb355953ae0	13	VVL95141718280000	40000	400	12.5	2.5	0	\N	f	34000	33200	2026-02-22	2026-06-01	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 07:17:51.960694+00	2026-03-18 16:00:29.346829+00	f	\N	\N
0e59bad3-eae7-435d-b166-6f5e876b3785	56da2e53-1358-4168-8c6e-cee12fe29c59	71	VVL86086676560000	50000	500	12.5	2.5	0	\N	f	42500	50000	2026-03-19	2026-06-26	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18 16:09:52.988631+00	2026-03-18 16:09:52.988631+00	f	\N	\N
a3742c80-66e9-443f-8ab2-a145af754194	b16866ff-ba34-412f-aeea-fa734ccf88a1	54	VVL86810721530000	50000	500	12.5	2.5	0	\N	f	42500	46500	2026-03-13	2026-06-20	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-12 06:38:45.897952+00	2026-03-18 16:13:43.703435+00	f	\N	\N
adbe0a7a-d431-41af-9a40-6fdc864df6ab	2d860b86-e289-45b9-b108-3ecc32fafe18	65	VVL97902498370000	50000	500	12.5	2.5	0	\N	f	42500	49600	2026-03-17	2026-06-24	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16 14:30:48.016116+00	2026-03-17 15:34:09.840675+00	f	\N	\N
c2c54c13-fb99-4e5d-9f99-1bddf98beb5b	e3325ec8-264a-41e1-a2d5-84fb33eb4412	55	VVL97890692880000	50000	500	12.5	2.5	0	\N	f	42500	48000	2026-03-13	2026-06-20	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-12 07:16:18.039277+00	2026-03-18 08:09:26.335178+00	f	\N	\N
dfa34099-366b-4a3e-85ef-eb12e94f4083	a0d4dce0-9bdd-4cf1-ad5d-1c95cf18e2dd	52	VVL97908016670000	30000	300	12.5	2.5	0	\N	f	25500	27900	2026-03-12	2026-06-19	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11 15:07:36.502343+00	2026-03-18 12:54:51.116569+00	f	\N	\N
d1929534-e23a-4d75-8031-6998ec8b0810	34977a0a-e657-40cb-840d-a6df47bba8d3	53	VVL93806067270000	10000	100	12.5	2.5	0	\N	f	8500	9300	2026-03-12	2026-06-19	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11 15:58:45.281688+00	2026-03-18 16:30:57.973028+00	f	\N	\N
7983d2f3-d1b5-4f40-afba-dfadeeb8e0bd	b86ae36d-afe4-41a9-8d69-af6178efda6c	60	VVL98406777980000	20000	200	12.5	2.5	0	\N	f	17000	19200	2026-03-16	2026-06-23	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-15 15:24:50.590167+00	2026-03-19 01:44:03.998917+00	f	\N	\N
b9ea214a-e90e-4ad5-a848-3b1005f2e89f	9920fe35-b725-4a78-802d-61689d6993b2	66	VVL97898570950000	30000	300	12.5	2.5	0	\N	f	25500	29400	2026-03-17	2026-06-24	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16 15:22:40.815973+00	2026-03-19 04:51:01.711862+00	f	\N	\N
\.


--
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payments (id, customer_id, loan_id, agent_id, date, amount, mode, status, promised_date, remarks, created_at, is_deleted, deleted_at, deleted_by) FROM stdin;
2dbe8ccd-1e20-485d-b670-032eabae41d6	8926b943-bda3-4c36-aa29-4f8576e75e90	735cd1ad-a76d-4026-87dc-60f501454b7a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-19	200	cash	paid	\N	\N	2026-02-24 15:21:11.626639+00	f	\N	\N
eca16f9d-297e-4eca-9938-93d4974c8ecd	8926b943-bda3-4c36-aa29-4f8576e75e90	735cd1ad-a76d-4026-87dc-60f501454b7a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-20	200	cash	paid	\N	\N	2026-02-24 15:21:43.320738+00	f	\N	\N
ccfc44fe-14c0-4f59-92c5-bbe524e0e65c	8926b943-bda3-4c36-aa29-4f8576e75e90	735cd1ad-a76d-4026-87dc-60f501454b7a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-21	200	cash	paid	\N	\N	2026-02-24 15:22:02.411125+00	f	\N	\N
4efba7cb-ac70-4ceb-9aeb-06ae7c2b74b4	8926b943-bda3-4c36-aa29-4f8576e75e90	735cd1ad-a76d-4026-87dc-60f501454b7a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-22	200	cash	paid	\N	\N	2026-02-24 15:22:19.347647+00	f	\N	\N
1cfe2a4f-4595-4ff7-aaf5-65bd54b9687f	8926b943-bda3-4c36-aa29-4f8576e75e90	735cd1ad-a76d-4026-87dc-60f501454b7a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-23	200	cash	paid	\N	\N	2026-02-24 15:22:38.570241+00	f	\N	\N
8d2b9a24-6b85-4cc1-b720-d40af55c7030	8926b943-bda3-4c36-aa29-4f8576e75e90	735cd1ad-a76d-4026-87dc-60f501454b7a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-24	200	cash	paid	\N	\N	2026-02-24 15:22:53.532817+00	f	\N	\N
44f4eb57-eec8-4aaa-aa11-59be033efd6c	c9a697e2-d1d0-4f48-9f8b-b0a12d06de0d	6778d224-f980-48ed-801f-bef1220cd43c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-19	100	online	paid	\N	\N	2026-02-24 15:26:37.820638+00	f	\N	\N
11b12b08-2839-4998-a8b1-9a75c307c3d5	c9a697e2-d1d0-4f48-9f8b-b0a12d06de0d	6778d224-f980-48ed-801f-bef1220cd43c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-20	100	online	paid	\N	\N	2026-02-24 15:27:34.200629+00	f	\N	\N
0ad6be81-8c9c-4a5d-b8c1-a92165a126d6	bcb87a68-a59d-438f-b81a-e5a4a6b666c1	b4a8d905-3198-4d75-8ee3-3800ec8f2b40	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-22	2000	online	paid	\N	\N	2026-02-24 15:33:12.586318+00	f	\N	\N
06b6d205-bb4b-4ea9-a6d3-6e5068212230	bcb87a68-a59d-438f-b81a-e5a4a6b666c1	b4a8d905-3198-4d75-8ee3-3800ec8f2b40	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-24	1000	online	paid	\N	\N	2026-02-24 15:33:43.272938+00	f	\N	\N
725af9fb-77f1-4929-9c9d-841ae46044f3	f5064908-4ea0-42c7-8a63-0ddfc2a80531	dc623009-9752-43d7-b22a-384740599eb7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-19	500	cash	paid	\N	\N	2026-02-24 16:17:54.769934+00	f	\N	\N
f7312eb1-25e6-4738-88e7-ec4b27a3da1c	f5064908-4ea0-42c7-8a63-0ddfc2a80531	dc623009-9752-43d7-b22a-384740599eb7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-20	400	cash	paid	\N	\N	2026-02-24 16:18:12.446996+00	f	\N	\N
55a96e13-006f-48b0-89e6-8c75a74a2901	f5064908-4ea0-42c7-8a63-0ddfc2a80531	dc623009-9752-43d7-b22a-384740599eb7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-21	400	cash	paid	\N	\N	2026-02-24 16:18:41.249691+00	f	\N	\N
59d2f233-d9d8-4237-acb9-d40dab07d8e1	f5064908-4ea0-42c7-8a63-0ddfc2a80531	dc623009-9752-43d7-b22a-384740599eb7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-22	400	cash	paid	\N	\N	2026-02-24 16:18:59.944469+00	f	\N	\N
b51e2333-091b-41d5-99d8-3eff3241c8db	f5064908-4ea0-42c7-8a63-0ddfc2a80531	dc623009-9752-43d7-b22a-384740599eb7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-23	400	cash	paid	\N	\N	2026-02-24 16:19:34.06265+00	f	\N	\N
0f56e78d-b837-4f19-9bc6-b5f81f02459c	f5064908-4ea0-42c7-8a63-0ddfc2a80531	dc623009-9752-43d7-b22a-384740599eb7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-24	400	cash	paid	\N	\N	2026-02-24 16:19:54.743166+00	f	\N	\N
825bc3d7-e89e-475e-9329-806647f41441	93906c36-47ae-41bb-bb4c-a594f08896b3	27e0e2f9-8d55-4cf8-a605-3a1b95f3c368	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-20	500	cash	paid	\N	\N	2026-02-24 16:24:31.415107+00	f	\N	\N
b10f39c5-7749-46ff-b741-ca37e6370066	93906c36-47ae-41bb-bb4c-a594f08896b3	27e0e2f9-8d55-4cf8-a605-3a1b95f3c368	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-21	500	online	paid	\N	\N	2026-02-24 16:24:53.586641+00	f	\N	\N
d06d734e-209f-4bde-ad1a-fb01649ce979	b55df5ce-674c-47c2-9c54-73bed3e8e571	0df2b337-87db-4802-a5f9-6944970e2ff5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-21	600	online	paid	\N	\N	2026-02-25 07:00:41.404548+00	f	\N	\N
525f64de-e092-4a80-b9d3-111894fe9993	b55df5ce-674c-47c2-9c54-73bed3e8e571	0df2b337-87db-4802-a5f9-6944970e2ff5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-23	600	online	paid	\N	\N	2026-02-25 07:01:08.412421+00	f	\N	\N
ba4509b0-2d24-4fa3-80bf-738d954b8717	4bf7d91d-6da6-4d5d-9db0-30b196a13651	6f37b184-d886-4b91-a179-60f467b3e51d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-20	300	cash	paid	\N	\N	2026-02-25 07:04:29.430471+00	f	\N	\N
e9059823-3a60-4f63-ad05-52e2423ea100	4bf7d91d-6da6-4d5d-9db0-30b196a13651	6f37b184-d886-4b91-a179-60f467b3e51d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-21	300	cash	paid	\N	\N	2026-02-25 07:04:52.39879+00	f	\N	\N
6712233d-40e3-4904-a101-2b31711708f8	4bf7d91d-6da6-4d5d-9db0-30b196a13651	6f37b184-d886-4b91-a179-60f467b3e51d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-23	300	cash	paid	\N	\N	2026-02-25 07:05:17.495891+00	f	\N	\N
120f21c5-f402-48b8-b32a-a6b5cc6b1ab3	4bf7d91d-6da6-4d5d-9db0-30b196a13651	6f37b184-d886-4b91-a179-60f467b3e51d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-24	300	cash	paid	\N	\N	2026-02-25 07:05:33.562465+00	f	\N	\N
6685279e-7d36-4e7c-9ec5-92bb4d0c52c0	e00a821e-300f-432b-8519-5ef03b42b09c	6edc184d-553a-4ab7-b3bc-924f1ea007d6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-21	600	online	paid	\N	\N	2026-02-25 07:14:37.885639+00	f	\N	\N
69fa37c5-cd9f-4a15-961c-0046c9352f3f	e00a821e-300f-432b-8519-5ef03b42b09c	6edc184d-553a-4ab7-b3bc-924f1ea007d6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-22	300	online	paid	\N	\N	2026-02-25 07:15:11.675891+00	f	\N	\N
53a3eac4-bc9f-432b-96de-158920d08dd9	e00a821e-300f-432b-8519-5ef03b42b09c	6edc184d-553a-4ab7-b3bc-924f1ea007d6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-24	600	online	paid	\N	\N	2026-02-25 07:15:30.371656+00	f	\N	\N
ccac25cd-c148-439e-9e14-5b7885e1553a	6aac96ea-eb26-460a-8340-ffb355953ae0	8e423e8d-c1ce-4d07-9860-fd7df34eaf44	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-22	400	online	paid	\N	\N	2026-02-25 07:18:14.970159+00	f	\N	\N
50e1cec6-fe54-4819-bfc1-960fca42e9b9	6aac96ea-eb26-460a-8340-ffb355953ae0	8e423e8d-c1ce-4d07-9860-fd7df34eaf44	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-23	400	online	paid	\N	\N	2026-02-25 07:18:36.624855+00	f	\N	\N
b55185f6-ac8e-4326-9de6-9695eed80776	6aac96ea-eb26-460a-8340-ffb355953ae0	8e423e8d-c1ce-4d07-9860-fd7df34eaf44	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-24	400	online	paid	\N	\N	2026-02-25 07:18:52.682482+00	f	\N	\N
71037484-3673-4136-a968-279da88f07dd	bee2c977-93c0-44ef-874e-a76e53e40a51	aa68ef20-1754-401b-9bfc-b8f2c49b0a4e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-22	400	online	paid	\N	\N	2026-02-25 07:21:46.887469+00	f	\N	\N
51e85c22-787f-4566-94a3-3dd16eb45194	bee2c977-93c0-44ef-874e-a76e53e40a51	aa68ef20-1754-401b-9bfc-b8f2c49b0a4e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-23	400	online	paid	\N	\N	2026-02-25 07:22:04.371121+00	f	\N	\N
adc82173-b58b-4298-941f-8f53c25f0043	bee2c977-93c0-44ef-874e-a76e53e40a51	aa68ef20-1754-401b-9bfc-b8f2c49b0a4e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-24	400	online	paid	\N	\N	2026-02-25 07:22:48.043757+00	f	\N	\N
108af3be-2054-4d2d-a4ac-74662737c454	72e0cd6d-f353-4cbc-b59f-e63ee38dd833	696b495b-35b0-4393-b4ec-68ed91e19550	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-22	300	online	paid	\N	\N	2026-02-25 07:27:30.79491+00	f	\N	\N
cee059bd-6774-4640-8163-612103b1da73	72e0cd6d-f353-4cbc-b59f-e63ee38dd833	696b495b-35b0-4393-b4ec-68ed91e19550	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-23	300	online	paid	\N	\N	2026-02-25 07:27:48.097783+00	f	\N	\N
fd6abf77-c74b-4414-a7a7-866db5953f02	72e0cd6d-f353-4cbc-b59f-e63ee38dd833	696b495b-35b0-4393-b4ec-68ed91e19550	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-24	300	online	paid	\N	\N	2026-02-25 07:28:08.182291+00	f	\N	\N
8d666abd-cfd4-4bf4-b322-3d2719319549	064b4a2b-34b6-4da3-9286-a5d88700fe07	ecb49778-5d46-4840-9796-12a3fbe11412	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25	500	online	paid	\N	\N	2026-02-25 07:34:13.653288+00	f	\N	\N
e1bff1fe-2524-4efd-be5e-fb8d3717574a	72e0cd6d-f353-4cbc-b59f-e63ee38dd833	696b495b-35b0-4393-b4ec-68ed91e19550	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25	300	online	paid	\N	\N	2026-02-25 13:38:13.103716+00	f	\N	\N
da9b2d03-8aeb-440a-adb6-6567a5ed5873	89d5c659-aa6c-4a99-b0fc-f737d9e8e0e4	111a604f-46f8-4271-8912-ccbe479ab3ef	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25	4500	online	paid	\N	\N	2026-02-25 13:38:44.26209+00	f	\N	\N
bce53459-3903-4f75-b2f4-fd906d35f268	bcb87a68-a59d-438f-b81a-e5a4a6b666c1	b4a8d905-3198-4d75-8ee3-3800ec8f2b40	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25	500	online	paid	\N	\N	2026-02-25 13:39:04.97267+00	f	\N	\N
816bf01d-06ad-482f-a90b-d62feb7d962a	e00a821e-300f-432b-8519-5ef03b42b09c	6edc184d-553a-4ab7-b3bc-924f1ea007d6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25	300	online	paid	\N	\N	2026-02-25 13:39:19.473092+00	f	\N	\N
4f969ee3-4e36-4d03-8968-67e4724c4a4c	6aac96ea-eb26-460a-8340-ffb355953ae0	8e423e8d-c1ce-4d07-9860-fd7df34eaf44	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25	400	online	paid	\N	\N	2026-02-25 13:39:34.392441+00	f	\N	\N
2d939fd7-99c1-43c6-a8ee-07aa7b8e8e16	f5064908-4ea0-42c7-8a63-0ddfc2a80531	dc623009-9752-43d7-b22a-384740599eb7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25	400	cash	paid	\N	\N	2026-02-25 15:29:50.771816+00	f	\N	\N
b4be5c98-99fe-483c-9662-aef371092252	8926b943-bda3-4c36-aa29-4f8576e75e90	735cd1ad-a76d-4026-87dc-60f501454b7a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25	200	cash	paid	\N	\N	2026-02-25 15:30:24.288818+00	f	\N	\N
e2843faf-8809-44d2-9ca0-7b21eac969ee	4bf7d91d-6da6-4d5d-9db0-30b196a13651	6f37b184-d886-4b91-a179-60f467b3e51d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25	300	cash	paid	\N	\N	2026-02-25 15:30:46.91912+00	f	\N	\N
1d67dee5-15c9-4879-8277-be5be739afeb	c9a697e2-d1d0-4f48-9f8b-b0a12d06de0d	6778d224-f980-48ed-801f-bef1220cd43c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25	300	online	paid	\N	\N	2026-02-25 15:40:58.272538+00	f	\N	\N
ad7bc930-0b74-4a4e-8580-e85287c30c5a	bee2c977-93c0-44ef-874e-a76e53e40a51	aa68ef20-1754-401b-9bfc-b8f2c49b0a4e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25	400	online	paid	\N	\N	2026-02-26 08:22:35.724126+00	f	\N	\N
f05d6965-6eb4-45e1-8e8d-f4c87b0154bb	72e0cd6d-f353-4cbc-b59f-e63ee38dd833	696b495b-35b0-4393-b4ec-68ed91e19550	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-26	300	online	paid	\N	\N	2026-02-26 08:23:25.359706+00	f	\N	\N
c9c30689-1f92-444a-9185-0f795d2a7659	89d5c659-aa6c-4a99-b0fc-f737d9e8e0e4	111a604f-46f8-4271-8912-ccbe479ab3ef	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-26	1500	online	paid	\N	\N	2026-02-26 13:30:07.72187+00	f	\N	\N
9da99c3f-2525-4967-8457-5a422b3fc8ae	63a8b08e-b8dd-451a-bb89-b38b0bb2d9b2	5dbe34e7-1ce9-4640-b617-a2529d3479d8	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-26	500	online	paid	\N	\N	2026-02-26 13:30:34.41885+00	f	\N	\N
c323f022-5906-4a6d-8754-8f84e4e7fb70	6aac96ea-eb26-460a-8340-ffb355953ae0	8e423e8d-c1ce-4d07-9860-fd7df34eaf44	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-26	400	online	paid	\N	\N	2026-02-26 13:47:44.305617+00	f	\N	\N
2b2ede50-3f73-4018-940c-a27a17883db3	bee2c977-93c0-44ef-874e-a76e53e40a51	aa68ef20-1754-401b-9bfc-b8f2c49b0a4e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-26	400	online	paid	\N	\N	2026-02-26 14:29:27.153342+00	f	\N	\N
e0fe9fe5-ca4f-4c11-8614-0baab10a7b2c	b55df5ce-674c-47c2-9c54-73bed3e8e571	0df2b337-87db-4802-a5f9-6944970e2ff5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-26	1200	online	paid	\N	\N	2026-02-26 14:32:03.474174+00	f	\N	\N
a2aa2e66-94d1-413f-ab6b-74de4b7e84bc	f5064908-4ea0-42c7-8a63-0ddfc2a80531	dc623009-9752-43d7-b22a-384740599eb7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-26	400	cash	paid	\N	\N	2026-02-26 15:52:14.760022+00	f	\N	\N
9aa86fb4-17ed-4c6a-b200-52ce87bcfe19	8926b943-bda3-4c36-aa29-4f8576e75e90	735cd1ad-a76d-4026-87dc-60f501454b7a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-26	200	cash	paid	\N	\N	2026-02-26 15:52:54.706742+00	f	\N	\N
10331285-fde5-4c3b-b63f-8aaa17d6a327	93906c36-47ae-41bb-bb4c-a594f08896b3	27e0e2f9-8d55-4cf8-a605-3a1b95f3c368	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-26	500	cash	paid	\N	\N	2026-02-26 15:53:29.013794+00	f	\N	\N
c3c7de36-a817-46c3-8972-160acd3e188e	4bf7d91d-6da6-4d5d-9db0-30b196a13651	6f37b184-d886-4b91-a179-60f467b3e51d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-26	300	cash	paid	\N	\N	2026-02-26 15:55:27.072797+00	f	\N	\N
c38118b7-1b10-4a8a-9b55-4e5c4dad9287	ba9ab57b-e2d8-4c2a-902d-effb7b810b03	a3f57a0f-8bdf-47f7-a94d-819924cdc08a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-26	1000	online	paid	\N	\N	2026-02-26 16:09:21.837784+00	f	\N	\N
0fcdc0c9-2a07-492b-a23f-0d7f8472b9ce	c8e35247-1c57-4290-9904-8553d3c7cad5	010a0aaf-0be5-46b5-a0dc-f5fcc85ed2cf	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-26	1200	cash	paid	\N	\N	2026-02-26 16:24:30.232131+00	f	\N	\N
1329753b-9db2-46b7-b49e-5388367dbc45	bcb87a68-a59d-438f-b81a-e5a4a6b666c1	b4a8d905-3198-4d75-8ee3-3800ec8f2b40	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-26	500	online	paid	\N	\N	2026-02-26 16:34:20.200767+00	f	\N	\N
c0a99574-d286-43e7-a78f-4abf21af8cb1	064b4a2b-34b6-4da3-9286-a5d88700fe07	ecb49778-5d46-4840-9796-12a3fbe11412	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-26	300	online	paid	\N	\N	2026-02-26 17:02:17.088056+00	f	\N	\N
76bbda5d-069b-4822-9029-9a248e1ed156	89d5c659-aa6c-4a99-b0fc-f737d9e8e0e4	111a604f-46f8-4271-8912-ccbe479ab3ef	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-27	1500	online	paid	\N	\N	2026-02-27 14:03:49.160814+00	f	\N	\N
df181aef-2738-4904-a903-be36c4699797	72e0cd6d-f353-4cbc-b59f-e63ee38dd833	696b495b-35b0-4393-b4ec-68ed91e19550	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-27	300	online	paid	\N	\N	2026-02-27 14:04:17.490008+00	f	\N	\N
2b82ef59-b28f-4acf-bada-9870c794a627	e00a821e-300f-432b-8519-5ef03b42b09c	6edc184d-553a-4ab7-b3bc-924f1ea007d6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-27	600	online	paid	\N	\N	2026-02-27 14:04:50.695875+00	f	\N	\N
57a4494d-a46e-452c-8b98-d464e9cacf3f	f5064908-4ea0-42c7-8a63-0ddfc2a80531	dc623009-9752-43d7-b22a-384740599eb7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-27	400	cash	paid	\N	\N	2026-02-27 15:52:13.330726+00	f	\N	\N
8389806d-8d36-4bc9-8c04-96c09ac14458	8926b943-bda3-4c36-aa29-4f8576e75e90	735cd1ad-a76d-4026-87dc-60f501454b7a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-27	200	cash	paid	\N	\N	2026-02-27 15:52:58.655884+00	f	\N	\N
3210c797-5c44-4c72-9f17-757224996dcd	4bf7d91d-6da6-4d5d-9db0-30b196a13651	6f37b184-d886-4b91-a179-60f467b3e51d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-27	300	cash	paid	\N	\N	2026-02-27 15:53:43.221777+00	f	\N	\N
097cf845-0e83-4e68-816b-fc3e533dfe68	bee2c977-93c0-44ef-874e-a76e53e40a51	aa68ef20-1754-401b-9bfc-b8f2c49b0a4e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-27	400	cash	paid	\N	\N	2026-02-27 15:54:03.614717+00	f	\N	\N
3e42a531-8d09-432c-aca8-4904e1d03b53	064b4a2b-34b6-4da3-9286-a5d88700fe07	ecb49778-5d46-4840-9796-12a3fbe11412	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-27	300	online	paid	\N	\N	2026-02-27 17:32:59.49692+00	f	\N	\N
971c8fe1-7575-481f-9ba3-de575a8261bb	ba9ab57b-e2d8-4c2a-902d-effb7b810b03	a3f57a0f-8bdf-47f7-a94d-819924cdc08a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-28	1000	online	paid	\N	\N	2026-02-28 08:17:19.352237+00	f	\N	\N
121ba753-ee33-402c-8522-2c6128c180dd	93906c36-47ae-41bb-bb4c-a594f08896b3	27e0e2f9-8d55-4cf8-a605-3a1b95f3c368	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-28	500	online	paid	\N	\N	2026-02-28 08:17:35.762871+00	f	\N	\N
29eb93cc-bf5f-44a8-a441-55ef508ed762	72e0cd6d-f353-4cbc-b59f-e63ee38dd833	696b495b-35b0-4393-b4ec-68ed91e19550	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-28	300	online	paid	\N	\N	2026-02-28 08:31:55.842159+00	f	\N	\N
6bda7573-bae8-497e-9ce2-5570b2e6cf3a	89d5c659-aa6c-4a99-b0fc-f737d9e8e0e4	111a604f-46f8-4271-8912-ccbe479ab3ef	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-28	1500	online	paid	\N	\N	2026-02-28 10:49:03.028142+00	f	\N	\N
7e72bcff-86da-407c-8868-26371b13a5e7	860f25ca-39ff-42f0-bacb-e409bd6007d7	71d81887-5e21-4486-97e6-faea2c876cff	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-01	400	online	paid	\N	\N	2026-02-28 13:27:29.446091+00	f	\N	\N
a35081b3-7494-4fd5-9342-491b3610c355	bcb87a68-a59d-438f-b81a-e5a4a6b666c1	b4a8d905-3198-4d75-8ee3-3800ec8f2b40	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-28	1000	online	paid	\N	\N	2026-02-28 14:28:51.162333+00	f	\N	\N
df537e2a-4780-4ffe-b000-322f4f0b6fc6	1ca2f5d0-fc1b-49ab-8443-25574737d3cf	18d2e760-ed6d-44b0-af27-6b7cb9d6ddbb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-28	200	cash	paid	\N	\N	2026-02-28 14:59:06.071021+00	f	\N	\N
653f3103-231d-4dbe-ba17-f5d1f04e9076	f5064908-4ea0-42c7-8a63-0ddfc2a80531	dc623009-9752-43d7-b22a-384740599eb7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-28	400	cash	paid	\N	\N	2026-02-28 14:59:28.706513+00	f	\N	\N
72abaa66-0d7d-4e0f-9616-968bbbd8c6f3	8926b943-bda3-4c36-aa29-4f8576e75e90	735cd1ad-a76d-4026-87dc-60f501454b7a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-28	200	cash	paid	\N	\N	2026-02-28 15:00:05.576496+00	f	\N	\N
facd0b99-704c-4895-98c5-638e05c0ed8b	6aac96ea-eb26-460a-8340-ffb355953ae0	8e423e8d-c1ce-4d07-9860-fd7df34eaf44	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-28	400	online	paid	\N	\N	2026-02-28 15:00:42.553847+00	f	\N	\N
91363b29-9f2d-473e-a00c-3274dd54191b	064b4a2b-34b6-4da3-9286-a5d88700fe07	ecb49778-5d46-4840-9796-12a3fbe11412	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-28	300	online	paid	\N	\N	2026-02-28 17:37:52.079512+00	f	\N	\N
7b114fea-960e-41f2-b3d5-89dadb1a21c1	ba9ab57b-e2d8-4c2a-902d-effb7b810b03	a3f57a0f-8bdf-47f7-a94d-819924cdc08a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-01	2000	online	paid	\N	\N	2026-03-01 05:32:29.075285+00	f	\N	\N
ba0b2245-fbc5-4fdb-8ea9-94f41b24af39	aed1fa37-b39e-453a-96ac-b79ba3f4889c	191731f2-5b78-401c-8cec-590024f34df2	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-01	3500	cash	paid	\N	\N	2026-03-01 05:55:28.971107+00	f	\N	\N
2179020c-3396-42d2-bbcb-2abd36469672	89d5c659-aa6c-4a99-b0fc-f737d9e8e0e4	111a604f-46f8-4271-8912-ccbe479ab3ef	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-01	1500	online	paid	\N	\N	2026-03-01 13:45:47.128676+00	f	\N	\N
89460b67-0530-4014-8e2a-4c79d1f2030e	6aac96ea-eb26-460a-8340-ffb355953ae0	8e423e8d-c1ce-4d07-9860-fd7df34eaf44	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-01	400	online	paid	\N	\N	2026-03-01 14:57:16.032617+00	f	\N	\N
0a7cb3cc-a59a-4851-9638-11c90b05e322	1ca2f5d0-fc1b-49ab-8443-25574737d3cf	18d2e760-ed6d-44b0-af27-6b7cb9d6ddbb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-01	100	cash	paid	\N	\N	2026-03-01 15:46:48.229908+00	f	\N	\N
25422301-4987-4a43-94ac-099d7a2320d0	f5064908-4ea0-42c7-8a63-0ddfc2a80531	dc623009-9752-43d7-b22a-384740599eb7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-01	400	cash	paid	\N	\N	2026-03-01 15:47:09.464812+00	f	\N	\N
53f9a130-89fa-4175-93b3-7d1e970b96ed	8926b943-bda3-4c36-aa29-4f8576e75e90	735cd1ad-a76d-4026-87dc-60f501454b7a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-01	200	cash	paid	\N	\N	2026-03-01 15:47:46.342708+00	f	\N	\N
c99013d5-f844-4428-8b06-0382f577cd38	ba9ab57b-e2d8-4c2a-902d-effb7b810b03	a3f57a0f-8bdf-47f7-a94d-819924cdc08a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-01	1000	cash	paid	\N	\N	2026-03-01 15:48:10.212308+00	f	\N	\N
e710f78c-d844-435c-bea4-5600738fc402	e9d54922-42db-42b1-ab59-8dd42d68af4c	fe889acf-38cf-4a1f-8fce-804d5304f246	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-01	300	cash	paid	\N	\N	2026-03-01 15:48:28.62892+00	f	\N	\N
5e80fb86-93f2-48c7-877e-d91f00fb406b	c8e35247-1c57-4290-9904-8553d3c7cad5	010a0aaf-0be5-46b5-a0dc-f5fcc85ed2cf	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-01	1200	cash	paid	\N	\N	2026-03-01 15:49:12.164935+00	f	\N	\N
a854d598-8420-4b47-8b72-200e8816a6bf	bcb87a68-a59d-438f-b81a-e5a4a6b666c1	b4a8d905-3198-4d75-8ee3-3800ec8f2b40	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-01	500	online	paid	\N	\N	2026-03-01 17:43:22.129876+00	f	\N	\N
5f4c09cb-0691-49c1-b306-7b05e1c781d2	bee2c977-93c0-44ef-874e-a76e53e40a51	aa68ef20-1754-401b-9bfc-b8f2c49b0a4e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-02	400	online	paid	\N	\N	2026-03-02 08:13:04.714666+00	f	\N	\N
7303c960-ab05-467f-9b6e-4791e589affa	72e0cd6d-f353-4cbc-b59f-e63ee38dd833	696b495b-35b0-4393-b4ec-68ed91e19550	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-02	300	online	paid	\N	\N	2026-03-02 08:13:39.719614+00	f	\N	\N
f92952ec-9432-44c2-b553-72f9ab6d8ddc	bee2c977-93c0-44ef-874e-a76e53e40a51	aa68ef20-1754-401b-9bfc-b8f2c49b0a4e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-02	400	online	not_paid	\N	\N	2026-03-02 01:58:19.63033+00	f	\N	\N
33566942-7568-40b9-8e1d-62819698ca55	1cac3c77-d86c-41b8-ba55-2b1f74410661	5d640f92-1900-47f5-bb7e-a6ab5061d564	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-02	200	online	paid	\N	\N	2026-03-02 14:43:13.144844+00	f	\N	\N
34a3693a-83ed-42aa-8758-cd53b15e9165	89d5c659-aa6c-4a99-b0fc-f737d9e8e0e4	111a604f-46f8-4271-8912-ccbe479ab3ef	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-02	1500	online	paid	\N	\N	2026-03-02 15:10:48.295536+00	f	\N	\N
ad2a6318-5c9b-4468-b2c1-9a801e0d8e09	bcb87a68-a59d-438f-b81a-e5a4a6b666c1	b4a8d905-3198-4d75-8ee3-3800ec8f2b40	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-02	500	online	paid	\N	\N	2026-03-02 15:11:25.330915+00	f	\N	\N
0a92b319-deac-47fe-a5ed-32149abac3aa	bee2c977-93c0-44ef-874e-a76e53e40a51	aa68ef20-1754-401b-9bfc-b8f2c49b0a4e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-02	400	online	paid	\N	\N	2026-03-02 15:11:53.451829+00	f	\N	\N
507fd15e-34f5-46d8-bb4c-fabb464d63e5	1ca2f5d0-fc1b-49ab-8443-25574737d3cf	18d2e760-ed6d-44b0-af27-6b7cb9d6ddbb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-02	100	cash	paid	\N	\N	2026-03-02 15:12:32.183332+00	f	\N	\N
0816f90f-13c3-4e6b-acd4-1c11051d8272	8926b943-bda3-4c36-aa29-4f8576e75e90	735cd1ad-a76d-4026-87dc-60f501454b7a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-02	200	cash	paid	\N	\N	2026-03-02 15:12:54.538985+00	f	\N	\N
3ee20d20-a6f5-42a5-a391-8ba3047a444e	e9d54922-42db-42b1-ab59-8dd42d68af4c	fe889acf-38cf-4a1f-8fce-804d5304f246	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-02	300	cash	paid	\N	\N	2026-03-02 15:13:16.130884+00	f	\N	\N
89ef6ec4-f5dd-457c-92b7-2eda299f39d8	cb5975f3-72b1-4cc9-bd02-81342334cb40	6043f054-834d-437f-860a-7f9269935958	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-03	200	online	paid	\N	\N	2026-03-02 15:29:26.303616+00	f	\N	\N
aaddeff6-0557-4994-b6dc-737191629c8a	c9a697e2-d1d0-4f48-9f8b-b0a12d06de0d	6778d224-f980-48ed-801f-bef1220cd43c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-02	300	online	paid	\N	\N	2026-03-02 15:32:37.204053+00	f	\N	\N
9d35b8f1-5f17-474c-9174-10fd2f60688d	ba9ab57b-e2d8-4c2a-902d-effb7b810b03	a3f57a0f-8bdf-47f7-a94d-819924cdc08a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-02	1000	online	paid	\N	\N	2026-03-02 15:33:28.185211+00	f	\N	\N
1f7ca92a-876d-4ba0-9deb-255ee67e4074	02889b17-5d17-4dc1-ace1-381b0d733984	def4d986-3767-4793-a6e8-c767351fd93f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-02	250	cash	paid	\N	\N	2026-03-02 17:01:32.065922+00	f	\N	\N
213b6333-ead3-4ec0-83b0-a88654d3ffe5	064b4a2b-34b6-4da3-9286-a5d88700fe07	ecb49778-5d46-4840-9796-12a3fbe11412	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-04	300	online	paid	\N	\N	2026-03-04 15:05:42.619037+00	f	\N	\N
a02af1d6-0047-4700-98ff-8041ac40486f	f5064908-4ea0-42c7-8a63-0ddfc2a80531	dc623009-9752-43d7-b22a-384740599eb7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-03	400	cash	paid	\N	\N	2026-03-04 15:06:35.540817+00	f	\N	\N
4e1c6e19-5e06-45a4-9556-b25bc0c746d4	8926b943-bda3-4c36-aa29-4f8576e75e90	735cd1ad-a76d-4026-87dc-60f501454b7a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-03	200	cash	paid	\N	\N	2026-03-04 15:07:06.090963+00	f	\N	\N
49497684-30bf-4748-b8c4-1517cbafe54e	1ca2f5d0-fc1b-49ab-8443-25574737d3cf	18d2e760-ed6d-44b0-af27-6b7cb9d6ddbb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-03	100	cash	paid	\N	\N	2026-03-04 15:08:01.930973+00	f	\N	\N
f068dae4-ae1f-4de4-b5fb-c1009134d94d	064b4a2b-34b6-4da3-9286-a5d88700fe07	ecb49778-5d46-4840-9796-12a3fbe11412	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-03	300	online	paid	\N	\N	2026-03-04 15:09:36.319839+00	f	\N	\N
8b1df0dc-4fc9-4ca8-af12-461f91b6a72c	e00a821e-300f-432b-8519-5ef03b42b09c	6edc184d-553a-4ab7-b3bc-924f1ea007d6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-03	600	online	paid	\N	\N	2026-03-04 15:10:12.328922+00	f	\N	\N
1e1ea377-0c01-4727-a547-e4b21d0797ae	860f25ca-39ff-42f0-bacb-e409bd6007d7	71d81887-5e21-4486-97e6-faea2c876cff	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-03	200	online	paid	\N	\N	2026-03-04 15:10:39.025461+00	f	\N	\N
af20df17-1724-4af8-a6e1-3627c7998dc0	1cac3c77-d86c-41b8-ba55-2b1f74410661	5d640f92-1900-47f5-bb7e-a6ab5061d564	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-03	200	online	paid	\N	\N	2026-03-04 15:11:14.00374+00	f	\N	\N
0313ccb0-1d9f-4775-8e56-6bf17e7c5900	ba9ab57b-e2d8-4c2a-902d-effb7b810b03	a3f57a0f-8bdf-47f7-a94d-819924cdc08a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-03	1000	online	paid	\N	\N	2026-03-04 15:12:00.640068+00	f	\N	\N
eea93a39-d925-4088-af28-875a9051e8c3	89d5c659-aa6c-4a99-b0fc-f737d9e8e0e4	111a604f-46f8-4271-8912-ccbe479ab3ef	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-03	1500	online	paid	\N	\N	2026-03-04 15:12:30.702486+00	f	\N	\N
fa4f72e7-f06a-43a1-9f22-b250cb79a59d	bee2c977-93c0-44ef-874e-a76e53e40a51	aa68ef20-1754-401b-9bfc-b8f2c49b0a4e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-03	400	online	paid	\N	\N	2026-03-04 15:12:52.362569+00	f	\N	\N
487e69bd-46b5-46d7-ad1c-b16044c873f4	bcb87a68-a59d-438f-b81a-e5a4a6b666c1	b4a8d905-3198-4d75-8ee3-3800ec8f2b40	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-03	500	online	paid	\N	\N	2026-03-04 15:13:19.357066+00	f	\N	\N
619e8275-ef4b-4ee7-a130-686ecb6049c9	8d648ef9-92ca-4513-8639-f0b3ec50a392	eed1102c-8dcc-4caf-9239-6a9cd7332ccc	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-03	200	online	paid	\N	\N	2026-03-04 15:13:41.002626+00	f	\N	\N
ab5f6e68-c8ab-4670-bf47-89ca274eb0d2	1cac3c77-d86c-41b8-ba55-2b1f74410661	5d640f92-1900-47f5-bb7e-a6ab5061d564	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-04	200	cash	paid	\N	\N	2026-03-04 15:51:40.602257+00	f	\N	\N
4861c430-8739-44f7-8959-8dcb0e67e993	1ca2f5d0-fc1b-49ab-8443-25574737d3cf	18d2e760-ed6d-44b0-af27-6b7cb9d6ddbb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-04	100	cash	paid	\N	\N	2026-03-04 15:52:09.867004+00	f	\N	\N
727e56ef-b45b-4caf-b487-32b421646cf2	f5064908-4ea0-42c7-8a63-0ddfc2a80531	dc623009-9752-43d7-b22a-384740599eb7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-04	400	cash	paid	\N	\N	2026-03-04 15:52:26.974993+00	f	\N	\N
d38adcd9-3e71-4a6e-80ef-c8dd4ae96c5a	bee2c977-93c0-44ef-874e-a76e53e40a51	aa68ef20-1754-401b-9bfc-b8f2c49b0a4e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-04	400	online	paid	\N	\N	2026-03-04 15:56:02.122576+00	f	\N	\N
effb6af9-551c-40dd-a770-eab0fe193fd2	b55df5ce-674c-47c2-9c54-73bed3e8e571	0df2b337-87db-4802-a5f9-6944970e2ff5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-04	1200	online	paid	\N	\N	2026-03-04 15:56:49.854845+00	f	\N	\N
63427235-c8af-4de4-bed1-9d113319bc55	6aac96ea-eb26-460a-8340-ffb355953ae0	8e423e8d-c1ce-4d07-9860-fd7df34eaf44	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-04	800	online	paid	\N	\N	2026-03-04 15:57:10.430055+00	f	\N	\N
77142fd2-1e0f-4f20-b062-28ce62e28b37	860f25ca-39ff-42f0-bacb-e409bd6007d7	71d81887-5e21-4486-97e6-faea2c876cff	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-04	200	online	paid	\N	\N	2026-03-04 15:57:32.380018+00	f	\N	\N
1cb25ae3-7ba9-4f62-80ab-f1709738517d	89d5c659-aa6c-4a99-b0fc-f737d9e8e0e4	111a604f-46f8-4271-8912-ccbe479ab3ef	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-04	1500	online	paid	\N	\N	2026-03-05 02:33:20.671643+00	f	\N	\N
0f81224b-bfd9-452e-a849-f515945a1d90	cb5975f3-72b1-4cc9-bd02-81342334cb40	6043f054-834d-437f-860a-7f9269935958	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-05	200	online	paid	\N	\N	2026-03-05 02:33:45.910968+00	f	\N	\N
bc23d4ec-af8e-431a-bd92-3ff081a34a16	8d648ef9-92ca-4513-8639-f0b3ec50a392	eed1102c-8dcc-4caf-9239-6a9cd7332ccc	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-05	200	online	paid	\N	\N	2026-03-05 02:34:12.06891+00	f	\N	\N
fe2c3c90-c7b9-4e97-ae0a-664e0686af87	02889b17-5d17-4dc1-ace1-381b0d733984	def4d986-3767-4793-a6e8-c767351fd93f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-05	500	cash	paid	\N	\N	2026-03-05 06:52:50.139708+00	f	\N	\N
bbbb3135-f55c-4fd4-8518-e81ac20a4f91	bcb87a68-a59d-438f-b81a-e5a4a6b666c1	b4a8d905-3198-4d75-8ee3-3800ec8f2b40	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-05	1000	online	paid	\N	\N	2026-03-05 07:34:45.51621+00	f	\N	\N
5011c8e6-280f-4561-b357-6a855d389a98	67eb359b-25a2-481e-ae53-c208688f5940	7ebb952f-b8ce-452d-a076-36b5efc9d1c5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-05	900	online	paid	\N	\N	2026-03-05 07:35:15.95825+00	f	\N	\N
e1e1471a-8898-4328-b2fb-c188d5e03933	b9bd3700-24a0-4fa2-9afa-ca0827c26188	b80d47c9-3d98-41cd-9037-7ddcdac87f0c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-05	400	online	paid	\N	\N	2026-03-05 13:47:19.171795+00	f	\N	\N
8dc5b867-5d5d-4a51-9ba8-367c1d2d8907	ba9ab57b-e2d8-4c2a-902d-effb7b810b03	a3f57a0f-8bdf-47f7-a94d-819924cdc08a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-05	1000	online	paid	\N	\N	2026-03-05 13:47:47.504008+00	f	\N	\N
2e289e8e-8942-4d0e-a3a1-b7f05394f9ed	93906c36-47ae-41bb-bb4c-a594f08896b3	27e0e2f9-8d55-4cf8-a605-3a1b95f3c368	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-05	500	online	paid	\N	\N	2026-03-05 13:48:14.06125+00	f	\N	\N
46928bac-c719-4209-8063-5bdcad607431	89d5c659-aa6c-4a99-b0fc-f737d9e8e0e4	111a604f-46f8-4271-8912-ccbe479ab3ef	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-05	1500	online	paid	\N	\N	2026-03-05 13:48:38.338737+00	f	\N	\N
dbe183b8-61ef-42bc-9f78-745295fb901e	c5f80bd8-670e-4df5-8c6a-ac7378801077	3a181c18-8f9e-4467-96a8-c09687ebea27	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-05	500	online	paid	\N	\N	2026-03-05 14:41:09.159797+00	f	\N	\N
3cfed9b8-e63d-475e-b93f-0e7f2cf3f3c1	1cac3c77-d86c-41b8-ba55-2b1f74410661	5d640f92-1900-47f5-bb7e-a6ab5061d564	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-05	200	online	paid	\N	\N	2026-03-05 15:16:13.042767+00	f	\N	\N
4a17d95d-96a7-4753-8e20-87256c084bd1	1ca2f5d0-fc1b-49ab-8443-25574737d3cf	18d2e760-ed6d-44b0-af27-6b7cb9d6ddbb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-05	100	cash	paid	\N	\N	2026-03-05 15:42:31.831803+00	f	\N	\N
3432e039-c634-4e38-b7a6-7812c5f1137a	e9d54922-42db-42b1-ab59-8dd42d68af4c	fe889acf-38cf-4a1f-8fce-804d5304f246	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-05	300	cash	paid	\N	\N	2026-03-05 15:42:55.31415+00	f	\N	\N
b469506c-e73a-4f67-ad59-e0a3e7919de5	e00a821e-300f-432b-8519-5ef03b42b09c	6edc184d-553a-4ab7-b3bc-924f1ea007d6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-05	600	online	paid	\N	\N	2026-03-05 15:43:13.690998+00	f	\N	\N
4f24f8e7-1d06-4ae6-9391-fa57638c7e4e	064b4a2b-34b6-4da3-9286-a5d88700fe07	ecb49778-5d46-4840-9796-12a3fbe11412	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-05	100	online	paid	\N	\N	2026-03-05 15:54:43.663834+00	f	\N	\N
5c2dc993-91ee-48df-8ff7-d5f839221a1e	064b4a2b-34b6-4da3-9286-a5d88700fe07	ecb49778-5d46-4840-9796-12a3fbe11412	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-05	200	online	paid	\N	\N	2026-03-05 16:04:11.727589+00	f	\N	\N
9a352355-7844-448c-92ef-938db71704f4	c9a697e2-d1d0-4f48-9f8b-b0a12d06de0d	6778d224-f980-48ed-801f-bef1220cd43c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-05	200	online	paid	\N	\N	2026-03-05 16:15:13.482201+00	f	\N	\N
9262d0c7-2a40-488d-bd8f-a41db8583f7e	860f25ca-39ff-42f0-bacb-e409bd6007d7	71d81887-5e21-4486-97e6-faea2c876cff	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-05	200	online	paid	\N	\N	2026-03-05 17:07:52.232613+00	f	\N	\N
71e0b5e8-2df8-4e4f-97b5-bad893d382d3	bee2c977-93c0-44ef-874e-a76e53e40a51	aa68ef20-1754-401b-9bfc-b8f2c49b0a4e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-05	400	online	paid	\N	\N	2026-03-05 17:08:10.583697+00	f	\N	\N
abba6c9c-7d4e-4bfe-bf93-cbeea2c80637	8d648ef9-92ca-4513-8639-f0b3ec50a392	eed1102c-8dcc-4caf-9239-6a9cd7332ccc	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-05	200	online	paid	\N	\N	2026-03-06 00:52:14.664329+00	f	\N	\N
bd198765-7313-4f41-9803-1bc99ee05bd6	02889b17-5d17-4dc1-ace1-381b0d733984	def4d986-3767-4793-a6e8-c767351fd93f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-06	500	cash	paid	\N	\N	2026-03-06 12:54:04.194505+00	f	\N	\N
ab0242fe-548e-4d74-83a4-78a0267c1314	89d5c659-aa6c-4a99-b0fc-f737d9e8e0e4	111a604f-46f8-4271-8912-ccbe479ab3ef	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-06	1500	online	paid	\N	\N	2026-03-06 13:02:44.410064+00	f	\N	\N
61d6f3e9-bcfb-4724-ab6b-8930f8e2891a	72e0cd6d-f353-4cbc-b59f-e63ee38dd833	696b495b-35b0-4393-b4ec-68ed91e19550	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-06	1200	online	paid	\N	\N	2026-03-06 13:03:05.3173+00	f	\N	\N
52be84d8-b53d-40bd-9192-8ec8ba9deb7e	c5f80bd8-670e-4df5-8c6a-ac7378801077	3a181c18-8f9e-4467-96a8-c09687ebea27	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-06	500	online	paid	\N	\N	2026-03-06 13:16:40.748051+00	f	\N	\N
77b4e62c-1d49-44e0-a384-d7e39494f5c5	b9bd3700-24a0-4fa2-9afa-ca0827c26188	b80d47c9-3d98-41cd-9037-7ddcdac87f0c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-06	400	online	paid	\N	\N	2026-03-06 13:40:13.906066+00	f	\N	\N
e5a2ceaf-0b5e-4eb4-ae9e-130887c6f7c2	93906c36-47ae-41bb-bb4c-a594f08896b3	27e0e2f9-8d55-4cf8-a605-3a1b95f3c368	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-06	500	online	paid	\N	\N	2026-03-06 13:47:40.877051+00	f	\N	\N
94ac53de-7a4f-4870-8dd6-a582deb6835d	c8e35247-1c57-4290-9904-8553d3c7cad5	010a0aaf-0be5-46b5-a0dc-f5fcc85ed2cf	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-06	1200	online	paid	\N	\N	2026-03-06 13:51:10.845921+00	f	\N	\N
b2f39ad6-a557-4663-9f1e-c7a24eeaf752	30e2e57d-801d-4c86-9ecc-5df01dfc0696	8d22f5f4-95f7-41a5-9819-ca25a18de27f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-06	600	online	paid	\N	\N	2026-03-06 14:39:20.08365+00	f	\N	\N
0847de22-7cbc-43fc-b362-c940aab05717	cb5975f3-72b1-4cc9-bd02-81342334cb40	6043f054-834d-437f-860a-7f9269935958	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-06	200	online	paid	\N	\N	2026-03-06 14:48:50.222687+00	f	\N	\N
bff31b0d-2cc7-4b97-8c98-efd6ae649fec	1cac3c77-d86c-41b8-ba55-2b1f74410661	5d640f92-1900-47f5-bb7e-a6ab5061d564	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-06	200	online	paid	\N	\N	2026-03-06 14:53:35.455625+00	f	\N	\N
3eb9e7a8-0cb9-42a1-937e-4fbfc532eb08	eec56395-bc3e-4592-8a21-7b694944b6eb	bd6c3241-ee7a-49a4-8f31-6ca7af5980d8	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-06	2000	online	paid	\N	\N	2026-03-06 15:13:02.852238+00	f	\N	\N
6ae5dee2-274a-4d19-a52c-cdbc573de0bf	f5064908-4ea0-42c7-8a63-0ddfc2a80531	dc623009-9752-43d7-b22a-384740599eb7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-06	400	cash	paid	\N	\N	2026-03-06 15:31:36.509342+00	f	\N	\N
64dcf2ba-9257-4308-815e-c4d40c58cb7e	8926b943-bda3-4c36-aa29-4f8576e75e90	735cd1ad-a76d-4026-87dc-60f501454b7a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-06	600	cash	paid	\N	\N	2026-03-06 15:31:57.737438+00	f	\N	\N
7cac54b8-dd30-4acb-ba3f-0c16ff5aed2d	4bf7d91d-6da6-4d5d-9db0-30b196a13651	6f37b184-d886-4b91-a179-60f467b3e51d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-06	1500	cash	paid	\N	\N	2026-03-06 15:32:26.682147+00	f	\N	\N
5c87ee5a-b241-4441-aed9-5321cf127236	eec56395-bc3e-4592-8a21-7b694944b6eb	bd6c3241-ee7a-49a4-8f31-6ca7af5980d8	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-06	0	online	not_paid	\N	\N	2026-03-06 15:31:13.716924+00	f	\N	\N
540f83a1-ef23-4eb6-85f0-aefdcb74a08e	064b4a2b-34b6-4da3-9286-a5d88700fe07	ecb49778-5d46-4840-9796-12a3fbe11412	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-06	100	online	paid	\N	\N	2026-03-06 16:03:05.740451+00	f	\N	\N
447ef24a-3c4e-49de-bfbd-7b35b98c4c59	ba9ab57b-e2d8-4c2a-902d-effb7b810b03	a3f57a0f-8bdf-47f7-a94d-819924cdc08a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-07	1000	online	paid	\N	\N	2026-03-07 00:56:20.309472+00	f	\N	\N
b1452233-6b40-4744-8c9b-bb99086ffd78	6aac96ea-eb26-460a-8340-ffb355953ae0	8e423e8d-c1ce-4d07-9860-fd7df34eaf44	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-07	400	online	paid	\N	\N	2026-03-07 02:08:54.736615+00	f	\N	\N
4b820fda-6d04-449d-ace9-ae41a31f8715	89d5c659-aa6c-4a99-b0fc-f737d9e8e0e4	111a604f-46f8-4271-8912-ccbe479ab3ef	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-07	1500	online	paid	\N	\N	2026-03-07 13:38:54.01163+00	f	\N	\N
13a4cddf-8eff-401a-bde4-706963688c5c	860f25ca-39ff-42f0-bacb-e409bd6007d7	71d81887-5e21-4486-97e6-faea2c876cff	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-07	200	online	paid	\N	\N	2026-03-07 13:40:56.760851+00	f	\N	\N
9aed1f15-2bd1-483a-b0a6-60d4effc457a	1cac3c77-d86c-41b8-ba55-2b1f74410661	5d640f92-1900-47f5-bb7e-a6ab5061d564	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-07	200	online	paid	\N	\N	2026-03-07 15:04:46.475805+00	f	\N	\N
5bacd099-7929-4fdd-96f7-3e1201f93637	4bf7d91d-6da6-4d5d-9db0-30b196a13651	6f37b184-d886-4b91-a179-60f467b3e51d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-07	900	cash	paid	\N	\N	2026-03-07 15:06:20.023465+00	f	\N	\N
46735147-7984-43b0-bb29-4fcdb1593056	8926b943-bda3-4c36-aa29-4f8576e75e90	735cd1ad-a76d-4026-87dc-60f501454b7a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-07	200	cash	paid	\N	\N	2026-03-07 15:09:47.357335+00	f	\N	\N
46daac85-44f0-4a4f-88d1-e4bf01fcb604	f5064908-4ea0-42c7-8a63-0ddfc2a80531	dc623009-9752-43d7-b22a-384740599eb7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-07	400	cash	paid	\N	\N	2026-03-07 15:10:29.059711+00	f	\N	\N
769b7927-9ec0-4bbd-9079-5751c99f47a1	c5f80bd8-670e-4df5-8c6a-ac7378801077	3a181c18-8f9e-4467-96a8-c09687ebea27	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-07	500	online	paid	\N	\N	2026-03-07 15:59:01.361252+00	f	\N	\N
de64d63a-4a0d-41e7-9392-f2310060047a	ba9ab57b-e2d8-4c2a-902d-effb7b810b03	a3f57a0f-8bdf-47f7-a94d-819924cdc08a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-07	1000	online	paid	\N	\N	2026-03-07 17:30:51.035523+00	f	\N	\N
e8d8e95c-a8e5-4a1d-942b-8fe7824e2274	cb5975f3-72b1-4cc9-bd02-81342334cb40	6043f054-834d-437f-860a-7f9269935958	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-07	200	online	paid	\N	\N	2026-03-07 17:31:17.064461+00	f	\N	\N
aca025cd-bc1c-441b-850a-19169670ebd4	064b4a2b-34b6-4da3-9286-a5d88700fe07	ecb49778-5d46-4840-9796-12a3fbe11412	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-07	200	online	paid	\N	\N	2026-03-08 01:13:24.951859+00	f	\N	\N
9dc4e9d8-c0ff-46cf-8030-29509d6f7473	064b4a2b-34b6-4da3-9286-a5d88700fe07	ecb49778-5d46-4840-9796-12a3fbe11412	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-08	100	online	paid	\N	\N	2026-03-08 05:07:49.232122+00	f	\N	\N
7f1f524f-8b67-4b3a-b6e1-ec7bfb273e12	8d648ef9-92ca-4513-8639-f0b3ec50a392	eed1102c-8dcc-4caf-9239-6a9cd7332ccc	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-08	400	online	paid	\N	\N	2026-03-08 05:08:08.179516+00	f	\N	\N
8b43111b-35e6-40e0-a24c-def20536a0cf	02889b17-5d17-4dc1-ace1-381b0d733984	def4d986-3767-4793-a6e8-c767351fd93f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-08	250	cash	paid	\N	\N	2026-03-08 06:28:31.224346+00	f	\N	\N
1a39912c-e307-4b94-9f67-d1a2cce91b7d	860f25ca-39ff-42f0-bacb-e409bd6007d7	71d81887-5e21-4486-97e6-faea2c876cff	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-08	200	online	paid	\N	\N	2026-03-08 13:09:38.449965+00	f	\N	\N
2534076d-9248-4e25-8587-a21bdf3c8001	30e2e57d-801d-4c86-9ecc-5df01dfc0696	8d22f5f4-95f7-41a5-9819-ca25a18de27f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-08	600	online	paid	\N	\N	2026-03-08 13:25:34.065704+00	f	\N	\N
7a65fa46-d5f5-4d1f-967f-21d8dd97f967	c62f3118-4803-4149-8621-2473aec070c1	43615615-48b3-4cb6-b3ff-cfcb63bb8a20	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-08	1000	online	paid	\N	\N	2026-03-08 14:01:29.917938+00	f	\N	\N
497b9003-53d0-4b32-8d9f-f8cbb95bd06e	1cac3c77-d86c-41b8-ba55-2b1f74410661	5d640f92-1900-47f5-bb7e-a6ab5061d564	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-08	200	online	paid	\N	\N	2026-03-08 14:56:14.137666+00	f	\N	\N
19903755-dffd-43bd-adb6-664a2d9fdbe9	e00a821e-300f-432b-8519-5ef03b42b09c	6edc184d-553a-4ab7-b3bc-924f1ea007d6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-08	900	online	paid	\N	\N	2026-03-08 14:59:27.06558+00	f	\N	\N
de627be6-871b-469d-a550-398e883917a8	bcb87a68-a59d-438f-b81a-e5a4a6b666c1	b4a8d905-3198-4d75-8ee3-3800ec8f2b40	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-08	1000	online	paid	\N	\N	2026-03-08 15:05:01.976403+00	f	\N	\N
db550ffc-356b-4ea2-a08a-cd105f6efe2d	f5064908-4ea0-42c7-8a63-0ddfc2a80531	dc623009-9752-43d7-b22a-384740599eb7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-08	400	cash	paid	\N	\N	2026-03-08 15:18:54.084755+00	f	\N	\N
96d7e673-3604-4629-9d9f-b404ae694bfe	89d5c659-aa6c-4a99-b0fc-f737d9e8e0e4	111a604f-46f8-4271-8912-ccbe479ab3ef	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-08	1500	online	paid	\N	\N	2026-03-08 15:25:20.71083+00	f	\N	\N
0a34c205-dbd0-45fb-b5b0-7cb6b929f5a6	c5f80bd8-670e-4df5-8c6a-ac7378801077	3a181c18-8f9e-4467-96a8-c09687ebea27	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-08	500	online	paid	\N	\N	2026-03-08 15:45:34.517722+00	f	\N	\N
2540a1ba-ae90-41e3-a444-398c30f88825	ba9ab57b-e2d8-4c2a-902d-effb7b810b03	a3f57a0f-8bdf-47f7-a94d-819924cdc08a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-08	1000	online	paid	\N	\N	2026-03-08 16:28:24.679469+00	f	\N	\N
ca89b9fb-00a7-43f7-bc45-b9dbab51c838	b9bd3700-24a0-4fa2-9afa-ca0827c26188	b80d47c9-3d98-41cd-9037-7ddcdac87f0c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-08	400	online	paid	\N	\N	2026-03-08 16:28:55.534868+00	f	\N	\N
5e731031-2f01-42c9-8a93-472563c77003	064b4a2b-34b6-4da3-9286-a5d88700fe07	ecb49778-5d46-4840-9796-12a3fbe11412	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-08	300	online	paid	\N	\N	2026-03-09 05:47:10.010115+00	f	\N	\N
0bb22d22-9a8e-4d20-b85d-4750e2d26fab	bee2c977-93c0-44ef-874e-a76e53e40a51	aa68ef20-1754-401b-9bfc-b8f2c49b0a4e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-09	1200	online	paid	\N	\N	2026-03-09 06:46:24.802839+00	f	\N	\N
0623ca02-4592-41a4-b9b1-7694c0d663b3	67eb359b-25a2-481e-ae53-c208688f5940	7ebb952f-b8ce-452d-a076-36b5efc9d1c5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-09	600	online	paid	\N	\N	2026-03-09 09:17:39.250253+00	f	\N	\N
a20c87c6-1dbf-4a97-81d7-a079c669075c	63a8b08e-b8dd-451a-bb89-b38b0bb2d9b2	5dbe34e7-1ce9-4640-b617-a2529d3479d8	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-09	400	online	paid	\N	\N	2026-03-09 13:18:41.327272+00	f	\N	\N
86dbd770-459b-4673-8652-39f687146923	c5f80bd8-670e-4df5-8c6a-ac7378801077	3a181c18-8f9e-4467-96a8-c09687ebea27	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-09	500	online	paid	\N	\N	2026-03-09 13:51:30.888671+00	f	\N	\N
7809976f-7c08-48f8-8e65-fe1df29af835	064b4a2b-34b6-4da3-9286-a5d88700fe07	ecb49778-5d46-4840-9796-12a3fbe11412	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-09	300	online	paid	\N	\N	2026-03-09 14:14:01.696882+00	f	\N	\N
8666f60a-50a3-4567-9974-8d6dda3ba247	30e2e57d-801d-4c86-9ecc-5df01dfc0696	8d22f5f4-95f7-41a5-9819-ca25a18de27f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-09	600	online	paid	\N	\N	2026-03-09 14:18:21.715716+00	f	\N	\N
02e83fee-4827-48c9-9a94-74df2e5c0b1b	6aac96ea-eb26-460a-8340-ffb355953ae0	8e423e8d-c1ce-4d07-9860-fd7df34eaf44	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-09	400	online	paid	\N	\N	2026-03-09 14:45:12.189494+00	f	\N	\N
c6966fb7-1efe-4ca6-9f2d-be2aef2330d7	89d5c659-aa6c-4a99-b0fc-f737d9e8e0e4	111a604f-46f8-4271-8912-ccbe479ab3ef	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-09	1500	online	paid	\N	\N	2026-03-09 14:45:47.798287+00	f	\N	\N
e303f872-8dca-4f5a-aab9-a2d8ed40e37e	1ca2f5d0-fc1b-49ab-8443-25574737d3cf	18d2e760-ed6d-44b0-af27-6b7cb9d6ddbb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-09	100	cash	paid	\N	\N	2026-03-09 14:57:12.514554+00	f	\N	\N
32b55bc7-774b-4782-b801-1613b3f8b3b1	1ca2f5d0-fc1b-49ab-8443-25574737d3cf	18d2e760-ed6d-44b0-af27-6b7cb9d6ddbb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-09	200	cash	paid	\N	\N	2026-03-09 14:57:55.333201+00	f	\N	\N
0392bb2b-948e-4d22-a5ac-3f3558a59559	f5064908-4ea0-42c7-8a63-0ddfc2a80531	dc623009-9752-43d7-b22a-384740599eb7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-09	400	cash	paid	\N	\N	2026-03-09 14:59:12.869825+00	f	\N	\N
eaa254fa-0a7b-471a-92fd-1f7638ec632d	02889b17-5d17-4dc1-ace1-381b0d733984	def4d986-3767-4793-a6e8-c767351fd93f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-09	250	cash	paid	\N	\N	2026-03-09 15:09:07.740258+00	f	\N	\N
b2f770fd-bcb0-4e7c-ba82-6605a036b1bc	35038458-ade9-412d-877d-814bb95adf5d	794af05e-0e94-449e-90ee-691d82534c27	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-10	400	online	paid	\N	\N	2026-03-10 04:11:14.291012+00	f	\N	\N
526fa40c-4ba1-469f-bb46-64dbe672647c	ba9ab57b-e2d8-4c2a-902d-effb7b810b03	a3f57a0f-8bdf-47f7-a94d-819924cdc08a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-10	2000	online	paid	\N	\N	2026-03-10 05:40:29.554406+00	f	\N	\N
8a770b0f-be2a-4340-86c4-a0126a64388b	c8e35247-1c57-4290-9904-8553d3c7cad5	010a0aaf-0be5-46b5-a0dc-f5fcc85ed2cf	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-10	1200	cash	paid	\N	\N	2026-03-10 14:27:52.401028+00	f	\N	\N
f35376b3-507a-4345-8295-059b5c7aacfe	860f25ca-39ff-42f0-bacb-e409bd6007d7	71d81887-5e21-4486-97e6-faea2c876cff	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-10	200	online	paid	\N	\N	2026-03-10 14:30:52.252521+00	f	\N	\N
d1f017a6-1a46-4a5f-9092-0e6e23402759	32e40b35-8c4b-4552-b8b8-7c233d31c03d	757d4684-58bf-40d2-bfdd-ec9921ff94d7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-10	250	online	paid	\N	\N	2026-03-10 14:48:41.861837+00	f	\N	\N
5649349c-f1d1-495c-a4fb-6e314c9e3a87	e00a821e-300f-432b-8519-5ef03b42b09c	6edc184d-553a-4ab7-b3bc-924f1ea007d6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-10	900	online	paid	\N	\N	2026-03-10 14:50:58.827046+00	f	\N	\N
b2a344be-70f6-4316-93b3-983519f0e0dc	8926b943-bda3-4c36-aa29-4f8576e75e90	735cd1ad-a76d-4026-87dc-60f501454b7a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-10	200	cash	paid	\N	\N	2026-03-10 15:01:13.349246+00	f	\N	\N
8ed20cdc-8e04-4fe9-8692-868850a8029b	8926b943-bda3-4c36-aa29-4f8576e75e90	735cd1ad-a76d-4026-87dc-60f501454b7a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-10	400	cash	paid	\N	\N	2026-03-10 15:02:34.08738+00	f	\N	\N
e61462c0-de47-4256-8192-7baf418ac88b	1ca2f5d0-fc1b-49ab-8443-25574737d3cf	18d2e760-ed6d-44b0-af27-6b7cb9d6ddbb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-10	100	cash	paid	\N	\N	2026-03-10 15:03:37.637103+00	f	\N	\N
f4689d11-0f87-498e-b239-27995f230be3	f5064908-4ea0-42c7-8a63-0ddfc2a80531	dc623009-9752-43d7-b22a-384740599eb7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-10	400	cash	paid	\N	\N	2026-03-10 15:04:17.609456+00	f	\N	\N
64b41276-f894-4656-bd28-244b361980fe	4bf7d91d-6da6-4d5d-9db0-30b196a13651	6f37b184-d886-4b91-a179-60f467b3e51d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-10	600	cash	paid	\N	\N	2026-03-10 15:05:58.579478+00	f	\N	\N
14d7315c-afde-4911-87fd-88f66c9a5238	6aac96ea-eb26-460a-8340-ffb355953ae0	8e423e8d-c1ce-4d07-9860-fd7df34eaf44	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-10	400	online	paid	\N	\N	2026-03-10 15:39:33.065765+00	f	\N	\N
62fed903-aa85-4044-8dd7-60b6d71e8d14	0d8641d3-1860-4dac-8f9c-a7362226fe97	682ad2e5-1d22-4c44-a132-b8580c165d1d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-10	300	online	paid	\N	\N	2026-03-10 15:39:58.799335+00	f	\N	\N
ddfd4e04-a089-402e-ae40-ddd2693b318c	1cac3c77-d86c-41b8-ba55-2b1f74410661	5d640f92-1900-47f5-bb7e-a6ab5061d564	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-10	200	online	paid	\N	\N	2026-03-10 15:43:12.758412+00	f	\N	\N
077a876c-0558-4052-b47e-ca96f3fabd41	064b4a2b-34b6-4da3-9286-a5d88700fe07	ecb49778-5d46-4840-9796-12a3fbe11412	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-10	100	online	paid	\N	\N	2026-03-10 16:11:21.331026+00	f	\N	\N
c7ea0c52-f911-4ba8-b506-537521acc88f	b9bd3700-24a0-4fa2-9afa-ca0827c26188	b80d47c9-3d98-41cd-9037-7ddcdac87f0c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-10	400	online	paid	\N	\N	2026-03-10 16:27:48.548831+00	f	\N	\N
97820943-ec29-48d9-a421-0e89cbb08661	bcb87a68-a59d-438f-b81a-e5a4a6b666c1	b4a8d905-3198-4d75-8ee3-3800ec8f2b40	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-10	500	online	paid	\N	\N	2026-03-10 17:10:58.236741+00	f	\N	\N
cef2e994-9897-4b9c-a3ab-e0e2e8c330ba	89d5c659-aa6c-4a99-b0fc-f737d9e8e0e4	111a604f-46f8-4271-8912-ccbe479ab3ef	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-10	1500	online	paid	\N	\N	2026-03-10 17:12:15.511504+00	f	\N	\N
bb93453d-4540-46ad-80bf-2bb7938e2203	35038458-ade9-412d-877d-814bb95adf5d	794af05e-0e94-449e-90ee-691d82534c27	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-10	200	online	paid	\N	\N	2026-03-11 00:58:11.649318+00	f	\N	\N
df47fbed-f7c5-4af7-a3f7-afd88249f105	c9a697e2-d1d0-4f48-9f8b-b0a12d06de0d	6778d224-f980-48ed-801f-bef1220cd43c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11	200	online	paid	\N	\N	2026-03-11 04:59:13.960842+00	f	\N	\N
44c0856c-8f77-4d60-b902-8427582d7348	67eb359b-25a2-481e-ae53-c208688f5940	7ebb952f-b8ce-452d-a076-36b5efc9d1c5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11	1500	online	paid	\N	\N	2026-03-11 06:02:57.565148+00	f	\N	\N
97274fbc-e38b-470c-9572-8781650b02d5	271816e2-6379-480d-92c3-c5f6fc561298	9b9a19c0-f88e-46eb-afd6-b823511a12e9	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11	600	online	paid	\N	\N	2026-03-11 12:58:35.126652+00	f	\N	\N
3b2c75be-5400-45d6-8262-fd9520fefedd	064b4a2b-34b6-4da3-9286-a5d88700fe07	ecb49778-5d46-4840-9796-12a3fbe11412	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11	200	online	paid	\N	\N	2026-03-11 12:59:08.625567+00	f	\N	\N
3ea553fd-fed7-4ec5-9869-4156903abcd5	cb5975f3-72b1-4cc9-bd02-81342334cb40	6043f054-834d-437f-860a-7f9269935958	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11	200	online	paid	\N	\N	2026-03-11 12:59:52.349028+00	f	\N	\N
cba19104-5a88-46b4-b53e-ffee4378d3e0	63a8b08e-b8dd-451a-bb89-b38b0bb2d9b2	5dbe34e7-1ce9-4640-b617-a2529d3479d8	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11	200	online	paid	\N	\N	2026-03-11 13:00:33.702463+00	f	\N	\N
490f4fed-dccc-46de-b142-5500b6d17a3a	6aac96ea-eb26-460a-8340-ffb355953ae0	8e423e8d-c1ce-4d07-9860-fd7df34eaf44	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11	400	online	paid	\N	\N	2026-03-11 13:01:06.708522+00	f	\N	\N
37b59b92-82c0-4b90-8a11-2b4f0e17b465	f35169da-5d69-4e7e-a35e-ed6237a94cff	6398b3f9-45c4-45b0-a7fc-0e3e1ced4173	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11	500	online	paid	\N	\N	2026-03-11 13:01:46.127353+00	f	\N	\N
f42f44d0-6b46-4303-ac5c-9c991caa73f7	93906c36-47ae-41bb-bb4c-a594f08896b3	27e0e2f9-8d55-4cf8-a605-3a1b95f3c368	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11	500	online	paid	\N	\N	2026-03-11 13:02:19.629959+00	f	\N	\N
f0b5657d-120b-4b19-9896-70e9c559c25d	ac85d0d3-a358-46b8-bf3e-4f4468ca5670	7a331756-19b2-4a9f-a2ee-2b3f6a641e72	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11	2400	online	paid	\N	\N	2026-03-11 13:11:22.311522+00	f	\N	\N
67af91cb-d8d9-4e91-a354-29e894c425ba	63a8b08e-b8dd-451a-bb89-b38b0bb2d9b2	5dbe34e7-1ce9-4640-b617-a2529d3479d8	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-05	700	online	paid	\N	\N	2026-03-11 13:13:37.141952+00	f	\N	\N
8c2a967a-d789-42c5-a4e0-2fd729a9f38c	32e40b35-8c4b-4552-b8b8-7c233d31c03d	757d4684-58bf-40d2-bfdd-ec9921ff94d7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11	250	online	paid	\N	\N	2026-03-11 13:17:03.025606+00	f	\N	\N
3a83bc8d-f3f9-47c8-93e3-659bedbefa4a	b55df5ce-674c-47c2-9c54-73bed3e8e571	0df2b337-87db-4802-a5f9-6944970e2ff5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11	3000	online	paid	\N	\N	2026-03-11 13:42:09.083054+00	f	\N	\N
d9414b0e-d575-4b4a-9352-b80b7e35989a	0d8641d3-1860-4dac-8f9c-a7362226fe97	682ad2e5-1d22-4c44-a132-b8580c165d1d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11	300	online	paid	\N	\N	2026-03-11 14:02:02.702849+00	f	\N	\N
3837afe6-7aad-48a0-a327-18610f82fdac	0d8641d3-1860-4dac-8f9c-a7362226fe97	682ad2e5-1d22-4c44-a132-b8580c165d1d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11	300	online	paid	\N	\N	2026-03-11 14:14:43.402842+00	f	\N	\N
4d1c4be6-b166-409a-af2a-2c22c8049677	e9d54922-42db-42b1-ab59-8dd42d68af4c	fe889acf-38cf-4a1f-8fce-804d5304f246	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11	1500	cash	paid	\N	\N	2026-03-11 14:42:21.990569+00	f	\N	\N
125d046e-f6e5-434f-8aa3-a714a5d9098d	ba9ab57b-e2d8-4c2a-902d-effb7b810b03	a3f57a0f-8bdf-47f7-a94d-819924cdc08a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11	1000	online	paid	\N	\N	2026-03-11 14:44:09.984159+00	f	\N	\N
71f84a6b-18f5-4db2-a4c2-0c16f5ac2468	c62f3118-4803-4149-8621-2473aec070c1	43615615-48b3-4cb6-b3ff-cfcb63bb8a20	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11	500	online	paid	\N	\N	2026-03-11 15:09:35.481026+00	f	\N	\N
bf586be8-4695-4678-abe5-fc859cb94954	1cac3c77-d86c-41b8-ba55-2b1f74410661	5d640f92-1900-47f5-bb7e-a6ab5061d564	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11	200	online	paid	\N	\N	2026-03-11 15:09:56.98269+00	f	\N	\N
334515ff-b573-49cd-ba3f-122942b89e09	aed1fa37-b39e-453a-96ac-b79ba3f4889c	191731f2-5b78-401c-8cec-590024f34df2	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11	3500	online	paid	\N	\N	2026-03-11 15:32:41.016615+00	f	\N	\N
6ac0ae33-6ac8-44d2-aa22-8f76bcc51961	4bf7d91d-6da6-4d5d-9db0-30b196a13651	6f37b184-d886-4b91-a179-60f467b3e51d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11	300	cash	paid	\N	\N	2026-03-11 15:34:18.586509+00	f	\N	\N
3847c586-b12e-47ed-bf6e-78f86ed71dd0	b2f4bd25-a426-4b1a-b0f6-3ef0115ba281	61588824-28f6-4f24-b902-3044b3b05a19	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11	500	cash	paid	\N	\N	2026-03-11 15:34:39.409114+00	f	\N	\N
fd434d5c-11b4-43bd-87ff-e1388dfaf99e	db6c8835-21b0-4c54-b4ff-2e6ec0441891	0d99cdf2-2edc-4baa-bf1a-14c97c0df949	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11	1000	cash	paid	\N	\N	2026-03-11 15:35:06.242332+00	f	\N	\N
c9b97046-e8b0-43c1-9344-8173884f5681	f5064908-4ea0-42c7-8a63-0ddfc2a80531	dc623009-9752-43d7-b22a-384740599eb7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11	400	cash	paid	\N	\N	2026-03-11 15:35:34.822145+00	f	\N	\N
9e9a2bf1-a8fe-4c22-bae6-1608da73a8d4	1ca2f5d0-fc1b-49ab-8443-25574737d3cf	18d2e760-ed6d-44b0-af27-6b7cb9d6ddbb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11	100	cash	paid	\N	\N	2026-03-11 15:36:03.806898+00	f	\N	\N
466ef5f9-7beb-4930-8050-86f05b3dc1ab	89d5c659-aa6c-4a99-b0fc-f737d9e8e0e4	111a604f-46f8-4271-8912-ccbe479ab3ef	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11	1500	online	paid	\N	\N	2026-03-11 15:51:24.231854+00	f	\N	\N
e93b4ddd-ac21-454e-99ae-9d0d82f2be76	bee2c977-93c0-44ef-874e-a76e53e40a51	aa68ef20-1754-401b-9bfc-b8f2c49b0a4e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11	800	online	paid	\N	\N	2026-03-11 15:51:58.065624+00	f	\N	\N
0aa202b7-4155-45b5-a841-0b2808ab4373	b9bd3700-24a0-4fa2-9afa-ca0827c26188	b80d47c9-3d98-41cd-9037-7ddcdac87f0c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11	400	online	paid	\N	\N	2026-03-11 16:16:58.14843+00	f	\N	\N
35f2ef45-869c-4f42-b5da-bdcedfe2e7cb	860f25ca-39ff-42f0-bacb-e409bd6007d7	71d81887-5e21-4486-97e6-faea2c876cff	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11	200	online	paid	\N	\N	2026-03-11 17:06:09.251279+00	f	\N	\N
d632c3dc-8471-4f97-89b8-4314cab0db86	c5f80bd8-670e-4df5-8c6a-ac7378801077	3a181c18-8f9e-4467-96a8-c09687ebea27	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11	1000	online	paid	\N	\N	2026-03-11 17:15:12.91251+00	f	\N	\N
6df54090-3a4c-465f-952c-8aee8bbb51d4	35038458-ade9-412d-877d-814bb95adf5d	794af05e-0e94-449e-90ee-691d82534c27	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-12	200	online	paid	\N	\N	2026-03-12 04:59:49.902995+00	f	\N	\N
c580b97f-8153-4493-b5ec-aa950bf2ae8d	c9a697e2-d1d0-4f48-9f8b-b0a12d06de0d	6778d224-f980-48ed-801f-bef1220cd43c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-12	200	online	paid	\N	\N	2026-03-12 05:20:51.153531+00	f	\N	\N
40f1744b-e303-48a2-a568-8455adca08c3	cf301afd-a3ed-4bea-9794-b4fe432d8861	8419a9be-df12-416f-81ce-3570f9a82a4c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-12	600	cash	paid	\N	\N	2026-03-12 06:11:45.435452+00	f	\N	\N
513165d3-10e6-46c4-a9af-20f94a98b382	b16866ff-ba34-412f-aeea-fa734ccf88a1	a3742c80-66e9-443f-8ab2-a145af754194	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-12	2500	cash	paid	\N	\N	2026-03-12 06:43:58.570761+00	f	\N	\N
08c0fd44-4577-4cdb-bbc1-a584899b246c	a0d4dce0-9bdd-4cf1-ad5d-1c95cf18e2dd	dfa34099-366b-4a3e-85ef-eb12e94f4083	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-12	300	online	paid	\N	\N	2026-03-12 08:02:40.107794+00	f	\N	\N
c9ca384d-95ec-4f4b-9f2f-309bfb270edf	72e0cd6d-f353-4cbc-b59f-e63ee38dd833	696b495b-35b0-4393-b4ec-68ed91e19550	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-12	900	online	paid	\N	\N	2026-03-12 08:35:41.454415+00	f	\N	\N
fc206363-c0ed-4bb5-8784-d75881abc291	1cac3c77-d86c-41b8-ba55-2b1f74410661	5d640f92-1900-47f5-bb7e-a6ab5061d564	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-12	200	online	paid	\N	\N	2026-03-12 14:39:43.099499+00	f	\N	\N
0bd0a60b-3860-4635-a818-e945134b0bb5	e9d54922-42db-42b1-ab59-8dd42d68af4c	fe889acf-38cf-4a1f-8fce-804d5304f246	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-12	300	cash	paid	\N	\N	2026-03-12 15:17:19.365343+00	f	\N	\N
7b32a6b9-338a-44f9-a9cc-64b985db8850	4bf7d91d-6da6-4d5d-9db0-30b196a13651	6f37b184-d886-4b91-a179-60f467b3e51d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-12	300	cash	paid	\N	\N	2026-03-12 15:17:53.554868+00	f	\N	\N
66d17daf-b316-4d48-9d3d-b1a492574354	8926b943-bda3-4c36-aa29-4f8576e75e90	735cd1ad-a76d-4026-87dc-60f501454b7a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-12	200	cash	paid	\N	\N	2026-03-12 15:18:26.201392+00	f	\N	\N
48615d17-6bd9-419d-baae-862fbdf34b96	f5064908-4ea0-42c7-8a63-0ddfc2a80531	dc623009-9752-43d7-b22a-384740599eb7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-12	400	cash	paid	\N	\N	2026-03-12 15:18:56.005326+00	f	\N	\N
6388b20f-ba02-4570-8223-e19041ef4b3e	1ca2f5d0-fc1b-49ab-8443-25574737d3cf	18d2e760-ed6d-44b0-af27-6b7cb9d6ddbb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-12	100	cash	paid	\N	\N	2026-03-12 15:19:34.869407+00	f	\N	\N
1731abe9-62f5-42a4-8d40-52f9d39ecee7	b2f4bd25-a426-4b1a-b0f6-3ef0115ba281	61588824-28f6-4f24-b902-3044b3b05a19	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-12	500	cash	paid	\N	\N	2026-03-12 15:19:52.913524+00	f	\N	\N
c0826dea-91d6-45fc-9b4d-7f04984ac48e	d59ecb10-5af9-4f75-8f43-dfc52d537f0c	400fb688-b2dd-42c2-b2f6-c2c3a6bff5bd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-12	200	cash	paid	\N	\N	2026-03-12 15:20:19.720391+00	f	\N	\N
b9bd993d-d580-45d7-8e78-31e077ed49d1	32e40b35-8c4b-4552-b8b8-7c233d31c03d	757d4684-58bf-40d2-bfdd-ec9921ff94d7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-12	250	online	paid	\N	\N	2026-03-12 15:22:59.71688+00	f	\N	\N
dcc6f3c3-e4f7-41fc-af81-95c93d4a3412	064b4a2b-34b6-4da3-9286-a5d88700fe07	ecb49778-5d46-4840-9796-12a3fbe11412	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-12	200	online	paid	\N	\N	2026-03-12 15:23:30.264632+00	f	\N	\N
714244c7-1c63-474a-a677-20a7fa539879	93906c36-47ae-41bb-bb4c-a594f08896b3	27e0e2f9-8d55-4cf8-a605-3a1b95f3c368	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-12	500	online	paid	\N	\N	2026-03-12 15:36:31.609448+00	f	\N	\N
0ff86a11-923e-4af2-960e-114dd27d80c4	89d5c659-aa6c-4a99-b0fc-f737d9e8e0e4	111a604f-46f8-4271-8912-ccbe479ab3ef	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-12	1500	online	paid	\N	\N	2026-03-12 16:12:54.717366+00	f	\N	\N
1e5812a6-d734-424c-9dcf-544504acabc7	02889b17-5d17-4dc1-ace1-381b0d733984	def4d986-3767-4793-a6e8-c767351fd93f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-12	500	cash	paid	\N	\N	2026-03-12 17:10:09.092616+00	f	\N	\N
7963ebc0-3114-4fc4-8a0b-82e65f7eb44c	02889b17-5d17-4dc1-ace1-381b0d733984	def4d986-3767-4793-a6e8-c767351fd93f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-12	500	cash	paid	\N	\N	2026-03-12 17:10:15.585642+00	f	\N	\N
d126674b-eead-4e36-b77a-82c07de02eb6	8d648ef9-92ca-4513-8639-f0b3ec50a392	eed1102c-8dcc-4caf-9239-6a9cd7332ccc	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-12	600	online	paid	\N	\N	2026-03-13 02:14:53.383012+00	f	\N	\N
3e3d0c79-a211-4396-90a1-0ce082eeec5a	bcb87a68-a59d-438f-b81a-e5a4a6b666c1	b4a8d905-3198-4d75-8ee3-3800ec8f2b40	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-13	1000	online	paid	\N	\N	2026-03-13 02:15:42.83403+00	f	\N	\N
16af34d1-4f9b-4904-9aa6-91180cf38014	34977a0a-e657-40cb-840d-a6df47bba8d3	d1929534-e23a-4d75-8031-6998ec8b0810	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-12	100	online	paid	\N	\N	2026-03-13 02:16:37.784141+00	f	\N	\N
6b222d4d-95c4-44d0-b201-8f4fe7678325	0d8641d3-1860-4dac-8f9c-a7362226fe97	682ad2e5-1d22-4c44-a132-b8580c165d1d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-13	600	online	paid	\N	\N	2026-03-13 04:58:11.51018+00	f	\N	\N
e5960bdd-d1f3-4744-bc53-525eb618d8f1	6aac96ea-eb26-460a-8340-ffb355953ae0	8e423e8d-c1ce-4d07-9860-fd7df34eaf44	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-13	400	online	paid	\N	\N	2026-03-13 04:59:14.001402+00	f	\N	\N
7358bfa9-c160-4280-896d-cdc8f5c4fd6b	e3325ec8-264a-41e1-a2d5-84fb33eb4412	c2c54c13-fb99-4e5d-9f99-1bddf98beb5b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-13	500	online	paid	\N	\N	2026-03-13 07:20:33.262616+00	f	\N	\N
4a4cf73a-c012-4fff-8621-7c58e1c6921b	eec56395-bc3e-4592-8a21-7b694944b6eb	bd6c3241-ee7a-49a4-8f31-6ca7af5980d8	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-13	600	online	paid	\N	\N	2026-03-13 07:20:59.711389+00	f	\N	\N
06927fb7-36a1-4686-a03c-6613be48d686	a0d4dce0-9bdd-4cf1-ad5d-1c95cf18e2dd	dfa34099-366b-4a3e-85ef-eb12e94f4083	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-13	300	online	paid	\N	\N	2026-03-13 12:30:11.959722+00	f	\N	\N
03753064-10ee-452a-b097-2980c427fc27	34977a0a-e657-40cb-840d-a6df47bba8d3	d1929534-e23a-4d75-8031-6998ec8b0810	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-13	100	online	paid	\N	\N	2026-03-13 12:31:00.255991+00	f	\N	\N
5b8d13bc-5ce6-4d77-8d3a-968cfbf997c1	064b4a2b-34b6-4da3-9286-a5d88700fe07	ecb49778-5d46-4840-9796-12a3fbe11412	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-13	300	online	paid	\N	\N	2026-03-13 12:32:06.513137+00	f	\N	\N
4d25b1fa-1dae-4f4f-980c-a9f2f74df95a	bee2c977-93c0-44ef-874e-a76e53e40a51	aa68ef20-1754-401b-9bfc-b8f2c49b0a4e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-13	1200	online	paid	\N	\N	2026-03-13 12:33:06.105143+00	f	\N	\N
4f15c35d-4aad-4b17-8d2c-7ac31c18e641	c5f80bd8-670e-4df5-8c6a-ac7378801077	3a181c18-8f9e-4467-96a8-c09687ebea27	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-13	1000	online	paid	\N	\N	2026-03-13 13:17:45.219615+00	f	\N	\N
2b4c0065-2a38-4cf7-a462-db612f4fecc8	860f25ca-39ff-42f0-bacb-e409bd6007d7	71d81887-5e21-4486-97e6-faea2c876cff	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-13	200	online	paid	\N	\N	2026-03-13 13:18:57.647613+00	f	\N	\N
51cd875b-288e-4b4e-a750-ff53ececec99	32e40b35-8c4b-4552-b8b8-7c233d31c03d	757d4684-58bf-40d2-bfdd-ec9921ff94d7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-13	250	online	paid	\N	\N	2026-03-13 13:40:26.057483+00	f	\N	\N
17c8fa75-2127-4420-a8c8-8f6b13c06d7e	ba9ab57b-e2d8-4c2a-902d-effb7b810b03	a3f57a0f-8bdf-47f7-a94d-819924cdc08a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-13	2000	online	paid	\N	\N	2026-03-13 13:41:20.913875+00	f	\N	\N
877dbd71-cf76-4873-b56a-5a6370c5bf7c	cf301afd-a3ed-4bea-9794-b4fe432d8861	8419a9be-df12-416f-81ce-3570f9a82a4c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-13	600	cash	paid	\N	\N	2026-03-13 14:19:35.038893+00	f	\N	\N
ba9b3ab8-e9f0-44a3-bc38-e23e4930e0e6	1cac3c77-d86c-41b8-ba55-2b1f74410661	5d640f92-1900-47f5-bb7e-a6ab5061d564	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-13	200	online	paid	\N	\N	2026-03-13 14:22:15.386123+00	f	\N	\N
b300d930-9290-4dac-bc13-d16ad47df643	6340050f-5246-43c5-9297-d14267b9bad0	17f01068-23e4-438e-8322-5e4a12f3f332	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-13	400	online	paid	\N	\N	2026-03-13 14:38:42.669728+00	f	\N	\N
1527867b-5386-46e6-8bee-ef3e524c01e0	b9bd3700-24a0-4fa2-9afa-ca0827c26188	b80d47c9-3d98-41cd-9037-7ddcdac87f0c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-13	400	online	paid	\N	\N	2026-03-13 14:46:34.576152+00	f	\N	\N
555ded46-890c-4337-a16a-fb812e4272df	1ca2f5d0-fc1b-49ab-8443-25574737d3cf	18d2e760-ed6d-44b0-af27-6b7cb9d6ddbb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-13	100	cash	paid	\N	\N	2026-03-13 14:48:20.130441+00	f	\N	\N
a0801d37-083c-4ea6-9915-072bedec79f1	f5064908-4ea0-42c7-8a63-0ddfc2a80531	dc623009-9752-43d7-b22a-384740599eb7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-13	400	cash	paid	\N	\N	2026-03-13 14:48:44.818736+00	f	\N	\N
14bcfb50-9d65-41a1-b952-0afb100863f0	8926b943-bda3-4c36-aa29-4f8576e75e90	735cd1ad-a76d-4026-87dc-60f501454b7a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-13	200	cash	paid	\N	\N	2026-03-13 14:49:09.99931+00	f	\N	\N
13ac0eaa-2e00-4915-a87f-cd812738abee	e9d54922-42db-42b1-ab59-8dd42d68af4c	fe889acf-38cf-4a1f-8fce-804d5304f246	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-13	300	cash	paid	\N	\N	2026-03-13 14:49:49.668845+00	f	\N	\N
4f40010e-6b16-48e0-8e97-71dc06f5fc08	f35169da-5d69-4e7e-a35e-ed6237a94cff	6398b3f9-45c4-45b0-a7fc-0e3e1ced4173	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-13	500	online	paid	\N	\N	2026-03-13 15:46:42.348299+00	f	\N	\N
fa4d10dc-1222-449c-bc46-bd69e94a15a8	89d5c659-aa6c-4a99-b0fc-f737d9e8e0e4	111a604f-46f8-4271-8912-ccbe479ab3ef	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-13	1500	online	paid	\N	\N	2026-03-13 16:50:00.336761+00	f	\N	\N
ebc0623a-dc30-476d-8744-581380609654	cb5975f3-72b1-4cc9-bd02-81342334cb40	6043f054-834d-437f-860a-7f9269935958	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-13	200	online	paid	\N	\N	2026-03-14 00:24:44.233019+00	f	\N	\N
2a98d597-08db-4117-b7ec-dd82a447bbe2	a0d4dce0-9bdd-4cf1-ad5d-1c95cf18e2dd	dfa34099-366b-4a3e-85ef-eb12e94f4083	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-14	300	online	paid	\N	\N	2026-03-14 07:27:32.382374+00	f	\N	\N
ea1319d5-0f67-4c82-b42a-c57ce32b53f5	80752817-7c75-426b-a97e-361b246ec563	135460a0-56bf-4c17-a4a8-5e66f29b52f6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-14	1200	cash	paid	\N	\N	2026-03-14 08:20:59.918517+00	f	\N	\N
50c2bca4-c7fb-4c91-8f67-4882b7aa0a45	8d648ef9-92ca-4513-8639-f0b3ec50a392	eed1102c-8dcc-4caf-9239-6a9cd7332ccc	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-14	200	online	paid	\N	\N	2026-03-14 13:41:57.07925+00	f	\N	\N
6f8d4fb5-ead4-4b3f-9671-43abda4d0564	e00a821e-300f-432b-8519-5ef03b42b09c	6edc184d-553a-4ab7-b3bc-924f1ea007d6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-14	900	online	paid	\N	\N	2026-03-14 13:47:05.356864+00	f	\N	\N
ad885a32-e2d4-4f65-8fe4-1099faf905ae	32e40b35-8c4b-4552-b8b8-7c233d31c03d	757d4684-58bf-40d2-bfdd-ec9921ff94d7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-14	250	online	paid	\N	\N	2026-03-14 14:11:07.189787+00	f	\N	\N
e3d889f8-e122-4be1-b96d-87c122ccefc8	1cac3c77-d86c-41b8-ba55-2b1f74410661	5d640f92-1900-47f5-bb7e-a6ab5061d564	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-14	200	online	paid	\N	\N	2026-03-14 14:41:28.79174+00	f	\N	\N
3329f0d9-1bb8-43e7-b6a1-010b1ae14e0d	d59ecb10-5af9-4f75-8f43-dfc52d537f0c	400fb688-b2dd-42c2-b2f6-c2c3a6bff5bd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-14	200	cash	paid	\N	\N	2026-03-14 14:50:14.001406+00	f	\N	\N
cf72b313-50d7-4422-880c-020ebf187a8e	1ca2f5d0-fc1b-49ab-8443-25574737d3cf	18d2e760-ed6d-44b0-af27-6b7cb9d6ddbb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-14	100	cash	paid	\N	\N	2026-03-14 14:50:46.268636+00	f	\N	\N
751084fa-4f53-4444-a10b-a5420a756b7a	8926b943-bda3-4c36-aa29-4f8576e75e90	735cd1ad-a76d-4026-87dc-60f501454b7a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-14	200	cash	paid	\N	\N	2026-03-14 14:51:08.855945+00	f	\N	\N
1d70d34d-dcec-44ab-bbee-bf0ac8279ef8	b9bd3700-24a0-4fa2-9afa-ca0827c26188	b80d47c9-3d98-41cd-9037-7ddcdac87f0c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-14	200	online	paid	\N	\N	2026-03-14 14:58:51.539959+00	f	\N	\N
7ed544c9-b2c1-48b6-a07f-db23e59a837a	35038458-ade9-412d-877d-814bb95adf5d	794af05e-0e94-449e-90ee-691d82534c27	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-14	200	online	paid	\N	\N	2026-03-14 15:12:03.884497+00	f	\N	\N
01776f43-6b89-4461-9e92-bc4ecfba9bc2	6aac96ea-eb26-460a-8340-ffb355953ae0	8e423e8d-c1ce-4d07-9860-fd7df34eaf44	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-14	400	online	paid	\N	\N	2026-03-14 15:12:33.818342+00	f	\N	\N
8aa7dc44-2acc-4344-937f-47dfcc90ad5d	064b4a2b-34b6-4da3-9286-a5d88700fe07	ecb49778-5d46-4840-9796-12a3fbe11412	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-14	100	online	paid	\N	\N	2026-03-14 15:28:51.804544+00	f	\N	\N
1e16cfdb-7596-4ae3-ad0d-bbebb130b713	e0fca0e1-df99-497f-87e4-41be32ec1780	c18d8b95-c031-4110-85c8-b265a89efc50	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-15	0	cash	not_paid	\N	\N	2026-03-14 15:27:48.026102+00	f	\N	\N
f4d77a74-d4e0-4c9f-b55f-09296fdcca9d	e0fca0e1-df99-497f-87e4-41be32ec1780	c18d8b95-c031-4110-85c8-b265a89efc50	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-14	1000	cash	paid	\N	\N	2026-03-14 15:31:03.007033+00	f	\N	\N
696f2560-ba62-4a5c-b4c4-a3bf54f11c67	f35169da-5d69-4e7e-a35e-ed6237a94cff	6398b3f9-45c4-45b0-a7fc-0e3e1ced4173	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-14	500	online	paid	\N	\N	2026-03-14 15:44:55.998318+00	f	\N	\N
219d14db-ae44-4f87-bc74-5d2980d3ddcb	89d5c659-aa6c-4a99-b0fc-f737d9e8e0e4	111a604f-46f8-4271-8912-ccbe479ab3ef	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-14	1500	online	paid	\N	\N	2026-03-14 15:45:28.10939+00	f	\N	\N
0a10d42a-29d6-45a8-a830-bd63594631c9	cb5975f3-72b1-4cc9-bd02-81342334cb40	6043f054-834d-437f-860a-7f9269935958	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-15	200	online	paid	\N	\N	2026-03-15 00:38:19.577994+00	f	\N	\N
8c2f5b37-cdd8-4724-9299-4cf8ca192252	34977a0a-e657-40cb-840d-a6df47bba8d3	d1929534-e23a-4d75-8031-6998ec8b0810	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-14	100	online	paid	\N	\N	2026-03-15 00:39:29.295223+00	f	\N	\N
709e18a6-c483-4df5-a5bb-513667887e11	bee2c977-93c0-44ef-874e-a76e53e40a51	aa68ef20-1754-401b-9bfc-b8f2c49b0a4e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-15	1200	online	paid	\N	\N	2026-03-15 02:31:39.640986+00	f	\N	\N
9057df1b-b15a-4d43-a774-44dd2adf1c8f	6340050f-5246-43c5-9297-d14267b9bad0	17f01068-23e4-438e-8322-5e4a12f3f332	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-15	800	online	paid	\N	\N	2026-03-15 06:29:20.761952+00	f	\N	\N
31d76446-9fd6-41bf-8b72-e45b28c33d2c	67eb359b-25a2-481e-ae53-c208688f5940	7ebb952f-b8ce-452d-a076-36b5efc9d1c5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-15	1200	online	paid	\N	\N	2026-03-15 06:30:15.328165+00	f	\N	\N
c8d68d12-6606-40aa-b8fa-7febdb351b0d	a0d4dce0-9bdd-4cf1-ad5d-1c95cf18e2dd	dfa34099-366b-4a3e-85ef-eb12e94f4083	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-15	300	online	paid	\N	\N	2026-03-15 08:14:20.014959+00	f	\N	\N
adac8564-7043-411a-bd1e-7399705d3ddb	cb5975f3-72b1-4cc9-bd02-81342334cb40	6043f054-834d-437f-860a-7f9269935958	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-15	200	online	paid	\N	\N	2026-03-15 13:37:35.595374+00	f	\N	\N
70b7e0f6-c925-4509-8ee4-8fab03eeef50	89d5c659-aa6c-4a99-b0fc-f737d9e8e0e4	111a604f-46f8-4271-8912-ccbe479ab3ef	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-15	1500	online	paid	\N	\N	2026-03-15 13:38:18.701987+00	f	\N	\N
85d4fdfd-3a4d-43c0-b717-0ca401f639ee	34977a0a-e657-40cb-840d-a6df47bba8d3	d1929534-e23a-4d75-8031-6998ec8b0810	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-15	100	online	paid	\N	\N	2026-03-15 13:38:51.819285+00	f	\N	\N
ac0db5e9-373b-4bc1-ac55-1978d5acd487	e3325ec8-264a-41e1-a2d5-84fb33eb4412	c2c54c13-fb99-4e5d-9f99-1bddf98beb5b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-15	1000	online	paid	\N	\N	2026-03-15 13:42:36.243252+00	f	\N	\N
af711b83-3fd9-4d43-973b-fc3a7db50997	32e40b35-8c4b-4552-b8b8-7c233d31c03d	757d4684-58bf-40d2-bfdd-ec9921ff94d7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-15	250	online	paid	\N	\N	2026-03-15 14:26:50.409837+00	f	\N	\N
0e2ec9ce-03c5-4d3d-bf73-6f1d9bb671d1	1cac3c77-d86c-41b8-ba55-2b1f74410661	5d640f92-1900-47f5-bb7e-a6ab5061d564	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-15	200	online	paid	\N	\N	2026-03-15 14:28:08.473685+00	f	\N	\N
e29bd665-0633-4420-87ac-14b128ad81a4	cf301afd-a3ed-4bea-9794-b4fe432d8861	8419a9be-df12-416f-81ce-3570f9a82a4c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-15	1200	cash	paid	\N	\N	2026-03-15 14:51:47.115389+00	f	\N	\N
8f7d646e-ffe1-4939-82e4-b9226016f546	271816e2-6379-480d-92c3-c5f6fc561298	9b9a19c0-f88e-46eb-afd6-b823511a12e9	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-15	300	cash	paid	\N	\N	2026-03-15 15:09:00.764968+00	f	\N	\N
0bc50568-7bd3-4819-9f6b-187ca8818b0d	1ca2f5d0-fc1b-49ab-8443-25574737d3cf	18d2e760-ed6d-44b0-af27-6b7cb9d6ddbb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-15	100	cash	paid	\N	\N	2026-03-15 15:09:22.235475+00	f	\N	\N
40dfbc91-85db-4264-8985-b321f9b321a9	8926b943-bda3-4c36-aa29-4f8576e75e90	735cd1ad-a76d-4026-87dc-60f501454b7a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-15	200	cash	paid	\N	\N	2026-03-15 15:09:39.426545+00	f	\N	\N
fb6b5211-5c62-41a9-b156-02b1f840b42b	f5064908-4ea0-42c7-8a63-0ddfc2a80531	dc623009-9752-43d7-b22a-384740599eb7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-15	400	cash	paid	\N	\N	2026-03-15 15:09:56.327459+00	f	\N	\N
e82aa8a2-d6c3-4c6e-b405-cbef50fb00cb	860f25ca-39ff-42f0-bacb-e409bd6007d7	71d81887-5e21-4486-97e6-faea2c876cff	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-15	200	online	paid	\N	\N	2026-03-15 15:25:31.483926+00	f	\N	\N
68dc72a3-0b94-4d55-bae5-732dfdd4aa4b	064b4a2b-34b6-4da3-9286-a5d88700fe07	ecb49778-5d46-4840-9796-12a3fbe11412	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-15	100	online	paid	\N	\N	2026-03-15 15:44:09.004209+00	f	\N	\N
dfe63303-efea-4c50-b5b3-e62d81a57610	b9bd3700-24a0-4fa2-9afa-ca0827c26188	b80d47c9-3d98-41cd-9037-7ddcdac87f0c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-15	200	online	paid	\N	\N	2026-03-15 15:49:26.353122+00	f	\N	\N
3aee0178-ec99-4b05-ad53-930ff09a5e54	8d648ef9-92ca-4513-8639-f0b3ec50a392	eed1102c-8dcc-4caf-9239-6a9cd7332ccc	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-15	200	online	paid	\N	\N	2026-03-16 00:53:50.5658+00	f	\N	\N
1c4f1fee-ddc0-48cf-bf65-4f44ddf8b612	f35169da-5d69-4e7e-a35e-ed6237a94cff	6398b3f9-45c4-45b0-a7fc-0e3e1ced4173	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16	500	online	paid	\N	\N	2026-03-16 00:54:54.368245+00	f	\N	\N
cbf65da6-d47d-4127-9db9-c18b53c6a461	6340050f-5246-43c5-9297-d14267b9bad0	17f01068-23e4-438e-8322-5e4a12f3f332	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16	400	online	paid	\N	\N	2026-03-16 05:51:20.735757+00	f	\N	\N
4b4b0e35-f049-471b-998a-b6eb414b9f42	67eb359b-25a2-481e-ae53-c208688f5940	7ebb952f-b8ce-452d-a076-36b5efc9d1c5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16	1500	online	paid	\N	\N	2026-03-16 05:52:08.79242+00	f	\N	\N
02ce3201-4317-4654-8706-c194d6fc9a74	a0d4dce0-9bdd-4cf1-ad5d-1c95cf18e2dd	dfa34099-366b-4a3e-85ef-eb12e94f4083	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16	300	online	paid	\N	\N	2026-03-16 06:29:07.223901+00	f	\N	\N
cec7e085-dce2-4f49-b5ec-994b72935c11	80752817-7c75-426b-a97e-361b246ec563	135460a0-56bf-4c17-a4a8-5e66f29b52f6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16	300	cash	paid	\N	\N	2026-03-16 07:44:14.391476+00	f	\N	\N
05f239d9-15c9-4cfb-a780-def1b8963440	271816e2-6379-480d-92c3-c5f6fc561298	9b9a19c0-f88e-46eb-afd6-b823511a12e9	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16	300	online	paid	\N	\N	2026-03-16 08:01:57.005721+00	f	\N	\N
58201442-d696-42bd-a23f-ea6fbf92b770	02889b17-5d17-4dc1-ace1-381b0d733984	def4d986-3767-4793-a6e8-c767351fd93f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16	1000	cash	paid	\N	\N	2026-03-16 08:05:46.152632+00	f	\N	\N
13772ea1-911b-4dec-9c54-088d895b9ca0	dede5547-d440-4d63-a9ac-ad427b2895c9	6ded35ce-a2e8-4856-827d-ab18be14743b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16	1000	cash	paid	\N	\N	2026-03-16 08:35:41.941044+00	f	\N	\N
5f173cb3-6182-49a5-89b6-3da8dff8e926	ba9ab57b-e2d8-4c2a-902d-effb7b810b03	a3f57a0f-8bdf-47f7-a94d-819924cdc08a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16	3000	online	paid	\N	\N	2026-03-16 13:03:59.436558+00	f	\N	\N
2f31c31a-8a41-4f4a-b42f-fbd14cf08ad7	6245a2e8-2eb5-4d5f-8b8a-aac817bfee18	55efd7cf-1188-4423-9a53-8ee2c53002fa	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16	200	online	paid	\N	\N	2026-03-16 13:04:26.459308+00	f	\N	\N
8ac7231d-f52f-4616-a547-b207acfb76f6	35038458-ade9-412d-877d-814bb95adf5d	794af05e-0e94-449e-90ee-691d82534c27	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16	200	online	paid	\N	\N	2026-03-16 13:04:46.957258+00	f	\N	\N
94214d05-6875-42db-a44f-894a64a06958	3765d341-7b06-463d-82fa-add7d738b854	eab03433-a240-440d-8140-9be3f7ccf9a7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16	2000	online	paid	\N	\N	2026-03-16 13:51:04.588308+00	f	\N	\N
a7b86ae9-d883-4c8a-9e3a-1da4b55f1ba5	34977a0a-e657-40cb-840d-a6df47bba8d3	d1929534-e23a-4d75-8031-6998ec8b0810	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16	100	online	paid	\N	\N	2026-03-16 14:13:09.525531+00	f	\N	\N
eec7691d-f8c3-4c0a-a414-81de42d11fd8	32e40b35-8c4b-4552-b8b8-7c233d31c03d	757d4684-58bf-40d2-bfdd-ec9921ff94d7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16	250	online	paid	\N	\N	2026-03-16 14:13:50.038431+00	f	\N	\N
861c564d-e6a5-4312-8f86-7e8fd37cff3f	22d10045-ef1c-4807-9278-c35dbb01d73f	db261798-826e-4d7b-9fc7-a4dba55df1f3	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16	200	online	paid	\N	\N	2026-03-16 14:28:18.046117+00	f	\N	\N
3583f61a-be90-45a2-aa41-37aa196f248f	84cf3d8e-64cc-4a90-8b33-12c94640d00b	ebc8c94f-09bf-41ca-8522-f81f98fb1469	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16	700	cash	paid	\N	\N	2026-03-16 14:47:43.00233+00	f	\N	\N
4256ad06-82c8-48ab-93e7-13648176a1a4	d59ecb10-5af9-4f75-8f43-dfc52d537f0c	400fb688-b2dd-42c2-b2f6-c2c3a6bff5bd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16	200	cash	paid	\N	\N	2026-03-16 14:48:35.92083+00	f	\N	\N
b6979f9d-ae18-4132-800a-13466f498357	1ca2f5d0-fc1b-49ab-8443-25574737d3cf	18d2e760-ed6d-44b0-af27-6b7cb9d6ddbb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16	100	cash	paid	\N	\N	2026-03-16 14:49:01.624367+00	f	\N	\N
98dda507-ef11-4f85-b5fe-50ed95d09e36	f5064908-4ea0-42c7-8a63-0ddfc2a80531	dc623009-9752-43d7-b22a-384740599eb7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16	400	cash	paid	\N	\N	2026-03-16 14:49:25.874485+00	f	\N	\N
ec1d61d1-1b17-4fe8-a6aa-1cc26622402c	8926b943-bda3-4c36-aa29-4f8576e75e90	735cd1ad-a76d-4026-87dc-60f501454b7a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16	200	cash	paid	\N	\N	2026-03-16 14:49:42.710512+00	f	\N	\N
fa945ac0-e776-4bdb-87e2-4fdb1cbf1cb0	1cac3c77-d86c-41b8-ba55-2b1f74410661	5d640f92-1900-47f5-bb7e-a6ab5061d564	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16	200	online	paid	\N	\N	2026-03-16 14:50:24.603681+00	f	\N	\N
3a0348aa-b3be-451f-8ba2-dacca9f1d1f3	93906c36-47ae-41bb-bb4c-a594f08896b3	27e0e2f9-8d55-4cf8-a605-3a1b95f3c368	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16	500	cash	paid	\N	\N	2026-03-16 14:58:24.753841+00	f	\N	\N
063e4a25-e25b-497b-8fc1-3832176aa5cf	e9d54922-42db-42b1-ab59-8dd42d68af4c	fe889acf-38cf-4a1f-8fce-804d5304f246	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16	600	cash	paid	\N	\N	2026-03-16 14:58:47.377585+00	f	\N	\N
b9c4626c-43f9-4d9a-8a7c-4811112b7aa8	b2f4bd25-a426-4b1a-b0f6-3ef0115ba281	61588824-28f6-4f24-b902-3044b3b05a19	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16	500	cash	paid	\N	\N	2026-03-16 15:58:47.951897+00	f	\N	\N
71d2eaee-fb5b-4776-b16c-4bcc2dccadd1	f35169da-5d69-4e7e-a35e-ed6237a94cff	6398b3f9-45c4-45b0-a7fc-0e3e1ced4173	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16	500	online	paid	\N	\N	2026-03-16 16:22:18.865874+00	f	\N	\N
5a3ee3dc-599c-4afe-9b25-07d91868cd54	b9bd3700-24a0-4fa2-9afa-ca0827c26188	b80d47c9-3d98-41cd-9037-7ddcdac87f0c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16	200	online	paid	\N	\N	2026-03-16 17:20:44.971888+00	f	\N	\N
39b55bae-93c3-4884-ae47-fd05d1e4493c	bee2c977-93c0-44ef-874e-a76e53e40a51	aa68ef20-1754-401b-9bfc-b8f2c49b0a4e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16	400	online	paid	\N	\N	2026-03-16 17:21:47.091568+00	f	\N	\N
0133642c-910e-4d9d-8575-2eea35bc92af	89d5c659-aa6c-4a99-b0fc-f737d9e8e0e4	111a604f-46f8-4271-8912-ccbe479ab3ef	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-17	1500	online	paid	\N	\N	2026-03-17 01:02:07.877745+00	f	\N	\N
ac9a7fe6-9e34-47f1-8a04-3422b689391f	ac85d0d3-a358-46b8-bf3e-4f4468ca5670	7a331756-19b2-4a9f-a2ee-2b3f6a641e72	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-17	2100	cash	paid	\N	\N	2026-03-17 04:30:26.148871+00	f	\N	\N
a25897c8-6b78-44c7-8e03-d74dca39bd47	6aac96ea-eb26-460a-8340-ffb355953ae0	8e423e8d-c1ce-4d07-9860-fd7df34eaf44	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-17	400	online	paid	\N	\N	2026-03-17 07:24:56.016999+00	f	\N	\N
ba726f59-b566-4b6c-81b0-f0a988c71d10	bcb87a68-a59d-438f-b81a-e5a4a6b666c1	b4a8d905-3198-4d75-8ee3-3800ec8f2b40	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-17	2000	online	paid	\N	\N	2026-03-17 07:36:00.356262+00	f	\N	\N
f41cdf26-99df-4d45-95a1-8ecbca2f4e88	a0d4dce0-9bdd-4cf1-ad5d-1c95cf18e2dd	dfa34099-366b-4a3e-85ef-eb12e94f4083	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-17	300	online	paid	\N	\N	2026-03-17 07:36:43.762627+00	f	\N	\N
b30efad8-ef9c-42e5-a382-870857142348	cb5975f3-72b1-4cc9-bd02-81342334cb40	6043f054-834d-437f-860a-7f9269935958	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-17	400	online	paid	\N	\N	2026-03-17 08:36:26.970009+00	f	\N	\N
859cddc1-7b53-4a50-a02f-ad1716b3dec9	b86ae36d-afe4-41a9-8d69-af6178efda6c	7983d2f3-d1b5-4f40-afba-dfadeeb8e0bd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-17	400	online	paid	\N	\N	2026-03-17 08:37:19.978019+00	f	\N	\N
e0a39a16-f392-4a47-a18e-fc32610528c0	271816e2-6379-480d-92c3-c5f6fc561298	9b9a19c0-f88e-46eb-afd6-b823511a12e9	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-17	150	cash	paid	\N	\N	2026-03-17 12:48:33.993383+00	f	\N	\N
722d395e-9c8c-4255-a99c-761049a1081d	80752817-7c75-426b-a97e-361b246ec563	135460a0-56bf-4c17-a4a8-5e66f29b52f6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-17	300	cash	paid	\N	\N	2026-03-17 12:55:59.332264+00	f	\N	\N
f6ad955e-8679-4ed1-b6ad-2351261460c7	63a8b08e-b8dd-451a-bb89-b38b0bb2d9b2	5dbe34e7-1ce9-4640-b617-a2529d3479d8	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-17	600	online	paid	\N	\N	2026-03-17 13:13:23.67816+00	f	\N	\N
589c768f-3089-4fb7-a9d5-f60ffc9ed189	cf6ae0f5-381e-455f-8bda-1dda692f14a4	e425ae02-2a03-4e18-af85-4b3990eefd11	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-17	600	cash	paid	\N	\N	2026-03-17 13:18:33.108887+00	f	\N	\N
7242928a-aea1-4660-86b2-659913d7ad76	0d8641d3-1860-4dac-8f9c-a7362226fe97	682ad2e5-1d22-4c44-a132-b8580c165d1d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-17	600	online	paid	\N	\N	2026-03-17 13:18:57.147767+00	f	\N	\N
15296225-956f-4080-81ac-7d736c78bf36	b16866ff-ba34-412f-aeea-fa734ccf88a1	a3742c80-66e9-443f-8ab2-a145af754194	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-17	500	online	paid	\N	\N	2026-03-17 14:15:03.753874+00	f	\N	\N
21079aa0-ded9-4c83-8b61-64784d76be53	ba9ab57b-e2d8-4c2a-902d-effb7b810b03	a3f57a0f-8bdf-47f7-a94d-819924cdc08a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-17	1000	online	paid	\N	\N	2026-03-17 14:15:36.586118+00	f	\N	\N
1a39109c-d1dd-4c95-a14c-df561cc0b7c7	6245a2e8-2eb5-4d5f-8b8a-aac817bfee18	55efd7cf-1188-4423-9a53-8ee2c53002fa	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-17	200	online	paid	\N	\N	2026-03-17 14:53:41.405216+00	f	\N	\N
9e164ced-139e-459e-8397-1de08a363e4f	84cf3d8e-64cc-4a90-8b33-12c94640d00b	ebc8c94f-09bf-41ca-8522-f81f98fb1469	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-17	700	online	paid	\N	\N	2026-03-17 14:54:14.940467+00	f	\N	\N
a4d2ff8e-7ea6-4306-b4c1-006b6e420072	1cac3c77-d86c-41b8-ba55-2b1f74410661	5d640f92-1900-47f5-bb7e-a6ab5061d564	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-17	200	online	paid	\N	\N	2026-03-17 14:54:44.495474+00	f	\N	\N
4137acc8-a858-4aec-a012-077e1bbf2484	c5f80bd8-670e-4df5-8c6a-ac7378801077	3a181c18-8f9e-4467-96a8-c09687ebea27	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-17	2000	online	paid	\N	\N	2026-03-17 14:56:25.69287+00	f	\N	\N
be576bf0-b8e9-411d-9b21-3884aa80e351	34977a0a-e657-40cb-840d-a6df47bba8d3	d1929534-e23a-4d75-8031-6998ec8b0810	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-17	100	online	paid	\N	\N	2026-03-17 14:57:02.43829+00	f	\N	\N
bec07b3c-1369-4ddf-bde4-e92662e64db1	c8e35247-1c57-4290-9904-8553d3c7cad5	010a0aaf-0be5-46b5-a0dc-f5fcc85ed2cf	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-17	1200	online	paid	\N	\N	2026-03-17 15:07:58.106769+00	f	\N	\N
ac5dd7c8-6b54-4adb-89ba-a9273ee00b66	32e40b35-8c4b-4552-b8b8-7c233d31c03d	757d4684-58bf-40d2-bfdd-ec9921ff94d7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-17	250	online	paid	\N	\N	2026-03-17 15:09:09.360217+00	f	\N	\N
900fc3d7-381b-47fa-89f9-f0889a988fd8	1ca2f5d0-fc1b-49ab-8443-25574737d3cf	18d2e760-ed6d-44b0-af27-6b7cb9d6ddbb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-17	100	cash	paid	\N	\N	2026-03-17 15:32:32.682172+00	f	\N	\N
91a2378e-eeba-408e-87a4-aa4170f9ecb1	f5064908-4ea0-42c7-8a63-0ddfc2a80531	dc623009-9752-43d7-b22a-384740599eb7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-17	400	cash	paid	\N	\N	2026-03-17 15:33:19.156752+00	f	\N	\N
65fbbcfd-5e59-49f1-ab32-d53769bc097f	93906c36-47ae-41bb-bb4c-a594f08896b3	27e0e2f9-8d55-4cf8-a605-3a1b95f3c368	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-17	500	cash	paid	\N	\N	2026-03-17 15:33:43.082466+00	f	\N	\N
431e7d1c-73d8-4100-ae1d-103e6bcfffd6	2d860b86-e289-45b9-b108-3ecc32fafe18	adbe0a7a-d431-41af-9a40-6fdc864df6ab	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-17	400	cash	paid	\N	\N	2026-03-17 15:34:09.318621+00	f	\N	\N
70428241-4d1d-4665-867a-c075fd290c9b	e9d54922-42db-42b1-ab59-8dd42d68af4c	fe889acf-38cf-4a1f-8fce-804d5304f246	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-17	300	cash	paid	\N	\N	2026-03-17 15:34:34.289438+00	f	\N	\N
b840e2d6-4bb1-4eb1-a09c-9d060a037b4c	f35169da-5d69-4e7e-a35e-ed6237a94cff	6398b3f9-45c4-45b0-a7fc-0e3e1ced4173	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-17	500	online	paid	\N	\N	2026-03-17 16:25:05.710841+00	f	\N	\N
362d4031-4612-467c-9154-a9dd2da3fa16	89d5c659-aa6c-4a99-b0fc-f737d9e8e0e4	111a604f-46f8-4271-8912-ccbe479ab3ef	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-17	1500	online	paid	\N	\N	2026-03-17 17:54:09.390268+00	f	\N	\N
4b546c64-429a-4048-b430-519cb30175fd	9920fe35-b725-4a78-802d-61689d6993b2	b9ea214a-e90e-4ad5-a848-3b1005f2e89f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18	300	online	paid	\N	\N	2026-03-18 06:29:29.057333+00	f	\N	\N
8f9abd25-fd80-454d-a44f-b0ce11a97858	80752817-7c75-426b-a97e-361b246ec563	135460a0-56bf-4c17-a4a8-5e66f29b52f6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18	300	cash	paid	\N	\N	2026-03-18 07:29:21.180204+00	f	\N	\N
f98f2837-ad5e-4b0c-aa96-2d5297eb73f5	27559805-98ca-4b40-a167-933eea4a69bb	9c2457d7-dd54-4968-bf51-e43a0ecb49f3	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18	6000	online	paid	\N	\N	2026-03-18 08:07:37.535442+00	f	\N	\N
91a71dca-3398-470f-b29f-c06aaaec2392	35038458-ade9-412d-877d-814bb95adf5d	794af05e-0e94-449e-90ee-691d82534c27	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18	200	online	paid	\N	\N	2026-03-18 08:08:12.043879+00	f	\N	\N
22f2f7ec-d815-4633-959c-245907ee884e	de282179-bb22-45ff-b75f-6bb22109cb12	804dc780-cd95-46c8-a131-47013ca5eb56	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18	3000	online	paid	\N	\N	2026-03-18 08:08:42.900051+00	f	\N	\N
89b595a3-f708-43f6-9a45-4d673ae126e3	e3325ec8-264a-41e1-a2d5-84fb33eb4412	c2c54c13-fb99-4e5d-9f99-1bddf98beb5b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18	500	online	paid	\N	\N	2026-03-18 08:09:25.855217+00	f	\N	\N
98177f86-a812-4d00-9c81-9f7242812028	c9a697e2-d1d0-4f48-9f8b-b0a12d06de0d	6778d224-f980-48ed-801f-bef1220cd43c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18	400	online	paid	\N	\N	2026-03-18 12:53:13.664217+00	f	\N	\N
4c7e2a7a-cc0a-4e7f-9d03-ebbd92b7d509	bee2c977-93c0-44ef-874e-a76e53e40a51	aa68ef20-1754-401b-9bfc-b8f2c49b0a4e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18	400	online	paid	\N	\N	2026-03-18 12:54:08.967915+00	f	\N	\N
aaeb8eaf-2b23-435a-9be1-caf2471a190d	a0d4dce0-9bdd-4cf1-ad5d-1c95cf18e2dd	dfa34099-366b-4a3e-85ef-eb12e94f4083	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18	300	online	paid	\N	\N	2026-03-18 12:54:50.63297+00	f	\N	\N
2c93d05c-cce0-4ccc-9298-4554d748ea4d	89d5c659-aa6c-4a99-b0fc-f737d9e8e0e4	111a604f-46f8-4271-8912-ccbe479ab3ef	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18	1500	online	paid	\N	\N	2026-03-18 13:33:28.473815+00	f	\N	\N
8b453637-f9c9-48e4-adf7-b2b8b7e92bb6	ba9ab57b-e2d8-4c2a-902d-effb7b810b03	a3f57a0f-8bdf-47f7-a94d-819924cdc08a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18	1000	online	paid	\N	\N	2026-03-18 13:47:50.549081+00	f	\N	\N
fc6b5514-3209-4d3a-93cc-8774a73bd101	6245a2e8-2eb5-4d5f-8b8a-aac817bfee18	55efd7cf-1188-4423-9a53-8ee2c53002fa	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18	200	online	paid	\N	\N	2026-03-18 13:49:19.453267+00	f	\N	\N
158d7341-2c0a-4737-aefb-b87f83907249	02889b17-5d17-4dc1-ace1-381b0d733984	def4d986-3767-4793-a6e8-c767351fd93f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18	500	cash	paid	\N	\N	2026-03-18 14:07:13.486537+00	f	\N	\N
ef2ac3f0-1560-467e-a998-1cd8d081260a	cf301afd-a3ed-4bea-9794-b4fe432d8861	8419a9be-df12-416f-81ce-3570f9a82a4c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18	1200	cash	paid	\N	\N	2026-03-18 14:33:39.15856+00	f	\N	\N
736cf073-e6bc-471e-a331-a18fe40bf809	22d10045-ef1c-4807-9278-c35dbb01d73f	db261798-826e-4d7b-9fc7-a4dba55df1f3	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18	200	online	paid	\N	\N	2026-03-18 14:52:29.812756+00	f	\N	\N
4c8581fa-e432-4004-b8c4-41bad793a2c9	1ca2f5d0-fc1b-49ab-8443-25574737d3cf	18d2e760-ed6d-44b0-af27-6b7cb9d6ddbb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18	100	cash	paid	\N	\N	2026-03-18 15:16:10.236272+00	f	\N	\N
5e94ab4b-e528-4856-b19f-c3f364de29b8	f5064908-4ea0-42c7-8a63-0ddfc2a80531	dc623009-9752-43d7-b22a-384740599eb7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18	400	cash	paid	\N	\N	2026-03-18 15:16:56.575969+00	f	\N	\N
88a0f4c8-5e67-4189-97cc-2baa07cde6db	8926b943-bda3-4c36-aa29-4f8576e75e90	735cd1ad-a76d-4026-87dc-60f501454b7a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18	600	cash	paid	\N	\N	2026-03-18 15:18:33.819281+00	f	\N	\N
4ff71d8c-f377-4c36-be84-313109641197	4bf7d91d-6da6-4d5d-9db0-30b196a13651	6f37b184-d886-4b91-a179-60f467b3e51d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18	1500	cash	paid	\N	\N	2026-03-18 15:19:11.923951+00	f	\N	\N
3b1f2954-edc2-4f8c-8850-f02b9ff3b5b3	e9d54922-42db-42b1-ab59-8dd42d68af4c	fe889acf-38cf-4a1f-8fce-804d5304f246	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18	300	cash	paid	\N	\N	2026-03-18 15:21:31.354451+00	f	\N	\N
44949dc7-22fb-405c-909d-a2da84342780	84cf3d8e-64cc-4a90-8b33-12c94640d00b	ebc8c94f-09bf-41ca-8522-f81f98fb1469	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18	700	cash	paid	\N	\N	2026-03-18 15:22:17.938678+00	f	\N	\N
891e6492-50db-4799-83a3-71d210153b94	d59ecb10-5af9-4f75-8f43-dfc52d537f0c	400fb688-b2dd-42c2-b2f6-c2c3a6bff5bd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18	400	cash	paid	\N	\N	2026-03-18 15:22:38.829232+00	f	\N	\N
74aee401-a4dc-46d5-a035-1814f28220e7	32e40b35-8c4b-4552-b8b8-7c233d31c03d	757d4684-58bf-40d2-bfdd-ec9921ff94d7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18	250	online	paid	\N	\N	2026-03-18 15:27:54.083828+00	f	\N	\N
2a98c7a7-a311-4723-9ce3-8299bb6a4171	6aac96ea-eb26-460a-8340-ffb355953ae0	8e423e8d-c1ce-4d07-9860-fd7df34eaf44	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18	400	online	paid	\N	\N	2026-03-18 16:00:28.835615+00	f	\N	\N
a7bb8f54-687c-411a-909d-79dd513c60b8	b16866ff-ba34-412f-aeea-fa734ccf88a1	a3742c80-66e9-443f-8ab2-a145af754194	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18	500	online	paid	\N	\N	2026-03-18 16:13:43.168322+00	f	\N	\N
7bb1f5b3-8bca-4198-8b90-7b3495d49458	860f25ca-39ff-42f0-bacb-e409bd6007d7	71d81887-5e21-4486-97e6-faea2c876cff	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18	200	online	paid	\N	\N	2026-03-18 16:14:34.85763+00	f	\N	\N
399ba774-07f5-4092-a380-4275bbb88605	34977a0a-e657-40cb-840d-a6df47bba8d3	d1929534-e23a-4d75-8031-6998ec8b0810	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18	100	online	paid	\N	\N	2026-03-18 16:30:57.330083+00	f	\N	\N
f7d1bd05-397f-41db-a637-0986e9757c18	b86ae36d-afe4-41a9-8d69-af6178efda6c	7983d2f3-d1b5-4f40-afba-dfadeeb8e0bd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19	400	online	paid	\N	\N	2026-03-19 01:43:58.570127+00	f	\N	\N
ccf39281-62fd-453a-aff8-c419866aca24	9920fe35-b725-4a78-802d-61689d6993b2	b9ea214a-e90e-4ad5-a848-3b1005f2e89f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19	300	online	paid	\N	\N	2026-03-19 04:50:58.82689+00	f	\N	\N
\.


--
-- Data for Name: profiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profiles (id, user_id, name, mobile, whatsapp_number, avatar_url, reporting_to, created_at, updated_at, is_deleted, deleted_at, deleted_by) FROM stdin;
5248d085-7ed8-4429-b8db-383591501c1e	c5dbe63c-3054-481f-ad4b-4dab2dd7dc8d	Elavarasan Thiyagarajan	9004835516	9004835516	\N	\N	2026-02-23 16:15:43.777529+00	2026-02-23 17:08:37.054491+00	f	\N	\N
d8bbbf7f-0ebb-49bc-8bc8-1abd3f3f149f	548bf3d4-4ce0-44b3-880f-5ed7df62647d	JORAT	8682041077	8682041077	\N	c5dbe63c-3054-481f-ad4b-4dab2dd7dc8d	2026-02-23 18:14:10.420207+00	2026-02-23 18:14:11.587257+00	f	\N	\N
d3a4e6b5-ea49-4d17-a732-11acf0b6586a	dedfbdd2-f9d5-447e-91d8-a9e808c3fe0e	AK	9965750385	9965750385	\N	548bf3d4-4ce0-44b3-880f-5ed7df62647d	2026-02-23 18:19:00.536375+00	2026-02-23 18:19:00.854322+00	f	\N	\N
99b6f81d-6f69-43e2-b168-a81a8406ddc4	de166364-de6d-4f83-806f-0a0905ac2772	MD	9999999999	9003845516	\N	\N	2026-02-24 08:32:44.154056+00	2026-02-24 08:32:45.486049+00	f	\N	\N
a8b33ca9-a6b3-42bd-a15b-600de964c8e4	ec23a138-6a85-40dc-80b3-47bfb474959c	Saranraj	9199620283	\N	\N	c5dbe63c-3054-481f-ad4b-4dab2dd7dc8d	2026-02-24 09:08:22.921038+00	2026-02-24 09:08:24.374204+00	f	\N	\N
6d791e45-e385-46d9-b29e-50d91d7a0051	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	Saran Raj	9962028302	9003845516	\N	c5dbe63c-3054-481f-ad4b-4dab2dd7dc8d	2026-02-24 13:19:24.352383+00	2026-02-24 13:19:25.571711+00	f	\N	\N
\.


--
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_roles (id, user_id, role, is_active, created_at) FROM stdin;
92846553-127c-4880-9bb3-5c3e05c58ace	c5dbe63c-3054-481f-ad4b-4dab2dd7dc8d	admin	t	2026-02-23 16:15:43.777529+00
debc62f0-326c-4078-b1c1-9264a4ad37e5	de166364-de6d-4f83-806f-0a0905ac2772	manager	f	2026-02-24 08:32:44.154056+00
e25de908-754c-4988-996b-43705499b0c5	ec23a138-6a85-40dc-80b3-47bfb474959c	manager	f	2026-02-24 09:08:22.921038+00
4523ee51-b45a-4281-88ac-65a7977914bd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	manager	t	2026-02-24 13:19:24.352383+00
15525e25-21ab-4bb8-9ebc-7f41032bb098	548bf3d4-4ce0-44b3-880f-5ed7df62647d	admin	t	2026-02-23 18:14:10.420207+00
3f769634-9e6b-4b91-bfca-58a07c70063a	dedfbdd2-f9d5-447e-91d8-a9e808c3fe0e	agent	t	2026-02-23 18:19:00.536375+00
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.schema_migrations (version, inserted_at) FROM stdin;
20211116024918	2026-02-23 16:06:20
20211116045059	2026-02-23 16:06:20
20211116050929	2026-02-23 16:06:20
20211116051442	2026-02-23 16:06:20
20211116212300	2026-02-23 16:06:20
20211116213355	2026-02-23 16:06:20
20211116213934	2026-02-23 16:06:20
20211116214523	2026-02-23 16:06:20
20211122062447	2026-02-23 16:06:20
20211124070109	2026-02-23 16:06:20
20211202204204	2026-02-23 16:06:20
20211202204605	2026-02-23 16:06:20
20211210212804	2026-02-23 16:06:20
20211228014915	2026-02-23 16:06:20
20220107221237	2026-02-23 16:06:21
20220228202821	2026-02-23 16:06:21
20220312004840	2026-02-23 16:06:21
20220603231003	2026-02-23 16:06:21
20220603232444	2026-02-23 16:06:21
20220615214548	2026-02-23 16:06:21
20220712093339	2026-02-23 16:06:21
20220908172859	2026-02-23 16:06:21
20220916233421	2026-02-23 16:06:21
20230119133233	2026-02-23 16:06:21
20230128025114	2026-02-23 16:06:21
20230128025212	2026-02-23 16:06:21
20230227211149	2026-02-23 16:06:21
20230228184745	2026-02-23 16:06:21
20230308225145	2026-02-23 16:06:21
20230328144023	2026-02-23 16:06:21
20231018144023	2026-02-23 16:06:21
20231204144023	2026-02-23 16:06:21
20231204144024	2026-02-23 16:06:21
20231204144025	2026-02-23 16:06:21
20240108234812	2026-02-23 16:06:21
20240109165339	2026-02-23 16:06:21
20240227174441	2026-02-23 16:06:21
20240311171622	2026-02-23 16:06:21
20240321100241	2026-02-23 16:06:21
20240401105812	2026-02-23 16:06:21
20240418121054	2026-02-23 16:06:21
20240523004032	2026-02-23 16:06:21
20240618124746	2026-02-23 16:06:21
20240801235015	2026-02-23 16:06:21
20240805133720	2026-02-23 16:06:21
20240827160934	2026-02-23 16:06:21
20240919163303	2026-02-23 16:06:21
20240919163305	2026-02-23 16:06:21
20241019105805	2026-02-23 16:06:21
20241030150047	2026-02-23 16:06:21
20241108114728	2026-02-23 16:06:21
20241121104152	2026-02-23 16:06:21
20241130184212	2026-02-23 16:06:21
20241220035512	2026-02-23 16:06:21
20241220123912	2026-02-23 16:06:21
20241224161212	2026-02-23 16:06:21
20250107150512	2026-02-23 16:06:21
20250110162412	2026-02-23 16:06:21
20250123174212	2026-02-23 16:06:21
20250128220012	2026-02-23 16:06:21
20250506224012	2026-02-23 16:06:21
20250523164012	2026-02-23 16:06:21
20250714121412	2026-02-23 16:06:21
20250905041441	2026-02-23 16:06:21
20251103001201	2026-02-23 16:06:21
20251120212548	2026-03-14 03:36:13
20251120215549	2026-03-14 03:36:13
20260218120000	2026-03-14 03:36:13
\.


--
-- Data for Name: subscription; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.subscription (id, subscription_id, entity, filters, claims, created_at, action_filter) FROM stdin;
\.


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets (id, name, owner, created_at, updated_at, public, avif_autodetection, file_size_limit, allowed_mime_types, owner_id, type) FROM stdin;
profile-images	profile-images	\N	2026-02-23 16:13:21.77982+00	2026-02-23 16:13:21.77982+00	t	f	\N	\N	\N	STANDARD
customer-kyc	customer-kyc	\N	2026-02-23 16:13:21.77982+00	2026-02-23 16:13:21.77982+00	t	f	\N	\N	\N	STANDARD
\.


--
-- Data for Name: buckets_analytics; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets_analytics (name, type, format, created_at, updated_at, id, deleted_at) FROM stdin;
\.


--
-- Data for Name: buckets_vectors; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets_vectors (id, type, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.migrations (id, name, hash, executed_at) FROM stdin;
0	create-migrations-table	e18db593bcde2aca2a408c4d1100f6abba2195df	2026-02-23 16:06:21.462462
1	initialmigration	6ab16121fbaa08bbd11b712d05f358f9b555d777	2026-02-23 16:06:21.474797
2	storage-schema	f6a1fa2c93cbcd16d4e487b362e45fca157a8dbd	2026-02-23 16:06:21.491385
3	pathtoken-column	2cb1b0004b817b29d5b0a971af16bafeede4b70d	2026-02-23 16:06:21.531576
4	add-migrations-rls	427c5b63fe1c5937495d9c635c263ee7a5905058	2026-02-23 16:06:21.546119
5	add-size-functions	79e081a1455b63666c1294a440f8ad4b1e6a7f84	2026-02-23 16:06:21.551298
6	change-column-name-in-get-size	ded78e2f1b5d7e616117897e6443a925965b30d2	2026-02-23 16:06:21.559846
7	add-rls-to-buckets	e7e7f86adbc51049f341dfe8d30256c1abca17aa	2026-02-23 16:06:21.566442
8	add-public-to-buckets	fd670db39ed65f9d08b01db09d6202503ca2bab3	2026-02-23 16:06:21.571416
9	fix-search-function	af597a1b590c70519b464a4ab3be54490712796b	2026-02-23 16:06:21.581269
10	search-files-search-function	b595f05e92f7e91211af1bbfe9c6a13bb3391e16	2026-02-23 16:06:21.586263
11	add-trigger-to-auto-update-updated_at-column	7425bdb14366d1739fa8a18c83100636d74dcaa2	2026-02-23 16:06:21.593808
12	add-automatic-avif-detection-flag	8e92e1266eb29518b6a4c5313ab8f29dd0d08df9	2026-02-23 16:06:21.602445
13	add-bucket-custom-limits	cce962054138135cd9a8c4bcd531598684b25e7d	2026-02-23 16:06:21.610104
14	use-bytes-for-max-size	941c41b346f9802b411f06f30e972ad4744dad27	2026-02-23 16:06:21.616487
15	add-can-insert-object-function	934146bc38ead475f4ef4b555c524ee5d66799e5	2026-02-23 16:06:21.674317
16	add-version	76debf38d3fd07dcfc747ca49096457d95b1221b	2026-02-23 16:06:21.679647
17	drop-owner-foreign-key	f1cbb288f1b7a4c1eb8c38504b80ae2a0153d101	2026-02-23 16:06:21.685112
18	add_owner_id_column_deprecate_owner	e7a511b379110b08e2f214be852c35414749fe66	2026-02-23 16:06:21.689866
19	alter-default-value-objects-id	02e5e22a78626187e00d173dc45f58fa66a4f043	2026-02-23 16:06:21.69561
20	list-objects-with-delimiter	cd694ae708e51ba82bf012bba00caf4f3b6393b7	2026-02-23 16:06:21.701566
21	s3-multipart-uploads	8c804d4a566c40cd1e4cc5b3725a664a9303657f	2026-02-23 16:06:21.709868
22	s3-multipart-uploads-big-ints	9737dc258d2397953c9953d9b86920b8be0cdb73	2026-02-23 16:06:21.728842
23	optimize-search-function	9d7e604cddc4b56a5422dc68c9313f4a1b6f132c	2026-02-23 16:06:21.746917
24	operation-function	8312e37c2bf9e76bbe841aa5fda889206d2bf8aa	2026-02-23 16:06:21.753653
25	custom-metadata	d974c6057c3db1c1f847afa0e291e6165693b990	2026-02-23 16:06:21.758702
26	objects-prefixes	215cabcb7f78121892a5a2037a09fedf9a1ae322	2026-02-23 16:06:21.763888
27	search-v2	859ba38092ac96eb3964d83bf53ccc0b141663a6	2026-02-23 16:06:21.768484
28	object-bucket-name-sorting	c73a2b5b5d4041e39705814fd3a1b95502d38ce4	2026-02-23 16:06:21.772856
29	create-prefixes	ad2c1207f76703d11a9f9007f821620017a66c21	2026-02-23 16:06:21.77734
30	update-object-levels	2be814ff05c8252fdfdc7cfb4b7f5c7e17f0bed6	2026-02-23 16:06:21.781787
31	objects-level-index	b40367c14c3440ec75f19bbce2d71e914ddd3da0	2026-02-23 16:06:21.786113
32	backward-compatible-index-on-objects	e0c37182b0f7aee3efd823298fb3c76f1042c0f7	2026-02-23 16:06:21.790711
33	backward-compatible-index-on-prefixes	b480e99ed951e0900f033ec4eb34b5bdcb4e3d49	2026-02-23 16:06:21.794947
34	optimize-search-function-v1	ca80a3dc7bfef894df17108785ce29a7fc8ee456	2026-02-23 16:06:21.799407
35	add-insert-trigger-prefixes	458fe0ffd07ec53f5e3ce9df51bfdf4861929ccc	2026-02-23 16:06:21.803821
36	optimise-existing-functions	6ae5fca6af5c55abe95369cd4f93985d1814ca8f	2026-02-23 16:06:21.812674
37	add-bucket-name-length-trigger	3944135b4e3e8b22d6d4cbb568fe3b0b51df15c1	2026-02-23 16:06:21.817395
38	iceberg-catalog-flag-on-buckets	02716b81ceec9705aed84aa1501657095b32e5c5	2026-02-23 16:06:21.825853
39	add-search-v2-sort-support	6706c5f2928846abee18461279799ad12b279b78	2026-02-23 16:06:21.83449
40	fix-prefix-race-conditions-optimized	7ad69982ae2d372b21f48fc4829ae9752c518f6b	2026-02-23 16:06:21.838861
41	add-object-level-update-trigger	07fcf1a22165849b7a029deed059ffcde08d1ae0	2026-02-23 16:06:21.842922
42	rollback-prefix-triggers	771479077764adc09e2ea2043eb627503c034cd4	2026-02-23 16:06:21.847234
43	fix-object-level	84b35d6caca9d937478ad8a797491f38b8c2979f	2026-02-23 16:06:21.851402
44	vector-bucket-type	99c20c0ffd52bb1ff1f32fb992f3b351e3ef8fb3	2026-02-23 16:06:21.855782
45	vector-buckets	049e27196d77a7cb76497a85afae669d8b230953	2026-02-23 16:06:21.862242
46	buckets-objects-grants	fedeb96d60fefd8e02ab3ded9fbde05632f84aed	2026-02-23 16:06:21.875516
47	iceberg-table-metadata	649df56855c24d8b36dd4cc1aeb8251aa9ad42c2	2026-02-23 16:06:21.881663
48	iceberg-catalog-ids	e0e8b460c609b9999ccd0df9ad14294613eed939	2026-02-23 16:06:21.887224
49	buckets-objects-grants-postgres	072b1195d0d5a2f888af6b2302a1938dd94b8b3d	2026-02-23 16:06:21.913302
50	search-v2-optimised	6323ac4f850aa14e7387eb32102869578b5bd478	2026-02-23 16:06:21.919841
51	index-backward-compatible-search	2ee395d433f76e38bcd3856debaf6e0e5b674011	2026-02-23 16:06:25.543245
52	drop-not-used-indexes-and-functions	5cc44c8696749ac11dd0dc37f2a3802075f3a171	2026-02-23 16:06:25.548543
53	drop-index-lower-name	d0cb18777d9e2a98ebe0bc5cc7a42e57ebe41854	2026-02-23 16:06:25.582491
54	drop-index-object-level	6289e048b1472da17c31a7eba1ded625a6457e67	2026-02-23 16:06:25.585495
55	prevent-direct-deletes	262a4798d5e0f2e7c8970232e03ce8be695d5819	2026-02-23 16:06:25.58746
56	fix-optimized-search-function	cb58526ebc23048049fd5bf2fd148d18b04a2073	2026-02-23 16:06:25.615825
\.


--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.objects (id, bucket_id, name, owner, created_at, updated_at, last_accessed_at, metadata, version, owner_id, user_metadata) FROM stdin;
3bdfa60c-9041-4a1f-9436-766bc3f0bb5c	customer-kyc	bb6df5cd-78b6-4e08-a6ea-b4acf3effde7/pan.png	c5dbe63c-3054-481f-ad4b-4dab2dd7dc8d	2026-02-23 18:47:54.048502+00	2026-02-23 18:47:54.048502+00	2026-02-23 18:47:54.048502+00	{"eTag": "\\"187b0067403a2cc070c65446c87c13b0\\"", "size": 4641, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-02-23T18:47:55.000Z", "contentLength": 4641, "httpStatusCode": 200}	68ae1fd7-07c3-45a8-ab1a-8753990d0b58	c5dbe63c-3054-481f-ad4b-4dab2dd7dc8d	{}
\.


--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads (id, in_progress_size, upload_signature, bucket_id, key, version, owner_id, created_at, user_metadata) FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads_parts (id, upload_id, size, part_number, bucket_id, key, etag, owner_id, version, created_at) FROM stdin;
\.


--
-- Data for Name: vector_indexes; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.vector_indexes (id, name, bucket_id, data_type, dimension, distance_metric, metadata_configuration, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: supabase_admin
--

COPY vault.secrets (id, name, description, secret, key_id, nonce, created_at, updated_at) FROM stdin;
\.


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('auth.refresh_tokens_id_seq', 301, true);


--
-- Name: loans_loan_number_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.loans_loan_number_seq', 71, true);


--
-- Name: subscription_id_seq; Type: SEQUENCE SET; Schema: realtime; Owner: supabase_admin
--

SELECT pg_catalog.setval('realtime.subscription_id_seq', 1, false);


--
-- Name: mfa_amr_claims amr_id_pk; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT amr_id_pk PRIMARY KEY (id);


--
-- Name: audit_log_entries audit_log_entries_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.audit_log_entries
    ADD CONSTRAINT audit_log_entries_pkey PRIMARY KEY (id);


--
-- Name: custom_oauth_providers custom_oauth_providers_identifier_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.custom_oauth_providers
    ADD CONSTRAINT custom_oauth_providers_identifier_key UNIQUE (identifier);


--
-- Name: custom_oauth_providers custom_oauth_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.custom_oauth_providers
    ADD CONSTRAINT custom_oauth_providers_pkey PRIMARY KEY (id);


--
-- Name: flow_state flow_state_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.flow_state
    ADD CONSTRAINT flow_state_pkey PRIMARY KEY (id);


--
-- Name: identities identities_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_pkey PRIMARY KEY (id);


--
-- Name: identities identities_provider_id_provider_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_provider_id_provider_unique UNIQUE (provider_id, provider);


--
-- Name: instances instances_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.instances
    ADD CONSTRAINT instances_pkey PRIMARY KEY (id);


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_authentication_method_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_authentication_method_pkey UNIQUE (session_id, authentication_method);


--
-- Name: mfa_challenges mfa_challenges_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_pkey PRIMARY KEY (id);


--
-- Name: mfa_factors mfa_factors_last_challenged_at_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_last_challenged_at_key UNIQUE (last_challenged_at);


--
-- Name: mfa_factors mfa_factors_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_pkey PRIMARY KEY (id);


--
-- Name: oauth_authorizations oauth_authorizations_authorization_code_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_authorization_code_key UNIQUE (authorization_code);


--
-- Name: oauth_authorizations oauth_authorizations_authorization_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_authorization_id_key UNIQUE (authorization_id);


--
-- Name: oauth_authorizations oauth_authorizations_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_pkey PRIMARY KEY (id);


--
-- Name: oauth_client_states oauth_client_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_client_states
    ADD CONSTRAINT oauth_client_states_pkey PRIMARY KEY (id);


--
-- Name: oauth_clients oauth_clients_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_clients
    ADD CONSTRAINT oauth_clients_pkey PRIMARY KEY (id);


--
-- Name: oauth_consents oauth_consents_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_pkey PRIMARY KEY (id);


--
-- Name: oauth_consents oauth_consents_user_client_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_user_client_unique UNIQUE (user_id, client_id);


--
-- Name: one_time_tokens one_time_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_token_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_token_unique UNIQUE (token);


--
-- Name: saml_providers saml_providers_entity_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_entity_id_key UNIQUE (entity_id);


--
-- Name: saml_providers saml_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_pkey PRIMARY KEY (id);


--
-- Name: saml_relay_states saml_relay_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sso_domains sso_domains_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_pkey PRIMARY KEY (id);


--
-- Name: sso_providers sso_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_providers
    ADD CONSTRAINT sso_providers_pkey PRIMARY KEY (id);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: audit_logs audit_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_logs
    ADD CONSTRAINT audit_logs_pkey PRIMARY KEY (id);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: feature_permissions feature_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feature_permissions
    ADD CONSTRAINT feature_permissions_pkey PRIMARY KEY (id);


--
-- Name: fund_transactions fund_transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fund_transactions
    ADD CONSTRAINT fund_transactions_pkey PRIMARY KEY (id);


--
-- Name: loans loans_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loans
    ADD CONSTRAINT loans_pkey PRIMARY KEY (id);


--
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- Name: profiles profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (id);


--
-- Name: profiles profiles_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_user_id_key UNIQUE (user_id);


--
-- Name: user_roles user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE ONLY realtime.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: subscription pk_subscription; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.subscription
    ADD CONSTRAINT pk_subscription PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: buckets_analytics buckets_analytics_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets_analytics
    ADD CONSTRAINT buckets_analytics_pkey PRIMARY KEY (id);


--
-- Name: buckets buckets_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets
    ADD CONSTRAINT buckets_pkey PRIMARY KEY (id);


--
-- Name: buckets_vectors buckets_vectors_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets_vectors
    ADD CONSTRAINT buckets_vectors_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_name_key; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_name_key UNIQUE (name);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: objects objects_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT objects_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_pkey PRIMARY KEY (id);


--
-- Name: vector_indexes vector_indexes_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.vector_indexes
    ADD CONSTRAINT vector_indexes_pkey PRIMARY KEY (id);


--
-- Name: audit_logs_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX audit_logs_instance_id_idx ON auth.audit_log_entries USING btree (instance_id);


--
-- Name: confirmation_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX confirmation_token_idx ON auth.users USING btree (confirmation_token) WHERE ((confirmation_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: custom_oauth_providers_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX custom_oauth_providers_created_at_idx ON auth.custom_oauth_providers USING btree (created_at);


--
-- Name: custom_oauth_providers_enabled_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX custom_oauth_providers_enabled_idx ON auth.custom_oauth_providers USING btree (enabled);


--
-- Name: custom_oauth_providers_identifier_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX custom_oauth_providers_identifier_idx ON auth.custom_oauth_providers USING btree (identifier);


--
-- Name: custom_oauth_providers_provider_type_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX custom_oauth_providers_provider_type_idx ON auth.custom_oauth_providers USING btree (provider_type);


--
-- Name: email_change_token_current_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_current_idx ON auth.users USING btree (email_change_token_current) WHERE ((email_change_token_current)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_new_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_new_idx ON auth.users USING btree (email_change_token_new) WHERE ((email_change_token_new)::text !~ '^[0-9 ]*$'::text);


--
-- Name: factor_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX factor_id_created_at_idx ON auth.mfa_factors USING btree (user_id, created_at);


--
-- Name: flow_state_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX flow_state_created_at_idx ON auth.flow_state USING btree (created_at DESC);


--
-- Name: identities_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_email_idx ON auth.identities USING btree (email text_pattern_ops);


--
-- Name: INDEX identities_email_idx; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.identities_email_idx IS 'Auth: Ensures indexed queries on the email column';


--
-- Name: identities_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_user_id_idx ON auth.identities USING btree (user_id);


--
-- Name: idx_auth_code; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_auth_code ON auth.flow_state USING btree (auth_code);


--
-- Name: idx_oauth_client_states_created_at; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_oauth_client_states_created_at ON auth.oauth_client_states USING btree (created_at);


--
-- Name: idx_user_id_auth_method; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_user_id_auth_method ON auth.flow_state USING btree (user_id, authentication_method);


--
-- Name: mfa_challenge_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_challenge_created_at_idx ON auth.mfa_challenges USING btree (created_at DESC);


--
-- Name: mfa_factors_user_friendly_name_unique; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX mfa_factors_user_friendly_name_unique ON auth.mfa_factors USING btree (friendly_name, user_id) WHERE (TRIM(BOTH FROM friendly_name) <> ''::text);


--
-- Name: mfa_factors_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_factors_user_id_idx ON auth.mfa_factors USING btree (user_id);


--
-- Name: oauth_auth_pending_exp_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_auth_pending_exp_idx ON auth.oauth_authorizations USING btree (expires_at) WHERE (status = 'pending'::auth.oauth_authorization_status);


--
-- Name: oauth_clients_deleted_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_clients_deleted_at_idx ON auth.oauth_clients USING btree (deleted_at);


--
-- Name: oauth_consents_active_client_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_consents_active_client_idx ON auth.oauth_consents USING btree (client_id) WHERE (revoked_at IS NULL);


--
-- Name: oauth_consents_active_user_client_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_consents_active_user_client_idx ON auth.oauth_consents USING btree (user_id, client_id) WHERE (revoked_at IS NULL);


--
-- Name: oauth_consents_user_order_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_consents_user_order_idx ON auth.oauth_consents USING btree (user_id, granted_at DESC);


--
-- Name: one_time_tokens_relates_to_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_relates_to_hash_idx ON auth.one_time_tokens USING hash (relates_to);


--
-- Name: one_time_tokens_token_hash_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_token_hash_hash_idx ON auth.one_time_tokens USING hash (token_hash);


--
-- Name: one_time_tokens_user_id_token_type_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX one_time_tokens_user_id_token_type_key ON auth.one_time_tokens USING btree (user_id, token_type);


--
-- Name: reauthentication_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX reauthentication_token_idx ON auth.users USING btree (reauthentication_token) WHERE ((reauthentication_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: recovery_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX recovery_token_idx ON auth.users USING btree (recovery_token) WHERE ((recovery_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: refresh_tokens_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_idx ON auth.refresh_tokens USING btree (instance_id);


--
-- Name: refresh_tokens_instance_id_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_user_id_idx ON auth.refresh_tokens USING btree (instance_id, user_id);


--
-- Name: refresh_tokens_parent_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_parent_idx ON auth.refresh_tokens USING btree (parent);


--
-- Name: refresh_tokens_session_id_revoked_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_session_id_revoked_idx ON auth.refresh_tokens USING btree (session_id, revoked);


--
-- Name: refresh_tokens_updated_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_updated_at_idx ON auth.refresh_tokens USING btree (updated_at DESC);


--
-- Name: saml_providers_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_providers_sso_provider_id_idx ON auth.saml_providers USING btree (sso_provider_id);


--
-- Name: saml_relay_states_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_created_at_idx ON auth.saml_relay_states USING btree (created_at DESC);


--
-- Name: saml_relay_states_for_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_for_email_idx ON auth.saml_relay_states USING btree (for_email);


--
-- Name: saml_relay_states_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_sso_provider_id_idx ON auth.saml_relay_states USING btree (sso_provider_id);


--
-- Name: sessions_not_after_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_not_after_idx ON auth.sessions USING btree (not_after DESC);


--
-- Name: sessions_oauth_client_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_oauth_client_id_idx ON auth.sessions USING btree (oauth_client_id);


--
-- Name: sessions_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_user_id_idx ON auth.sessions USING btree (user_id);


--
-- Name: sso_domains_domain_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_domains_domain_idx ON auth.sso_domains USING btree (lower(domain));


--
-- Name: sso_domains_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_domains_sso_provider_id_idx ON auth.sso_domains USING btree (sso_provider_id);


--
-- Name: sso_providers_resource_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_providers_resource_id_idx ON auth.sso_providers USING btree (lower(resource_id));


--
-- Name: sso_providers_resource_id_pattern_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_providers_resource_id_pattern_idx ON auth.sso_providers USING btree (resource_id text_pattern_ops);


--
-- Name: unique_phone_factor_per_user; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX unique_phone_factor_per_user ON auth.mfa_factors USING btree (user_id, phone);


--
-- Name: user_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX user_id_created_at_idx ON auth.sessions USING btree (user_id, created_at);


--
-- Name: users_email_partial_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX users_email_partial_key ON auth.users USING btree (email) WHERE (is_sso_user = false);


--
-- Name: INDEX users_email_partial_key; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.users_email_partial_key IS 'Auth: A partial unique index that applies only when is_sso_user is false';


--
-- Name: users_instance_id_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_email_idx ON auth.users USING btree (instance_id, lower((email)::text));


--
-- Name: users_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_idx ON auth.users USING btree (instance_id);


--
-- Name: users_is_anonymous_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_is_anonymous_idx ON auth.users USING btree (is_anonymous);


--
-- Name: ix_realtime_subscription_entity; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX ix_realtime_subscription_entity ON realtime.subscription USING btree (entity);


--
-- Name: messages_inserted_at_topic_index; Type: INDEX; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE INDEX messages_inserted_at_topic_index ON ONLY realtime.messages USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: subscription_subscription_id_entity_filters_action_filter_key; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE UNIQUE INDEX subscription_subscription_id_entity_filters_action_filter_key ON realtime.subscription USING btree (subscription_id, entity, filters, action_filter);


--
-- Name: bname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bname ON storage.buckets USING btree (name);


--
-- Name: bucketid_objname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bucketid_objname ON storage.objects USING btree (bucket_id, name);


--
-- Name: buckets_analytics_unique_name_idx; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX buckets_analytics_unique_name_idx ON storage.buckets_analytics USING btree (name) WHERE (deleted_at IS NULL);


--
-- Name: idx_multipart_uploads_list; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_multipart_uploads_list ON storage.s3_multipart_uploads USING btree (bucket_id, key, created_at);


--
-- Name: idx_objects_bucket_id_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_bucket_id_name ON storage.objects USING btree (bucket_id, name COLLATE "C");


--
-- Name: name_prefix_search; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX name_prefix_search ON storage.objects USING btree (name text_pattern_ops);


--
-- Name: vector_indexes_name_bucket_id_idx; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX vector_indexes_name_bucket_id_idx ON storage.vector_indexes USING btree (name, bucket_id);


--
-- Name: users on_auth_user_created; Type: TRIGGER; Schema: auth; Owner: supabase_auth_admin
--

CREATE TRIGGER on_auth_user_created AFTER INSERT ON auth.users FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();


--
-- Name: loans generate_loan_display_id_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER generate_loan_display_id_trigger BEFORE INSERT ON public.loans FOR EACH ROW EXECUTE FUNCTION public.generate_loan_display_id();


--
-- Name: loans set_loan_display_id; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER set_loan_display_id BEFORE INSERT ON public.loans FOR EACH ROW EXECUTE FUNCTION public.generate_loan_display_id();


--
-- Name: customers update_customers_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_customers_updated_at BEFORE UPDATE ON public.customers FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: feature_permissions update_feature_permissions_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_feature_permissions_updated_at BEFORE UPDATE ON public.feature_permissions FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: loans update_loans_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_loans_updated_at BEFORE UPDATE ON public.loans FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: profiles update_profiles_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_profiles_updated_at BEFORE UPDATE ON public.profiles FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: subscription tr_check_filters; Type: TRIGGER; Schema: realtime; Owner: supabase_admin
--

CREATE TRIGGER tr_check_filters BEFORE INSERT OR UPDATE ON realtime.subscription FOR EACH ROW EXECUTE FUNCTION realtime.subscription_check_filters();


--
-- Name: buckets enforce_bucket_name_length_trigger; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER enforce_bucket_name_length_trigger BEFORE INSERT OR UPDATE OF name ON storage.buckets FOR EACH ROW EXECUTE FUNCTION storage.enforce_bucket_name_length();


--
-- Name: buckets protect_buckets_delete; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER protect_buckets_delete BEFORE DELETE ON storage.buckets FOR EACH STATEMENT EXECUTE FUNCTION storage.protect_delete();


--
-- Name: objects protect_objects_delete; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER protect_objects_delete BEFORE DELETE ON storage.objects FOR EACH STATEMENT EXECUTE FUNCTION storage.protect_delete();


--
-- Name: objects update_objects_updated_at; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER update_objects_updated_at BEFORE UPDATE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.update_updated_at_column();


--
-- Name: identities identities_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: mfa_challenges mfa_challenges_auth_factor_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_auth_factor_id_fkey FOREIGN KEY (factor_id) REFERENCES auth.mfa_factors(id) ON DELETE CASCADE;


--
-- Name: mfa_factors mfa_factors_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: oauth_authorizations oauth_authorizations_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_client_id_fkey FOREIGN KEY (client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: oauth_authorizations oauth_authorizations_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: oauth_consents oauth_consents_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_client_id_fkey FOREIGN KEY (client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: oauth_consents oauth_consents_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: one_time_tokens one_time_tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: refresh_tokens refresh_tokens_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: saml_providers saml_providers_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_flow_state_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_flow_state_id_fkey FOREIGN KEY (flow_state_id) REFERENCES auth.flow_state(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_oauth_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_oauth_client_id_fkey FOREIGN KEY (oauth_client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: sso_domains sso_domains_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: loans loans_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loans
    ADD CONSTRAINT loans_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(id);


--
-- Name: payments payments_agent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_agent_id_fkey FOREIGN KEY (agent_id) REFERENCES auth.users(id);


--
-- Name: payments payments_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(id);


--
-- Name: payments payments_loan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_loan_id_fkey FOREIGN KEY (loan_id) REFERENCES public.loans(id);


--
-- Name: objects objects_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT "objects_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_upload_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_upload_id_fkey FOREIGN KEY (upload_id) REFERENCES storage.s3_multipart_uploads(id) ON DELETE CASCADE;


--
-- Name: vector_indexes vector_indexes_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.vector_indexes
    ADD CONSTRAINT vector_indexes_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets_vectors(id);


--
-- Name: audit_log_entries; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.audit_log_entries ENABLE ROW LEVEL SECURITY;

--
-- Name: flow_state; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.flow_state ENABLE ROW LEVEL SECURITY;

--
-- Name: identities; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.identities ENABLE ROW LEVEL SECURITY;

--
-- Name: instances; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.instances ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_amr_claims; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_amr_claims ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_challenges; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_challenges ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_factors; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_factors ENABLE ROW LEVEL SECURITY;

--
-- Name: one_time_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.one_time_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: refresh_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.refresh_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_relay_states; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_relay_states ENABLE ROW LEVEL SECURITY;

--
-- Name: schema_migrations; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.schema_migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: sessions; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sessions ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_domains; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_domains ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: users; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.users ENABLE ROW LEVEL SECURITY;

--
-- Name: fund_transactions Admins and managers can insert fund transactions; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admins and managers can insert fund transactions" ON public.fund_transactions FOR INSERT WITH CHECK ((public.has_role(auth.uid(), 'admin'::public.app_role) OR public.has_role(auth.uid(), 'manager'::public.app_role) OR (public.has_role(auth.uid(), 'agent'::public.app_role) AND (reference_table = 'payments'::text) AND (type = 'loan_repayment'::text))));


--
-- Name: audit_logs Admins can insert audit logs; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admins can insert audit logs" ON public.audit_logs FOR INSERT WITH CHECK ((public.has_role(auth.uid(), 'admin'::public.app_role) OR (auth.uid() IS NOT NULL)));


--
-- Name: customers Admins can manage all customers; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admins can manage all customers" ON public.customers USING (public.has_role(auth.uid(), 'admin'::public.app_role));


--
-- Name: fund_transactions Admins can manage all fund transactions; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admins can manage all fund transactions" ON public.fund_transactions USING (public.has_role(auth.uid(), 'admin'::public.app_role));


--
-- Name: loans Admins can manage all loans; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admins can manage all loans" ON public.loans USING (public.has_role(auth.uid(), 'admin'::public.app_role));


--
-- Name: payments Admins can manage all payments; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admins can manage all payments" ON public.payments USING (public.has_role(auth.uid(), 'admin'::public.app_role));


--
-- Name: profiles Admins can manage all profiles; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admins can manage all profiles" ON public.profiles USING (public.has_role(auth.uid(), 'admin'::public.app_role));


--
-- Name: user_roles Admins can manage all roles; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admins can manage all roles" ON public.user_roles USING (public.has_role(auth.uid(), 'admin'::public.app_role));


--
-- Name: feature_permissions Admins can manage feature permissions; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admins can manage feature permissions" ON public.feature_permissions USING (public.has_role(auth.uid(), 'admin'::public.app_role));


--
-- Name: audit_logs Admins can view all audit logs; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admins can view all audit logs" ON public.audit_logs FOR SELECT USING (public.has_role(auth.uid(), 'admin'::public.app_role));


--
-- Name: profiles Admins can view all profiles; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admins can view all profiles" ON public.profiles FOR SELECT USING (public.has_role(auth.uid(), 'admin'::public.app_role));


--
-- Name: payments Agents can create payments for assigned customers; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Agents can create payments for assigned customers" ON public.payments FOR INSERT WITH CHECK (((agent_id = auth.uid()) AND (EXISTS ( SELECT 1
   FROM public.customers
  WHERE ((customers.id = payments.customer_id) AND ((customers.assigned_agent_id = auth.uid()) OR public.has_role(auth.uid(), 'admin'::public.app_role)))))));


--
-- Name: customers Agents can update assigned customers; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Agents can update assigned customers" ON public.customers FOR UPDATE USING ((assigned_agent_id = auth.uid()));


--
-- Name: payments Agents can update own payments; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Agents can update own payments" ON public.payments FOR UPDATE USING ((agent_id = auth.uid()));


--
-- Name: customers Agents can view assigned customers; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Agents can view assigned customers" ON public.customers FOR SELECT USING ((assigned_agent_id = auth.uid()));


--
-- Name: loans Agents can view loans for assigned customers; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Agents can view loans for assigned customers" ON public.loans FOR SELECT USING ((EXISTS ( SELECT 1
   FROM public.customers c
  WHERE ((c.id = loans.customer_id) AND (c.assigned_agent_id = auth.uid()) AND (c.is_deleted = false)))));


--
-- Name: payments Agents can view payments for assigned customers; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Agents can view payments for assigned customers" ON public.payments FOR SELECT USING (((agent_id = auth.uid()) OR (EXISTS ( SELECT 1
   FROM public.customers c
  WHERE ((c.id = payments.customer_id) AND (c.assigned_agent_id = auth.uid()) AND (c.is_deleted = false))))));


--
-- Name: profiles Authenticated users can create own profile; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Authenticated users can create own profile" ON public.profiles FOR INSERT WITH CHECK ((auth.uid() = user_id));


--
-- Name: feature_permissions Authenticated users can view feature permissions; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Authenticated users can view feature permissions" ON public.feature_permissions FOR SELECT USING (true);


--
-- Name: payments Managers can create payments for reporting agents customers; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Managers can create payments for reporting agents customers" ON public.payments FOR INSERT WITH CHECK ((public.has_role(auth.uid(), 'manager'::public.app_role) AND (EXISTS ( SELECT 1
   FROM public.customers c
  WHERE ((c.id = payments.customer_id) AND (c.is_deleted = false) AND ((c.assigned_agent_id = auth.uid()) OR (c.assigned_agent_id IN ( SELECT p.user_id
           FROM public.profiles p
          WHERE ((p.reporting_to = auth.uid()) AND (p.is_deleted = false))))))))));


--
-- Name: customers Managers can insert customers; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Managers can insert customers" ON public.customers FOR INSERT WITH CHECK ((public.has_role(auth.uid(), 'manager'::public.app_role) AND ((assigned_agent_id = auth.uid()) OR (assigned_agent_id IN ( SELECT p.user_id
   FROM public.profiles p
  WHERE ((p.reporting_to = auth.uid()) AND (p.is_deleted = false)))))));


--
-- Name: loans Managers can insert loans; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Managers can insert loans" ON public.loans FOR INSERT WITH CHECK ((public.has_role(auth.uid(), 'manager'::public.app_role) AND (EXISTS ( SELECT 1
   FROM public.customers c
  WHERE ((c.id = loans.customer_id) AND (c.is_deleted = false) AND ((c.assigned_agent_id = auth.uid()) OR (c.assigned_agent_id IN ( SELECT p.user_id
           FROM public.profiles p
          WHERE ((p.reporting_to = auth.uid()) AND (p.is_deleted = false))))))))));


--
-- Name: customers Managers can update customers of reporting agents; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Managers can update customers of reporting agents" ON public.customers FOR UPDATE USING ((public.has_role(auth.uid(), 'manager'::public.app_role) AND ((assigned_agent_id = auth.uid()) OR (assigned_agent_id IN ( SELECT p.user_id
   FROM public.profiles p
  WHERE ((p.reporting_to = auth.uid()) AND (p.is_deleted = false)))))));


--
-- Name: loans Managers can update loans for reporting agents customers; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Managers can update loans for reporting agents customers" ON public.loans FOR UPDATE USING ((public.has_role(auth.uid(), 'manager'::public.app_role) AND (EXISTS ( SELECT 1
   FROM public.customers c
  WHERE ((c.id = loans.customer_id) AND (c.is_deleted = false) AND ((c.assigned_agent_id = auth.uid()) OR (c.assigned_agent_id IN ( SELECT p.user_id
           FROM public.profiles p
          WHERE ((p.reporting_to = auth.uid()) AND (p.is_deleted = false))))))))));


--
-- Name: payments Managers can update payments of reporting agents; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Managers can update payments of reporting agents" ON public.payments FOR UPDATE USING ((public.has_role(auth.uid(), 'manager'::public.app_role) AND (EXISTS ( SELECT 1
   FROM public.customers c
  WHERE ((c.id = payments.customer_id) AND (c.is_deleted = false) AND ((c.assigned_agent_id = auth.uid()) OR (c.assigned_agent_id IN ( SELECT p.user_id
           FROM public.profiles p
          WHERE ((p.reporting_to = auth.uid()) AND (p.is_deleted = false))))))))));


--
-- Name: customers Managers can view customers of reporting agents; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Managers can view customers of reporting agents" ON public.customers FOR SELECT USING ((public.has_role(auth.uid(), 'manager'::public.app_role) AND ((assigned_agent_id = auth.uid()) OR (assigned_agent_id IN ( SELECT p.user_id
   FROM public.profiles p
  WHERE ((p.reporting_to = auth.uid()) AND (p.is_deleted = false)))))));


--
-- Name: fund_transactions Managers can view fund transactions; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Managers can view fund transactions" ON public.fund_transactions FOR SELECT USING (public.has_role(auth.uid(), 'manager'::public.app_role));


--
-- Name: loans Managers can view loans for reporting agents customers; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Managers can view loans for reporting agents customers" ON public.loans FOR SELECT USING ((public.has_role(auth.uid(), 'manager'::public.app_role) AND (EXISTS ( SELECT 1
   FROM public.customers c
  WHERE ((c.id = loans.customer_id) AND (c.is_deleted = false) AND ((c.assigned_agent_id = auth.uid()) OR (c.assigned_agent_id IN ( SELECT p.user_id
           FROM public.profiles p
          WHERE ((p.reporting_to = auth.uid()) AND (p.is_deleted = false))))))))));


--
-- Name: payments Managers can view payments of reporting agents; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Managers can view payments of reporting agents" ON public.payments FOR SELECT USING ((public.has_role(auth.uid(), 'manager'::public.app_role) AND (EXISTS ( SELECT 1
   FROM public.customers c
  WHERE ((c.id = payments.customer_id) AND (c.is_deleted = false) AND ((c.assigned_agent_id = auth.uid()) OR (c.assigned_agent_id IN ( SELECT p.user_id
           FROM public.profiles p
          WHERE ((p.reporting_to = auth.uid()) AND (p.is_deleted = false))))))))));


--
-- Name: profiles Managers can view reporting agents profiles; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Managers can view reporting agents profiles" ON public.profiles FOR SELECT USING ((public.has_role(auth.uid(), 'manager'::public.app_role) AND (reporting_to = auth.uid())));


--
-- Name: user_roles Managers can view reporting agents roles; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Managers can view reporting agents roles" ON public.user_roles FOR SELECT USING ((public.has_role(auth.uid(), 'manager'::public.app_role) AND (user_id IN ( SELECT pr.user_id
   FROM public.profiles pr
  WHERE ((pr.reporting_to = auth.uid()) AND (pr.is_deleted = false))))));


--
-- Name: profiles Users can update own profile; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can update own profile" ON public.profiles FOR UPDATE USING ((auth.uid() = user_id));


--
-- Name: profiles Users can view own profile; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can view own profile" ON public.profiles FOR SELECT USING ((auth.uid() = user_id));


--
-- Name: user_roles Users can view own roles; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can view own roles" ON public.user_roles FOR SELECT USING ((auth.uid() = user_id));


--
-- Name: audit_logs; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.audit_logs ENABLE ROW LEVEL SECURITY;

--
-- Name: customers; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.customers ENABLE ROW LEVEL SECURITY;

--
-- Name: feature_permissions; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.feature_permissions ENABLE ROW LEVEL SECURITY;

--
-- Name: fund_transactions; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.fund_transactions ENABLE ROW LEVEL SECURITY;

--
-- Name: loans; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.loans ENABLE ROW LEVEL SECURITY;

--
-- Name: payments; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.payments ENABLE ROW LEVEL SECURITY;

--
-- Name: profiles; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;

--
-- Name: user_roles; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.user_roles ENABLE ROW LEVEL SECURITY;

--
-- Name: messages; Type: ROW SECURITY; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE realtime.messages ENABLE ROW LEVEL SECURITY;

--
-- Name: objects Admins full access to KYC files; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Admins full access to KYC files" ON storage.objects USING (((bucket_id = 'customer-kyc'::text) AND public.has_role(auth.uid(), 'admin'::public.app_role)));


--
-- Name: objects Agents can update KYC files; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Agents can update KYC files" ON storage.objects FOR UPDATE USING (((bucket_id = 'customer-kyc'::text) AND public.has_role(auth.uid(), 'agent'::public.app_role)));


--
-- Name: objects Agents can upload KYC files; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Agents can upload KYC files" ON storage.objects FOR INSERT WITH CHECK (((bucket_id = 'customer-kyc'::text) AND public.has_role(auth.uid(), 'agent'::public.app_role)));


--
-- Name: objects Agents can view KYC files; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Agents can view KYC files" ON storage.objects FOR SELECT USING (((bucket_id = 'customer-kyc'::text) AND public.has_role(auth.uid(), 'agent'::public.app_role)));


--
-- Name: objects Managers can update KYC files; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Managers can update KYC files" ON storage.objects FOR UPDATE USING (((bucket_id = 'customer-kyc'::text) AND public.has_role(auth.uid(), 'manager'::public.app_role)));


--
-- Name: objects Managers can upload KYC files; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Managers can upload KYC files" ON storage.objects FOR INSERT WITH CHECK (((bucket_id = 'customer-kyc'::text) AND public.has_role(auth.uid(), 'manager'::public.app_role)));


--
-- Name: objects Managers can view KYC files; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Managers can view KYC files" ON storage.objects FOR SELECT USING (((bucket_id = 'customer-kyc'::text) AND public.has_role(auth.uid(), 'manager'::public.app_role)));


--
-- Name: objects Public read access for profile images; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Public read access for profile images" ON storage.objects FOR SELECT USING ((bucket_id = 'profile-images'::text));


--
-- Name: objects Users can delete own profile image; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Users can delete own profile image" ON storage.objects FOR DELETE USING (((bucket_id = 'profile-images'::text) AND ((auth.uid())::text = (storage.foldername(name))[1])));


--
-- Name: objects Users can update own profile image; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Users can update own profile image" ON storage.objects FOR UPDATE USING (((bucket_id = 'profile-images'::text) AND ((auth.uid())::text = (storage.foldername(name))[1])));


--
-- Name: objects Users can upload own profile image; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Users can upload own profile image" ON storage.objects FOR INSERT WITH CHECK (((bucket_id = 'profile-images'::text) AND ((auth.uid())::text = (storage.foldername(name))[1])));


--
-- Name: buckets; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets_analytics; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets_analytics ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets_vectors; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets_vectors ENABLE ROW LEVEL SECURITY;

--
-- Name: migrations; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: objects; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.objects ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads_parts; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads_parts ENABLE ROW LEVEL SECURITY;

--
-- Name: vector_indexes; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.vector_indexes ENABLE ROW LEVEL SECURITY;

--
-- Name: supabase_realtime; Type: PUBLICATION; Schema: -; Owner: postgres
--

CREATE PUBLICATION supabase_realtime WITH (publish = 'insert, update, delete, truncate');


ALTER PUBLICATION supabase_realtime OWNER TO postgres;

--
-- Name: SCHEMA auth; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA auth TO anon;
GRANT USAGE ON SCHEMA auth TO authenticated;
GRANT USAGE ON SCHEMA auth TO service_role;
GRANT ALL ON SCHEMA auth TO supabase_auth_admin;
GRANT ALL ON SCHEMA auth TO dashboard_user;
GRANT USAGE ON SCHEMA auth TO postgres;


--
-- Name: SCHEMA extensions; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA extensions TO anon;
GRANT USAGE ON SCHEMA extensions TO authenticated;
GRANT USAGE ON SCHEMA extensions TO service_role;
GRANT ALL ON SCHEMA extensions TO dashboard_user;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT USAGE ON SCHEMA public TO postgres;
GRANT USAGE ON SCHEMA public TO anon;
GRANT USAGE ON SCHEMA public TO authenticated;
GRANT USAGE ON SCHEMA public TO service_role;


--
-- Name: SCHEMA realtime; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA realtime TO postgres;
GRANT USAGE ON SCHEMA realtime TO anon;
GRANT USAGE ON SCHEMA realtime TO authenticated;
GRANT USAGE ON SCHEMA realtime TO service_role;
GRANT ALL ON SCHEMA realtime TO supabase_realtime_admin;


--
-- Name: SCHEMA storage; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA storage TO postgres WITH GRANT OPTION;
GRANT USAGE ON SCHEMA storage TO anon;
GRANT USAGE ON SCHEMA storage TO authenticated;
GRANT USAGE ON SCHEMA storage TO service_role;
GRANT ALL ON SCHEMA storage TO supabase_storage_admin WITH GRANT OPTION;
GRANT ALL ON SCHEMA storage TO dashboard_user;


--
-- Name: SCHEMA vault; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA vault TO postgres WITH GRANT OPTION;
GRANT USAGE ON SCHEMA vault TO service_role;


--
-- Name: FUNCTION email(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.email() TO dashboard_user;


--
-- Name: FUNCTION jwt(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.jwt() TO postgres;
GRANT ALL ON FUNCTION auth.jwt() TO dashboard_user;


--
-- Name: FUNCTION role(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.role() TO dashboard_user;


--
-- Name: FUNCTION uid(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.uid() TO dashboard_user;


--
-- Name: FUNCTION armor(bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.armor(bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO dashboard_user;


--
-- Name: FUNCTION armor(bytea, text[], text[]); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.armor(bytea, text[], text[]) FROM postgres;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO dashboard_user;


--
-- Name: FUNCTION crypt(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.crypt(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO dashboard_user;


--
-- Name: FUNCTION dearmor(text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.dearmor(text) FROM postgres;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO dashboard_user;


--
-- Name: FUNCTION decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION decrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION digest(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.digest(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION digest(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.digest(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO dashboard_user;


--
-- Name: FUNCTION encrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION encrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION gen_random_bytes(integer); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_random_bytes(integer) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO dashboard_user;


--
-- Name: FUNCTION gen_random_uuid(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_random_uuid() FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO dashboard_user;


--
-- Name: FUNCTION gen_salt(text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_salt(text) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO dashboard_user;


--
-- Name: FUNCTION gen_salt(text, integer); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_salt(text, integer) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO dashboard_user;


--
-- Name: FUNCTION grant_pg_cron_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION extensions.grant_pg_cron_access() FROM supabase_admin;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO supabase_admin WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO dashboard_user;


--
-- Name: FUNCTION grant_pg_graphql_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.grant_pg_graphql_access() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION grant_pg_net_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION extensions.grant_pg_net_access() FROM supabase_admin;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO supabase_admin WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO dashboard_user;


--
-- Name: FUNCTION hmac(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.hmac(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION hmac(text, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.hmac(text, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean) TO dashboard_user;


--
-- Name: FUNCTION pgp_armor_headers(text, OUT key text, OUT value text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO dashboard_user;


--
-- Name: FUNCTION pgp_key_id(bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_key_id(bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgrst_ddl_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_ddl_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgrst_drop_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_drop_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION set_graphql_placeholder(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.set_graphql_placeholder() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_generate_v1(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v1() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v1mc(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v1mc() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v3(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v4(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v4() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v5(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO dashboard_user;


--
-- Name: FUNCTION uuid_nil(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_nil() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_dns(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_dns() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_oid(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_oid() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_url(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_url() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_x500(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_x500() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO dashboard_user;


--
-- Name: FUNCTION graphql("operationName" text, query text, variables jsonb, extensions jsonb); Type: ACL; Schema: graphql_public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO postgres;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO anon;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO authenticated;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO service_role;


--
-- Name: FUNCTION pg_reload_conf(); Type: ACL; Schema: pg_catalog; Owner: supabase_admin
--

GRANT ALL ON FUNCTION pg_catalog.pg_reload_conf() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION get_auth(p_usename text); Type: ACL; Schema: pgbouncer; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION pgbouncer.get_auth(p_usename text) FROM PUBLIC;
GRANT ALL ON FUNCTION pgbouncer.get_auth(p_usename text) TO pgbouncer;


--
-- Name: FUNCTION generate_loan_display_id(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.generate_loan_display_id() TO anon;
GRANT ALL ON FUNCTION public.generate_loan_display_id() TO authenticated;
GRANT ALL ON FUNCTION public.generate_loan_display_id() TO service_role;


--
-- Name: FUNCTION get_agent_daily_stats(p_date date); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.get_agent_daily_stats(p_date date) TO anon;
GRANT ALL ON FUNCTION public.get_agent_daily_stats(p_date date) TO authenticated;
GRANT ALL ON FUNCTION public.get_agent_daily_stats(p_date date) TO service_role;


--
-- Name: FUNCTION get_agent_stats_range(p_from date, p_to date); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.get_agent_stats_range(p_from date, p_to date) TO anon;
GRANT ALL ON FUNCTION public.get_agent_stats_range(p_from date, p_to date) TO authenticated;
GRANT ALL ON FUNCTION public.get_agent_stats_range(p_from date, p_to date) TO service_role;


--
-- Name: FUNCTION get_user_role(_user_id uuid); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.get_user_role(_user_id uuid) TO anon;
GRANT ALL ON FUNCTION public.get_user_role(_user_id uuid) TO authenticated;
GRANT ALL ON FUNCTION public.get_user_role(_user_id uuid) TO service_role;


--
-- Name: FUNCTION handle_new_user(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.handle_new_user() TO anon;
GRANT ALL ON FUNCTION public.handle_new_user() TO authenticated;
GRANT ALL ON FUNCTION public.handle_new_user() TO service_role;


--
-- Name: FUNCTION has_role(_user_id uuid, _role public.app_role); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.has_role(_user_id uuid, _role public.app_role) TO anon;
GRANT ALL ON FUNCTION public.has_role(_user_id uuid, _role public.app_role) TO authenticated;
GRANT ALL ON FUNCTION public.has_role(_user_id uuid, _role public.app_role) TO service_role;


--
-- Name: FUNCTION log_audit(p_action text, p_table_name text, p_record_id uuid, p_old_data jsonb, p_new_data jsonb); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.log_audit(p_action text, p_table_name text, p_record_id uuid, p_old_data jsonb, p_new_data jsonb) TO anon;
GRANT ALL ON FUNCTION public.log_audit(p_action text, p_table_name text, p_record_id uuid, p_old_data jsonb, p_new_data jsonb) TO authenticated;
GRANT ALL ON FUNCTION public.log_audit(p_action text, p_table_name text, p_record_id uuid, p_old_data jsonb, p_new_data jsonb) TO service_role;


--
-- Name: FUNCTION restore_record(p_table_name text, p_record_id uuid); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.restore_record(p_table_name text, p_record_id uuid) TO anon;
GRANT ALL ON FUNCTION public.restore_record(p_table_name text, p_record_id uuid) TO authenticated;
GRANT ALL ON FUNCTION public.restore_record(p_table_name text, p_record_id uuid) TO service_role;


--
-- Name: FUNCTION rls_auto_enable(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.rls_auto_enable() TO anon;
GRANT ALL ON FUNCTION public.rls_auto_enable() TO authenticated;
GRANT ALL ON FUNCTION public.rls_auto_enable() TO service_role;


--
-- Name: FUNCTION soft_delete(p_table_name text, p_record_id uuid); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.soft_delete(p_table_name text, p_record_id uuid) TO anon;
GRANT ALL ON FUNCTION public.soft_delete(p_table_name text, p_record_id uuid) TO authenticated;
GRANT ALL ON FUNCTION public.soft_delete(p_table_name text, p_record_id uuid) TO service_role;


--
-- Name: FUNCTION update_updated_at_column(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.update_updated_at_column() TO anon;
GRANT ALL ON FUNCTION public.update_updated_at_column() TO authenticated;
GRANT ALL ON FUNCTION public.update_updated_at_column() TO service_role;


--
-- Name: FUNCTION apply_rls(wal jsonb, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO supabase_realtime_admin;


--
-- Name: FUNCTION broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO postgres;
GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO dashboard_user;


--
-- Name: FUNCTION build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO postgres;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO anon;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO service_role;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION "cast"(val text, type_ regtype); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO postgres;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO dashboard_user;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO anon;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO authenticated;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO service_role;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO supabase_realtime_admin;


--
-- Name: FUNCTION check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO postgres;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO anon;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO authenticated;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO service_role;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO supabase_realtime_admin;


--
-- Name: FUNCTION is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO postgres;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO anon;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO service_role;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO supabase_realtime_admin;


--
-- Name: FUNCTION quote_wal2json(entity regclass); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO postgres;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO anon;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO authenticated;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO service_role;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO supabase_realtime_admin;


--
-- Name: FUNCTION send(payload jsonb, event text, topic text, private boolean); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO postgres;
GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO dashboard_user;


--
-- Name: FUNCTION subscription_check_filters(); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO postgres;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO dashboard_user;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO anon;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO authenticated;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO service_role;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO supabase_realtime_admin;


--
-- Name: FUNCTION to_regrole(role_name text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO postgres;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO anon;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO authenticated;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO service_role;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO supabase_realtime_admin;


--
-- Name: FUNCTION topic(); Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON FUNCTION realtime.topic() TO postgres;
GRANT ALL ON FUNCTION realtime.topic() TO dashboard_user;


--
-- Name: FUNCTION _crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault._crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault._crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea) TO service_role;


--
-- Name: FUNCTION create_secret(new_secret text, new_name text, new_description text, new_key_id uuid); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault.create_secret(new_secret text, new_name text, new_description text, new_key_id uuid) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault.create_secret(new_secret text, new_name text, new_description text, new_key_id uuid) TO service_role;


--
-- Name: FUNCTION update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault.update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault.update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid) TO service_role;


--
-- Name: TABLE audit_log_entries; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.audit_log_entries TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.audit_log_entries TO postgres;
GRANT SELECT ON TABLE auth.audit_log_entries TO postgres WITH GRANT OPTION;


--
-- Name: TABLE custom_oauth_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.custom_oauth_providers TO postgres;
GRANT ALL ON TABLE auth.custom_oauth_providers TO dashboard_user;


--
-- Name: TABLE flow_state; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.flow_state TO postgres;
GRANT SELECT ON TABLE auth.flow_state TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.flow_state TO dashboard_user;


--
-- Name: TABLE identities; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.identities TO postgres;
GRANT SELECT ON TABLE auth.identities TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.identities TO dashboard_user;


--
-- Name: TABLE instances; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.instances TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.instances TO postgres;
GRANT SELECT ON TABLE auth.instances TO postgres WITH GRANT OPTION;


--
-- Name: TABLE mfa_amr_claims; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_amr_claims TO postgres;
GRANT SELECT ON TABLE auth.mfa_amr_claims TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_amr_claims TO dashboard_user;


--
-- Name: TABLE mfa_challenges; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_challenges TO postgres;
GRANT SELECT ON TABLE auth.mfa_challenges TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_challenges TO dashboard_user;


--
-- Name: TABLE mfa_factors; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_factors TO postgres;
GRANT SELECT ON TABLE auth.mfa_factors TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_factors TO dashboard_user;


--
-- Name: TABLE oauth_authorizations; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_authorizations TO postgres;
GRANT ALL ON TABLE auth.oauth_authorizations TO dashboard_user;


--
-- Name: TABLE oauth_client_states; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_client_states TO postgres;
GRANT ALL ON TABLE auth.oauth_client_states TO dashboard_user;


--
-- Name: TABLE oauth_clients; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_clients TO postgres;
GRANT ALL ON TABLE auth.oauth_clients TO dashboard_user;


--
-- Name: TABLE oauth_consents; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_consents TO postgres;
GRANT ALL ON TABLE auth.oauth_consents TO dashboard_user;


--
-- Name: TABLE one_time_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.one_time_tokens TO postgres;
GRANT SELECT ON TABLE auth.one_time_tokens TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.one_time_tokens TO dashboard_user;


--
-- Name: TABLE refresh_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.refresh_tokens TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.refresh_tokens TO postgres;
GRANT SELECT ON TABLE auth.refresh_tokens TO postgres WITH GRANT OPTION;


--
-- Name: SEQUENCE refresh_tokens_id_seq; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO dashboard_user;
GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO postgres;


--
-- Name: TABLE saml_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.saml_providers TO postgres;
GRANT SELECT ON TABLE auth.saml_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_providers TO dashboard_user;


--
-- Name: TABLE saml_relay_states; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.saml_relay_states TO postgres;
GRANT SELECT ON TABLE auth.saml_relay_states TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_relay_states TO dashboard_user;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT SELECT ON TABLE auth.schema_migrations TO postgres WITH GRANT OPTION;


--
-- Name: TABLE sessions; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sessions TO postgres;
GRANT SELECT ON TABLE auth.sessions TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sessions TO dashboard_user;


--
-- Name: TABLE sso_domains; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sso_domains TO postgres;
GRANT SELECT ON TABLE auth.sso_domains TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_domains TO dashboard_user;


--
-- Name: TABLE sso_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sso_providers TO postgres;
GRANT SELECT ON TABLE auth.sso_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_providers TO dashboard_user;


--
-- Name: TABLE users; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.users TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.users TO postgres;
GRANT SELECT ON TABLE auth.users TO postgres WITH GRANT OPTION;


--
-- Name: TABLE pg_stat_statements; Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON TABLE extensions.pg_stat_statements FROM postgres;
GRANT ALL ON TABLE extensions.pg_stat_statements TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements TO dashboard_user;


--
-- Name: TABLE pg_stat_statements_info; Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON TABLE extensions.pg_stat_statements_info FROM postgres;
GRANT ALL ON TABLE extensions.pg_stat_statements_info TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements_info TO dashboard_user;


--
-- Name: TABLE audit_logs; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.audit_logs TO anon;
GRANT ALL ON TABLE public.audit_logs TO authenticated;
GRANT ALL ON TABLE public.audit_logs TO service_role;


--
-- Name: TABLE customers; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.customers TO anon;
GRANT ALL ON TABLE public.customers TO authenticated;
GRANT ALL ON TABLE public.customers TO service_role;


--
-- Name: TABLE feature_permissions; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.feature_permissions TO anon;
GRANT ALL ON TABLE public.feature_permissions TO authenticated;
GRANT ALL ON TABLE public.feature_permissions TO service_role;


--
-- Name: TABLE fund_transactions; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.fund_transactions TO anon;
GRANT ALL ON TABLE public.fund_transactions TO authenticated;
GRANT ALL ON TABLE public.fund_transactions TO service_role;


--
-- Name: SEQUENCE loans_loan_number_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.loans_loan_number_seq TO anon;
GRANT ALL ON SEQUENCE public.loans_loan_number_seq TO authenticated;
GRANT ALL ON SEQUENCE public.loans_loan_number_seq TO service_role;


--
-- Name: TABLE loans; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.loans TO anon;
GRANT ALL ON TABLE public.loans TO authenticated;
GRANT ALL ON TABLE public.loans TO service_role;


--
-- Name: TABLE payments; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.payments TO anon;
GRANT ALL ON TABLE public.payments TO authenticated;
GRANT ALL ON TABLE public.payments TO service_role;


--
-- Name: TABLE profiles; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.profiles TO anon;
GRANT ALL ON TABLE public.profiles TO authenticated;
GRANT ALL ON TABLE public.profiles TO service_role;


--
-- Name: TABLE user_roles; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.user_roles TO anon;
GRANT ALL ON TABLE public.user_roles TO authenticated;
GRANT ALL ON TABLE public.user_roles TO service_role;


--
-- Name: TABLE messages; Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON TABLE realtime.messages TO postgres;
GRANT ALL ON TABLE realtime.messages TO dashboard_user;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO anon;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO authenticated;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO service_role;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.schema_migrations TO postgres;
GRANT ALL ON TABLE realtime.schema_migrations TO dashboard_user;
GRANT SELECT ON TABLE realtime.schema_migrations TO anon;
GRANT SELECT ON TABLE realtime.schema_migrations TO authenticated;
GRANT SELECT ON TABLE realtime.schema_migrations TO service_role;
GRANT ALL ON TABLE realtime.schema_migrations TO supabase_realtime_admin;


--
-- Name: TABLE subscription; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.subscription TO postgres;
GRANT ALL ON TABLE realtime.subscription TO dashboard_user;
GRANT SELECT ON TABLE realtime.subscription TO anon;
GRANT SELECT ON TABLE realtime.subscription TO authenticated;
GRANT SELECT ON TABLE realtime.subscription TO service_role;
GRANT ALL ON TABLE realtime.subscription TO supabase_realtime_admin;


--
-- Name: SEQUENCE subscription_id_seq; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO postgres;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO dashboard_user;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO anon;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO authenticated;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO service_role;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO supabase_realtime_admin;


--
-- Name: TABLE buckets; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

REVOKE ALL ON TABLE storage.buckets FROM supabase_storage_admin;
GRANT ALL ON TABLE storage.buckets TO supabase_storage_admin WITH GRANT OPTION;
GRANT ALL ON TABLE storage.buckets TO service_role;
GRANT ALL ON TABLE storage.buckets TO authenticated;
GRANT ALL ON TABLE storage.buckets TO anon;
GRANT ALL ON TABLE storage.buckets TO postgres WITH GRANT OPTION;


--
-- Name: TABLE buckets_analytics; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.buckets_analytics TO service_role;
GRANT ALL ON TABLE storage.buckets_analytics TO authenticated;
GRANT ALL ON TABLE storage.buckets_analytics TO anon;


--
-- Name: TABLE buckets_vectors; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT SELECT ON TABLE storage.buckets_vectors TO service_role;
GRANT SELECT ON TABLE storage.buckets_vectors TO authenticated;
GRANT SELECT ON TABLE storage.buckets_vectors TO anon;


--
-- Name: TABLE objects; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

REVOKE ALL ON TABLE storage.objects FROM supabase_storage_admin;
GRANT ALL ON TABLE storage.objects TO supabase_storage_admin WITH GRANT OPTION;
GRANT ALL ON TABLE storage.objects TO service_role;
GRANT ALL ON TABLE storage.objects TO authenticated;
GRANT ALL ON TABLE storage.objects TO anon;
GRANT ALL ON TABLE storage.objects TO postgres WITH GRANT OPTION;


--
-- Name: TABLE s3_multipart_uploads; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO anon;


--
-- Name: TABLE s3_multipart_uploads_parts; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads_parts TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO anon;


--
-- Name: TABLE vector_indexes; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT SELECT ON TABLE storage.vector_indexes TO service_role;
GRANT SELECT ON TABLE storage.vector_indexes TO authenticated;
GRANT SELECT ON TABLE storage.vector_indexes TO anon;


--
-- Name: TABLE secrets; Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT SELECT,REFERENCES,DELETE,TRUNCATE ON TABLE vault.secrets TO postgres WITH GRANT OPTION;
GRANT SELECT,DELETE ON TABLE vault.secrets TO service_role;


--
-- Name: TABLE decrypted_secrets; Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT SELECT,REFERENCES,DELETE,TRUNCATE ON TABLE vault.decrypted_secrets TO postgres WITH GRANT OPTION;
GRANT SELECT,DELETE ON TABLE vault.decrypted_secrets TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON SEQUENCES TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON FUNCTIONS TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON TABLES TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO service_role;


--
-- Name: ensure_rls; Type: EVENT TRIGGER; Schema: -; Owner: postgres
--

CREATE EVENT TRIGGER ensure_rls ON ddl_command_end
         WHEN TAG IN ('CREATE TABLE', 'CREATE TABLE AS', 'SELECT INTO')
   EXECUTE FUNCTION public.rls_auto_enable();


ALTER EVENT TRIGGER ensure_rls OWNER TO postgres;

--
-- Name: issue_graphql_placeholder; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_graphql_placeholder ON sql_drop
         WHEN TAG IN ('DROP EXTENSION')
   EXECUTE FUNCTION extensions.set_graphql_placeholder();


ALTER EVENT TRIGGER issue_graphql_placeholder OWNER TO supabase_admin;

--
-- Name: issue_pg_cron_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_cron_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_cron_access();


ALTER EVENT TRIGGER issue_pg_cron_access OWNER TO supabase_admin;

--
-- Name: issue_pg_graphql_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_graphql_access ON ddl_command_end
         WHEN TAG IN ('CREATE FUNCTION')
   EXECUTE FUNCTION extensions.grant_pg_graphql_access();


ALTER EVENT TRIGGER issue_pg_graphql_access OWNER TO supabase_admin;

--
-- Name: issue_pg_net_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_net_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_net_access();


ALTER EVENT TRIGGER issue_pg_net_access OWNER TO supabase_admin;

--
-- Name: pgrst_ddl_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_ddl_watch ON ddl_command_end
   EXECUTE FUNCTION extensions.pgrst_ddl_watch();


ALTER EVENT TRIGGER pgrst_ddl_watch OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_drop_watch ON sql_drop
   EXECUTE FUNCTION extensions.pgrst_drop_watch();


ALTER EVENT TRIGGER pgrst_drop_watch OWNER TO supabase_admin;

--
-- PostgreSQL database dump complete
--

\unrestrict Y8BFhYbF38q9577ieHEtyzSkvm1NpFcxC1YzCRoWc2GjDe52MSfrn6HCx9hpZTr

