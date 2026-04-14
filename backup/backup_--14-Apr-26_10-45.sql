--
-- PostgreSQL database dump
--

\restrict JR42WfoXa5pVkZA37GFQfPg63YeuUN3f2rcwIl3VTJIS3dcLjrEBC4BnushHxNk

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
-- Name: allow_any_operation(text[]); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.allow_any_operation(expected_operations text[]) RETURNS boolean
    LANGUAGE sql STABLE
    AS $$
  WITH current_operation AS (
    SELECT storage.operation() AS raw_operation
  ),
  normalized AS (
    SELECT CASE
      WHEN raw_operation LIKE 'storage.%' THEN substr(raw_operation, 9)
      ELSE raw_operation
    END AS current_operation
    FROM current_operation
  )
  SELECT EXISTS (
    SELECT 1
    FROM normalized n
    CROSS JOIN LATERAL unnest(expected_operations) AS expected_operation
    WHERE expected_operation IS NOT NULL
      AND expected_operation <> ''
      AND n.current_operation = CASE
        WHEN expected_operation LIKE 'storage.%' THEN substr(expected_operation, 9)
        ELSE expected_operation
      END
  );
$$;


ALTER FUNCTION storage.allow_any_operation(expected_operations text[]) OWNER TO supabase_storage_admin;

--
-- Name: allow_only_operation(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.allow_only_operation(expected_operation text) RETURNS boolean
    LANGUAGE sql STABLE
    AS $$
  WITH current_operation AS (
    SELECT storage.operation() AS raw_operation
  ),
  normalized AS (
    SELECT
      CASE
        WHEN raw_operation LIKE 'storage.%' THEN substr(raw_operation, 9)
        ELSE raw_operation
      END AS current_operation,
      CASE
        WHEN expected_operation LIKE 'storage.%' THEN substr(expected_operation, 9)
        ELSE expected_operation
      END AS requested_operation
    FROM current_operation
  )
  SELECT CASE
    WHEN requested_operation IS NULL OR requested_operation = '' THEN FALSE
    ELSE COALESCE(current_operation = requested_operation, FALSE)
  END
  FROM normalized;
$$;


ALTER FUNCTION storage.allow_only_operation(expected_operation text) OWNER TO supabase_storage_admin;

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
-- Name: webauthn_challenges; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.webauthn_challenges (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid,
    challenge_type text NOT NULL,
    session_data jsonb NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    expires_at timestamp with time zone NOT NULL,
    CONSTRAINT webauthn_challenges_challenge_type_check CHECK ((challenge_type = ANY (ARRAY['signup'::text, 'registration'::text, 'authentication'::text])))
);


ALTER TABLE auth.webauthn_challenges OWNER TO supabase_auth_admin;

--
-- Name: webauthn_credentials; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.webauthn_credentials (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL,
    credential_id bytea NOT NULL,
    public_key bytea NOT NULL,
    attestation_type text DEFAULT ''::text NOT NULL,
    aaguid uuid,
    sign_count bigint DEFAULT 0 NOT NULL,
    transports jsonb DEFAULT '[]'::jsonb NOT NULL,
    backup_eligible boolean DEFAULT false NOT NULL,
    backed_up boolean DEFAULT false NOT NULL,
    friendly_name text DEFAULT ''::text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    last_used_at timestamp with time zone
);


ALTER TABLE auth.webauthn_credentials OWNER TO supabase_auth_admin;

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
    user_metadata jsonb,
    metadata jsonb
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
da43243e-1e0f-41c8-8920-40762944883f	2026-04-07 18:43:37.586006+00	2026-04-07 18:43:37.586006+00	password	1003b2ff-a816-4c8e-918e-a5ddfb5c28b9
75e0e0db-49bf-4d03-ab0a-84c743854dd1	2026-04-08 04:55:31.95968+00	2026-04-08 04:55:31.95968+00	password	62010e81-7ea3-4f40-9946-972d54f94faa
063691e8-6117-4e94-9065-4322805a5482	2026-04-08 05:55:51.888625+00	2026-04-08 05:55:51.888625+00	password	e721515a-e9e7-4aa5-bae0-49e1eea6e40d
2ce4e90e-b306-4fa5-8bad-938aea45fe00	2026-04-08 12:31:31.578746+00	2026-04-08 12:31:31.578746+00	password	055f4827-a445-41d3-ad52-ac02e3cd19ae
459ad20d-785f-4763-9e01-f2a2a06202c6	2026-04-09 05:08:38.112977+00	2026-04-09 05:08:38.112977+00	password	69b91c2d-b593-49b5-9fc2-72573bbd7a48
9a93a814-ad98-48c4-a61c-90cf45c6bb36	2026-04-09 12:25:42.393919+00	2026-04-09 12:25:42.393919+00	password	d54f5067-a627-4f26-a792-b5d473acf5a5
2f52efa3-bc8e-4c7e-b27c-7cb7f574aabe	2026-04-10 05:39:54.036386+00	2026-04-10 05:39:54.036386+00	password	617df9f2-a32c-40de-b5eb-bb80aa0eeb73
997d9674-403e-4ac6-a746-ef82b5dfb7c8	2026-04-10 13:04:25.485099+00	2026-04-10 13:04:25.485099+00	password	b7b13864-0c06-4e9f-afb5-bc0e8b6735fc
77535d61-d259-4580-8bfe-6c6c4c72ac79	2026-04-10 18:45:02.19733+00	2026-04-10 18:45:02.19733+00	password	8b44885d-fbcd-4709-a494-eff25abba396
bc2bb0e4-c163-49be-a8fa-8717fc53fe9e	2026-04-11 04:45:09.947424+00	2026-04-11 04:45:09.947424+00	password	f5283a49-9e48-4376-bd70-8c9308138466
8841752c-3420-46bb-90bd-bddd6c6f7cbb	2026-04-11 12:50:42.679608+00	2026-04-11 12:50:42.679608+00	password	2cd51409-0a35-4df8-b59c-e6f02dce2dfa
225558f1-72a4-4e30-8f35-73504c00972e	2026-04-11 14:34:13.332991+00	2026-04-11 14:34:13.332991+00	password	529b7612-ca63-44ef-aa37-5a20143f4c13
b9264987-f085-43f0-b6b3-7f9911a594b7	2026-04-12 04:58:17.592073+00	2026-04-12 04:58:17.592073+00	password	1b6aa24c-5c47-4da2-90f3-f69f2a997848
49485a22-2020-4895-8430-fa35da56277b	2026-04-12 04:58:23.986633+00	2026-04-12 04:58:23.986633+00	password	af84c21d-51da-4163-aeef-4cf3b4abb0d1
e4f05335-1210-4837-864a-15dbe0b300b4	2026-04-12 13:20:52.579065+00	2026-04-12 13:20:52.579065+00	password	8300aefe-82a0-48dc-bec6-4cb2f580fb61
2270e816-25f0-4566-aa1d-849ffa3fad7a	2026-04-12 13:31:09.595106+00	2026-04-12 13:31:09.595106+00	password	48da1268-da28-427a-8ac6-01625390b5d6
a26a6e09-7bce-48e7-aa70-ab697b95d2f9	2026-04-13 05:08:24.3191+00	2026-04-13 05:08:24.3191+00	password	c077088f-eb9b-47fc-975b-65abf9a69a55
5801adaf-f0d7-4ba7-a9c5-e9bf7dae7e6d	2026-04-13 12:39:39.072513+00	2026-04-13 12:39:39.072513+00	password	eed7692e-2d04-43b8-9ae9-dd5ad2ef49d5
088c7724-7531-44a6-9693-a2cd6e9b9088	2026-04-14 05:13:24.307957+00	2026-04-14 05:13:24.307957+00	password	b46a1f5d-871d-42ac-96ac-e063bffe1483
484473e8-135a-4a47-886e-cde95a4d796b	2026-03-31 06:15:27.610566+00	2026-03-31 06:15:27.610566+00	password	9aee8b1d-6973-4b1f-9d56-c46a409d2faf
05db4d56-3bd9-49c3-81fd-b11e8e04d930	2026-04-07 13:26:00.118979+00	2026-04-07 13:26:00.118979+00	password	edbcd445-b3ec-4232-95d6-48f32627a807
a06bec9d-a381-4f09-97fc-c61bc51e4e5f	2026-04-07 15:34:46.856877+00	2026-04-07 15:34:46.856877+00	password	53d610bf-706e-47a8-b2aa-0be8b8cc304f
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
00000000-0000-0000-0000-000000000000	543	mmxls4gfsnp5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-04-07 13:26:00.087771+00	2026-04-07 14:26:35.565115+00	\N	05db4d56-3bd9-49c3-81fd-b11e8e04d930
00000000-0000-0000-0000-000000000000	545	gdc3agb6xwrc	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	f	2026-04-07 15:34:45.850351+00	2026-04-07 15:34:45.850351+00	uc64jin4r2gt	05db4d56-3bd9-49c3-81fd-b11e8e04d930
00000000-0000-0000-0000-000000000000	607	msr7hd7jxpn5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-04-11 14:34:13.31231+00	2026-04-11 15:32:44.520653+00	\N	225558f1-72a4-4e30-8f35-73504c00972e
00000000-0000-0000-0000-000000000000	609	dhvdijlz3ugx	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	f	2026-04-12 04:58:17.543113+00	2026-04-12 04:58:17.543113+00	n7tza7hgmmcs	225558f1-72a4-4e30-8f35-73504c00972e
00000000-0000-0000-0000-000000000000	599	mw44nal476o3	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-04-11 00:14:22.480718+00	2026-04-12 06:24:50.806383+00	asgjgp7ueze7	063691e8-6117-4e94-9065-4322805a5482
00000000-0000-0000-0000-000000000000	612	vqeb3vjerkwy	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-04-12 06:24:50.82223+00	2026-04-12 07:50:40.723141+00	mw44nal476o3	063691e8-6117-4e94-9065-4322805a5482
00000000-0000-0000-0000-000000000000	614	vactb7fvqi3n	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-04-12 07:50:40.730408+00	2026-04-12 13:20:51.447152+00	vqeb3vjerkwy	063691e8-6117-4e94-9065-4322805a5482
00000000-0000-0000-0000-000000000000	616	c64liy4c3l2x	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	f	2026-04-12 13:20:51.470562+00	2026-04-12 13:20:51.470562+00	vactb7fvqi3n	063691e8-6117-4e94-9065-4322805a5482
00000000-0000-0000-0000-000000000000	560	uveqfctbhgyh	548bf3d4-4ce0-44b3-880f-5ed7df62647d	f	2026-04-07 18:43:37.584714+00	2026-04-07 18:43:37.584714+00	\N	da43243e-1e0f-41c8-8920-40762944883f
00000000-0000-0000-0000-000000000000	546	r3ayvwq4imuo	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-04-07 15:34:46.855503+00	2026-04-08 04:55:31.441719+00	\N	a06bec9d-a381-4f09-97fc-c61bc51e4e5f
00000000-0000-0000-0000-000000000000	617	z76lj2altjww	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	f	2026-04-12 13:20:52.577675+00	2026-04-12 13:20:52.577675+00	\N	e4f05335-1210-4837-864a-15dbe0b300b4
00000000-0000-0000-0000-000000000000	453	aa6f5y4rr47t	c5dbe63c-3054-481f-ad4b-4dab2dd7dc8d	f	2026-03-31 06:15:27.58252+00	2026-03-31 06:15:27.58252+00	\N	484473e8-135a-4a47-886e-cde95a4d796b
00000000-0000-0000-0000-000000000000	563	s3beambc6xtd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-04-08 05:55:51.861446+00	2026-04-08 07:59:40.635428+00	\N	063691e8-6117-4e94-9065-4322805a5482
00000000-0000-0000-0000-000000000000	565	ulxr5jmjmqt4	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-04-08 07:26:22.231513+00	2026-04-08 12:31:30.806627+00	bizrfskcpemg	75e0e0db-49bf-4d03-ab0a-84c743854dd1
00000000-0000-0000-0000-000000000000	567	v7dgpbx6jnzt	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	f	2026-04-08 12:31:30.829636+00	2026-04-08 12:31:30.829636+00	ulxr5jmjmqt4	75e0e0db-49bf-4d03-ab0a-84c743854dd1
00000000-0000-0000-0000-000000000000	619	fqkcm37eorye	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-04-12 14:46:49.871405+00	2026-04-12 16:29:25.476945+00	2zydxmrnuhfa	2270e816-25f0-4566-aa1d-849ffa3fad7a
00000000-0000-0000-0000-000000000000	568	pjzqpr5hdw7y	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-04-08 12:31:31.577365+00	2026-04-08 13:29:41.250663+00	\N	2ce4e90e-b306-4fa5-8bad-938aea45fe00
00000000-0000-0000-0000-000000000000	570	kv42xfhotf4u	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-04-08 13:47:46.164387+00	2026-04-08 14:45:58.627675+00	fbrna2pa3457	063691e8-6117-4e94-9065-4322805a5482
00000000-0000-0000-0000-000000000000	624	2tywo6dpwboy	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-04-13 06:06:53.014744+00	2026-04-13 07:08:33.302431+00	euqpm3m4zljb	a26a6e09-7bce-48e7-aa70-ab697b95d2f9
00000000-0000-0000-0000-000000000000	574	oxz2priehf6h	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-04-08 16:51:47.233557+00	2026-04-09 03:23:34.20661+00	cyvai2aub2vu	063691e8-6117-4e94-9065-4322805a5482
00000000-0000-0000-0000-000000000000	572	suq4gbqlyscd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-04-08 15:11:28.439237+00	2026-04-09 05:08:36.472473+00	biq5e4ing6zu	2ce4e90e-b306-4fa5-8bad-938aea45fe00
00000000-0000-0000-0000-000000000000	576	72oaaqrko5pz	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	f	2026-04-09 05:08:36.486764+00	2026-04-09 05:08:36.486764+00	suq4gbqlyscd	2ce4e90e-b306-4fa5-8bad-938aea45fe00
00000000-0000-0000-0000-000000000000	621	r5cs23tett2h	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-04-12 18:02:24.990339+00	2026-04-13 07:23:57.128676+00	lih5l5jche6l	2270e816-25f0-4566-aa1d-849ffa3fad7a
00000000-0000-0000-0000-000000000000	577	ifrhnnq7ycdx	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-04-09 05:08:38.111109+00	2026-04-09 06:54:03.113322+00	\N	459ad20d-785f-4763-9e01-f2a2a06202c6
00000000-0000-0000-0000-000000000000	579	hh2fajc7ghrx	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-04-09 06:54:03.14386+00	2026-04-09 12:25:41.391785+00	ifrhnnq7ycdx	459ad20d-785f-4763-9e01-f2a2a06202c6
00000000-0000-0000-0000-000000000000	581	a2igska7ucmi	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	f	2026-04-09 12:25:41.421027+00	2026-04-09 12:25:41.421027+00	hh2fajc7ghrx	459ad20d-785f-4763-9e01-f2a2a06202c6
00000000-0000-0000-0000-000000000000	626	gzxsxyvzwg6v	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-04-13 07:23:57.143966+00	2026-04-13 08:28:41.138796+00	r5cs23tett2h	2270e816-25f0-4566-aa1d-849ffa3fad7a
00000000-0000-0000-0000-000000000000	582	kt2gsiybr576	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-04-09 12:25:42.391983+00	2026-04-09 13:27:53.285681+00	\N	9a93a814-ad98-48c4-a61c-90cf45c6bb36
00000000-0000-0000-0000-000000000000	628	jvuhyolxurri	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	f	2026-04-13 12:39:37.89405+00	2026-04-13 12:39:37.89405+00	idtkrrgfo2bu	a26a6e09-7bce-48e7-aa70-ab697b95d2f9
00000000-0000-0000-0000-000000000000	584	eg7bkewvdi6z	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-04-09 14:33:13.458352+00	2026-04-09 15:34:03.221355+00	gtlvqrixrxka	9a93a814-ad98-48c4-a61c-90cf45c6bb36
00000000-0000-0000-0000-000000000000	586	xw7cekd3goga	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	f	2026-04-10 05:39:25.089561+00	2026-04-10 05:39:25.089561+00	z6epb62necmk	9a93a814-ad98-48c4-a61c-90cf45c6bb36
00000000-0000-0000-0000-000000000000	587	mr6lzwlp6q24	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-04-10 05:39:54.033579+00	2026-04-10 06:38:08.579253+00	\N	2f52efa3-bc8e-4c7e-b27c-7cb7f574aabe
00000000-0000-0000-0000-000000000000	629	w3p6cjoanl4z	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-04-13 12:39:39.069788+00	2026-04-13 13:37:59.145097+00	\N	5801adaf-f0d7-4ba7-a9c5-e9bf7dae7e6d
00000000-0000-0000-0000-000000000000	589	p7hnwfcg2bfj	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-04-10 08:46:01.549094+00	2026-04-10 13:40:06.293817+00	zms5dojwxoyu	063691e8-6117-4e94-9065-4322805a5482
00000000-0000-0000-0000-000000000000	591	7qsb4psrttr6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-04-10 13:04:25.469355+00	2026-04-10 14:02:45.463046+00	\N	997d9674-403e-4ac6-a746-ef82b5dfb7c8
00000000-0000-0000-0000-000000000000	631	kbcu4q4g2njz	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-04-13 13:37:59.167859+00	2026-04-13 15:07:03.489192+00	w3p6cjoanl4z	5801adaf-f0d7-4ba7-a9c5-e9bf7dae7e6d
00000000-0000-0000-0000-000000000000	593	xu7nya3ozwlu	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-04-10 14:02:45.474873+00	2026-04-10 15:01:12.717691+00	7qsb4psrttr6	997d9674-403e-4ac6-a746-ef82b5dfb7c8
00000000-0000-0000-0000-000000000000	595	g3qu6c6zfxy2	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-04-10 15:46:59.655046+00	2026-04-10 17:14:41.134886+00	iw3ynicipqtv	063691e8-6117-4e94-9065-4322805a5482
00000000-0000-0000-0000-000000000000	635	w2el6nzdghl7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-04-13 16:19:29.558272+00	2026-04-14 03:18:21.247308+00	ql3bhpqcqxs4	2270e816-25f0-4566-aa1d-849ffa3fad7a
00000000-0000-0000-0000-000000000000	597	asgjgp7ueze7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-04-10 18:30:55.082156+00	2026-04-11 00:14:22.459812+00	drtqneqkoyg2	063691e8-6117-4e94-9065-4322805a5482
00000000-0000-0000-0000-000000000000	633	jwqgu2au6dkb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-04-13 15:07:03.503275+00	2026-04-14 05:12:57.915575+00	kbcu4q4g2njz	5801adaf-f0d7-4ba7-a9c5-e9bf7dae7e6d
00000000-0000-0000-0000-000000000000	602	sgcbp6yobtss	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-04-11 06:09:20.093046+00	2026-04-11 07:07:50.861419+00	lnyow6jv7ofs	bc2bb0e4-c163-49be-a8fa-8717fc53fe9e
00000000-0000-0000-0000-000000000000	604	qnjtnmkohz6j	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	f	2026-04-11 12:43:07.633219+00	2026-04-11 12:43:07.633219+00	uy5z45dtfuw2	bc2bb0e4-c163-49be-a8fa-8717fc53fe9e
00000000-0000-0000-0000-000000000000	606	prmdla6dl3or	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	f	2026-04-11 13:49:12.055362+00	2026-04-11 13:49:12.055362+00	7sf7gudjuehb	8841752c-3420-46bb-90bd-bddd6c6f7cbb
00000000-0000-0000-0000-000000000000	637	obyx2yxlg6mf	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	f	2026-04-14 05:12:57.932252+00	2026-04-14 05:12:57.932252+00	jwqgu2au6dkb	5801adaf-f0d7-4ba7-a9c5-e9bf7dae7e6d
00000000-0000-0000-0000-000000000000	638	nazmyvststdc	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	f	2026-04-14 05:13:24.305555+00	2026-04-14 05:13:24.305555+00	\N	088c7724-7531-44a6-9693-a2cd6e9b9088
00000000-0000-0000-0000-000000000000	544	uc64jin4r2gt	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-04-07 14:26:35.587229+00	2026-04-07 15:34:45.833992+00	mmxls4gfsnp5	05db4d56-3bd9-49c3-81fd-b11e8e04d930
00000000-0000-0000-0000-000000000000	608	n7tza7hgmmcs	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-04-11 15:32:44.545968+00	2026-04-12 04:58:17.520081+00	msr7hd7jxpn5	225558f1-72a4-4e30-8f35-73504c00972e
00000000-0000-0000-0000-000000000000	610	dw3vq4xijiud	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	f	2026-04-12 04:58:17.588637+00	2026-04-12 04:58:17.588637+00	\N	b9264987-f085-43f0-b6b3-7f9911a594b7
00000000-0000-0000-0000-000000000000	611	7yotoqtt2733	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-04-12 04:58:23.985367+00	2026-04-12 06:59:33.315823+00	\N	49485a22-2020-4895-8430-fa35da56277b
00000000-0000-0000-0000-000000000000	613	ooryizgfilip	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-04-12 06:59:33.330666+00	2026-04-12 07:58:04.917394+00	7yotoqtt2733	49485a22-2020-4895-8430-fa35da56277b
00000000-0000-0000-0000-000000000000	618	2zydxmrnuhfa	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-04-12 13:31:09.579269+00	2026-04-12 14:46:49.84454+00	\N	2270e816-25f0-4566-aa1d-849ffa3fad7a
00000000-0000-0000-0000-000000000000	561	lckagsjtrnhk	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	f	2026-04-08 04:55:31.454297+00	2026-04-08 04:55:31.454297+00	r3ayvwq4imuo	a06bec9d-a381-4f09-97fc-c61bc51e4e5f
00000000-0000-0000-0000-000000000000	620	lih5l5jche6l	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-04-12 16:29:25.498298+00	2026-04-12 18:02:24.975449+00	fqkcm37eorye	2270e816-25f0-4566-aa1d-849ffa3fad7a
00000000-0000-0000-0000-000000000000	562	av5u6qtcc6xr	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-04-08 04:55:31.958533+00	2026-04-08 06:25:30.069714+00	\N	75e0e0db-49bf-4d03-ab0a-84c743854dd1
00000000-0000-0000-0000-000000000000	615	sf3hwmeu2oki	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-04-12 07:58:04.927825+00	2026-04-13 05:08:23.853581+00	ooryizgfilip	49485a22-2020-4895-8430-fa35da56277b
00000000-0000-0000-0000-000000000000	564	bizrfskcpemg	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-04-08 06:25:30.084225+00	2026-04-08 07:26:22.2068+00	av5u6qtcc6xr	75e0e0db-49bf-4d03-ab0a-84c743854dd1
00000000-0000-0000-0000-000000000000	622	xlns2j7rioao	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	f	2026-04-13 05:08:23.879177+00	2026-04-13 05:08:23.879177+00	sf3hwmeu2oki	49485a22-2020-4895-8430-fa35da56277b
00000000-0000-0000-0000-000000000000	566	fbrna2pa3457	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-04-08 07:59:40.654014+00	2026-04-08 13:47:46.146849+00	s3beambc6xtd	063691e8-6117-4e94-9065-4322805a5482
00000000-0000-0000-0000-000000000000	623	euqpm3m4zljb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-04-13 05:08:24.317104+00	2026-04-13 06:06:53.002067+00	\N	a26a6e09-7bce-48e7-aa70-ab697b95d2f9
00000000-0000-0000-0000-000000000000	569	biq5e4ing6zu	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-04-08 13:29:41.281396+00	2026-04-08 15:11:28.425771+00	pjzqpr5hdw7y	2ce4e90e-b306-4fa5-8bad-938aea45fe00
00000000-0000-0000-0000-000000000000	571	j3fpcms7eki5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-04-08 14:45:58.655783+00	2026-04-08 15:44:11.246449+00	kv42xfhotf4u	063691e8-6117-4e94-9065-4322805a5482
00000000-0000-0000-0000-000000000000	573	cyvai2aub2vu	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-04-08 15:44:11.26279+00	2026-04-08 16:51:47.200271+00	j3fpcms7eki5	063691e8-6117-4e94-9065-4322805a5482
00000000-0000-0000-0000-000000000000	575	pwymzch3tr35	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-04-09 03:23:34.237063+00	2026-04-09 05:41:56.295792+00	oxz2priehf6h	063691e8-6117-4e94-9065-4322805a5482
00000000-0000-0000-0000-000000000000	625	idtkrrgfo2bu	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-04-13 07:08:33.318633+00	2026-04-13 12:39:37.872054+00	2tywo6dpwboy	a26a6e09-7bce-48e7-aa70-ab697b95d2f9
00000000-0000-0000-0000-000000000000	578	fdyvlrbhr7jo	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-04-09 05:41:56.314787+00	2026-04-09 07:16:06.774064+00	pwymzch3tr35	063691e8-6117-4e94-9065-4322805a5482
00000000-0000-0000-0000-000000000000	627	ixo37e6x3l7w	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-04-13 08:28:41.161279+00	2026-04-13 12:57:07.113694+00	gzxsxyvzwg6v	2270e816-25f0-4566-aa1d-849ffa3fad7a
00000000-0000-0000-0000-000000000000	583	gtlvqrixrxka	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-04-09 13:27:53.299949+00	2026-04-09 14:33:13.441419+00	kt2gsiybr576	9a93a814-ad98-48c4-a61c-90cf45c6bb36
00000000-0000-0000-0000-000000000000	630	ctpowa5q5hr4	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-04-13 12:57:07.132136+00	2026-04-13 14:18:33.142549+00	ixo37e6x3l7w	2270e816-25f0-4566-aa1d-849ffa3fad7a
00000000-0000-0000-0000-000000000000	585	z6epb62necmk	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-04-09 15:34:03.250708+00	2026-04-10 05:39:25.06239+00	eg7bkewvdi6z	9a93a814-ad98-48c4-a61c-90cf45c6bb36
00000000-0000-0000-0000-000000000000	580	zms5dojwxoyu	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-04-09 07:16:06.791452+00	2026-04-10 08:46:01.535354+00	fdyvlrbhr7jo	063691e8-6117-4e94-9065-4322805a5482
00000000-0000-0000-0000-000000000000	588	xm2csntowumg	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-04-10 06:38:08.597437+00	2026-04-10 12:59:19.66144+00	mr6lzwlp6q24	2f52efa3-bc8e-4c7e-b27c-7cb7f574aabe
00000000-0000-0000-0000-000000000000	590	befl2xgltbft	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	f	2026-04-10 12:59:19.675243+00	2026-04-10 12:59:19.675243+00	xm2csntowumg	2f52efa3-bc8e-4c7e-b27c-7cb7f574aabe
00000000-0000-0000-0000-000000000000	632	kfo45m35vsgb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-04-13 14:18:33.153644+00	2026-04-13 15:21:11.974615+00	ctpowa5q5hr4	2270e816-25f0-4566-aa1d-849ffa3fad7a
00000000-0000-0000-0000-000000000000	592	iw3ynicipqtv	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-04-10 13:40:06.313376+00	2026-04-10 15:46:59.633891+00	p7hnwfcg2bfj	063691e8-6117-4e94-9065-4322805a5482
00000000-0000-0000-0000-000000000000	634	ql3bhpqcqxs4	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-04-13 15:21:11.989018+00	2026-04-13 16:19:29.541555+00	kfo45m35vsgb	2270e816-25f0-4566-aa1d-849ffa3fad7a
00000000-0000-0000-0000-000000000000	596	drtqneqkoyg2	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-04-10 17:14:41.158383+00	2026-04-10 18:30:55.060005+00	g3qu6c6zfxy2	063691e8-6117-4e94-9065-4322805a5482
00000000-0000-0000-0000-000000000000	636	yh3e4b2i4ca2	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	f	2026-04-14 03:18:21.274954+00	2026-04-14 03:18:21.274954+00	w2el6nzdghl7	2270e816-25f0-4566-aa1d-849ffa3fad7a
00000000-0000-0000-0000-000000000000	598	xbybgjpp7iyc	c5dbe63c-3054-481f-ad4b-4dab2dd7dc8d	f	2026-04-10 18:45:02.172056+00	2026-04-10 18:45:02.172056+00	\N	77535d61-d259-4580-8bfe-6c6c4c72ac79
00000000-0000-0000-0000-000000000000	594	ne6iy4tf4chp	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-04-10 15:01:12.729079+00	2026-04-11 04:44:40.093991+00	xu7nya3ozwlu	997d9674-403e-4ac6-a746-ef82b5dfb7c8
00000000-0000-0000-0000-000000000000	600	gvq55e5drmh7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	f	2026-04-11 04:44:40.114168+00	2026-04-11 04:44:40.114168+00	ne6iy4tf4chp	997d9674-403e-4ac6-a746-ef82b5dfb7c8
00000000-0000-0000-0000-000000000000	601	lnyow6jv7ofs	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-04-11 04:45:09.945353+00	2026-04-11 06:09:20.073723+00	\N	bc2bb0e4-c163-49be-a8fa-8717fc53fe9e
00000000-0000-0000-0000-000000000000	603	uy5z45dtfuw2	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-04-11 07:07:50.87019+00	2026-04-11 12:43:07.604716+00	sgcbp6yobtss	bc2bb0e4-c163-49be-a8fa-8717fc53fe9e
00000000-0000-0000-0000-000000000000	605	7sf7gudjuehb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	t	2026-04-11 12:50:42.673876+00	2026-04-11 13:49:12.031473+00	\N	8841752c-3420-46bb-90bd-bddd6c6f7cbb
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
20260302000000
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sessions (id, user_id, created_at, updated_at, factor_id, aal, not_after, refreshed_at, user_agent, ip, tag, oauth_client_id, refresh_token_hmac_key, refresh_token_counter, scopes) FROM stdin;
da43243e-1e0f-41c8-8920-40762944883f	548bf3d4-4ce0-44b3-880f-5ed7df62647d	2026-04-07 18:43:37.583417+00	2026-04-07 18:43:37.583417+00	\N	aal1	\N	\N	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Mobile Safari/537.36	49.204.119.9	\N	\N	\N	\N	\N
a06bec9d-a381-4f09-97fc-c61bc51e4e5f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07 15:34:46.837904+00	2026-04-08 04:55:31.472129+00	\N	aal1	\N	2026-04-08 04:55:31.472028	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	115.97.225.42	\N	\N	\N	\N	\N
b9264987-f085-43f0-b6b3-7f9911a594b7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 04:58:17.56736+00	2026-04-12 04:58:17.56736+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	115.97.225.42	\N	\N	\N	\N	\N
75e0e0db-49bf-4d03-ab0a-84c743854dd1	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 04:55:31.954568+00	2026-04-08 12:31:30.85448+00	\N	aal1	\N	2026-04-08 12:31:30.854372	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	115.97.225.42	\N	\N	\N	\N	\N
9a93a814-ad98-48c4-a61c-90cf45c6bb36	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09 12:25:42.382905+00	2026-04-10 05:39:25.120617+00	\N	aal1	\N	2026-04-10 05:39:25.120478	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	115.97.225.42	\N	\N	\N	\N	\N
225558f1-72a4-4e30-8f35-73504c00972e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11 14:34:13.283441+00	2026-04-12 04:58:21.967227+00	\N	aal1	\N	2026-04-12 04:58:21.96712	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	115.97.225.42	\N	\N	\N	\N	\N
2f52efa3-bc8e-4c7e-b27c-7cb7f574aabe	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 05:39:54.016887+00	2026-04-10 12:59:19.698888+00	\N	aal1	\N	2026-04-10 12:59:19.69878	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	115.97.225.42	\N	\N	\N	\N	\N
2ce4e90e-b306-4fa5-8bad-938aea45fe00	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 12:31:31.560805+00	2026-04-09 05:08:36.507824+00	\N	aal1	\N	2026-04-09 05:08:36.507717	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	115.97.225.42	\N	\N	\N	\N	\N
a26a6e09-7bce-48e7-aa70-ab697b95d2f9	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 05:08:24.304112+00	2026-04-13 12:39:37.925057+00	\N	aal1	\N	2026-04-13 12:39:37.924953	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	115.97.225.42	\N	\N	\N	\N	\N
459ad20d-785f-4763-9e01-f2a2a06202c6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09 05:08:38.099975+00	2026-04-09 12:25:41.458968+00	\N	aal1	\N	2026-04-09 12:25:41.458855	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	115.97.225.42	\N	\N	\N	\N	\N
063691e8-6117-4e94-9065-4322805a5482	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 05:55:51.820764+00	2026-04-12 13:20:51.502923+00	\N	aal1	\N	2026-04-12 13:20:51.502809	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Mobile Safari/537.36	115.97.225.42	\N	\N	\N	\N	\N
e4f05335-1210-4837-864a-15dbe0b300b4	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 13:20:52.563025+00	2026-04-12 13:20:52.563025+00	\N	aal1	\N	\N	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Mobile Safari/537.36	115.97.225.42	\N	\N	\N	\N	\N
77535d61-d259-4580-8bfe-6c6c4c72ac79	c5dbe63c-3054-481f-ad4b-4dab2dd7dc8d	2026-04-10 18:45:02.139728+00	2026-04-10 18:45:02.139728+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 26_4_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/145.0.7632.108 Mobile/15E148 Safari/604.1	106.195.47.91	\N	\N	\N	\N	\N
997d9674-403e-4ac6-a746-ef82b5dfb7c8	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 13:04:25.437959+00	2026-04-11 04:44:40.147707+00	\N	aal1	\N	2026-04-11 04:44:40.147582	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	115.97.225.42	\N	\N	\N	\N	\N
bc2bb0e4-c163-49be-a8fa-8717fc53fe9e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11 04:45:09.933255+00	2026-04-11 12:43:07.669402+00	\N	aal1	\N	2026-04-11 12:43:07.669287	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	115.97.225.42	\N	\N	\N	\N	\N
484473e8-135a-4a47-886e-cde95a4d796b	c5dbe63c-3054-481f-ad4b-4dab2dd7dc8d	2026-03-31 06:15:27.55715+00	2026-03-31 06:15:27.55715+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	49.249.37.106	\N	\N	\N	\N	\N
05db4d56-3bd9-49c3-81fd-b11e8e04d930	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07 13:26:00.040119+00	2026-04-07 15:34:45.873557+00	\N	aal1	\N	2026-04-07 15:34:45.873437	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	115.97.225.42	\N	\N	\N	\N	\N
8841752c-3420-46bb-90bd-bddd6c6f7cbb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11 12:50:42.64594+00	2026-04-11 13:49:12.086459+00	\N	aal1	\N	2026-04-11 13:49:12.086362	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	115.97.225.42	\N	\N	\N	\N	\N
49485a22-2020-4895-8430-fa35da56277b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 04:58:23.984362+00	2026-04-13 05:08:23.91326+00	\N	aal1	\N	2026-04-13 05:08:23.913153	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	115.97.225.42	\N	\N	\N	\N	\N
2270e816-25f0-4566-aa1d-849ffa3fad7a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 13:31:09.565817+00	2026-04-14 03:18:21.308836+00	\N	aal1	\N	2026-04-14 03:18:21.30873	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Mobile Safari/537.36	27.5.191.126	\N	\N	\N	\N	\N
5801adaf-f0d7-4ba7-a9c5-e9bf7dae7e6d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 12:39:39.054759+00	2026-04-14 05:12:57.953294+00	\N	aal1	\N	2026-04-14 05:12:57.953164	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	115.97.225.42	\N	\N	\N	\N	\N
088c7724-7531-44a6-9693-a2cd6e9b9088	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-14 05:13:24.294446+00	2026-04-14 05:13:24.294446+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	115.97.225.42	\N	\N	\N	\N	\N
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
00000000-0000-0000-0000-000000000000	dedfbdd2-f9d5-447e-91d8-a9e808c3fe0e	authenticated	authenticated	9965750385@vvlenterprises.in	$2a$10$HEwL0CqnLi2vuuRr6xHB0ePnfmNv6D17BVHSFhmwZIEtR4QaXl6eW	2026-02-23 18:19:00.549872+00	\N		\N		\N			\N	2026-02-24 14:45:25.966338+00	{"provider": "email", "providers": ["email"]}	{"name": "AK", "role": "agent", "mobile": "9965750385", "reporting_to": "548bf3d4-4ce0-44b3-880f-5ed7df62647d", "email_verified": true, "whatsapp_number": "9965750385"}	\N	2026-02-23 18:19:00.536708+00	2026-02-24 14:45:25.972581+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	c5dbe63c-3054-481f-ad4b-4dab2dd7dc8d	authenticated	authenticated	9003845516@vvlenterprises.in	$2a$10$FPpTb6j4rYFV9iztQjLp.O.2S7seUZ3beTh17ammH8BI9ElbJMHSi	2026-02-23 16:15:43.789609+00	\N		\N		\N			\N	2026-04-10 18:45:02.138923+00	{"provider": "email", "providers": ["email"]}	{"email_verified": true}	\N	2026-02-23 16:15:43.777872+00	2026-04-10 18:45:02.193835+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	ec23a138-6a85-40dc-80b3-47bfb474959c	authenticated	authenticated	9199620283@vvlenterprises.in	$2a$10$QsNmNRU6hVRRDH42iHQt2.WfveOc469pF.WFR.JH9k7WE/TfJ0T/W	2026-02-24 09:08:22.947492+00	\N		\N		\N			\N	2026-02-24 13:16:44.268825+00	{"provider": "email", "providers": ["email"]}	{"name": "Saranraj", "role": "manager", "mobile": "9199620283", "reporting_to": "c5dbe63c-3054-481f-ad4b-4dab2dd7dc8d", "email_verified": true, "whatsapp_number": null}	\N	2026-02-24 09:08:22.921381+00	2026-02-24 14:54:20.455218+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	548bf3d4-4ce0-44b3-880f-5ed7df62647d	authenticated	authenticated	8682041077@vvlenterprises.in	$2a$10$LJPP9PrDTi3MPnj.GWK6P.sR2jqPvjXfXg3cwtsi7BrIyQLibpUlq	2026-02-23 18:14:10.448233+00	\N		\N		\N			\N	2026-04-07 18:43:37.583325+00	{"provider": "email", "providers": ["email"]}	{"name": "JORAT", "role": "manager", "mobile": "8682041077", "reporting_to": "c5dbe63c-3054-481f-ad4b-4dab2dd7dc8d", "email_verified": true, "whatsapp_number": "8682041077"}	\N	2026-02-23 18:14:10.420548+00	2026-04-07 18:43:37.585655+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	authenticated	authenticated	9962028302@vvlenterprises.in	$2a$10$Ui6geUZCbxqjpwRGRddIiei3qzT8f52oaWIQ9H1NzjTdzsJq8AjmC	2026-02-24 13:19:24.377948+00	\N		\N		\N			\N	2026-04-14 05:13:24.294357+00	{"provider": "email", "providers": ["email"]}	{"name": "Saran Raj", "role": "manager", "mobile": "9962028302", "reporting_to": "c5dbe63c-3054-481f-ad4b-4dab2dd7dc8d", "email_verified": true, "whatsapp_number": "9003845516"}	\N	2026-02-24 13:19:24.352791+00	2026-04-14 05:13:24.307586+00	\N	\N			\N		0	\N		\N	f	\N	f
\.


--
-- Data for Name: webauthn_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.webauthn_challenges (id, user_id, challenge_type, session_data, created_at, expires_at) FROM stdin;
\.


--
-- Data for Name: webauthn_credentials; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.webauthn_credentials (id, user_id, credential_id, public_key, attestation_type, aaguid, sign_count, transports, backup_eligible, backed_up, friendly_name, created_at, updated_at, last_used_at) FROM stdin;
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
d59ecb10-5af9-4f75-8f43-dfc52d537f0c	Jaffer	9940384253	No.33 Srinivasa Perumal Kovil Street koduingaiyur	20000	200	2026-03-12	2026-06-19	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11 07:43:34.929+00	2026-03-11 07:43:34.929+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
cf301afd-a3ed-4bea-9794-b4fe432d8861	Baai ( Thaadi )	9176464040	No.F2 Block Green Nagar Ramapuram Hari Appartment 	60000	600	2026-03-12	2026-06-19	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11 14:06:39.594785+00	2026-03-11 14:06:39.594785+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
a0d4dce0-9bdd-4cf1-ad5d-1c95cf18e2dd	Gopal (Veg)	9790801667	No.11 West Vanniyar Street k.k.nagar 	30000	300	2026-03-12	2026-06-19	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11 15:07:36.249415+00	2026-03-11 15:07:36.249415+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
34977a0a-e657-40cb-840d-a6df47bba8d3	Magesh(mec)	9380606727	No.29 Kabilar Street M.G.R Nagar 	10000	100	2026-03-12	2026-06-19	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11 15:58:44.963427+00	2026-03-11 15:58:44.963427+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
b16866ff-ba34-412f-aeea-fa734ccf88a1	E.Saravanan	8681072153	No.54 V.O.C Street 	50000	500	2026-03-13	2026-06-20	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-12 06:38:45.589659+00	2026-03-12 06:38:45.589659+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6340050f-5246-43c5-9297-d14267b9bad0	S.K.Sendhil	9940010438	No.19 Thamarai Vinayagar Kovil Street 	40000	400	2026-03-13	2026-06-20	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-12 13:50:57.150288+00	2026-03-12 13:50:57.150288+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
f8e88dc3-4e2d-4526-b66d-743bc434bc6e	Karthi (School)	9841621345	No.104/54 Annai Sathya Street M.G.R Nager 	40000	400	2026-03-13	2026-06-20	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-12 15:52:48.201714+00	2026-03-12 15:52:48.201714+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
cf6ae0f5-381e-455f-8bda-1dda692f14a4	Chizhyan. DMDK	8939037510	No.29/7 Ilango Nager 3rd Street Virugambakam 	20000	200	2026-03-15	2026-06-22	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-14 14:09:18.904928+00	2026-03-14 14:14:35.089044+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
e0fca0e1-df99-497f-87e4-41be32ec1780	R.Gopi (Auto)	7358563374	No.78 Saraswathi Nagar Main Road Alwarthiru Nagar 	50000	500	2026-03-15	2026-06-22	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-14 15:18:22.635655+00	2026-03-14 15:18:22.635655+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
b86ae36d-afe4-41a9-8d69-af6178efda6c	Prathaban.R.O.Water	9840677798	No.F 214 Vivacity Kannivakkam Guduvanchery	20000	200	2026-03-16	2026-06-23	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-15 15:24:50.297021+00	2026-03-15 15:24:50.297021+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6245a2e8-2eb5-4d5f-8b8a-aac817bfee18	Balamurali (sekar)	7397397536	No.6 Kambar Street M.G.R Nagar 	20000	200	2026-03-16	2026-06-23	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-15 15:36:43.094483+00	2026-03-15 15:36:43.094483+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22d10045-ef1c-4807-9278-c35dbb01d73f	Rajaselvam	8072425226	No.30 Sangaralinganar Street M.G.R Nagar 	20000	200	2026-03-16	2026-06-23	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-15 15:58:15.971839+00	2026-03-15 15:58:15.971839+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
fb079db0-2262-4017-bd24-5d42ca326ff9	Manipaul	7845032033	No.47 Rangarajapuram Main Road	20000	200	2026-03-17	2026-06-24	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16 06:58:20.853235+00	2026-03-16 06:58:20.853235+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3292a221-dac6-489f-9624-6f993ac28f7d	Magesh.sekar	8838682230	No.6 Seethalai Sathanar Street M.G.R Nagar 	20000	200	2026-03-17	2026-06-24	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16 07:20:20.756907+00	2026-03-16 07:20:20.756907+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9920fe35-b725-4a78-802d-61689d6993b2	Udhayakumar(Sekar)	9789857095	No.5/8 Subramani Salai Munusamy Street Saidhapet	30000	300	2026-03-17	2026-06-24	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16 15:22:40.422745+00	2026-03-16 15:22:40.422745+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23ac8ae5-7452-4182-b51c-a70026bbe0d8	Karthi (Veg)	9363981384	No.54 K.K.Salai	5000	50	2026-03-18	2026-06-25	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-17 12:54:39.233463+00	2026-03-17 12:54:39.233463+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
db40f757-c1ca-42a3-bb92-2df13793998d	Shankar.ilaiyaraja	7200287138	No.206 Pragasam Salai Valasarvakkam	10000	100	2026-03-19	2026-06-26	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18 14:24:49.53306+00	2026-03-18 14:24:49.53306+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
cb86aae2-de85-41b5-bf5f-20645840e270	Iliyas	7338799523	No.5/11 D.S.Lakshmanan Street	5000	50	2026-03-19	2026-06-26	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18 14:30:44.18339+00	2026-03-18 14:56:02.958632+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6d60857f-7cd1-437e-a536-c9d04949b1c7	Anitha	7305664084	No.20 Pugazhalenthi Street 	50000	500	2026-03-19	2026-06-26	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18 15:59:54.47753+00	2026-03-18 15:59:54.47753+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
56da2e53-1358-4168-8c6e-cee12fe29c59	Gokul (Magic)	8608667656	No.127 East Vanniyar Street West K.K Nagar 	50000	500	2026-03-19	2026-06-26	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18 16:09:52.628257+00	2026-03-18 16:09:52.628257+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
d61b213f-26ab-40b6-ac19-bc6fb34eaf79	Gopi.Kuppan	8637601326	No.10 Soolai Street 	20000	200	2026-03-20	2026-06-27	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19 07:32:26.860979+00	2026-03-19 07:32:26.860979+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6735cbe7-8e3f-41f0-b16c-9b60d974d6ec	Loganathan.DMDK	8124102166	No.49 Sri Lakshmi Nagar 3rd Street Alwarthiru Thiru Nagar	20000	200	2026-03-20	2026-06-27	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19 07:40:02.945259+00	2026-03-19 07:40:02.945259+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
dd17dc7d-fde3-4770-bdf7-c30ba3dbcca6	Barath.7092103855	8098341733	No.4 V.O.C Street Annai Sathya Nagar	30000	300	2026-03-20	2026-06-27	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19 14:14:31.606315+00	2026-03-19 14:14:31.606315+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6c56e1c0-92ef-426c-8b5f-f6a9eac0ebc0	Raja.megic	9677854994	No.59 Ayya Puram 59th Street K.K.Nagar	30000	300	2026-03-20	2026-06-27	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19 14:33:06.353673+00	2026-03-19 14:33:06.353673+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
df704001-715c-495c-832e-1971c5655106	Ramesh.Megic	7550271431	No.5/2 Sakthi Vinayakar Kovil Street M.G.R Nagar 	30000	300	2026-03-20	2026-06-27	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19 15:36:20.506973+00	2026-03-19 15:36:20.506973+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
f196fdd7-e224-44d7-b6f4-4cbde8b41ae7	Amutha.DMDK	9789901723	No.9/35 Vanniyar Street West K.K.Nagar	10000	100	2026-03-22	2026-06-29	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-21 14:06:07.381566+00	2026-03-21 14:06:07.381566+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
894bed8a-dcbc-44c1-b441-fa5be29868d6	Ajith	7338717624	No.18  Muthu Mariyamman Kovil Street 	5000	50	2026-03-22	2026-06-29	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-21 15:30:42.880917+00	2026-03-21 15:30:42.880917+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9252d856-84b5-47ad-870a-5df022b6adad	Muthukumar.7338758742	9042990261	No.21 Barma Colony 2 Street 	30000	300	2026-03-22	2026-06-29	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-21 15:57:23.866132+00	2026-03-21 15:57:23.866132+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
eb67be15-b51a-4b91-b2ae-6645450cb3cf	S.M.Murugan	6381199003	No.63/29 Alzheri Street M.G.R Nagar 	45000	450	2026-03-22	2026-06-29	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-21 16:20:17.254056+00	2026-03-21 16:20:17.254056+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
44e44d3f-1c42-41fa-8bf1-2bdb5bf219c7	Pandit	9840181145	Sanjai Gandhi Street M.G.R Nagar 	20000	200	2026-03-23	2026-06-30	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-22 06:30:55.186151+00	2026-03-22 06:30:55.186151+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7d755464-aa72-4aab-9028-a75e09410ff6	Vijaya	6385348186	No.1 Sanjai Gandhi Street M.G.R Nagar	50000	500	2026-03-23	2026-06-30	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-22 07:17:02.593954+00	2026-03-22 07:17:02.593954+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
250eeece-4579-4cc4-86f9-0cdd866fbd24	Kumaran.E.B	9940310125	No.3 Valiyammal Nagar	10000	100	2026-03-23	2026-06-30	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-22 13:22:47.552767+00	2026-03-22 13:22:47.552767+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2d860b86-e289-45b9-b108-3ecc32fafe18	Uma.Elumalai	9790249837	No.2 Nagappan Street Jaferkhanpet 	50000	500	2026-03-17	2026-06-24	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16 14:30:47.139086+00	2026-04-05 15:07:36.864249+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
e3325ec8-264a-41e1-a2d5-84fb33eb4412	Mani.Magic	9789069288	No.19/16 Manju Appartment 3rd Floor Pillaiyar Kovil Street Nesappakkam 	50000	500	2026-03-13	2026-06-20	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-12 07:16:17.772063+00	2026-04-06 15:04:46.322676+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
a00d5979-396d-4d33-b05c-a102fb0bb7a8	Prabhu	9884366006	No.15 Pugzhlendhi Street 	40000	400	2026-03-23	2026-06-30	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-22 13:39:43.554948+00	2026-03-22 13:39:43.554948+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9a636e37-de02-451a-981d-4bf513dce4eb	Vinoth.Munusamy	8610441105	No.30 6th Street Kaanum Nagar 	60000	600	2026-03-24	2026-07-01	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-23 14:47:41.759976+00	2026-03-23 14:47:41.759976+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
651c7fb2-68bf-46d8-bf93-3f25bf5c8dab	Dhanush Kodi	9840274884	No.11 Krishnan 1st Street Soolai Pallam 	50000	500	2026-03-24	2026-07-01	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-23 15:56:42.872948+00	2026-03-23 15:56:42.872948+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
e9b6d72d-0b4a-450d-8c1d-4d79ce11223a	Iliyas.Dhaadi Baai	8940818894	Block 2 Door no.F2 Green Nagar Hari Appartment Ramapuram 	40000	400	2026-04-07	2026-07-15	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06 14:41:37.174935+00	2026-04-06 14:41:37.174935+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
b22b99e0-ad0d-4b0b-bdeb-7f6883ff97c1	Harideva	8248976962	No.11 Sangaralinganar Street 	20000	200	2026-04-07	2026-07-15	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06 15:36:39.201419+00	2026-04-06 15:36:39.201419+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
70b6dbb8-0fb8-4661-a0cd-21955635a422	Vishwanathan.9600058274	7358541871	No.E2 Nethra Ambika Appartment Vembuli Amman Kovil Street 	65000	650	2026-04-07	2026-07-15	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06 16:27:23.607569+00	2026-04-06 16:27:23.607569+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2c143dd6-c039-4a59-8c14-02bf93b00f0a	Banu.Mohamed	8825873353	No 380 Thangavel Street 	20000	200	2026-04-09	2026-07-17	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 16:17:16.261417+00	2026-04-08 16:17:16.261417+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
61b47ec3-e7e1-4a78-8784-836a84315124	Nandhini.vasanthakumar	9842320588	No.18/A Srinivasan Nagar Nellithoppu Mangadu	50000	500	2026-04-09	2026-07-17	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 16:25:32.016033+00	2026-04-08 16:25:32.016033+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
d11d1904-a5c2-4fd5-8ebc-c800d6ced0b2	Sathish (Piller) V.C	9176912147	No.55, V.S.N.Garden, Jafferkhanpet, Chennai	5000	50	2026-03-25	2026-07-02	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-24 05:50:55.336405+00	2026-03-24 13:14:14.658939+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
790d3d01-21ef-4976-82d4-af3adacb886c	Paramaguru	8870373283	No.9 Oomaidhurai Street 	10000	100	2026-03-26	2026-07-03	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25 14:16:19.173941+00	2026-03-25 14:16:19.173941+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
ea7436e5-3b5c-49c8-87e4-6d727b2c2e50	Parthasarathy	6381967187	No.1/A Kamarajar Street Ajantha Bus Stop 	10000	100	2026-03-25	2026-07-02	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25 14:35:56.924786+00	2026-03-25 14:35:56.924786+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2ff85cab-09cd-4175-94ce-d7ccba40ae21	Raju.F.C	9841528425	No.39/B.  K.R.Ramasamy Street M.G.R.Nagar	50000	500	2026-03-26	2026-07-03	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25 15:55:17.802115+00	2026-03-25 15:55:17.802115+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
046f033d-2013-4dbe-9ac8-947af0d1e115	Maha	6381310691	No.17 Jothi Nagar 1 st Street 	50000	500	2026-03-26	2026-07-03	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-26 15:57:48.666882+00	2026-03-26 15:57:48.666882+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
963ccc89-3e62-4787-ae26-1b8b908b51c4	Iqbal	8124499982	No.40 Periyar Street Avvai Nagar Paadi	50000	500	2026-03-29	2026-07-06	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28 12:38:03.038747+00	2026-03-28 12:38:03.038747+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
591f4d1e-01f6-4c59-a2b0-7358e00a485d	S.Saravanan	8939604919	No.10 2nd Street Kaanum Nagar	25000	250	2026-03-29	2026-07-06	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28 13:08:43.447362+00	2026-03-28 13:08:43.447362+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
f076e587-f2c0-423c-9441-07bde93baeb3	P.Selvam	9790726889	No.20 Pugzhlendhi Street 	50000	500	2026-03-29	2026-07-06	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28 14:20:32.146657+00	2026-03-28 14:20:32.146657+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5fecec3a-5262-4cfd-8464-57abf6fd6c0c	Sheela	8681913102	No.18 Anna Street soolaipallam	30000	300	2026-03-29	2026-07-06	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28 15:22:48.233122+00	2026-03-28 15:22:48.233122+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2a8f0801-a95d-49fb-a6a0-f9a9a84c463b	G.vengatesh	9840836084	No.13 Otta Pillaiyar Kovil st Virukampakkam	50000	500	2026-03-31	2026-07-08	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 07:22:11.314766+00	2026-03-30 07:22:11.314766+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
eccc41c7-9d86-41a5-8c93-ae01f74f8080	K.V.Ramesh	9841896888	No.12/1 Brinthavanam Street 	40000	400	2026-03-31	2026-07-08	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 07:26:34.305941+00	2026-03-30 07:26:34.305941+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4686827e-4849-4bfa-88aa-129912510008	Bhavani.Venkat	6382125280	No.10/5 Ganeshan Street Rajiv Gandhi Nagar Nesappakkam 	20000	200	2026-03-31	2026-07-08	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 14:15:26.227877+00	2026-03-30 14:15:26.227877+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
30d6e5ab-ae5d-4ea9-93ff-3655cdedc049	Aravind	9043483117	No.4 Subramaniya Siva Street M.G.R Nagar 	30000	300	2026-03-31	2026-07-08	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 14:51:02.450707+00	2026-03-30 14:51:02.450707+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7d1ca2e6-5ac0-47d0-9b5b-6080fb746026	V.Saravanan.Pillar	9841794202	No.39.Arumuga Navalar Street Mejestic Colony Valasarvakkam 	70000	700	2026-03-31	2026-07-08	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 15:53:03.185656+00	2026-03-30 15:53:03.185656+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
b5e377bf-be6c-4609-9ed7-af18422a1b4a	Padmavathy.9514594764	7418516932	Kanni Street 	15000	150	2026-03-31	2026-07-08	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 16:37:11.448807+00	2026-03-30 16:37:11.448807+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
bdfb7101-8e1c-4167-9c21-77c4defe8ce5	Chinnakownder	8220590794	No.21 Sanjay Gandhi Street 	50000	500	2026-04-02	2026-07-10	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-01 15:26:49.495208+00	2026-04-01 15:26:49.495208+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
dbb5444e-976f-4d00-9769-c0111b85f5b6	K.Kumaran	8610566710	No.15 Sanjay Gandhi Street 	5000	50	2026-04-02	2026-07-10	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-01 13:19:07.050878+00	2026-04-02 05:06:47.992396+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9daa6e18-5bdb-420a-a5bf-8420c72c9e6e	Kadumpadi	9566032619	No.61/1 V.S.M.Gardan West Jafferkhan pet	10000	100	2026-04-05	2026-07-13	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04 06:18:38.613685+00	2026-04-04 06:18:38.613685+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
481d1580-100a-4f65-bc22-32aac9182e37	Gandhi	7418441724	No.15 Annai Sathiyanagar Main Street 	25000	250	2026-04-05	2026-07-13	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04 06:50:24.068357+00	2026-04-04 06:50:24.068357+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
84cf3d8e-64cc-4a90-8b33-12c94640d00b	Chandran.(Malathi) - 8925450236	7010478505	No.10 Jeeva Road Periyar Nagar Nergundram 	70000	700	2026-03-11	2026-06-18	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-10 06:04:18.264146+00	2026-04-04 07:04:11.090155+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
0730e6a0-07e6-44f1-b129-097c3fb6e85c	Mani.Angala	6369072076	K.K.Salai	5000	50	2026-04-05	2026-07-13	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04 07:07:31.836056+00	2026-04-04 07:07:31.836056+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
586c004c-3e6b-40bf-a2f5-cd3a1fdfe4c0	Sivaraj.Sekar	9566266523	No.14 F block Sivalingapuram 	30000	300	2026-04-05	2026-07-13	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04 07:10:35.471772+00	2026-04-04 07:10:35.471772+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
a529d878-71a9-4774-8ef5-b4e2ce601e22	Elumalai.mani	7867936516	Royala Nagar	10000	100	2026-04-05	2026-07-13	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04 07:20:09.188371+00	2026-04-04 07:20:09.188371+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
dcf458bf-10c7-41f7-ab08-ed37fbfc4b2b	K.Kumaran.1	8220608406	Sanjai Gandhi Street 	5000	50	2026-04-05	2026-07-13	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04 07:25:32.250695+00	2026-04-04 07:25:32.250695+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
b0ad6445-eed2-49f7-9b7c-78fdf8a2a53d	Ramesh.guru	9094857586	No.108 Kanniga Puram 3rd Street 	20000	200	2026-04-05	2026-07-13	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04 14:37:45.195185+00	2026-04-04 14:37:45.195185+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
a03836bd-4e58-4dcf-b429-ad094f601d2d	Sundharamoorthy.Magic.6382566774	6369360350	No.52 Kabilar Street M.G.R Nagar 	20000	200	2026-04-05	2026-07-13	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04 15:53:46.856558+00	2026-04-04 15:53:46.856558+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
019b4424-175f-4bb1-9c64-bd2fb04a8ae4	Sagunthala	7358237112	Sanjay Gandhi Street 	5000	50	2026-04-06	2026-07-14	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-05 07:50:25.860566+00	2026-04-05 07:50:25.860566+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
d02bef4a-06c7-4717-b494-968be98c5e8b	Prasanna	7671817684	Ayyavu Street 	5000	50	2026-04-06	2026-07-14	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-05 15:18:55.592087+00	2026-04-05 15:18:55.592087+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1f87a89f-83e6-4c4a-ab6b-15d208b3b778	Parthipan	9597063435	No.15 Srinivasa Nagar 2 Street Kamatchi Amman Kovil Street Mangadu 	50000	500	2026-04-10	2026-07-18	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09 06:02:44.029092+00	2026-04-09 06:02:44.029092+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
c458c3a2-4dd1-432a-b480-b8675bd14584	Kumar.pillar	9176023040	No.11/5 Annal Gandhi Street 	20000	200	2026-04-11	2026-07-19	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 14:12:09.123824+00	2026-04-10 14:12:09.123824+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5f1540b7-3eda-41e6-87f9-f6a13d0a1980	Rajkumar (DMDK)	9840071794	No.359, Amaravathi Street, Sheik Abdulla Nagar, Virugambakkam, Chennai - 92.	10000	100	2026-04-12	2026-07-20	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11 14:27:40.459135+00	2026-04-11 14:35:20.471478+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
ae9b4b5a-e5ed-4d12-a2c3-fc021439ac60	Basheerbai	9962445854	No.9, Kamaraj Salai, Nesapakkam	15000	150	2026-04-12	2026-07-20	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11 14:54:17.328826+00	2026-04-11 14:54:17.328826+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8388404f-fd37-4f07-be34-7e919c686e8a	Ismail (Dhadi)	9790769675	No.F2 ,2 Block, Hari Appartment, GreenNagar, Ramapuram	20000	200	2026-04-12	2026-07-20	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11 15:33:01.525635+00	2026-04-11 15:33:01.525635+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8d1aa297-ebb1-4cbb-94f7-ef5d2b2bbb12	Bhavani (Pichaimuthu)	6369373709	No.39, Vivekanadhar Street, Alwarthiru Nagar	15000	150	2026-04-13	2026-07-21	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 07:43:10.327864+00	2026-04-12 07:43:10.327864+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
45758843-0035-4992-a067-2c4d561bf31b	Stalin	7305941585	No.3 chippailane Kariyanchavadi Chennai.56	30000	300	2026-04-13	2026-07-21	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 07:52:50.704974+00	2026-04-12 07:52:50.704974+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
69862c5d-a6f2-48c9-83d8-364820586103	Palani.soup	7094642382	No.38/20 Pulidevan Street 	20000	200	2026-04-13	2026-07-21	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 14:49:00.445896+00	2026-04-13 05:16:07.812014+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
66a5baef-e9ee-4830-8b91-10c5b91c0d5a	Vinoth.Mesthiri	9940168991	No.71/1 V.S.M Garden Jaferkhanpet 	10000	100	2026-04-13	2026-07-21	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 15:15:09.715673+00	2026-04-13 05:19:18.489134+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2ef2bbe9-b267-4369-9bd3-51063fe4a3fa	Ponnaiyan	8148934655	No.13, Subash Cahndira Boss Street, S.M.Block	10000	100	2026-04-14	2026-07-22	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 05:53:48.120062+00	2026-04-13 05:53:48.120062+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
d88ba32e-2497-4cd8-a1c5-f997143c88bd	Kalieaswaran	9597794913	No.56 Jaibeem Nagar Vengikal	50000	500	2026-04-14	2026-07-22	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 08:30:20.564744+00	2026-04-13 08:30:20.564744+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1020dca0-c5c1-4720-843b-40aeeea968c9	Mahalakshmi.santhosh	9791575802	No.11 Pugazhethi Street Thotarchi	30000	300	2026-04-14	2026-07-22	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 13:41:49.735737+00	2026-04-13 13:41:49.735737+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9d8d49c7-f547-4022-aec3-2f51631c9189	Lakshmi.pillar	9087220819	No.10 Masuthi Street Choolaipallam 	20000	200	2026-04-14	2026-07-22	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 14:28:28.35132+00	2026-04-13 14:28:28.35132+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
a518ab91-c839-427f-9118-f38636c91f1e	Shanthi	9600058274	No.E2 Nethra Ambika Appartment Vembuli Amman Kovil Street 	25000	250	2026-04-14	2026-07-22	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 15:48:33.092851+00	2026-04-13 15:48:33.092851+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
f025048e-8e5a-4053-9066-4c63b2111890	Nithyanandham	9962705540	No.81/A Pillaiyar Kovil Street Jaferkhanpet 	20000	200	2026-04-14	2026-07-22	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 16:18:21.407253+00	2026-04-13 16:18:21.407253+00	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
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
183d4bdc-0ec7-46af-a0f0-cd7c5942138c	loan_repayment	200	Loan repayment from Ramesh.guru	payments	9e36ebaa-5940-4947-91a5-97ba69330223	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 17:54:02.256646+00	f	\N	\N
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
ce28872c-3384-42da-a6cc-b3fe0c5fefea	loan_repayment	300	Loan repayment from Ramanathan(Soop)	payments	fcee3555-16af-4280-94cf-261a22fb228d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 15:04:38.300066+00	f	\N	\N
e78ac4a6-242b-4b05-9a87-227d3aa6f66e	loan_repayment	1000	Loan repayment from Nandhini.vasanthakumar	payments	3ce2c244-f585-4dd0-b8fb-01c208fc8462	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11 00:15:32.738188+00	f	\N	\N
452e7b91-f1a0-4551-9dd9-a7d67a5dee7a	loan_repayment	50	Loan repayment from K.Kumaran.1	payments	d46a9224-e3fc-4862-a7c9-58674a1d6f3d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11 00:16:50.70453+00	f	\N	\N
178e4794-f2b2-4aa2-b90d-425a247ae770	loan_disbursement	17000	Loan disbursed to Ismail (Dhadi)	customers	8388404f-fd37-4f07-be34-7e919c686e8a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11 15:33:02.286323+00	f	\N	\N
a3af2c61-02fc-4c66-8fb9-239ddfaa0776	loan_repayment	100	Loan repayment from Sagunthala	payments	de4accaa-26de-43df-8145-b4be16f3bbbc	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11 16:11:52.437646+00	f	\N	\N
e4b8cd03-7e88-422a-9605-c9ccff28d251	loan_repayment	50	Loan repayment from K.Kumaran	payments	cf8927e8-7989-43be-99e9-3f9b0897a175	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 07:48:18.928654+00	f	\N	\N
c81a1591-750c-4d77-9a79-702bb392bc3b	loan_repayment	500	Loan repayment from Anitha	payments	a4b4b984-7dc4-4827-8519-756ffcc92247	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 07:49:49.642429+00	f	\N	\N
174e4ece-9b30-4346-913b-c76d50f93726	loan_repayment	300	Loan repayment from Gopal (Veg)	payments	bc3ca6b4-7e46-4451-b3e7-9409b202cc73	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 07:50:58.386587+00	f	\N	\N
309f5c5b-0182-4688-aa54-308c2907646a	loan_repayment	1500	Loan repayment from Thangapandy	payments	02de6adc-668e-4bf9-ad36-88a24380aeb8	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 07:51:21.585004+00	f	\N	\N
4a4b8106-f123-440e-999f-5267a67dba35	loan_repayment	700	Loan repayment from V.Saravanan.Pillar	payments	dfcff569-10d2-4b2b-ad27-d996a037554e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 07:51:56.794091+00	f	\N	\N
12033ccb-e04d-4240-9b7b-0e354f3042d7	loan_repayment	1000	Loan repayment from R.Gopi (Auto)	payments	1ed36d6f-b112-4517-a03e-8cecfe9977d0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 07:52:23.161378+00	f	\N	\N
cc10b7fb-9d0b-48c9-a1d5-d1bce8fe9b5c	loan_repayment	100	Loan repayment from Kumaran.E.B	payments	fb55c28f-1244-470f-9c27-fc654834ccb7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 07:53:55.628012+00	f	\N	\N
e28af44c-848e-4fc5-9d55-381795560041	loan_repayment	200	Loan repayment from Bhavani.Venkat	payments	8b16f268-1ec7-40c8-b0fc-be96cd73e4d5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 07:54:44.934418+00	f	\N	\N
50bdecd9-73c9-4537-8528-f5a74c98d215	loan_repayment	200	Loan repayment from Veeramani (vaiko)	payments	31a289be-3ee8-4a3c-b2f5-e6e0fdd60c0e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 07:55:28.136831+00	f	\N	\N
84af57d2-8285-474f-b618-601b47f68fcb	loan_repayment	2000	Loan repayment from S.K.Sendhil	payments	d8b8a6fc-669a-488a-ae51-f16c7dbb291b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 07:57:20.221492+00	f	\N	\N
61c97025-c848-4360-abba-1e86454a528a	loan_repayment	400	Loan repayment from Karthikeyan	payments	66631c12-2f6a-41a4-9c98-f3a22eece1fa	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 07:58:36.465326+00	f	\N	\N
e6522c5b-29e6-4a37-aec8-d7963d3a324c	loan_repayment	300	Loan repayment from Selvam.Ration	payments	07a8d780-9667-44e7-96aa-20182619800b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 07:59:38.341146+00	f	\N	\N
8f6d249f-108f-4131-a22c-8fcde44748b6	loan_repayment	1500	Loan repayment from Thangapandy	payments	dc3d9b99-7dd2-4913-a4ef-17886d6f52fd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 13:24:00.015309+00	f	\N	\N
41c72e81-57ad-4c23-9c21-b9d40550eed0	loan_repayment	300	Loan repayment from Gopal (Veg)	payments	2e6ca676-f019-4649-a413-a106116e6174	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 13:24:31.753481+00	f	\N	\N
f0fd9a88-8ee3-48af-af82-c4a34717f438	loan_repayment	300	Loan repayment from Iliyas	payments	bfa805ba-4123-4b97-a5b1-9cde0d336a25	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 15:08:33.446827+00	f	\N	\N
5a266f0a-357f-48f6-8c36-b60ff68e918a	loan_repayment	700	Loan repayment from V.Saravanan.Pillar	payments	82cc9595-212b-4a3a-9e42-17bee32af6a7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 15:40:54.37819+00	f	\N	\N
a794e6aa-f9ad-46e8-b293-14063c173ee8	loan_repayment	1000	Loan repayment from Nandhini.vasanthakumar	payments	b6c13a2b-80fe-46cf-81c9-ebf8af994e52	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 18:54:28.187824+00	f	\N	\N
653bfd2b-ff80-4ba0-9a04-28bf7dd73476	loan_repayment	500	Loan repayment from Magesh(mec)	payments	2144e743-ecef-4cd0-9801-20eb906e1e82	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 07:24:36.176076+00	f	\N	\N
5f51dad4-9401-40c5-813f-9e190fb72424	loan_repayment	200	Loan repayment from Vengatesh.Mec	payments	6589d145-8753-4023-82ff-62b94dfe010a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 07:25:10.561449+00	f	\N	\N
5bff63a1-65a5-4f7c-a42d-6dbaab0d9420	loan_repayment	5000	Loan repayment from Chinnakownder	payments	b3831b5d-6698-411f-b29d-80222036d865	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 12:57:30.184207+00	f	\N	\N
fe7b1ab5-b6f7-4ddd-9116-b53ecdaf6f54	loan_disbursement	25500	Loan disbursed to Mahalakshmi.santhosh	customers	1020dca0-c5c1-4720-843b-40aeeea968c9	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 13:41:50.477266+00	f	\N	\N
0ae6a175-ecc1-480e-80ed-20ca5a7ffd5b	loan_repayment	600	Loan repayment from Kumar.pillar	payments	8ac96dd6-7578-4eaa-8789-411301e1af57	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 14:25:22.703947+00	f	\N	\N
91cba042-67b3-4407-a35d-d491bae2d9d3	loan_repayment	200	Loan repayment from Rajaselvam	payments	a1085f34-be49-4ddf-826e-e6dc1c401ef9	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 14:25:27.686829+00	f	\N	\N
8a7c261d-91f2-4fee-9cfe-90ef91e4e442	loan_repayment	100	Loan repayment from Divya (poo kadai)	payments	3fd08ee2-b2e3-4baf-ad89-3fb6c7fc0ae5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 15:28:15.488062+00	f	\N	\N
76efbee9-24e3-4e4b-a921-1d1765f18f9d	loan_repayment	300	Loan repayment from Sheela	payments	01507b48-70ec-4dad-8e78-50f335174797	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 15:29:50.348858+00	f	\N	\N
2cfb579c-c2e9-4545-934e-c356c653fac7	loan_repayment	200	Loan repayment from Jaffer	payments	a198a373-9545-4330-8e11-e4deddf4e027	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 15:31:21.250188+00	f	\N	\N
512ad285-cd4b-463d-b501-3e054af4dc33	loan_repayment	200	Loan repayment from Harideva	payments	2148d077-04d3-48b9-8a71-2408d6940c47	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 15:32:01.476453+00	f	\N	\N
6b809561-3bcc-4839-b2bf-973af07f33bd	loan_repayment	50	Loan repayment from Mani.Angala	payments	a38e8203-bfc3-447e-9a8b-61a9681bc33e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 16:10:24.308283+00	f	\N	\N
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
d93c693e-2ace-40bf-867a-fc013d2d6d74	loan_repayment	500	Loan repayment from P.Selvam	payments	58982214-7352-4362-aecf-90ac75025643	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 15:47:12.844352+00	f	\N	\N
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
52556869-96a6-4479-9d8a-5bf2eea6c0c9	loan_repayment	1000	Loan repayment from Gokul (Magic)	payments	69810eec-9423-47bd-9f6f-bd59ed19279c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 15:47:53.820217+00	f	\N	\N
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
dc58a5a6-ee2e-4532-867c-19acd71df6a7	loan_repayment	50	Loan repayment from K.Kumaran	payments	1a7afa43-2b6f-4b98-ac07-bb45c1fa0e48	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11 00:16:27.716974+00	f	\N	\N
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
50a1ce23-07c4-45da-817a-e05b6a5cad3a	loan_repayment	200	Loan repayment from Ramesh(Pori)	payments	30bf9133-f7bb-4a6a-b7e0-a4f957593c0e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-20 15:03:26.18837+00	f	\N	\N
bf3a6964-34ba-4df6-918d-4605e51fa292	loan_repayment	300	Loan repayment from Udhayakumar(Sekar)	payments	ccf39281-62fd-453a-aff8-c419866aca24	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19 04:50:59.046536+00	f	\N	\N
910706cb-ce5a-4889-befc-5c373b459e9f	loan_disbursement	17000	Loan disbursed to Gopi.Kuppan	customers	d61b213f-26ab-40b6-ac19-bc6fb34eaf79	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19 07:32:27.5183+00	f	\N	\N
6e9a2a2e-b66b-4e2a-a3f5-a9fd83c55520	loan_repayment	1800	Loan repayment from M.Ramesh	payments	f44ad72d-cd25-4c10-9f1f-f9521a3028cd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19 07:34:48.079392+00	f	\N	\N
a2b80637-6225-41c0-a93a-c752f157677c	loan_disbursement	17000	Loan disbursed to Loganathan.DMDK	customers	6735cbe7-8e3f-41f0-b16c-9b60d974d6ec	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19 07:40:03.419124+00	f	\N	\N
70451148-856c-4df3-970d-15ea6ee56915	loan_repayment	500	Loan repayment from Karthi.Suba	payments	d6022f39-784a-43d6-94a8-4d08036810fe	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19 07:59:24.752815+00	f	\N	\N
2237b1ad-7b89-4a70-921e-c9cd58117e48	loan_repayment	250	Loan repayment from R.Murugan(Auto)	payments	2d687d02-6a59-4c78-be96-8c750a6f8068	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19 08:28:17.926751+00	f	\N	\N
91d63de4-6b98-43d7-8c8e-c3e013d74d03	loan_repayment	600	Loan repayment from Magesh.sekar	payments	63a39dba-aac2-460d-aae8-4f2bc9242f91	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19 13:15:07.655089+00	f	\N	\N
ce6acf72-e628-47e9-8cdb-681d99fb39cb	loan_repayment	1000	Loan repayment from R.Gopi (Auto)	payments	15793f4f-8f8d-49ce-85be-cb15f4080e72	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19 13:16:13.97733+00	f	\N	\N
9abd2a2c-7414-4814-aed7-9aaafc9f7af0	loan_repayment	200	Loan repayment from Balamurali (sekar)	payments	5b38cf27-ee58-4416-a388-13ba644847f6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19 13:24:24.554108+00	f	\N	\N
eccc7440-c7f8-41b2-8dd9-b0409cf7b9fc	loan_repayment	1000	Loan repayment from Varanasi.Ayyer.	payments	0cd5a2cd-9c7b-42a8-8192-88f197c00f73	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19 13:55:58.222389+00	f	\N	\N
9e434bfc-d3b4-434f-933c-2c18e17ee3c9	loan_repayment	500	Loan repayment from Hamsa	payments	017641ee-f6b8-444c-8d78-c106bd49a93e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19 13:56:15.031642+00	f	\N	\N
55b273b6-a5f7-40e0-ae1d-9078df80be19	loan_repayment	500	Loan repayment from E.Saravanan	payments	9fee64ef-1d8e-4ae5-a4ce-5c012c39b867	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19 14:02:52.064065+00	f	\N	\N
91e314b9-bc02-4d03-9199-d832db974608	loan_disbursement	25500	Loan disbursed to Barath.7092103855	customers	dd17dc7d-fde3-4770-bdf7-c30ba3dbcca6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19 14:14:32.144565+00	f	\N	\N
7cfb8c18-0449-41ef-a3e0-cd815c1aa89c	loan_repayment	300	Loan repayment from Barath.7092103855	payments	3a9550cd-688f-44ed-9236-2559e0e622d4	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19 14:16:20.479127+00	f	\N	\N
bf95c210-4ada-4bba-92c3-1881c3d33ab6	loan_repayment	500	Loan repayment from Anitha	payments	c76f0656-a4be-4579-b437-75ea49bfb931	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19 14:26:29.116417+00	f	\N	\N
ea673cb2-da7a-418f-83d8-17e09ad201ff	loan_disbursement	25500	Loan disbursed to Raja.megic	customers	6c56e1c0-92ef-426c-8b5f-f6a9eac0ebc0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19 14:33:07.020245+00	f	\N	\N
6cfe92b4-c8a6-4635-b3f5-969cea39a779	loan_repayment	500	Loan repayment from Gokul (Magic)	payments	226a8875-ffdc-477f-a888-749c1418ceb6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19 14:49:36.261547+00	f	\N	\N
610cc626-197e-418d-989e-524f10e7f2d5	loan_repayment	500	Loan repayment from Bhavani (Vijayakumar)	payments	6522a134-95e8-45f6-b43c-8f120528ff43	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19 14:59:45.867589+00	f	\N	\N
e8483f1b-d5a9-4eb2-977e-a431bd8db3ba	loan_repayment	300	Loan repayment from Ramanathan(Soop)	payments	a8d11bd1-aff7-43ab-8e01-e0d8937cd158	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19 15:00:23.279431+00	f	\N	\N
bf297600-5732-4e72-b470-1a7332644379	loan_repayment	200	Loan repayment from Jaffer	payments	bd38ed1f-fa77-4cfb-865d-9b740a0ec3e5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19 15:00:51.934888+00	f	\N	\N
06675acd-567b-428c-90eb-68a711df9fe2	loan_repayment	600	Loan repayment from Uma (Elumalai)	payments	2e074954-d89e-4964-82eb-01166f88d848	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19 15:01:24.485508+00	f	\N	\N
6dc37fcd-7355-48d4-82c0-b8410b634d4d	loan_repayment	400	Loan repayment from Lakshmi.(Tiffin)	payments	6bd3cb7a-8d5f-4874-90c6-43bcf4098619	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19 15:02:00.451134+00	f	\N	\N
5fd40331-2f1c-4a82-887c-3153c59a0623	loan_repayment	200	Loan repayment from Ramesh(Pori)	payments	2bac413c-c230-4420-9475-6959251aa488	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19 15:02:32.070643+00	f	\N	\N
e9ac9055-defd-44c2-ba7d-364d0f968a55	loan_repayment	200	Loan repayment from Rubini	payments	ff3e6819-b7f4-4d1d-8764-cfdc9d52e131	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19 15:03:14.978373+00	f	\N	\N
5266f978-ddb0-44dd-b614-d53bae186206	loan_repayment	100	Loan repayment from Magesh(mec)	payments	1cc65ac6-b1ad-4248-a4e5-245fae477d6a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19 15:13:55.205929+00	f	\N	\N
6568e361-6167-4d29-a9dc-8869714d9496	loan_disbursement	25500	Loan disbursed to Ramesh.Megic	customers	df704001-715c-495c-832e-1971c5655106	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19 15:36:21.041635+00	f	\N	\N
a39aff44-b5dd-4e27-8180-523f0d457996	loan_repayment	1200	Loan repayment from S.K.Sendhil	payments	dc245389-e636-4ce6-b982-58fd862b7d90	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19 15:40:51.858546+00	f	\N	\N
af09860e-6882-4bdf-9a0b-03167eba0e6c	loan_repayment	200	Loan repayment from Veeramani (vaiko)	payments	24be1fd2-6645-4720-86c9-7fc14b00eadc	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19 15:42:13.186991+00	f	\N	\N
2c4d5c02-fdff-4f18-a986-4efcb7373486	loan_repayment	400	Loan repayment from Sriman	payments	182a161f-9ffd-4fab-8124-0149141e55cb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19 15:49:50.943931+00	f	\N	\N
a05d2b69-bcbf-4932-91c6-57d74730bb24	loan_repayment	1000	Loan repayment from Brijesh	payments	29bef954-3996-409e-975a-b20affd8e850	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19 18:22:56.0648+00	f	\N	\N
7881cde8-7ef6-43f1-86d3-4f6603bbd9f0	loan_repayment	1500	Loan repayment from Thangapandy	payments	b9ed54a1-2ea3-433e-942d-e884fa552a78	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19 18:23:14.563185+00	f	\N	\N
f12a3c5c-313a-475a-84b5-e3a87ce30c51	loan_repayment	1200	Loan repayment from Teja	payments	996c60d0-75c8-49e2-bfa3-c4203e431318	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-20 06:11:49.043364+00	f	\N	\N
c772c308-bf73-45de-9490-ed6ce73c722d	loan_repayment	200	Loan repayment from UMA.(Teacher)	payments	b3e943e1-0b16-46f4-8660-c277ac3949c4	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-20 07:26:55.558468+00	f	\N	\N
cb32a8e9-324b-476f-a716-399094ce9aca	loan_repayment	200	Loan repayment from Sathya (Tailor)	payments	02d8c28c-8a52-473c-9800-721d3856f204	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-20 07:27:59.792727+00	f	\N	\N
bbf5cbe6-e879-457e-b05f-38060f3084ba	loan_repayment	500	Loan repayment from Anitha	payments	415398f1-af86-4eeb-b270-ac879b353bd2	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-20 07:28:26.765794+00	f	\N	\N
fb8aab8f-175b-4643-a84c-d026a90a89be	loan_repayment	400	Loan repayment from Karthikeyan	payments	33aa2ee2-75db-415f-b538-14c84bc8cc26	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-20 09:34:35.841747+00	f	\N	\N
e6733d16-e38f-4507-997d-fd22f93b8de1	loan_repayment	1200	Loan repayment from Sudhagar	payments	6f1b28af-ac7c-40a1-8bf1-431e71242e49	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-20 12:40:26.155144+00	f	\N	\N
e437ab91-50dd-4ba4-97cc-d2b8ce66e3f5	loan_repayment	200	Loan repayment from Balamurali (sekar)	payments	d47f048d-fb64-4983-90b5-f0216c5b1c0e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-20 12:40:54.495051+00	f	\N	\N
ba0e1bbc-12cc-41dc-8a22-80a50e0afbbd	loan_repayment	500	Loan repayment from Gokul (Magic)	payments	21296d99-5f4e-447e-b407-d6a9eccfa8ab	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-20 12:41:47.915338+00	f	\N	\N
88e5f7ea-b56d-45bb-8f9d-f5d894085981	loan_repayment	300	Loan repayment from Selvam.Ration	payments	65851c48-dfb9-44a3-a089-3a8b9deeac54	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-20 13:16:24.20756+00	f	\N	\N
fba64531-8f70-44d8-9927-12b8bd9473db	loan_repayment	1500	Loan repayment from Vasu (iyyar)	payments	7c3cd7b2-8490-46df-bc3a-1391ec557ca8	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-20 13:17:08.560019+00	f	\N	\N
0aaa8a42-5aad-4a4e-aeba-264b6311dbed	loan_repayment	500	Loan repayment from Mani (Magic)	payments	03ab640f-2259-4876-a3aa-09320ae85344	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-20 13:18:26.411446+00	f	\N	\N
701a5975-f94a-48bf-8212-93f74f48e973	loan_repayment	500	Loan repayment from Hamsa	payments	8f88d7dc-dcdf-408f-8399-98be07cd2a77	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-20 13:47:06.766305+00	f	\N	\N
63010326-08d2-4423-bd5e-e547276d3c34	loan_repayment	500	Loan repayment from Varanasi.Ayyer.	payments	868ca7df-65ec-4648-957c-9fb13a170b2c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-20 14:01:46.284281+00	f	\N	\N
b9df65f2-b26a-450d-9368-8ea9e5f46d2c	loan_repayment	300	Loan repayment from Udhayakumar(Sekar)	payments	4f60b275-13c2-44f4-a9b4-7f642ecfdc28	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-20 14:36:29.167078+00	f	\N	\N
f6150ae7-3faa-4ceb-a720-6e535373d542	loan_repayment	500	Loan repayment from R.Gopi (Auto)	payments	50e08d69-70be-44c7-b445-081968c5ad45	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-20 14:37:18.15829+00	f	\N	\N
38cb540f-a545-4b5e-a1bb-1628447726b8	loan_repayment	200	Loan repayment from Prathaban.R.O.Water	payments	aa031338-68e5-47cb-b7c6-af447a5e271d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-20 14:37:49.417246+00	f	\N	\N
f05c1b8d-f158-470c-b167-281118998d14	loan_repayment	3000	Loan repayment from Barath.7092103855	payments	856a61ad-fbfc-411f-a76e-7c54bc626602	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-20 14:51:17.542172+00	f	\N	\N
80e2129d-6423-4bc8-a8c7-3f39277dadf0	loan_repayment	400	Loan repayment from Lakshmi.(Tiffin)	payments	150dc901-85f5-4cd9-a568-8ee43f203edf	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-20 15:03:01.719054+00	f	\N	\N
e991b00e-a811-41ba-b59d-acbc2b0e3c03	loan_repayment	500	Loan repayment from Chandran.(Malathi)	payments	bf194712-1fdc-4bc3-a3b8-9a6ad0bc4215	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-20 15:03:47.481769+00	f	\N	\N
c23348c0-b27b-487b-a468-93e5c47796b8	loan_repayment	300	Loan repayment from Ramanathan(Soop)	payments	2e48db32-b8ab-44e3-bba8-272c760506e5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-20 15:04:05.366413+00	f	\N	\N
10f651ee-9ab1-40a9-af88-d63469ddff9e	loan_repayment	200	Loan repayment from Rubini	payments	58bfc235-d775-42b6-b5ed-af45fd391a96	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-20 15:04:26.041862+00	f	\N	\N
1ddbe232-afdf-4fb5-90ac-d45b1c95c133	loan_repayment	300	Loan repayment from Kumaravel.megic	payments	881ede1d-c014-4a54-8df2-4e58b51ec059	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-20 15:05:11.019838+00	f	\N	\N
0d1f65bb-7247-4468-90de-7ebae4c60d1d	loan_repayment	500	Loan repayment from Lakshmi.(Tiffin)	payments	c1b9ce49-819a-474c-8d2c-d98290dd7886	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 16:04:13.881789+00	f	\N	\N
bf6c278b-03db-47cf-853c-4e3f85a16205	loan_repayment	50	Loan repayment from Mani.Angala	payments	d59d3858-6af8-4591-a4a8-357ce4e5b680	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11 07:06:34.246775+00	f	\N	\N
1e4d8d8b-25ba-4b4a-8697-d1e9c184dd42	loan_repayment	300	Loan repayment from Ramanathan(Soop)	payments	868543e9-9a83-4174-a496-f5c13ed06cb8	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11 15:46:46.901816+00	f	\N	\N
2886cc76-0d46-4321-b84b-3bec9e32ecef	loan_repayment	1200	Loan repayment from Iliyas.Dhaadi Baai	payments	e74d640b-243a-4b31-aced-76f89eea1381	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 07:06:53.181575+00	f	\N	\N
4bdf2f25-6cf0-41ab-878d-bbebd636fd80	loan_repayment	200	Loan repayment from Ismail (Dhadi)	payments	b9903c0d-1c89-4ae0-941f-1069548772d2	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 07:08:09.387361+00	f	\N	\N
2f165ad6-f133-4abd-9984-de6e0fe90bc2	loan_repayment	50	Loan repayment from K.Kumaran.1	payments	7fa352ef-ab59-4cbf-9380-33c1a04441ce	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 07:48:41.016146+00	f	\N	\N
b32de736-9fe0-4300-8357-9c7ee494d85e	loan_disbursement	25500	Loan disbursed to Stalin	customers	45758843-0035-4992-a067-2c4d561bf31b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 07:52:51.319507+00	f	\N	\N
ab03aa4a-15d7-48ae-96f7-3be5a0e01738	loan_repayment	800	Loan repayment from Stella Mery	payments	e130365f-7953-4818-ae01-34b5d1666228	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 07:53:26.055992+00	f	\N	\N
3a1bce94-6a63-4e9d-aa93-cefd69319b36	loan_repayment	500	Loan repayment from Karthi.Suba	payments	19324c76-740d-407a-85fe-ed5daa938b7d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 07:58:14.807187+00	f	\N	\N
138ce33b-a168-4324-b187-536e833c69f4	loan_repayment	50	Loan repayment from K.Kumaran	payments	883f1fcd-ae49-4c21-9eb2-b34986a0722c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 08:00:01.036218+00	f	\N	\N
5da37fb3-75b5-4ae7-9b9e-978368259d16	loan_repayment	50	Loan repayment from Sagunthala	payments	65c0cd2e-b288-49d8-8f47-f36ba6a2feb8	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 08:01:35.283175+00	f	\N	\N
948c9e2e-5441-401a-81c4-73b736c7905a	loan_repayment	300	Loan repayment from Udhayakumar(Sekar)	payments	3e2287d7-a517-4a1a-b0be-4c7a76f05edb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 13:27:27.772958+00	f	\N	\N
a9239119-5d07-46fa-9c27-1a70cd729aa2	loan_repayment	500	Loan repayment from Gokul (Magic)	payments	c276837d-15ef-4e3e-8509-e637026081f7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 13:27:54.498972+00	f	\N	\N
7c8fb10f-bfdb-4b13-a8a4-4eb0a37bcbca	loan_disbursement	8500	Loan disbursed to Vinoth.Mesthri	customers	66a5baef-e9ee-4830-8b91-10c5b91c0d5a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 15:15:10.321368+00	f	\N	\N
7dff8133-f6ef-4416-9bbf-6178fa7cf4d0	loan_repayment	2000	Loan repayment from K.V.Ramesh	payments	6cf19eca-40cc-4d6d-b286-7bfb2a95832e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 16:29:36.430927+00	f	\N	\N
9910767f-f016-4dc1-841b-8232d5dc7951	loan_repayment	2000	Loan repayment from Manipaul	payments	70f004d6-1dc8-4f42-9ca6-4af7b7bead78	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 05:18:22.10961+00	f	\N	\N
0a11ae0a-54d4-414a-92d3-cd402ee59dbf	loan_repayment	700	Loan repayment from V.Saravanan.Pillar	payments	0f1d7351-e0d7-459b-b2c8-674f9942bd9d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 07:25:40.519443+00	f	\N	\N
3f515b37-fe33-439b-889b-214f408e839b	loan_repayment	1500	Loan repayment from Ramya(Murugan T kadai) 	payments	2ba51da9-7cd5-433c-a254-eb6e85a3b644	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 12:58:08.251755+00	f	\N	\N
2ceac99c-65a7-43a3-96ef-dd06876db6da	loan_repayment	1300	Loan repayment from Vishwanathan.9600058274	payments	e8778b71-a5f5-4518-aad3-88a0305c108a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 13:51:35.750721+00	f	\N	\N
efadcba3-e239-4946-af02-b496223e4c0a	loan_disbursement	17000	Loan disbursed to Lakshmi.pillar	customers	9d8d49c7-f547-4022-aec3-2f51631c9189	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 14:28:28.944862+00	f	\N	\N
80a20943-a9ef-4357-b61a-37c786558994	loan_repayment	500	Loan repayment from Lakshmi.(Tiffin)	payments	055125ea-6a83-407d-8fda-06e18eec35a9	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 15:28:37.150211+00	f	\N	\N
65d3fa77-608d-4b8c-929c-e7851daf1d60	loan_repayment	100	Loan repayment from Elumalai.mani	payments	a07b6b44-1bf8-4e1a-890b-baa0f678a143	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 15:31:43.76491+00	f	\N	\N
5bd1e91e-598a-441d-b0c3-faaf2712cfe6	loan_repayment	200	Loan repayment from Jaffer	payments	1def4570-48de-4862-a5f1-e8f730989494	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 15:35:42.839127+00	f	\N	\N
a065575e-ff7a-4686-a3ad-f012c59c37dd	loan_disbursement	17000	Loan disbursed to Nithyanandham	customers	f025048e-8e5a-4053-9066-4c63b2111890	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 16:18:22.010041+00	f	\N	\N
c9645941-eeac-49e5-88ae-5c5a813f2065	loan_repayment	200	Loan repayment from Jaffer	payments	315ba264-96e5-40d2-82c3-067d46a2ef81	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-20 15:04:54.453366+00	f	\N	\N
8e7ff261-08dc-42b1-aa67-8d66c700ef69	loan_repayment	400	Loan repayment from Sriman	payments	1ec66a6c-fc50-47fb-8366-605070b2ecb2	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-20 15:20:53.983449+00	f	\N	\N
c940396e-0b9d-4466-8550-8c46bcb9137b	loan_repayment	600	Loan repayment from Ramesh.Megic	payments	0144e73b-0bc6-4972-ab2e-4597811d5d20	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-20 15:46:26.449234+00	f	\N	\N
8b80865e-f4a4-4dd9-873f-6d9f1e84fa66	loan_repayment	500	Loan repayment from E.Saravanan	payments	979f47d9-f685-4436-8141-068855be296e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-20 16:10:18.797003+00	f	\N	\N
9c373783-d80b-4bc7-a282-ba25b6b96e7b	loan_repayment	200	Loan repayment from N.Manikandan	payments	414db79e-8df8-44e5-a9f8-b15bacb9f6fb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-20 16:12:46.719652+00	f	\N	\N
aab524ca-7c42-4658-a0e1-10e6277677b2	loan_repayment	200	Loan repayment from Veeramani (vaiko)	payments	95be0a61-5d91-4230-9053-7f2982fdd1d8	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-20 16:33:12.053061+00	f	\N	\N
a6cd7624-7f8d-4c67-81d8-2f55131b7769	loan_repayment	1000	Loan repayment from Brijesh	payments	48a98716-8bba-4149-acce-386ac2846bfb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-20 16:33:31.81431+00	f	\N	\N
d100c38f-2376-4233-ade0-f94d2c3a19e3	loan_repayment	100	Loan repayment from Magesh(mec)	payments	7d91df2a-39d9-4908-9d50-e3b3227b48f1	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-20 17:05:52.365302+00	f	\N	\N
97e418e9-83b3-4daa-aae7-38a3a7f80fc9	loan_repayment	1500	Loan repayment from Thangapandy	payments	6d03356c-bda5-4ae3-9905-3220143f8373	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-20 17:06:42.026366+00	f	\N	\N
e58cb343-c0c4-4b72-ac7a-b6d4fb8696f5	loan_repayment	500	Loan repayment from Mani (Magic)	payments	1b3be3cd-513e-40ee-a8e8-de762638ae27	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-21 05:24:20.681862+00	f	\N	\N
33efb66e-bd13-4992-ab9a-ad7b1505ea41	loan_repayment	1800	Loan repayment from Manipaul	payments	f761822b-2e21-47c5-b74a-277a15a6a484	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-21 07:05:08.02909+00	f	\N	\N
de1aa89c-d5eb-45bb-852b-a56427b829d9	loan_repayment	200	Loan repayment from Balamurali (sekar)	payments	36d6692a-b9d8-43c3-9891-336f1239bcde	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-21 08:47:49.301231+00	f	\N	\N
b86c67f4-aa03-4aac-8e85-584477496e87	loan_repayment	3000	Loan repayment from Barath.7092103855	payments	1952859e-a636-4622-9266-8d40bf641769	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-21 08:48:07.082477+00	f	\N	\N
7136f19b-0a39-48af-98be-a89dd69878f9	loan_repayment	300	Loan repayment from Udhayakumar(Sekar)	payments	1409959a-30c7-48f1-b82e-b18c27168681	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-21 09:40:05.425043+00	f	\N	\N
86c57328-058d-4639-9cca-587ea481beed	loan_repayment	600	Loan repayment from M.Ramesh	payments	c58bc072-f0c7-4b5f-8223-029cacf22c4f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-21 13:39:06.470822+00	f	\N	\N
381c88f0-50db-426b-bf7f-22fbda33031b	loan_repayment	500	Loan repayment from Anitha	payments	2c875f21-e62c-4065-a94f-e2c5d49b48c4	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-21 13:39:38.252426+00	f	\N	\N
83575921-3dd1-4a80-baca-64c1dc2f86b4	loan_repayment	500	Loan repayment from Karthi.Suba	payments	569a2a72-0054-44aa-8bac-5f53d393556f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-21 13:40:07.361305+00	f	\N	\N
46f5ec83-4b98-4ca1-905b-8b05d4b678fc	loan_disbursement	8500	Loan disbursed to Amutha.DMDK	customers	f196fdd7-e224-44d7-b6f4-4cbde8b41ae7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-21 14:06:08.028343+00	f	\N	\N
dbcb2847-fee8-41c8-bb9e-44a2bf051e24	loan_repayment	300	Loan repayment from Divya (poo kadai)	payments	865aaba0-821f-470a-8c0c-4df44fe2441e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-21 14:12:32.439783+00	f	\N	\N
be613edb-77ed-4ff8-b312-2226db639247	loan_repayment	200	Loan repayment from Rajaselvam	payments	9cd2c926-01e2-4a12-85ea-f5ec50f6c435	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-21 14:18:30.680529+00	f	\N	\N
b2570772-eaf7-44de-ad01-45efecab1371	loan_repayment	500	Loan repayment from Gokul (Magic)	payments	b98fbef9-10f0-4b4f-85d2-842b98e2fec1	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-21 14:33:38.525082+00	f	\N	\N
e6aa5049-5a83-419d-9fd0-b7bc29eb2859	loan_repayment	200	Loan repayment from Rubini	payments	7cca3b96-1d36-4f2e-a2c7-efe1f70558a0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-21 14:56:45.393049+00	f	\N	\N
5f124ea0-507d-489c-90ce-a62a38e97ac5	loan_repayment	400	Loan repayment from Lakshmi.(Tiffin)	payments	bc13ab72-6123-48ff-901a-c295e30e5d09	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-21 14:59:48.115754+00	f	\N	\N
97fb3f87-5f9d-4438-8085-a81f30858931	loan_repayment	500	Loan repayment from Uma (Elumalai)	payments	9a7d3086-f699-4f7c-bb21-fee6759e89f2	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-21 15:00:13.067382+00	f	\N	\N
e511109f-325c-4d12-a485-58c2a9e65e0d	loan_repayment	1000	Loan repayment from Nandhini	payments	28461d1f-3619-4934-b70a-a3629541080a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-21 15:19:12.814446+00	f	\N	\N
55a12f1d-6085-4399-9669-42cf33816b23	loan_disbursement	4250	Loan disbursed to Ajith	customers	894bed8a-dcbc-44c1-b441-fa5be29868d6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-21 15:30:43.448198+00	f	\N	\N
caef9957-b437-42f0-90bc-c8b4f6dfc63e	loan_repayment	1000	Loan repayment from R.Gopi (Auto)	payments	824defa5-1cc6-4f38-b19f-985111e396dc	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-21 15:32:54.762611+00	f	\N	\N
17eaec74-2819-4227-a37c-fc2b6a4ea4e5	loan_repayment	1000	Loan repayment from Ilaiyaraja (Auto)	payments	5983faff-8bdf-48fd-97f6-48a761556409	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-21 15:34:32.401573+00	f	\N	\N
c0be21dd-5d87-4a66-b7ec-15e1d42d7f68	loan_disbursement	25500	Loan disbursed to Muthukumar.7338758742	customers	9252d856-84b5-47ad-870a-5df022b6adad	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-21 15:57:24.37436+00	f	\N	\N
05d2d3e5-e687-4a4b-ae2e-6dfcc13622b1	loan_disbursement	38250	Loan disbursed to S.M.Murugan	customers	eb67be15-b51a-4b91-b2ae-6645450cb3cf	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-21 16:20:17.878126+00	f	\N	\N
4aaf4cd8-e6d1-4d52-bbc5-e78770d9d8d8	loan_repayment	200	Loan repayment from Veeramani (vaiko)	payments	f0679d8f-5c41-486a-b6e2-d55e13b4882e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-21 18:43:25.8383+00	f	\N	\N
5c1d606c-cd89-4355-9889-ea8ca16287fd	loan_repayment	200	Loan repayment from Sathya (Tailor)	payments	1c46f36d-35a4-4932-b61a-c6e780df6e79	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-21 18:44:16.39699+00	f	\N	\N
09f86798-6396-45ef-b3fa-65b4841e0ed1	loan_repayment	500	Loan repayment from Bhavani (Vijayakumar)	payments	a10c531e-0f97-435e-b090-316c16a8e56e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-21 18:45:12.110025+00	f	\N	\N
fbc6ed5a-cdf6-46b6-9b9d-dbeaaf025fea	loan_repayment	1500	Loan repayment from Thangapandy	payments	e949d1c2-b23b-4fc0-a32e-4d2d335144e1	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-21 18:46:08.018099+00	f	\N	\N
c21e55f5-283c-4edb-bdad-91b866060ef4	loan_repayment	400	Loan repayment from UMA.(Teacher)	payments	dad29ade-3737-4bfd-8b29-0a91ab6c618a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-22 02:08:05.361364+00	f	\N	\N
64288668-3bba-4a4b-9cda-aaa11d946f4e	loan_disbursement	17000	Loan disbursed to Pandit	customers	44e44d3f-1c42-41fa-8bf1-2bdb5bf219c7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-22 06:30:57.403454+00	f	\N	\N
fea0f0b0-ba7a-4b1c-bada-576e8c802f04	loan_disbursement	42500	Loan disbursed to Vijaya	customers	7d755464-aa72-4aab-9028-a75e09410ff6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-22 07:17:03.13175+00	f	\N	\N
e7714167-b293-440a-8512-91dabff7ef9e	loan_disbursement	8500	Loan disbursed to Kumaran.E.B	customers	250eeece-4579-4cc4-86f9-0cdd866fbd24	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-22 13:22:48.152629+00	f	\N	\N
7b062e9a-bb9c-4927-b5e3-bfea5ca9cdde	loan_repayment	1500	Loan repayment from Thangapandy	payments	516a2a70-fa65-4a62-86fa-4f16e3e42945	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-22 13:26:28.598338+00	f	\N	\N
cf7d8942-5ccb-44bd-97e4-8617d67f4384	loan_repayment	800	Loan repayment from Sriman	payments	ee84fbc7-4c04-4422-b798-3f754280c4e4	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-22 13:27:02.692015+00	f	\N	\N
64915e75-d076-4e91-a1fa-db3c52f13e5e	loan_repayment	600	Loan repayment from Sudhagar	payments	2ee744d6-2602-4376-8680-77b98832c0b6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-22 13:27:36.817156+00	f	\N	\N
4d51bd29-57b6-4dfc-9567-268961b44a32	loan_repayment	200	Loan repayment from Balamurali (sekar)	payments	e6b2992c-0e1c-4356-92dd-69b444300601	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-22 13:28:22.090606+00	f	\N	\N
16788eed-6494-4d14-bcd0-0400fff60f2c	loan_repayment	500	Loan repayment from Anitha	payments	29658c9b-c50a-4c45-8121-5b1e91655b45	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-22 13:28:54.131532+00	f	\N	\N
441e10b8-497c-41b0-82b3-512b0826136d	loan_repayment	2100	Loan repayment from Sendhil (Sathiyanagar)	payments	1c06af56-b2ce-459f-a196-ec0a0ddbe29b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-22 13:29:31.093475+00	f	\N	\N
c57f44bc-d974-4e3c-b4d8-3a16685de457	loan_disbursement	34000	Loan disbursed to Prabhu	customers	a00d5979-396d-4d33-b05c-a102fb0bb7a8	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-22 13:39:44.043793+00	f	\N	\N
d92961cc-2abb-4704-9ef7-6e6c9e2f45b5	loan_repayment	300	Loan repayment from Udhayakumar(Sekar)	payments	8a316f42-f121-4a91-9cd6-46c7b4d33b4f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-22 14:01:27.572046+00	f	\N	\N
08e51170-07c7-4652-a871-32b534a871c5	loan_repayment	200	Loan repayment from Rubini	payments	d486d745-af78-43b2-9825-0437d4cbd45b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-22 14:06:38.885219+00	f	\N	\N
cad1e13f-c56a-44bb-8675-6f4eb0aea7b9	loan_repayment	750	Loan repayment from Ramya(Murugan T kadai) 	payments	2ed083fb-6d96-4d13-909d-514ec83cf855	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-22 14:07:00.788325+00	f	\N	\N
24ddae77-351f-46dc-ba64-ada984c6871a	loan_repayment	1000	Loan repayment from Rajesh ( Elc )	payments	8b0ad247-1cf7-4fdd-a1b3-275a60cf1bbe	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-22 14:43:47.099196+00	f	\N	\N
056eb9b2-a28a-49cb-92ef-c1a289461398	loan_repayment	50	Loan repayment from Ajith	payments	c567bf18-6b90-4c02-9665-62624d456d28	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-22 15:37:02.711901+00	f	\N	\N
a4912296-ee38-47f7-9676-1886151df7df	loan_repayment	400	Loan repayment from Veeramani (vaiko)	payments	de48b1c6-dc4e-464f-b673-69625a625884	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-22 15:37:52.065913+00	f	\N	\N
8b753eed-c841-4e4c-a382-3a6dc1bdfbd4	loan_repayment	500	Loan repayment from R.Gopi (Auto)	payments	7a37691f-c716-40c5-ae07-88c150a40c5d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-22 15:38:17.474057+00	f	\N	\N
d8f91848-f22b-42ad-891d-a269005417b4	loan_repayment	500	Loan repayment from E.Saravanan	payments	753331a4-a320-417d-9ace-6284098e06f1	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-22 15:38:49.591913+00	f	\N	\N
f962e4cd-ba01-4347-94c9-9365627982dd	loan_repayment	400	Loan repayment from N.Manikandan	payments	e42a54d9-94dd-4632-a5f6-9b8054b4c2b5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-22 15:39:15.481335+00	f	\N	\N
140e186a-a389-4472-9459-fa7e17981c99	loan_repayment	150	Loan repayment from Murugan(mec)	payments	16f25a18-eb46-40be-961a-52e5248762a4	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-22 15:48:51.610672+00	f	\N	\N
b7928d94-9157-486e-a030-cc7fa6913ee4	loan_repayment	400	Loan repayment from Lakshmi.(Tiffin)	payments	845e1d5f-b80f-4d51-b6fe-9678942ea6be	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-22 15:49:26.526154+00	f	\N	\N
368e1f58-4ea8-46f1-9d11-c5be10eddb81	loan_repayment	100	Loan repayment from Divya (poo kadai)	payments	674fc9bd-d3d7-415c-a9b9-69529c878c57	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-22 15:49:59.375369+00	f	\N	\N
f47af3e9-a11b-46bc-be6c-9d3eed04e969	loan_repayment	700	Loan repayment from Chandran.(Malathi)	payments	8df8207e-161f-4ae6-a663-9b2b7847b849	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-22 15:50:24.780511+00	f	\N	\N
d551459a-a955-45a7-af82-458605f9db98	loan_repayment	2000	Loan repayment from Karthi (School)	payments	a3019b9e-a752-44f2-82a9-fed2e20e8124	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-22 16:21:06.452107+00	f	\N	\N
76a212dc-0032-4a82-a3d2-232c09e48de8	loan_repayment	1200	Loan repayment from S.K.Sendhil	payments	10236e8a-750a-42db-8e35-1b04e09b5d69	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-22 16:34:41.499791+00	f	\N	\N
69535360-35d6-4e04-bc2a-0e507f0c4781	loan_repayment	1000	Loan repayment from Vasu (iyyar)	payments	371fe285-5267-45ef-a3cd-fc40210a33f6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-22 18:03:39.581181+00	f	\N	\N
56b576ac-789e-47d0-8b6c-0a591fa8047e	loan_repayment	500	Loan repayment from Karthi.Suba	payments	ad14375f-4d76-4d1d-85ca-07cdda7fa541	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-22 18:04:18.769419+00	f	\N	\N
5b4cd056-ce44-4002-a7b6-3353d424e4ba	loan_repayment	500	Loan repayment from Shankar.ilaiyaraja	payments	a138e61c-5ad5-42e5-b93a-fc7c11d90104	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-23 05:08:30.305145+00	f	\N	\N
fc6bdb9e-6202-4c66-9923-a2556b80406a	loan_repayment	300	Loan repayment from Selvam.Ration	payments	62908e8c-ebbc-4d3e-9936-7f2cbabe8411	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-23 07:38:42.285958+00	f	\N	\N
d52ccd90-6afa-44dc-910d-712cccae1758	loan_repayment	600	Loan repayment from Prathaban.R.O.Water	payments	5c53aad3-7c84-4d47-85c6-e8f0c5b1cfba	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-23 07:51:18.580957+00	f	\N	\N
48b8bfa0-7de3-4e20-be3e-03470a0f1821	loan_repayment	500	Loan repayment from Anitha	payments	49892609-a554-469b-8713-3b5bd088d872	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-23 07:51:37.902475+00	f	\N	\N
aac7e439-ff5e-4dbf-8281-3aef499151ad	loan_repayment	500	Loan repayment from Stella Mery	payments	af0ace36-b834-48aa-b137-4fafa06e7e4a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-23 07:52:11.415009+00	f	\N	\N
1d54b301-9fb5-475f-87ef-4df17f2a14b4	loan_repayment	1000	Loan repayment from Loganathan.DMDK	payments	249d8fd3-8dd1-4750-b1c7-0c6607daacc1	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-23 13:27:59.940782+00	f	\N	\N
ecf96d37-58c0-477a-94df-4880c62cda26	loan_repayment	100	Loan repayment from Kumaran.E.B	payments	17b6c9d9-ab8f-4e74-9748-fd47182488c9	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-23 13:28:32.986869+00	f	\N	\N
7555377b-0fb4-4b5d-8439-835c6bc6e71c	loan_repayment	250	Loan repayment from R.Murugan(Auto)	payments	31f290c4-9b1a-41a7-9cb7-05db88e614a5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-23 13:28:56.346373+00	f	\N	\N
d19b26e6-5465-4bdf-ae06-eeb2626dd57a	loan_repayment	900	Loan repayment from M.Ramesh	payments	d3a47515-b410-44e9-ac64-e4b0395a38e3	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-23 14:17:34.227056+00	f	\N	\N
fb36afb5-97cf-470d-8cab-701cb2b88c5e	loan_repayment	500	Loan repayment from S.Murugan.(Sekar)	payments	46d91f08-a0df-474f-80ee-4d924852ada3	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-23 14:18:07.844985+00	f	\N	\N
de17e4d6-7f6f-4212-8ce7-30fad15c1805	loan_repayment	500	Loan repayment from Bhavani (Vijayakumar)	payments	ac6dbdbe-944e-4ad1-ac42-ae6bdbfd6684	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-23 14:18:25.204841+00	f	\N	\N
a5e66ee8-3c60-426e-b931-04cded8bbac7	loan_disbursement	51000	Loan disbursed to Vinoth.Munusamy	customers	9a636e37-de02-451a-981d-4bf513dce4eb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-23 14:47:42.316208+00	f	\N	\N
5f64d91e-4e80-445a-a99e-4de7ddfc8070	loan_repayment	500	Loan repayment from Varanasi.Ayyer.	payments	104018d6-111a-4b55-a37d-b52891f4f73f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-23 15:03:45.8488+00	f	\N	\N
870f2a58-6123-4328-88ea-fd805ba03e2a	loan_repayment	200	Loan repayment from Rubini	payments	080a46ad-b19f-410e-9886-54cdff2f6e1d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-23 15:17:57.490165+00	f	\N	\N
59db75d6-28af-4b5f-9062-f36f4b1a0aeb	loan_repayment	200	Loan repayment from Vengatesh.Mec	payments	b9f41895-9d8d-4b63-ac91-12fd2c5a161d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-23 15:18:21.759279+00	f	\N	\N
501f1811-0b01-4dd5-90ad-280599ae910d	loan_repayment	500	Loan repayment from Karthi.Suba	payments	b672d21f-ed2c-4112-ad40-69f414f46bcd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-23 15:18:47.825514+00	f	\N	\N
73a853af-69ca-48cf-a912-81d9adf874f6	loan_repayment	200	Loan repayment from Rajaselvam	payments	02d2dde3-628c-4b90-a78a-2bafae436fcf	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-23 15:19:11.907638+00	f	\N	\N
e1835941-00c4-44fb-92a5-8edd0d8ec1e8	loan_repayment	500	Loan repayment from Vijaya	payments	e3849104-79f5-4f52-a117-ae3325a25fa4	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-23 15:27:56.527741+00	f	\N	\N
884f0958-67ac-45ca-a9cf-3b1d984c5348	loan_repayment	200	Loan repayment from Pandit	payments	ca4f50b5-6075-4107-86a8-ab99583cc13b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-23 15:37:43.793681+00	f	\N	\N
eece9f4e-8fbe-434a-8573-ccf5919b3301	loan_repayment	600	Loan repayment from Ramesh(Pori)	payments	50775378-ecc1-4154-8e85-4db2cac056c9	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-23 15:38:21.900643+00	f	\N	\N
8b094b24-6b30-49d8-a3f1-5f9251b4d5f3	loan_repayment	400	Loan repayment from Lakshmi.(Tiffin)	payments	330e8a9c-4447-46ad-9d3d-9abada35a8d9	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-23 15:38:47.830711+00	f	\N	\N
ededa5df-569c-4a75-b7a3-0144e0c2d4fa	loan_repayment	100	Loan repayment from Divya (poo kadai)	payments	d302bb04-cc7b-4646-9ca0-50800009ca6e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-23 15:39:07.940254+00	f	\N	\N
fdd61271-28be-4063-8435-e3df12cb7053	loan_repayment	500	Loan repayment from Uma (Elumalai)	payments	e989836d-b59e-496b-bc0c-a28f753838dd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-23 15:39:54.362022+00	f	\N	\N
1557bbb8-0a61-4ee9-bda9-4e92a16ee275	loan_repayment	700	Loan repayment from Chandran.(Malathi)	payments	b85c0ad8-b282-4ba0-b939-0597c2d23840	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-23 15:40:10.766299+00	f	\N	\N
ebb85866-03d9-4b44-a2f1-f7fb27787a6b	loan_repayment	300	Loan repayment from Ramanathan(Soop)	payments	fb97ff57-bc41-4b78-b657-00a00c87e23c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-23 15:40:34.462406+00	f	\N	\N
18a17714-57fb-4a4a-8547-caf8596ad414	loan_repayment	200	Loan repayment from Jaffer	payments	5f409fe3-7b4d-4cc8-95af-775f2ad154fb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-23 15:41:02.413866+00	f	\N	\N
68dc5a7a-c6d3-490b-8c17-643499d0f1f5	loan_repayment	600	Loan repayment from Kumaravel.megic	payments	e454c8b2-fe8a-424b-8725-56095200bdd2	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-23 15:41:24.991517+00	f	\N	\N
8cee5db2-b452-434f-bf7e-a6e4f533ef7d	loan_disbursement	42500	Loan disbursed to Dhanush Kodi	customers	651c7fb2-68bf-46d8-bf93-3f25bf5c8dab	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-23 15:56:43.427686+00	f	\N	\N
ccc223df-08b3-47a4-b60a-8b06fde0899f	loan_repayment	400	Loan repayment from Sriman	payments	76e26bf0-3ee9-4eb2-958d-ab0d113a268c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-23 18:22:35.777224+00	f	\N	\N
8b5bd1a8-7693-4e26-b385-16e67f50ecce	loan_repayment	200	Loan repayment from Balamurali (sekar)	payments	48ee6ac8-9db1-44c3-8f3d-f5af8481d97e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-23 18:23:06.932365+00	f	\N	\N
e6873e57-2ae4-4843-af19-1938b4311a01	loan_repayment	1500	Loan repayment from Thangapandy	payments	b8414a6e-6fc5-4cd1-b973-8fd4940c4335	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-23 18:23:45.384359+00	f	\N	\N
3ba926d0-b0a0-4594-a6d3-d37e62a3a379	loan_repayment	400	Loan repayment from Karthikeyan	payments	26014c2b-7569-46de-98e2-3e0d18a14b0f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-24 02:13:39.886136+00	f	\N	\N
faa75d6c-7391-4c47-a8bd-454848d40698	loan_repayment	600	Loan repayment from UMA.(Teacher)	payments	aa028eee-e58b-4c1a-9e16-74c58a94be93	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-24 05:16:41.482265+00	f	\N	\N
bd7e95eb-9b9a-471c-8e1a-67fdb6e43949	loan_repayment	900	Loan repayment from Ramesh.Megic	payments	ea3afea6-e42d-42a7-84a7-bae74a418f5b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-24 05:17:34.011973+00	f	\N	\N
c85ebc0d-c74e-4daf-9421-637bc97bc504	loan_repayment	1500	Loan repayment from Gokul (Magic)	payments	04651c0e-d160-4182-a5b2-8f371bcd4e80	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-24 05:18:03.079867+00	f	\N	\N
7a76f875-6b01-4ada-a57d-ae12b2a64f9d	loan_disbursement	4250	Loan disbursed to Sathish (Piller) V,C	customers	d11d1904-a5c2-4fd5-8ebc-c800d6ced0b2	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-24 05:50:55.827307+00	f	\N	\N
dda25cca-54d8-4ce1-803d-623050cebd86	loan_repayment	3000	Loan repayment from Baai ( Thaadi )	payments	846be268-f6f8-4758-b87a-c1fedad7f895	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-24 06:35:28.177257+00	f	\N	\N
b8a28d1b-a773-4551-9d8d-0c6ed00d7264	loan_repayment	300	Loan repayment from Selvam.Ration	payments	e0f9817c-f658-4465-9ef3-971be5e04c66	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-24 07:43:31.170756+00	f	\N	\N
63c00bf5-eb53-42a7-9e1e-fb2368417beb	loan_repayment	3000	Loan repayment from Thangam.Akka	payments	0d3397fb-e0b9-4d83-8e22-f57bf0ab9e1e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-24 07:58:09.300339+00	f	\N	\N
3273f7d2-9b9d-48ea-b40d-832b0d9474c1	loan_repayment	4000	Loan repayment from Brijesh	payments	15b7e0d8-40ae-44e6-a0b6-7104cd1d01cf	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-24 13:09:37.366009+00	f	\N	\N
daca78be-392a-4591-9699-81860b722060	loan_repayment	500	Loan repayment from Anitha	payments	e7939cc6-9e50-49c3-82a9-1e82cac639ef	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-24 13:10:02.896712+00	f	\N	\N
16767043-20f3-4cff-9ea5-0aefdd259d9a	loan_repayment	600	Loan repayment from Vinoth.Munusamy	payments	70b60340-1019-4f58-a4e6-919543bd80ea	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-24 13:10:34.108119+00	f	\N	\N
332c9f89-edec-4e67-8862-937c39843b09	loan_repayment	500	Loan repayment from Stella Mery	payments	845751f3-5183-4841-ace8-600506341e71	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-24 13:11:37.530961+00	f	\N	\N
41001c5a-1c05-4a75-b3db-682f78a075c1	loan_repayment	400	Loan repayment from Veeramani (vaiko)	payments	2f3da0a1-ce00-46e9-84a7-d1aefd12f5c8	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-24 13:42:58.709476+00	f	\N	\N
9cd4d14a-72c0-48fd-be01-0a24eaf89652	loan_repayment	100	Loan repayment from Kumaran.E.B	payments	d46abeb5-f989-4c85-9b01-d6a1c849da32	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-24 13:43:22.473126+00	f	\N	\N
0c27ae83-fe8e-4f34-b11d-54d25251b728	loan_repayment	200	Loan repayment from Rubini	payments	e7284654-718d-4ce2-8c03-a5e5084813c0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-24 14:19:07.346946+00	f	\N	\N
19314667-a78f-4519-82e7-4e29a8c2afc6	loan_repayment	200	Loan repayment from Jaffer	payments	d6567c00-84f9-490f-a527-1dbc43071709	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-24 15:06:29.205153+00	f	\N	\N
350f2f0e-76d2-498f-93fc-095e91b0dffa	loan_repayment	100	Loan repayment from Divya (poo kadai)	payments	fdf0b9af-97eb-4fa7-9f50-d47e93225298	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-24 15:06:52.545638+00	f	\N	\N
6f886096-1dba-4c3f-a632-129c0e824b0c	loan_repayment	500	Loan repayment from Uma (Elumalai)	payments	2d5ee989-6eef-445a-92f6-9895b52656f2	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-24 15:07:42.132318+00	f	\N	\N
8e1976a1-6e8e-468d-a2ae-7505d6e4fef1	loan_repayment	300	Loan repayment from Ramanathan(Soop)	payments	afff9397-7570-4318-b1b7-88c042880f83	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-24 15:08:07.713141+00	f	\N	\N
d816c50d-c364-44aa-9e55-7f4414482fd3	loan_repayment	700	Loan repayment from Chandran.(Malathi)	payments	9c81d5a1-8f6e-482f-9874-b954a8d0583b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-24 15:08:29.21775+00	f	\N	\N
10df290e-1d9c-4b0f-b950-ef852416a4b0	loan_repayment	100	Loan repayment from Ajith	payments	67c7a3c6-fe21-4e39-b89e-dcb2cf9826ef	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-24 15:09:47.57436+00	f	\N	\N
f92cac25-b4cb-495f-a528-0cc1e31df184	loan_repayment	500	Loan repayment from Dhanush Kodi	payments	02509e5a-efa8-4bda-bd49-9b5a0b5c59da	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-24 15:11:28.581824+00	f	\N	\N
9e4505c4-c72d-4b5d-a890-e93aee85b511	loan_repayment	250	Loan repayment from R.Murugan(Auto)	payments	dfa1b9b2-72de-40a3-96e7-6085d09c0d4f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-24 15:17:14.354783+00	f	\N	\N
4c0d81cb-fa8f-43b9-b955-17b00cfbb2c4	loan_repayment	400	Loan repayment from Sriman	payments	af237246-c9da-42ac-91ab-a4396a2def14	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-24 15:37:57.154945+00	f	\N	\N
f2ea8bfa-9f79-46f8-9ae3-c2aced9325d8	loan_repayment	500	Loan repayment from Iliyas	payments	ae859795-9035-4cd5-a667-21afd197cd26	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-24 16:08:53.411256+00	f	\N	\N
51b16e5f-4217-40bd-8055-bd9a88898877	loan_repayment	500	Loan repayment from Karthi.Suba	payments	4c84c80f-50fd-43d1-a3b3-9255d9441271	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-24 17:40:26.725559+00	f	\N	\N
8bdf7ac9-7a38-4b84-bedf-2fd929238514	loan_repayment	200	Loan repayment from Vengatesh.Mec	payments	1ad417a0-684c-42ca-9178-c100adf00482	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-24 23:28:48.757385+00	f	\N	\N
96dca8b0-c16a-48c5-91ae-9cb6794cbc2e	loan_repayment	1500	Loan repayment from Thangapandy	payments	95943292-2c34-4658-b038-a87637b2e2b7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-24 23:29:42.528905+00	f	\N	\N
488f1517-e717-484f-9b83-9707b44ac881	loan_repayment	1800	Loan repayment from Manipaul	payments	076a33e2-c249-46ab-90de-95b2459b3c90	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25 05:05:53.137801+00	f	\N	\N
78c64c8a-0aa7-4e5e-a81d-436fb0777d16	loan_repayment	300	Loan repayment from Selvam.Ration	payments	346f3bb9-cf4f-4c21-860b-83c7c0aa4e35	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25 13:19:03.193339+00	f	\N	\N
6f6d1e1b-39c4-4ee2-a421-45a03150706e	loan_repayment	150	Loan repayment from Sathish (Piller) V.C	payments	b55f9246-7633-4b7c-8d1e-10ca0346cb7b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25 13:43:19.289448+00	f	\N	\N
0751fb9e-cd12-4a8f-9a51-ad41cd6d9b34	loan_repayment	200	Loan repayment from Magesh(mec)	payments	14ae9b82-82b4-4a78-81ff-a4ca2e53da1f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25 13:51:30.809822+00	f	\N	\N
4fc72396-3eb2-4a11-af69-c871650520c1	loan_repayment	300	Loan repayment from Udhayakumar(Sekar)	payments	2a1e3f34-c8b8-40e4-b1d3-7d67de54276c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25 13:52:45.383285+00	f	\N	\N
f13d077d-e2f2-4f8d-ad92-f5453cf50723	loan_repayment	500	Loan repayment from Anitha	payments	a543c4e0-1c91-4db5-a645-60b87b3965fd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25 14:09:20.390837+00	f	\N	\N
2a8c1516-832d-4f74-a3b9-9681b53687bd	loan_repayment	1500	Loan repayment from R.Kumar (Yazhini)	payments	b8a9de08-c6b2-4bc5-9d57-138697d51d21	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25 14:09:42.302512+00	f	\N	\N
f7000808-76b0-41e6-9400-5a2fe6dbfa8b	loan_repayment	100	Loan repayment from Kumaran.E.B	payments	92f71386-acab-4fb3-9f64-2fc1b2bf10c5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25 14:10:35.44471+00	f	\N	\N
ed005485-be66-462e-aeb2-56946db6533a	loan_repayment	400	Loan repayment from Sriman	payments	14f37e0c-979b-4b12-b396-eab6adcc8bc6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25 14:11:03.637669+00	f	\N	\N
85da40dc-d3fc-4ccc-b280-aebbbd9240cf	loan_repayment	600	Loan repayment from Vinoth.Munusamy	payments	83788520-ae16-442e-8445-e5d4c6907176	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25 14:11:28.838207+00	f	\N	\N
5e8269c2-4933-462c-8fd2-0cd317037174	loan_repayment	400	Loan repayment from Balamurali (sekar)	payments	7ca63ef3-28ae-4256-b0ab-1decee8b2c8a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25 14:11:56.665433+00	f	\N	\N
6afa7d47-4dbc-469f-a288-e080ecc38776	loan_repayment	250	Loan repayment from R.Murugan(Auto)	payments	66170a83-907e-4d0b-9039-98589aebc339	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25 14:12:26.034177+00	f	\N	\N
ca872b0a-4efb-42f6-a49f-2ec383c11c89	loan_repayment	600	Loan repayment from Sudhagar	payments	9cd30e76-5cb9-4f6d-941a-99611f6495cd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25 14:12:52.050689+00	f	\N	\N
06790da7-ece5-41e5-b5b0-5a46d26eb69a	loan_repayment	1000	Loan repayment from E.Saravanan	payments	2da746db-c554-408c-9c29-226d995f611e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25 14:13:17.644132+00	f	\N	\N
02985c7b-57fa-47e2-ae32-0bffd42d1ce1	loan_repayment	500	Loan repayment from Hamsa	payments	08d101d2-5020-4e38-ab1d-0559996def7b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25 14:13:35.527455+00	f	\N	\N
26d978c2-e704-4cd6-a6fc-7ee37d459f66	loan_disbursement	8500	Loan disbursed to Paramaguru	customers	790d3d01-21ef-4976-82d4-af3adacb886c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25 14:16:19.717319+00	f	\N	\N
6881bf5c-283d-4d09-bb18-db6a66483757	loan_repayment	500	Loan repayment from R.Gopi (Auto)	payments	e7c9f0c1-95fa-40cf-adeb-887a9458c0f1	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25 14:24:18.801031+00	f	\N	\N
543cd57a-9b2b-4275-9565-04778cf2aaf6	loan_repayment	1200	Loan repayment from Teja	payments	fd3e8e5c-e5b0-48bc-9ec3-ff08921db00d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25 14:27:09.819046+00	f	\N	\N
36d156cc-df14-4237-8f17-c171219d5fc2	loan_disbursement	8500	Loan disbursed to Parthasarathy	customers	ea7436e5-3b5c-49c8-87e4-6d727b2c2e50	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25 14:35:57.42204+00	f	\N	\N
0817c337-a672-4ac9-be8b-efd336363a1a	loan_repayment	400	Loan repayment from Pandit	payments	ee61c717-28ef-433b-b09a-9dfa1ff8776f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25 15:15:49.283422+00	f	\N	\N
f143dc5e-d58b-46c6-be1a-e6829970eb6c	loan_repayment	100	Loan repayment from Divya (poo kadai)	payments	538dead3-d602-4cd6-8944-6b8edd34c7ff	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25 15:16:10.135834+00	f	\N	\N
7facc288-40f7-4734-b461-a607afe54677	loan_repayment	400	Loan repayment from Lakshmi.(Tiffin)	payments	53f743cb-8673-4b8b-b99d-e30f6ce3fb92	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25 15:16:33.741895+00	f	\N	\N
80afeae3-1672-4e19-b1a1-388b1a75001c	loan_repayment	300	Loan repayment from Ramanathan(Soop)	payments	7a032445-bb65-47af-ad44-feafe68291f3	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25 15:16:59.874968+00	f	\N	\N
9612b64d-4fd3-4f77-99f4-3747ec701f5c	loan_repayment	200	Loan repayment from Jaffer	payments	66006242-66d0-44cd-a288-c658887020d4	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25 15:17:18.338733+00	f	\N	\N
d4b13cfc-0b85-4af7-a96f-39294efa8e52	loan_repayment	600	Loan repayment from Kumaravel.megic	payments	6d03e90b-c8de-4841-bcf2-345620d64fbd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25 15:17:38.74337+00	f	\N	\N
86d401d1-40cb-44e5-beea-168bb12a2fdf	loan_repayment	500	Loan repayment from Karthi.Suba	payments	7bf0a0de-2c0b-4939-8700-decb56f45e07	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25 15:24:23.039668+00	f	\N	\N
3ee200a0-8fe5-43fe-9a1d-8b665ebbe029	loan_repayment	1000	Loan repayment from Chizhyan. DMDK	payments	32f8032f-1ca8-4258-bc52-e3c32f5a42db	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25 15:27:38.703797+00	f	\N	\N
f08c096b-2040-4955-9d15-fa4d47dbf950	loan_repayment	500	Loan repayment from Bhavani (Vijayakumar)	payments	bceee938-d226-4f47-ab02-309df72c2eea	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25 15:53:20.73754+00	f	\N	\N
f25fc35e-c3d6-4643-b74f-f6f13f40557c	loan_disbursement	42500	Loan disbursed to Raju.F.C	customers	2ff85cab-09cd-4175-94ce-d7ccba40ae21	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25 15:55:18.460529+00	f	\N	\N
821ed5eb-2425-4cf6-b4a5-92fb3c1688fb	loan_repayment	400	Loan repayment from Karthikeyan	payments	6f096700-dc8b-448c-b935-54cd5431bf09	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25 16:07:56.867175+00	f	\N	\N
2e24531f-759c-401d-b8b2-e28e4f774d7a	loan_repayment	500	Loan repayment from Dhanush Kodi	payments	87dd8234-925c-497d-badc-18640abf5b23	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25 16:44:38.753232+00	f	\N	\N
04f573df-0d0a-40b8-a2cd-e4e440e45d9b	loan_repayment	300	Loan repayment from Ramesh.Megic	payments	08d07610-48c6-4205-a1d8-682f178a8727	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25 16:45:10.362559+00	f	\N	\N
def46234-e3e7-4b9e-a6f3-2a688b9acc73	loan_repayment	1500	Loan repayment from Vasu (iyyar)	payments	8c915b67-bd75-4182-b828-8c9052708d61	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25 18:20:44.666223+00	f	\N	\N
0dea5900-96e4-4a3c-8edd-2cecfed064ac	loan_repayment	400	Loan repayment from N.Manikandan	payments	c49e377a-76e1-4dcf-99bb-4cc214304a8d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-26 01:00:15.055893+00	f	\N	\N
7f60745f-674f-4f29-97bc-a7830d27b665	loan_repayment	300	Loan repayment from Hari(Arvind)	payments	7daea1bf-01c3-44bc-b1e5-e80b42435fd5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-26 06:34:22.630265+00	f	\N	\N
2adbd3bd-6cb5-45f7-b48f-1f4cc35ede08	loan_repayment	300	Loan repayment from Selvam.Ration	payments	520c0bd7-6148-49a9-b70e-fc1fd16bcbb3	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-26 13:09:16.764572+00	f	\N	\N
7cab906e-3354-4ecc-9662-0ce3750e39c8	loan_repayment	1000	Loan repayment from Ramya(Murugan T kadai) 	payments	813d3bb0-45da-4435-a8a5-c3582eaa4b93	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-26 13:09:48.319996+00	f	\N	\N
9686e361-ccf9-47c4-82e1-f53cd634d1d9	loan_repayment	300	Loan repayment from Murugan(mec)	payments	fac9cc7d-8f23-4a2d-91d3-05a0fbb474cd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-26 13:10:09.001145+00	f	\N	\N
337853a7-c0fa-45bd-97fc-737ac1a3f94d	loan_repayment	1000	Loan repayment from Varanasi.Ayyer.	payments	0c8951c7-9d39-4cf4-8a60-fa72c8d98bd0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-26 13:23:25.545732+00	f	\N	\N
bf0375b0-5f92-428a-9822-bf18fa0416db	loan_repayment	600	Loan repayment from Ramesh.Megic	payments	2f52cdea-a890-477c-b531-967edfbd6adc	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-26 13:24:42.987529+00	f	\N	\N
e8a939f9-085d-4543-b810-0e904a177f4b	loan_repayment	600	Loan repayment from M.Ramesh	payments	4622ea62-e079-4750-ace8-f588a9876b6c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-26 13:25:26.111106+00	f	\N	\N
10b3f040-9835-4d37-a768-d75204311abb	loan_repayment	150	Loan repayment from Sathish (Piller) V.C	payments	9c592890-7884-4a2a-8668-65cb3aa39bd2	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-26 13:26:01.935498+00	f	\N	\N
ca3d9724-2703-4d6a-aab4-643de1caba0c	loan_repayment	200	Loan repayment from Balamurali (sekar)	payments	824bc39d-0738-427e-9a42-ea87b5296ab6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-26 13:26:39.305786+00	f	\N	\N
d61d9d51-a1b4-46f9-807b-4098aa3ef53e	loan_repayment	400	Loan repayment from Sriman	payments	42e9a259-6d84-4020-aa8c-f47847375dc9	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-26 13:26:57.199016+00	f	\N	\N
709228ee-b98a-4f84-a5c9-9b5ca6a78fb3	loan_repayment	500	Loan repayment from Anitha	payments	78743664-0c61-4e22-9250-45f0b842b90d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-26 14:14:42.074308+00	f	\N	\N
02e0cd11-3a9b-4a00-aee5-450525b1dc89	loan_repayment	100	Loan repayment from Magesh(mec)	payments	d5708bdb-d94d-41d2-a9aa-7c5e01f767a7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-26 14:18:48.943004+00	f	\N	\N
59942c1d-3287-4cb5-bcf4-770a1948cd86	loan_repayment	200	Loan repayment from Rajaselvam	payments	1071f031-020e-4127-a940-557a38453681	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-26 14:30:05.757197+00	f	\N	\N
6a957f36-6f35-4beb-a118-c43fd378acd4	loan_repayment	100	Loan repayment from Kumaran.E.B	payments	092b2ced-8b92-4316-a92f-4d049bf266a2	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-26 14:30:26.262578+00	f	\N	\N
61476e02-1110-4735-a5d1-4216a3f687dc	loan_repayment	600	Loan repayment from Vinoth.Munusamy	payments	47dca8cd-165d-41f9-9a15-242fbe4f5c98	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-26 15:15:49.468791+00	f	\N	\N
182e520d-ca21-4bfb-8ca1-c88d138955e1	loan_repayment	200	Loan repayment from Rubini	payments	5d2722d9-8394-401c-b53a-51bd955951e6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-26 15:16:23.725011+00	f	\N	\N
03bad459-8490-4625-8f18-e527f9cacb9e	loan_repayment	200	Loan repayment from Parthasarathy	payments	cccdd7cf-5cb3-4b38-86d7-72fc7e71e14e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-26 15:17:15.500639+00	f	\N	\N
04b6bc04-b09a-4019-91fa-8f503714e483	loan_repayment	200	Loan repayment from Pandit	payments	96aff583-71ea-4959-bf8b-fc8dcfe93ec5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-26 15:36:10.336923+00	f	\N	\N
74d0f8ff-244f-4f2d-a243-2736d667709a	loan_repayment	400	Loan repayment from Lakshmi.(Tiffin)	payments	095b9114-32c2-4efe-99c5-195eaadd3146	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-26 15:36:34.2344+00	f	\N	\N
6a6c8088-05f5-493f-abf7-0676f1bd61b9	loan_repayment	600	Loan repayment from Ramesh(Pori)	payments	f6e1cd69-65c4-45b8-8d00-bba48c871afd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-26 15:36:56.520282+00	f	\N	\N
7899b8cf-1312-415a-8141-5a4727785f2e	loan_repayment	100	Loan repayment from Divya (poo kadai)	payments	96c09814-4138-4601-aea6-fd6e00796313	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-26 15:37:16.443804+00	f	\N	\N
e02b0e9e-99d7-4e8e-aaec-11106bdc8c63	loan_repayment	250	Loan repayment from R.Murugan(Auto)	payments	eee92444-8d33-4c89-b24c-993f3334da6c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-26 15:37:37.82822+00	f	\N	\N
8943384b-e45d-49df-a3e8-97a4cbcaf60f	loan_repayment	500	Loan repayment from Uma (Elumalai)	payments	42ad76b2-d52d-4971-9a07-03d2c5a3e66e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-26 15:38:21.566583+00	f	\N	\N
5bf156b3-7cf1-4cb5-99a5-9fb6736df91c	loan_repayment	300	Loan repayment from Ramanathan(Soop)	payments	6d8f238e-51ba-43c2-ac8e-126a9700b86e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-26 15:38:44.916394+00	f	\N	\N
9e06bde1-026c-4370-9ced-1dcb6b7ed0d2	loan_repayment	700	Loan repayment from Chandran.(Malathi)	payments	384d1b51-35a6-414a-a27a-9c64487be787	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-26 15:39:03.304848+00	f	\N	\N
5af7fd62-43c2-4a9e-8bf5-b9e2c4a96bf8	loan_disbursement	42500	Loan disbursed to Maha	customers	046f033d-2013-4dbe-9ac8-947af0d1e115	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-26 15:57:49.444137+00	f	\N	\N
cdf43047-ea1c-41ba-aad8-83e0aac5d5ab	loan_repayment	500	Loan repayment from E.Saravanan	payments	4c815174-b3d1-4dd6-853b-a2f5903643ca	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-26 16:06:18.378471+00	f	\N	\N
59cac427-7def-4cfc-873e-1d294c142dec	loan_repayment	2000	Loan repayment from Varanasi.Ayyer.	payments	68637286-2a36-4224-ba3f-b7d3e6c92ba1	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-26 17:43:54.345254+00	f	\N	\N
11a3db49-7e90-499f-8d6e-7c020ef74c28	loan_repayment	500	Loan repayment from Karthi.Suba	payments	ec65c2a6-9383-4ced-96b8-386587651ec8	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-26 17:44:29.744308+00	f	\N	\N
1201e60a-f9e5-4069-9d03-bbf5149ba1cd	loan_repayment	2000	Loan repayment from Brijesh	payments	e0f48468-4397-4909-aa62-283df2ea0f4a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-26 17:45:06.71971+00	f	\N	\N
73cdd654-24cd-4310-b069-af44c0832f26	loan_repayment	800	Loan repayment from Ilaiyaraja (Auto)	payments	42274a28-781d-4044-9e55-f5807bc06e8b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-27 04:13:35.360834+00	f	\N	\N
7c1d7b6e-4f09-40f3-b4a4-c7c8ab859b5a	loan_repayment	2000	Loan repayment from Karunakaran	payments	d2cf798a-f52b-43af-a6b4-eaefb6494e77	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-27 04:14:13.035111+00	f	\N	\N
0cd83253-0b7b-4d24-8cf5-f43612a616a1	loan_repayment	150	Loan repayment from Sathish (Piller) V.C	payments	fa81124e-5bfb-4aec-98df-5829d45722d5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-27 04:21:11.4134+00	f	\N	\N
ec600385-29b4-40b7-b496-931b53071ba0	loan_repayment	200	Loan repayment from Vengatesh.Mec	payments	ef77b2c2-e2dd-4458-a197-3317f78c4643	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-27 07:15:31.131815+00	f	\N	\N
f7454497-eb70-423e-9ba3-0d460b295445	loan_repayment	300	Loan repayment from Selvam.Ration	payments	23e8c7cf-4ce4-4b39-9289-cd3b21b5875a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-27 08:00:20.202899+00	f	\N	\N
87acbaeb-3ae4-45ee-9cca-db917426a4d0	loan_repayment	1200	Loan repayment from D.Shankar	payments	a41574be-1f5c-42bb-9d9c-142f189dcdb6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-27 08:09:53.698286+00	f	\N	\N
56e0dbf5-a50c-439a-98c4-702a0cfc42c6	loan_repayment	500	Loan repayment from Anitha	payments	d3076d4d-e7a1-4bfe-85a1-1bd9de2f174b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-27 08:10:19.75357+00	f	\N	\N
dfe0eb08-074d-42dd-85aa-6a1347ee2582	loan_repayment	200	Loan repayment from Paramaguru	payments	e5d5d9b3-7945-4515-b364-fcbccac2f804	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-27 08:10:49.197565+00	f	\N	\N
9829a980-7ada-42b4-af78-a98d6f67dbe1	loan_repayment	4500	Loan repayment from Thangapandy	payments	17d7f9b0-b513-4549-a31e-891120ab0138	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-27 13:26:41.631452+00	f	\N	\N
5fd5f281-46c0-4dc2-bb18-a69e8f7bfe4c	loan_repayment	500	Loan repayment from Ramya(Murugan T kadai) 	payments	3adc1dfb-f7bf-4255-8436-1916b660ac84	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-27 14:11:53.028514+00	f	\N	\N
210fea7b-6cd8-4adb-bd20-77fed712905a	loan_repayment	200	Loan repayment from Balamurali (sekar)	payments	4157e064-5f84-4c17-82ac-fd928cb03f91	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-27 14:25:26.355794+00	f	\N	\N
6c0f9c69-d338-4aef-9390-4c0b0c5ce34e	loan_repayment	600	Loan repayment from Vinoth.Munusamy	payments	e85b3f43-074a-4002-bae2-337f6187af5b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-27 14:32:16.20842+00	f	\N	\N
e68db1e3-5a62-45df-8c02-47ba46fee0c5	loan_repayment	500	Loan repayment from E.Saravanan	payments	934dd680-89aa-4ef6-9aaf-f3fea5d5eab9	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-27 14:36:20.49593+00	f	\N	\N
eefeb974-4202-4e1a-b47f-4b5f08c65158	loan_repayment	1000	Loan repayment from Vasu (iyyar)	payments	2302cafa-f80a-49f1-ad57-ff4a7f34df01	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-27 14:36:37.2734+00	f	\N	\N
9ba025a2-1cbc-447c-b374-c726d6b87839	loan_repayment	200	Loan repayment from Rubini	payments	c241eb12-3293-446a-8d9a-783f43c5e9db	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-27 14:48:03.749581+00	f	\N	\N
56f53a2e-6ff1-4302-866f-f4ed98e03f20	loan_repayment	200	Loan repayment from Pandit	payments	20801021-f7ed-48f2-a52e-ab0dee8daa57	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-27 15:17:28.371448+00	f	\N	\N
10dc3660-01ff-4590-b9fc-a6d56cc3cb4c	loan_repayment	400	Loan repayment from Lakshmi.(Tiffin)	payments	c7c0d2bc-56e8-4cad-af8e-47b7e24e8b38	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-27 15:17:55.462951+00	f	\N	\N
1398d30f-5132-4d30-8a56-94415977b906	loan_repayment	100	Loan repayment from Divya (poo kadai)	payments	65c2630f-f1ee-484c-b918-2dc35f114712	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-27 15:18:16.66289+00	f	\N	\N
3c2d15bd-e191-4f40-8857-4e80e1a97a90	loan_repayment	300	Loan repayment from Chandran.(Malathi)	payments	d5ecd5ff-e7d1-4064-a219-d23157fdf339	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-27 15:18:34.067718+00	f	\N	\N
2c8dd228-9ac4-4688-8dcd-95f9ac0c8f8f	loan_repayment	300	Loan repayment from Ramanathan(Soop)	payments	3bc3f3dd-ad47-49bc-9ab6-4f299db9b9cc	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-27 15:18:56.582972+00	f	\N	\N
8ca4c672-6406-46f2-ad20-9e0c918d22c3	loan_repayment	400	Loan repayment from Jaffer	payments	d01d5af5-e64a-426f-b57d-381be86b5c0c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-27 15:19:14.645183+00	f	\N	\N
2f493694-45f1-4e01-ab80-6ff9df1d6a81	loan_repayment	1500	Loan repayment from Gokul (Magic)	payments	729c0fe3-f18c-4445-8eeb-9958bb64dc1f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-27 15:19:32.942864+00	f	\N	\N
f7db8527-6f50-4409-a1e7-321f191eb722	loan_repayment	1800	Loan repayment from Raja.megic	payments	d350b33e-6ad6-493f-83a2-2ec2476b451d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-27 15:20:00.233475+00	f	\N	\N
5801c556-da92-482a-bb1d-7fc792837036	loan_repayment	1000	Loan repayment from Vijaya	payments	135f7655-7c40-46ee-abc1-f6a1248c699d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-27 15:22:26.062939+00	f	\N	\N
0fd186d8-9f7c-4502-aedc-22a51db38526	loan_repayment	500	Loan repayment from Karthi.Suba	payments	62d9efae-e57f-47ea-8ba5-56c64063803f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-27 15:22:53.754571+00	f	\N	\N
6e3c11be-8b69-4682-bacd-a311c5bc7756	loan_repayment	200	Loan repayment from Rubini	payments	4f71736b-d5df-4461-a2a2-706e8e41a243	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-27 15:23:21.616826+00	f	\N	\N
de20123e-514f-4234-91dd-03e79603d5a0	loan_repayment	1500	Loan repayment from Raju.F.C	payments	b81e733f-87e2-48de-bb7e-aa4a44f9c2b6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-27 15:47:29.919741+00	f	\N	\N
e1c7f892-f217-424c-aa35-3a61e444859b	loan_repayment	250	Loan repayment from R.Murugan(Auto)	payments	008c6639-b7f2-4275-b185-7526bfd4c689	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-27 15:48:37.392287+00	f	\N	\N
87dbf2e1-84bc-4c89-aa9a-62321084c916	loan_repayment	400	Loan repayment from Sriman	payments	0d86681c-e66e-4dc7-b025-c7e42b08ec02	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-27 15:49:39.730778+00	f	\N	\N
6d5efe33-2be5-423f-b086-7aef6c1ee3e9	loan_repayment	100	Loan repayment from Magesh(mec)	payments	707315e2-7a86-475b-8026-6a54daf9fbbc	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-27 17:54:46.413168+00	f	\N	\N
4bbf8865-1843-440a-b1c6-88e09283768d	loan_repayment	1000	Loan repayment from Varanasi.Ayyer.	payments	174530c5-b771-475e-86b2-46c91b6b865b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28 06:34:50.9208+00	f	\N	\N
802372af-5c02-4b63-b086-cc242aa32b23	loan_repayment	150	Loan repayment from Sathish (Piller) V.C	payments	165f4131-37f8-4455-84aa-92e890a5b9c1	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28 06:35:25.559408+00	f	\N	\N
5b331961-d21e-4c77-8281-17ab02c99dfe	loan_repayment	500	Loan repayment from Shankar.ilaiyaraja	payments	bfe65a89-1eed-4b8e-848a-193af20ae8cb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28 06:42:53.36827+00	f	\N	\N
1b64c906-e423-4d11-9e40-b61fa3b22f3d	loan_repayment	200	Loan repayment from Sathya (Tailor)	payments	51248123-82c3-49cc-bbeb-d3e8a146967c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28 06:43:56.524968+00	f	\N	\N
a6fc119a-744b-4d67-ab1c-5dbb63c031db	loan_repayment	300	Loan repayment from Selvam.Ration	payments	1c22ae00-d7a5-418d-9ae6-ec59588b7bb5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28 07:41:20.391714+00	f	\N	\N
dfc51d9b-9e11-4248-9529-9168e0d48bbe	loan_repayment	400	Loan repayment from N.Manikandan	payments	197689b2-92ef-497e-81a9-b8eb5804f715	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28 12:34:33.83181+00	f	\N	\N
dd5a5bc7-34dc-4d9b-9793-238c816308c4	loan_repayment	500	Loan repayment from Anitha	payments	e66f01d9-94ae-41ba-a114-a113600f4c67	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28 12:34:46.132221+00	f	\N	\N
944ce4a1-24d9-47db-8972-6bead9b1d998	loan_disbursement	42500	Loan disbursed to Iqbal	customers	963ccc89-3e62-4787-ae26-1b8b908b51c4	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28 12:38:03.675525+00	f	\N	\N
78dcf91e-bd0b-46b9-879c-c8b6dec34970	loan_disbursement	21250	Loan disbursed to S.Saravanan	customers	591f4d1e-01f6-4c59-a2b0-7358e00a485d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28 13:08:44.057054+00	f	\N	\N
4b564765-cb72-4762-98d4-078b37fb25b9	loan_repayment	2000	Loan repayment from Brijesh	payments	42a1e9f7-73ea-4fe1-9a19-a17266056ff8	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28 13:31:22.578291+00	f	\N	\N
873ca3b6-62f2-483a-8390-ed24d836d4dc	loan_disbursement	42500	Loan disbursed to P.Selvam	customers	f076e587-f2c0-423c-9441-07bde93baeb3	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28 14:20:32.734268+00	f	\N	\N
e61c1c40-7cfe-45c6-93ce-bc4a0a9dd5a2	loan_repayment	500	Loan repayment from Vasu (iyyar)	payments	1839e78b-3b10-4e5c-96b6-4b2bb06ef63d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28 14:21:30.602172+00	f	\N	\N
77176575-add3-4993-8c9b-f28ed2140b0d	loan_repayment	500	Loan repayment from R.Gopi (Auto)	payments	8fcde289-e5bd-4ef0-8131-4e88175b2279	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28 14:21:51.474491+00	f	\N	\N
09d7888d-0d5d-4e4e-a5a1-6a10ea72cff1	loan_repayment	500	Loan repayment from R.Gopi (Auto)	payments	8a2bb0a1-7cbb-45ed-86a5-b96b2b16a98f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28 14:23:57.95476+00	f	\N	\N
0ce3a113-a03d-4c0c-802a-461a4a5d3129	loan_repayment	1200	Loan repayment from Teja	payments	5c816394-7327-43e0-a515-78a00d3e3bd5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28 14:36:48.228424+00	f	\N	\N
97867536-483d-4911-8c07-adf300e45128	loan_repayment	500	Loan repayment from Bhavani (Vijayakumar)	payments	894e7254-003b-423c-abba-969f857404d1	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28 14:55:40.106031+00	f	\N	\N
61da6f5e-fe81-4f21-be30-314267ec4e8c	loan_repayment	400	Loan repayment from Lakshmi.(Tiffin)	payments	11ce3ce0-751d-4ea3-9293-776eb75935cd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28 15:06:16.514676+00	f	\N	\N
5b4f5be5-87dc-4114-9fce-055df35cca64	loan_repayment	100	Loan repayment from Divya (poo kadai)	payments	b73d63d8-9a51-4320-9db5-488674cffa22	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28 15:06:38.097677+00	f	\N	\N
0b9f193b-25cb-42d6-ab25-a283f520442e	loan_repayment	400	Loan repayment from Ramesh(Pori)	payments	1d60549c-0d4c-4835-9bea-86a188cf17c2	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28 15:07:02.178037+00	f	\N	\N
6f45f227-fcc0-4505-bc04-31f2b98a8726	loan_repayment	3500	Loan repayment from Valli	payments	2dd3f4a4-cc7d-4593-bda3-1a5870e7157d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28 15:07:42.249486+00	f	\N	\N
0a7d09b1-4885-47f1-a9fe-6792b4f2be69	loan_repayment	200	Loan repayment from Pandit	payments	cee7d033-f10a-44e9-94c9-14dfbdf6787d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28 15:08:07.843428+00	f	\N	\N
cf19050b-b452-44ce-b606-d710f2627259	loan_repayment	700	Loan repayment from Chandran.(Malathi)	payments	c7d01469-8a16-4330-a857-85b41e6eecfe	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28 15:08:29.334558+00	f	\N	\N
97341158-12e2-4cdd-a160-6b31f762759f	loan_repayment	300	Loan repayment from Ramanathan(Soop)	payments	4aff9906-9d90-4cc6-a8d2-cfff50f85eca	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28 15:09:16.656166+00	f	\N	\N
797f5124-c0c2-41eb-a7cb-77cf93d4c46a	loan_repayment	200	Loan repayment from Jaffer	payments	1a338952-b9d4-4c35-937f-9bf71fbcf176	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28 15:10:00.074406+00	f	\N	\N
5bfa99be-01e5-45de-85db-995c93b1fcd0	loan_repayment	2000	Loan repayment from P.Mariyappan	payments	d26c98be-36a7-4042-a458-828d2eaf4614	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28 15:14:49.364835+00	f	\N	\N
d47f3fae-d35b-4adf-81ea-566e7b886289	loan_disbursement	25500	Loan disbursed to Sheela	customers	5fecec3a-5262-4cfd-8464-57abf6fd6c0c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28 15:22:48.952024+00	f	\N	\N
5ca8d6a0-ebac-453f-944a-22fba5ddd692	loan_repayment	500	Loan repayment from Vijaya	payments	5f7ff5d8-1b56-4e54-bcc9-9b3b351884a0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28 15:27:50.794436+00	f	\N	\N
16ad5b15-a3a0-42d2-9828-70c517fc2de7	loan_repayment	300	Loan repayment from Parthasarathy	payments	1b1c2e12-2878-4148-8adf-67c429581683	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28 15:52:43.825617+00	f	\N	\N
ec5daf60-9963-4a06-96b1-fb0f20926b28	loan_repayment	250	Loan repayment from R.Murugan(Auto)	payments	7f413869-ab92-4209-92cc-4c9c7e71d6c8	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28 15:55:27.438361+00	f	\N	\N
a20bb588-1712-443d-8b03-0ab034e95f22	loan_repayment	600	Loan repayment from Vinoth.Munusamy	payments	5f6901fe-d934-42af-bac4-f859982f6860	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28 15:56:31.891028+00	f	\N	\N
5d691d1d-a0f7-4f57-b902-a7d81ee8150d	loan_repayment	3000	Loan repayment from Rajagopalan	payments	dec6dcd5-6868-4ada-b481-f0e0dbec958a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28 16:05:32.845113+00	f	\N	\N
5cd9ebb6-a238-4080-870a-40cfd5c0968d	loan_repayment	200	Loan repayment from Kumaran.E.B	payments	2f3461d4-d620-43db-b1d4-48e3f8f809f3	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28 16:05:48.304094+00	f	\N	\N
417e090f-0d0b-4cbc-9b7a-c9d17a52485f	loan_repayment	800	Loan repayment from Karthikeyan	payments	65c79ce3-4707-47e2-a2a2-02201b20c99c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28 16:13:24.083343+00	f	\N	\N
886a86cc-ac71-4aa6-ae89-c00e11d17e13	loan_repayment	500	Loan repayment from Karthi.Suba	payments	0379626e-1986-483c-8acd-85f63107ee7b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28 16:13:46.205741+00	f	\N	\N
eac6e009-a971-4c55-a7ae-02a27f9275a8	loan_repayment	200	Loan repayment from Rubini	payments	6553f88a-67f6-4f96-9805-35614269b2b9	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28 16:20:11.949542+00	f	\N	\N
7bd65e65-f59d-4c12-a6a2-426c57cc3324	loan_repayment	1500	Loan repayment from Thangapandy	payments	c3e7c2fb-7893-4048-b379-603ebca1a64e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28 18:17:50.232378+00	f	\N	\N
68399b01-39ef-4831-bd18-17b9461e7492	loan_repayment	1800	Loan repayment from Baai ( Thaadi )	payments	c76b9445-32ed-4d6f-8e74-a40735ca161e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-29 14:45:00.969204+00	f	\N	\N
3de36677-c7e8-4d83-a1cb-a616377987a5	loan_repayment	200	Loan repayment from Iliyas	payments	00a509e3-b5b5-49c9-9b99-6fa2bde8dd2b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-29 15:16:46.48241+00	f	\N	\N
106e4dd5-2399-4a29-bfff-2192d4c883ab	loan_repayment	100	Loan repayment from Divya (poo kadai)	payments	4bb2e2a7-96d2-4eaf-a4dd-fe98e046f500	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-29 15:28:31.668452+00	f	\N	\N
f1d87536-80d4-449f-8e10-3381ba282bea	loan_repayment	200	Loan repayment from Pandit	payments	c8e4add4-7258-47b6-82ef-76105cb21acc	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-29 15:29:02.86612+00	f	\N	\N
4e2fc0f3-79be-46f6-a1bd-47d1041bf811	loan_repayment	300	Loan repayment from Sheela	payments	3bfcc8c4-bc05-4d4e-a7e5-ea454c93ce31	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-29 15:29:31.231301+00	f	\N	\N
11f68910-0aee-46e1-8716-7dfcee8842d4	loan_repayment	200	Loan repayment from Rubini	payments	7b520306-0b22-4dbd-9a4d-4a9573e17cd1	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-29 15:29:57.354049+00	f	\N	\N
d12cbcec-d47f-4727-8054-0f85a8445f2e	loan_repayment	400	Loan repayment from Lakshmi.(Tiffin)	payments	b3602212-a689-4966-8364-380a9bd9be84	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-29 15:33:09.228672+00	f	\N	\N
7b8ac865-561e-412c-8ed3-9bd677250c0c	loan_repayment	2200	Loan repayment from Manipaul	payments	5ac3eb03-c530-4ee5-aab6-f2343e48c86f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 05:16:18.899581+00	f	\N	\N
e67b80c2-d199-4ccb-8350-aa64688baf3f	loan_repayment	1000	Loan repayment from Stella Mery	payments	584a8123-e917-42df-aef6-37f8b76975bf	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 06:45:19.399647+00	f	\N	\N
24b9d9fa-4537-457a-a2d7-a89e661b1c3f	loan_repayment	500	Loan repayment from Anitha	payments	b2e160be-135d-4dcb-8383-1192f3bd51d5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 06:45:40.712085+00	f	\N	\N
e137f402-be80-4e17-b5dd-8964dbd00b1d	loan_repayment	150	Loan repayment from Sathish (Piller) V.C	payments	54456e77-2ec0-4954-9817-2c8489ba9f3e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 06:46:16.082136+00	f	\N	\N
71492d6d-f1b6-473f-b1d5-7a10e5273b9a	loan_repayment	1000	Loan repayment from Nandhini	payments	8b46ec2d-414b-4c1c-b863-4f64cc62e6ef	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 06:46:54.41968+00	f	\N	\N
58c9f944-5c07-4786-a704-403be352c661	loan_repayment	250	Loan repayment from S.Saravanan	payments	67ced17e-a5ea-43f7-9ca9-8485014e8541	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 06:47:22.46145+00	f	\N	\N
b057b303-d5ee-4ebe-8f95-ef177776fbb5	loan_repayment	1000	Loan repayment from Rajesh ( Elc )	payments	f13e05a3-60fc-452f-88b4-fda5b7e6935c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 06:47:50.434778+00	f	\N	\N
5c234003-34f6-43d7-8fca-205af7b9d92e	loan_repayment	1000	Loan repayment from Brijesh	payments	8db22ce5-3393-43af-864e-c99fc1c342f1	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 06:48:24.119466+00	f	\N	\N
a25cfc58-d88e-45a8-bdbf-c10020e14859	loan_repayment	500	Loan repayment from R.Gopi (Auto)	payments	3330ea96-828b-4251-9a0d-5c87679eea4a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 06:48:48.921814+00	f	\N	\N
bb1e3781-500a-4f38-ae96-dd63de8422f1	loan_repayment	500	Loan repayment from P.Selvam	payments	c791250f-b998-4639-b1f8-6108c7a8023a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 06:49:16.932021+00	f	\N	\N
2e453a30-5b2d-4ce2-ab8a-611c1181c0e9	loan_repayment	400	Loan repayment from Veeramani (vaiko)	payments	a4e03e71-9be8-44a0-8cef-bc229f1e832a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 06:49:37.849348+00	f	\N	\N
f963bde0-7d8f-4a48-bb4b-713d53b9e785	loan_repayment	500	Loan repayment from Vijaya	payments	71b2f5bd-789d-4f43-a237-b10dd142b6f7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 06:50:01.933755+00	f	\N	\N
34ec4689-f126-4b12-8ac3-26486d17d301	loan_repayment	150	Loan repayment from Ajith	payments	80602b59-9c97-4681-ad2b-ec23626eb7bc	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 06:50:23.212753+00	f	\N	\N
90f18a4d-8f61-4d87-a3b1-42fcf4da355b	loan_repayment	500	Loan repayment from Vasu (iyyar)	payments	648a12c2-e2c7-420d-a510-db8e4e25685d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 06:50:56.119148+00	f	\N	\N
55be50bc-5636-4cff-886e-c620abde2625	loan_repayment	300	Loan repayment from Selvam.Ration	payments	2a5de140-94ce-4dd9-9e8c-90059c191318	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 06:51:42.782583+00	f	\N	\N
e3b05a4e-5d99-416e-9d76-fb3e8cffc0df	loan_repayment	500	Loan repayment from Maha	payments	658c1ea5-33ef-4256-9dbe-d0e143fc9fb2	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 06:52:04.163913+00	f	\N	\N
c98188b2-091c-4ccc-ad9b-e9d574db8451	loan_repayment	250	Loan repayment from R.Murugan(Auto)	payments	945b205d-c30a-4e0f-9e15-896892cd8e5f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 06:52:35.276619+00	f	\N	\N
1eae0edd-ef8a-4f57-bc86-e5de756c52a3	loan_repayment	500	Loan repayment from Karthi.Suba	payments	eb31d94a-f320-4e2a-a5f5-12276e5bc911	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 06:52:57.811916+00	f	\N	\N
3b9c2d3a-3a31-4013-a794-704bc2a76bc6	loan_repayment	2100	Loan repayment from Sendhil (Sathiyanagar)	payments	c7019492-6abd-4e5f-b679-7d295c053b5c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 06:54:42.853868+00	f	\N	\N
dda5dab6-5447-4ee2-9fb0-3a74cd544c91	loan_disbursement	42500	Loan disbursed to G.vengatesh	customers	2a8f0801-a95d-49fb-a6a0-f9a9a84c463b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 07:22:11.891379+00	f	\N	\N
671f22d8-10f8-4420-9c4c-87c697cdd1b0	loan_repayment	2000	Loan repayment from Gopi.Kuppan	payments	cf439710-3067-46c2-9977-46983141ce77	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 07:22:44.505792+00	f	\N	\N
693da2db-ed14-4dd8-8faa-fcaa7f709a28	loan_disbursement	34000	Loan disbursed to K.V.Ramesh	customers	eccc41c7-9d86-41a5-8c93-ae01f74f8080	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 07:26:34.820822+00	f	\N	\N
8feadd2e-d97f-4d18-8098-af49d7a71eec	loan_repayment	500	Loan repayment from Ramya(Murugan T kadai) 	payments	7963ebc0-3114-4fc4-8a0b-82e65f7eb44c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-12 17:10:15.847254+00	f	\N	\N
cfd092bc-3b97-471f-b1a8-09f12c419dc8	loan_repayment	400	Loan repayment from Sriman	payments	f92952ec-9432-44c2-b553-72f9ab6d8ddc	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-02 01:58:19.929389+00	t	\N	\N
4f055ef9-01d4-4450-8e98-3010ae67ca02	loan_repayment	0	Loan repayment from Ilaiyaraja (Auto)	payments	5c87ee5a-b241-4441-aed9-5321cf127236	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-06 15:31:13.967318+00	f	\N	\N
c2f80350-eb26-4736-a8fd-5ec7ec6df8a8	loan_repayment	0	Loan repayment from R.Gopi (Auto)	payments	1e16cfdb-7596-4ae3-ad0d-bbebb130b713	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-14 15:27:48.268128+00	f	\N	\N
5cc0ba3d-ac79-4631-8301-bd7d78221063	loan_repayment	500	Loan repayment from Anitha	payments	cd27d9ca-bf62-4a12-b52c-aec524774c52	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 11:36:49.519747+00	f	\N	\N
1f8aaa85-7a15-464c-9afe-0a0b0c98d40e	loan_repayment	1500	Loan repayment from Dhanush Kodi	payments	460aab6d-065d-45fe-8222-bcba348be43a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 11:37:20.032726+00	f	\N	\N
69665d84-bd0e-47fe-b10d-717cd547f66c	loan_repayment	150	Loan repayment from Sathish (Piller) V.C	payments	61f2656c-d314-4463-ae09-068f50906ba3	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 11:37:45.241576+00	f	\N	\N
78e3f264-e7cc-45ad-bbf9-7650f9f2effa	loan_repayment	200	Loan repayment from Paramaguru	payments	e0ef6042-533a-4076-a4b3-fa839daa2b35	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 11:39:17.584073+00	f	\N	\N
68c8bef5-8c21-4e4f-9c2b-9131e14645c3	loan_repayment	300	Loan repayment from Gopal (Veg)	payments	406b2019-b092-45b3-a7e1-2f1c25ac1115	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 12:09:58.342215+00	f	\N	\N
8d5db2b3-a740-4f2c-9cd1-f3cecfd8045e	loan_repayment	1000	Loan repayment from Iqbal	payments	be3fbd24-3416-4e90-a2fb-ce17f374cd35	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 12:10:50.449651+00	f	\N	\N
1e7c900f-5ada-4cb3-983b-20dce1449de5	loan_repayment	600	Loan repayment from Vinoth.Munusamy	payments	43d1bbbd-6cc0-423d-a246-d0bf82c8bab1	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 12:11:14.330539+00	f	\N	\N
d942fcd7-058f-4d0f-b403-4b19cd3bd6bb	loan_repayment	3000	Loan repayment from Thangapandy	payments	d334c85b-cbc5-4ee0-9984-120e6feaeb90	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 13:11:44.015319+00	f	\N	\N
2d13c610-581d-44c1-b937-0d6639db384f	loan_repayment	1200	Loan repayment from Sudhagar	payments	ebc15ff1-6d99-43ba-839c-806cff60f63b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 14:10:02.940927+00	f	\N	\N
0e0a20e6-e7f1-4d61-9fe9-89068d490e0f	loan_disbursement	17000	Loan disbursed to Bhavani.Venkat	customers	4686827e-4849-4bfa-88aa-129912510008	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 14:15:26.791306+00	f	\N	\N
111f3fb3-21f3-4c14-90f8-1dba56fa854a	loan_repayment	200	Loan repayment from Rajaselvam	payments	5a93dc70-5bb4-403c-9e71-837d33c7433f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 14:18:43.728533+00	f	\N	\N
eca93f8f-6fba-4770-9c13-5d83760b7f59	loan_repayment	200	Loan repayment from Balamurali (sekar)	payments	e6292293-8cff-4d0d-829a-a9199c2f024b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 14:19:01.469368+00	f	\N	\N
8e7c254d-2472-495e-888f-4e253aa5f084	loan_repayment	500	Loan repayment from R.Gopi (Auto)	payments	beda3c44-b8c0-4634-9835-3db6855be1aa	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 14:20:52.017992+00	f	\N	\N
95674df4-a488-48c3-bb4a-b3611d908955	loan_repayment	300	Loan repayment from Udhayakumar(Sekar)	payments	d1f98dbc-5e5d-4cb6-a4b8-4a22799a1cb9	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 14:35:24.17981+00	f	\N	\N
2b293af8-3d72-49b2-88b3-c28dd6f4b354	loan_disbursement	25500	Loan disbursed to Aravind	customers	30d6e5ab-ae5d-4ea9-93ff-3655cdedc049	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 14:51:03.336777+00	f	\N	\N
1cab2bd5-f7c7-4bab-9f86-6fe1fe03767b	loan_repayment	2000	Loan repayment from Aravind	payments	9e16b495-9bb1-4a4f-b3f4-69de09012555	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 15:12:27.806399+00	f	\N	\N
00f1a161-e71d-49c5-b20c-0d47ec0fe758	loan_repayment	200	Loan repayment from Parthasarathy	payments	740bdf6c-fb1d-4323-9c3b-29d1a7476592	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 15:25:15.826691+00	f	\N	\N
5d84a99a-9fd7-4fa4-aba7-4af5d71bda9a	loan_repayment	200	Loan repayment from Pandit	payments	d201bd22-4566-45b6-9037-57429cb51026	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 15:38:32.754462+00	f	\N	\N
d30fa734-e658-48f9-8b51-91c97ea5153a	loan_repayment	250	Loan repayment from R.Murugan(Auto)	payments	798e482c-8320-4241-b1b2-e1ff9a785c6f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 15:38:53.168825+00	f	\N	\N
d1f83334-b18f-413d-b7b3-beeadea765ad	loan_repayment	400	Loan repayment from Lakshmi.(Tiffin)	payments	67fc8ae2-ffa0-42c7-bed7-ec75df325644	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 15:39:21.035148+00	f	\N	\N
c08a2a56-606c-4ded-985d-32a53cea9c94	loan_repayment	100	Loan repayment from Divya (poo kadai)	payments	651adb74-002f-4f57-9097-7de4363f49d4	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 15:39:39.181616+00	f	\N	\N
6f6814ba-994e-45f5-b23d-1588ec10a1d5	loan_repayment	400	Loan repayment from Ramesh(Pori)	payments	676a13e6-cef5-4b6f-b7b7-90bd05123876	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 15:40:06.871666+00	f	\N	\N
aca07b7c-d1ee-4735-8ce0-b2dba70d0f84	loan_repayment	300	Loan repayment from Sheela	payments	d8464bed-6384-41cb-902b-400a2be7ef83	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 15:40:25.854823+00	f	\N	\N
272803bb-f9ac-42fa-b721-bfd2d9866ffd	loan_repayment	300	Loan repayment from Ramanathan(Soop)	payments	a1525765-6d63-4418-ad90-a8e431534f9c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 15:40:50.216138+00	f	\N	\N
2948a49e-77cf-4f28-a61c-2793e628895c	loan_repayment	200	Loan repayment from Jaffer	payments	c1e00078-4023-41e0-856a-9125979f20b7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 15:41:12.509541+00	f	\N	\N
595099c2-4761-4cb0-a639-3244f9ed2314	loan_repayment	500	Loan repayment from Hamsa	payments	75170d12-c16c-4b45-a09c-888ee211f3d2	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 15:41:29.101513+00	f	\N	\N
7b983423-0edb-4c50-8255-60f83670ba45	loan_repayment	600	Loan repayment from Kumaravel.megic	payments	cfe15b6c-401a-4711-9bd6-c1733dabe80b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 15:41:53.924232+00	f	\N	\N
ca1fc9ff-e038-4125-860f-fb269f7985d3	loan_disbursement	59500	Loan disbursed to V.Saravanan.Pillar	customers	7d1ca2e6-5ac0-47d0-9b5b-6080fb746026	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 15:53:03.820844+00	f	\N	\N
c89bc178-48dd-42b4-b51a-af06d2422be0	loan_repayment	500	Loan repayment from Vijaya	payments	7dafd7e4-d97e-48ef-8fc2-86e9497c4a0c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 16:20:34.206119+00	f	\N	\N
f22dad9c-3ce7-42cf-9292-f4c0bb8f0e01	loan_disbursement	12750	Loan disbursed to Padmavathy.9514594764	customers	b5e377bf-be6c-4609-9ed7-af18422a1b4a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 16:37:11.998472+00	f	\N	\N
fa9618dc-0ae4-4df7-9efc-84d6842ac53c	loan_repayment	400	Loan repayment from Sriman	payments	afb45054-e92a-42f0-9f5a-f6684a3af758	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 16:38:44.200869+00	f	\N	\N
cf1c8344-401f-4e0e-acf8-9e456245d4a9	loan_repayment	200	Loan repayment from Vengatesh.Mec	payments	f429a34b-d8b1-4bb5-8f65-8438f12cd79a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 17:32:28.527102+00	f	\N	\N
c99fd694-4aa1-4129-b7b5-a54bea94475a	loan_repayment	200	Loan repayment from Kumaran.E.B	payments	cdc3996b-c141-4c51-bfd9-2dcae4fd5e23	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 17:33:09.225731+00	f	\N	\N
7cf2183a-82c6-4055-9af4-c99e34c5f270	loan_repayment	100	Loan repayment from Karthi (Veg)	payments	0492c18e-37a4-4cbb-9cfe-7e05adb6327d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 17:33:31.162149+00	f	\N	\N
9d14be7f-e49b-4c82-b924-00a80072f0a4	loan_repayment	400	Loan repayment from N.Manikandan	payments	6dcafd0f-8909-42f7-b705-a40c08632360	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 17:35:25.740482+00	f	\N	\N
0de12871-d9aa-42c4-8cf9-83b2caf5e533	loan_repayment	500	Loan repayment from Maha	payments	8729a894-b29a-46a0-adff-f0a11a94e534	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-31 06:12:51.629053+00	f	\N	\N
0b1c48aa-5612-4287-a7ac-aa540f021eee	loan_repayment	800	Loan repayment from Karthikeyan	payments	6e0004d6-1973-4fe7-97c0-718b6a5a417f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-31 06:18:15.930449+00	f	\N	\N
86f153b6-fe9f-476c-b3cc-fae8ad4f735a	loan_repayment	2000	Loan repayment from Brijesh	payments	6c0ef556-58f4-4aab-9eed-78ad5d1da8d6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-31 06:40:34.315675+00	f	\N	\N
a9575c66-0315-4625-9fa8-bd581d676a1e	loan_repayment	1000	Loan repayment from Loganathan.DMDK	payments	7cbb5d26-eeab-4ab6-be61-9e9d713bf2f6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-31 06:40:56.487557+00	f	\N	\N
20f8aad9-9c24-4693-b36e-4d1c84c5726b	loan_repayment	2100	Loan repayment from S.K.Sendhil	payments	4d772ea8-8fe3-4214-b5db-f3d5d1f23dbe	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-31 06:41:46.132536+00	f	\N	\N
0eac0a82-d4af-4fb8-8faf-bafe2a5d11a7	loan_repayment	1400	Loan repayment from Prathaban.R.O.Water	payments	0e0e1218-8558-477d-af2e-5478026727f5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-31 07:13:08.227706+00	f	\N	\N
61c7e664-39cc-4b98-b1f4-9b5ae13ffc01	loan_repayment	300	Loan repayment from Gopal (Veg)	payments	68f3ab9f-c3dc-44c9-aa16-c407851bcc22	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-31 13:24:34.365063+00	f	\N	\N
6c25eb11-923f-4b07-bdea-54829194b3e3	loan_repayment	2000	Loan repayment from Gokul (Magic)	payments	80cb2c14-6dba-4e38-8fec-b8fc9d6d57b7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-31 13:25:09.874002+00	f	\N	\N
097fe7c2-149b-4660-a212-60732a921a96	loan_repayment	500	Loan repayment from Mani (Magic)	payments	a45d9d93-06c3-4f3e-8422-32282c0bce4f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-31 13:25:54.007657+00	f	\N	\N
2f05e534-fa94-4da9-af75-48196d22b23e	loan_repayment	500	Loan repayment from Mani (Magic)	payments	91f1ccea-7565-4781-ba56-ebc2d5b1180d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-31 13:26:40.237239+00	f	\N	\N
ef3c515c-3c6a-48f3-96af-8dcc5020f1e7	loan_repayment	500	Loan repayment from S.Saravanan	payments	b4d6681e-690f-471b-8699-cd24f86c861a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-31 13:28:40.502301+00	f	\N	\N
da55943b-5f09-49f0-ba5a-6a338cf10287	loan_repayment	1000	Loan repayment from E.Saravanan	payments	9bc160d9-bb31-4bc7-9b79-808cb875aacb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-31 13:29:25.037287+00	f	\N	\N
2d881aab-719a-46b6-8215-d9a84231ba7a	loan_repayment	500	Loan repayment from Anitha	payments	aa97ea60-63a4-4210-af8d-f3cabeadd3e0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-31 13:29:52.698956+00	f	\N	\N
05305d3d-f477-4e33-9d51-3179ced0042b	loan_repayment	300	Loan repayment from Udhayakumar(Sekar)	payments	92cd2fd9-537e-4e85-aea2-9ee95b556466	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-31 13:30:59.129339+00	f	\N	\N
1c7c2db4-e91f-4571-8687-8783d19c2698	loan_repayment	200	Loan repayment from Balamurali (sekar)	payments	283b912f-366c-4b79-b10e-b705a5df4e8e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-31 13:32:03.581278+00	f	\N	\N
bb333cf2-7293-467f-8207-bb4aa80e481b	loan_repayment	200	Loan repayment from Bhavani.Venkat	payments	8225c222-4b4b-4214-8f33-cf77fdd83975	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-31 13:33:00.778816+00	f	\N	\N
74ef7e2a-a7e6-4124-99c4-f23198a06b5f	loan_repayment	1000	Loan repayment from Vasu (iyyar)	payments	633772f7-e5d3-401b-8e4b-87b6225a5cd6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-31 15:18:35.252429+00	f	\N	\N
d1b86aca-ac63-403e-9611-74ffc460c905	loan_repayment	200	Loan repayment from Rajaselvam	payments	aa38e162-5b30-4f07-ab82-0acb284993ef	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-31 15:19:01.670992+00	f	\N	\N
8d12d8fe-5864-4fe5-9bf1-5ded98b3e9b7	loan_repayment	200	Loan repayment from Jaffer	payments	29f78f40-25db-4346-b481-c5583b3c4ea6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-31 15:28:44.266539+00	f	\N	\N
4d5a8881-ea61-4e12-a380-c29245e51ae1	loan_repayment	200	Loan repayment from Rubini	payments	2d03e3b3-c1be-4576-b31e-0f91bbae286e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-31 15:29:47.171542+00	f	\N	\N
89ea4078-9b61-485b-ac2f-df109edd62ef	loan_repayment	300	Loan repayment from Sheela	payments	bf39f025-de7c-42b6-89ce-109a7fb4dd62	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-31 15:30:09.640384+00	f	\N	\N
624ab138-75b5-4006-897b-9264612104f6	loan_repayment	200	Loan repayment from Pandit	payments	93be0d90-3352-4a5c-a545-93624f5da304	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-31 15:30:47.785183+00	f	\N	\N
409d5f89-b35b-4159-83bc-df8a737e7964	loan_repayment	2400	Loan repayment from Magesh.sekar	payments	05ede501-b1eb-4258-bdcb-503596fbcff2	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-31 16:00:32.960068+00	f	\N	\N
45a1e709-0eed-4dd1-9cad-ec2c6ba29a34	loan_repayment	500	Loan repayment from P.Selvam	payments	364fd4ce-4083-4ee3-8ab2-24ab1d4303bf	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-31 16:11:45.341135+00	f	\N	\N
fdf67d5b-95fe-4d4a-953d-3dc6da600d0b	loan_repayment	150	Loan repayment from Padmavathy.9514594764	payments	5409a5a4-03f4-4d11-afc3-e1c39ee919a8	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-31 17:59:30.704419+00	f	\N	\N
41e087ae-6563-462b-b20d-c88d7ea6f4c2	loan_repayment	400	Loan repayment from Sriman	payments	896dcad6-302f-424d-aa14-aa67c36f53a6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-31 17:59:59.98977+00	f	\N	\N
b391a83d-0627-4c07-aed2-035ace950231	loan_repayment	600	Loan repayment from Vinoth.Munusamy	payments	c6ce0909-e94c-44f5-9179-a6b42fcb7d1f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-31 18:00:30.8187+00	f	\N	\N
0212b56f-d852-4cb4-874e-bda7575ee8ca	loan_repayment	1000	Loan repayment from Dhanush Kodi	payments	f5b06b2b-280e-4345-96ca-506f2754a24e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-31 18:01:43.626385+00	f	\N	\N
437b3c4d-ee70-48ec-bc83-2daf7dc3968e	loan_repayment	1000	Loan repayment from Karthi.Suba	payments	587bae3f-4024-4163-9605-675bd29ea5e4	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-01 05:38:26.90367+00	f	\N	\N
d6851c92-2435-4207-8452-4f2ea0226a3c	loan_repayment	500	Loan repayment from Stella Mery	payments	df7d36e8-c240-4bf4-8eb7-979e5a6d064e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-01 05:39:11.240807+00	f	\N	\N
a50086ee-622f-4ab0-817a-722bb4ad4d8a	loan_repayment	300	Loan repayment from Selvam.Ration	payments	7a3b2ae4-70d6-4f14-967b-bcbe86294640	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-01 06:03:29.619234+00	f	\N	\N
1f199957-5e43-4e59-a180-706973c2621e	loan_repayment	200	Loan repayment from Sathya (Tailor)	payments	78ef4dea-10da-4b34-b87b-f1c405a41844	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-01 06:47:38.757033+00	f	\N	\N
0da56525-70d2-4055-95ba-ce7cc3e9c13c	loan_repayment	500	Loan repayment from Anitha	payments	05ea7fbd-107e-4027-9c70-f2da20b102bf	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-01 13:08:34.272098+00	f	\N	\N
c76672e1-4a8f-4a11-97f0-0e3913b4b079	loan_repayment	300	Loan repayment from Gopal (Veg)	payments	28a47319-ec13-40e2-83d5-a024c48767cb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-01 13:09:24.33087+00	f	\N	\N
459cf447-27b4-415f-9389-aa9165bce05d	loan_repayment	3000	Loan repayment from Thangapandy	payments	570aaade-6352-4ed8-a6e0-fa4d7e4ee35c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-01 13:10:08.74903+00	f	\N	\N
3b47714c-f6f2-453c-b9dd-9f9ab5b79b3e	loan_repayment	150	Loan repayment from Ajith	payments	949c1f1b-80c2-463f-b17d-e51b4be7a224	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-01 13:10:38.778533+00	f	\N	\N
9146086d-46e7-497b-b97d-4f065904cc4d	loan_repayment	200	Loan repayment from Balamurali (sekar)	payments	17f28ab6-2e09-4717-a75a-ce0c56e6dbef	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-01 13:16:29.362485+00	f	\N	\N
045b771f-23ab-40b6-8e27-59ba3eff4a4a	loan_disbursement	4250	Loan disbursed to K. Kumaran	customers	dbb5444e-976f-4d00-9769-c0111b85f5b6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-01 13:19:07.591867+00	f	\N	\N
d8361b15-423e-4df8-ac53-be54f899dce1	loan_repayment	100	Loan repayment from Sathish (Piller) V.C	payments	acb57de9-2f78-40cd-afbd-e37114ce242b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-01 13:32:35.412927+00	f	\N	\N
64b926de-fae5-453a-9d34-33913b5b3ffb	loan_repayment	1200	Loan repayment from R.Kumar (Yazhini)	payments	b1d01f95-643a-45f6-961e-2e562897a65f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-01 13:46:26.412988+00	f	\N	\N
a172d0f7-6686-4a17-97cb-21ee335e0558	loan_repayment	300	Loan repayment from Udhayakumar(Sekar)	payments	4c2be374-5bed-4537-8a13-933204e10ec2	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-01 13:50:56.381143+00	f	\N	\N
4a29b119-ce7d-4abf-bcae-eebf5ecbf194	loan_repayment	1000	Loan repayment from Brijesh	payments	b068328e-b9b3-443d-b010-4c594b2fee3c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-01 14:02:03.294132+00	f	\N	\N
0c22d3a5-3b8e-406a-b3e7-337a771466a1	loan_repayment	200	Loan repayment from Rajaselvam	payments	cec7f2e8-e828-4ba1-9d39-245f4247da49	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-01 14:49:38.964883+00	f	\N	\N
56011713-443f-4c6d-bcab-eb9431d87e7c	loan_repayment	1500	Loan repayment from Ramesh.Megic	payments	afb55341-1bee-42cd-b463-64272b57896f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-01 14:51:33.768212+00	f	\N	\N
92f2ddda-b2b7-4893-b8a3-e9e3cc44b75d	loan_repayment	200	Loan repayment from Bhavani.Venkat	payments	0cf59de7-7b8d-440e-a74d-9f5bafe9a023	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-01 15:10:51.605425+00	f	\N	\N
ba66cb4c-058d-45d7-ad95-7c67c1cdac47	loan_repayment	400	Loan repayment from Lakshmi.(Tiffin)	payments	cc34ba9e-cdc7-49f6-91cc-583fc6ad1650	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-01 15:11:14.93071+00	f	\N	\N
04c1dc8a-7c32-46ca-9b42-9652fab9fd1c	loan_repayment	300	Loan repayment from Sheela	payments	2656c239-02cb-44af-9796-67bc74351353	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-01 15:11:39.041111+00	f	\N	\N
b635cf83-79d4-4bf6-9bb5-dd2f96ee6523	loan_repayment	200	Loan repayment from Jaffer	payments	58534086-e91c-4833-8ac4-213450bcca28	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-01 15:11:57.450464+00	f	\N	\N
88dfbd34-f3cb-4e36-a5dd-a7a34366db2e	loan_repayment	400	Loan repayment from Sriman	payments	5a0e693e-cca9-41ca-a82c-1ff2a5bda22a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-01 15:20:57.155552+00	f	\N	\N
7ce4d71b-1005-4139-b7d5-d3a3f76ab846	loan_disbursement	42500	Loan disbursed to Chinnakownder	customers	bdfb7101-8e1c-4167-9c21-77c4defe8ce5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-01 15:26:50.314373+00	f	\N	\N
411da2fe-04f8-47c3-9f71-668781461d51	loan_repayment	1000	Loan repayment from G.vengatesh	payments	5297f1dc-0833-47ff-8a27-92025a18964e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-01 15:33:22.241918+00	f	\N	\N
0cea8722-e3de-4f6f-a1f9-93ee10046ad2	loan_repayment	500	Loan repayment from P.Selvam	payments	14444f3a-c518-44a4-be59-eaf2478083e3	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-01 15:37:36.552033+00	f	\N	\N
4678cb73-5cb9-4677-9e33-a2f3be8e4469	loan_repayment	100	Loan repayment from Karthi (Veg)	payments	6e442019-26ab-423f-9327-f806a03ff059	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-01 15:57:50.501371+00	f	\N	\N
d310b16c-c7d9-4928-a892-0031a32fc808	loan_repayment	100	Loan repayment from Kumaran.E.B	payments	5f857d08-a257-4bad-939a-cc8d7a941ec1	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-02 00:26:43.059769+00	f	\N	\N
bb9e275f-5603-4b91-84a6-940ab0689374	loan_repayment	1000	Loan repayment from Maha	payments	9b2c2636-87a9-4d5f-b468-07714c7cbc10	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-02 00:27:29.284702+00	f	\N	\N
d89f3f88-cd06-47d4-812c-f8d59cd48c41	loan_repayment	500	Loan repayment from Paramaguru	payments	4e026e0b-d411-4f17-87bd-6603fe8427b8	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-02 00:42:43.354483+00	f	\N	\N
ef383fde-72e5-49ad-a606-1e6320cae76c	loan_repayment	50	Loan repayment from K. Kumaran	payments	95eb556a-a2fa-4d09-9537-9581c4af656f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-02 05:06:17.6337+00	f	\N	\N
cd6e0522-d640-4192-abfe-7ec62d868fd1	loan_repayment	600	Loan repayment from Prathaban.R.O.Water	payments	0c893f1a-e0f7-4174-a7df-74849d7f4ea1	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-02 05:09:30.533829+00	f	\N	\N
f47ad43f-08fd-4f78-bb77-2ab091dec246	loan_repayment	400	Loan repayment from Karthikeyan	payments	78304f69-77be-4f11-98c4-9f26d080b085	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-02 05:09:57.748722+00	f	\N	\N
d6c1c3ad-d981-4bcc-9566-f1df0a3c9b30	loan_repayment	500	Loan repayment from Mani (Magic)	payments	84f51afc-6008-4b41-9725-a6761335e4c1	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-02 08:56:01.547738+00	f	\N	\N
4da5a2ad-b0a1-4955-a89d-444dc629f50d	loan_repayment	300	Loan repayment from Gopal (Veg)	payments	51a45981-fda5-45b7-8b1b-c0abe4d8d49e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-02 08:56:54.809343+00	f	\N	\N
07ab673d-ea13-40cc-a120-f9e7dc803995	loan_repayment	1500	Loan repayment from Raja.megic	payments	ba5de993-d294-4dbb-be67-d173d37dba97	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-02 15:19:44.749149+00	f	\N	\N
1326f707-f73f-40a9-aa87-e7745e9f4198	loan_repayment	100	Loan repayment from Divya (poo kadai)	payments	fc8eee15-22fd-4a88-8751-479260cdb355	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-02 15:41:27.043823+00	f	\N	\N
ddea3315-8d41-4f99-afef-cbe6da451963	loan_repayment	400	Loan repayment from Ramesh(Pori)	payments	f63da06e-5de2-41eb-aaf5-7db773862bd6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-02 15:41:57.191623+00	f	\N	\N
32f51bdb-be9f-4559-905b-4c63a20ad1e4	loan_repayment	300	Loan repayment from Sheela	payments	7a2db8f0-26d2-4336-9fa6-fdbe14428eb6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-02 15:42:21.966721+00	f	\N	\N
97bc41c2-92c3-41cb-a679-ee97aa837664	loan_repayment	300	Loan repayment from Ramanathan(Soop)	payments	8a2e60b9-f402-4dc3-8ded-0a0054c92545	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-02 15:42:58.410792+00	f	\N	\N
8423814a-91a1-470f-baeb-c04bd2e4f94d	loan_repayment	200	Loan repayment from Jaffer	payments	bf52efb0-4d61-4f26-9faa-e934ded7f4cd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-02 15:43:39.697039+00	f	\N	\N
d6fa950e-5097-4dac-9bca-ec2ccdfaa009	loan_repayment	1100	Loan repayment from S.Murugan.(Sekar)	payments	1239850e-0015-47df-94c3-0568289d5d14	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03 07:00:22.260215+00	f	\N	\N
99418124-9258-4708-a138-d4f25c5babeb	loan_repayment	1000	Loan repayment from E.Saravanan	payments	954474f9-75d2-4b33-a29d-7d99ba30b320	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03 07:00:47.295997+00	f	\N	\N
932b510c-d78d-4869-84bd-02ea5d7f77d3	loan_repayment	1000	Loan repayment from Ilaiyaraja (Auto)	payments	706b978e-839c-4f3f-95b9-17972494f49a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03 07:01:13.440547+00	f	\N	\N
8fde7fc9-e23f-495e-a42e-ac061e7f98ec	loan_repayment	1400	Loan repayment from V.Saravanan.Pillar	payments	8753822c-97e4-431e-ad8b-4a10e51f3209	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03 07:01:42.109687+00	f	\N	\N
9abc2fd5-98dd-40b7-8f52-5cd02d9e6a5c	loan_repayment	150	Loan repayment from Sathish (Piller) V.C	payments	31694355-69d5-4728-bc3e-2769a03d07f8	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03 07:02:03.333157+00	f	\N	\N
b7462a12-c90c-4ff8-b649-bd930b897379	loan_repayment	1000	Loan repayment from R.Gopi (Auto)	payments	ed9c1877-0bf2-4d15-9cce-ddb1f6d2f5e7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03 07:02:26.417582+00	f	\N	\N
3b124da2-de12-49f3-b146-eb9e5c10b769	loan_repayment	500	Loan repayment from Anitha	payments	710e54af-fc10-4f41-beb3-9bff8d3d5a03	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03 07:02:45.86146+00	f	\N	\N
7c77bc99-021e-46fe-b9b5-851787128402	loan_repayment	600	Loan repayment from Vinoth.Munusamy	payments	654f3bc6-f5bc-4e48-8d9b-0d44d84bdf69	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03 07:03:11.008579+00	f	\N	\N
5bff4b14-55fc-413c-bdff-5b30877b0a4c	loan_repayment	600	Loan repayment from Rubini	payments	ef356e79-9f62-4ab1-a716-8f2e1dfa962b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03 07:03:33.361092+00	f	\N	\N
3d8e6e51-75b4-4e5f-ac09-9150228f4e40	loan_repayment	200	Loan repayment from Balamurali (sekar)	payments	bda8aa20-7f88-40cc-917b-a13bad2df903	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03 07:04:30.886078+00	f	\N	\N
566a0cbb-26ca-4472-b3b1-2dce0f7f83e2	loan_repayment	200	Loan repayment from Bhavani.Venkat	payments	3c3eb0c8-dc3e-48c8-ada5-9782bc72c408	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03 07:04:46.522449+00	f	\N	\N
c36f0f48-636a-414a-a7a2-305a95466490	loan_repayment	1000	Loan repayment from Karthi.Suba	payments	aeafc5c5-5d19-4bb0-825b-bdc6c2638eae	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03 07:06:30.713673+00	f	\N	\N
bcbc3bc5-751a-4a01-b8da-7f2749944dba	loan_repayment	250	Loan repayment from S.Saravanan	payments	e7a7a7b3-2178-4907-9ad2-c048e603ec77	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03 07:06:54.222819+00	f	\N	\N
f44f3730-52db-4be7-a1d1-9b0d3264a3ee	loan_repayment	100	Loan repayment from Kumaran.E.B	payments	708351ea-84b6-4b31-9f7d-6e1ebb002eff	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 16:05:55.063728+00	f	\N	\N
0f9fde94-05be-4b64-b9f4-c917dbd24a1e	loan_repayment	200	Loan repayment from Balamurali (sekar)	payments	89ea621f-5a08-48ed-be51-81111c752392	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 16:06:27.016985+00	f	\N	\N
5611613a-e85a-41cb-9d94-b4e7f81c6a30	loan_repayment	1000	Loan repayment from Maha	payments	2ad59018-01f2-4856-862a-d265f917be75	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11 07:07:16.816878+00	f	\N	\N
4b70823f-c20d-4ff4-b957-3d40a1e1478b	loan_repayment	100	Loan repayment from Divya (poo kadai)	payments	cce62074-d27f-4c9f-bcf6-47013f4af236	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11 15:47:09.552353+00	f	\N	\N
854a01dd-325f-431e-993b-526fdb3649c7	loan_repayment	600	Loan repayment from Ramesh(Pori)	payments	0678a04f-dd2f-4f0d-8b67-042e886bbebe	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11 15:48:11.506795+00	f	\N	\N
23873de4-1a9f-4093-9d3c-cfb711f3b228	loan_repayment	100	Loan repayment from Elumalai.mani	payments	81483de8-390b-42af-b7ee-4912a0bf5408	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11 15:49:43.065305+00	f	\N	\N
5325295b-9838-4b7f-a273-b1c5499d1325	loan_repayment	1800	Loan repayment from Baai ( Thaadi )	payments	0777b6d0-461e-4a26-a4ef-4fba110ac8ac	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 07:07:40.766127+00	f	\N	\N
fa096839-b068-4dc5-91f4-f51fec3a7155	loan_repayment	200	Loan repayment from Paramaguru	payments	09bb7d98-98e2-4d48-b5c2-700c83cf1a29	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 07:49:03.092836+00	f	\N	\N
fc1c92ec-67f4-462d-a159-0407680ba921	loan_repayment	500	Loan repayment from Mani.Magic	payments	a378b038-c967-4d61-9751-21ffec3fd58e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 07:49:28.454396+00	f	\N	\N
9917e4c8-ed18-40a7-a93f-5efc385ce31d	loan_repayment	500	Loan repayment from Parthipan	payments	094d1591-48a9-486f-85f7-28bfe0b26bd9	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 07:50:37.849761+00	f	\N	\N
8938a7c5-07cf-437f-915e-5bc6d9c6f665	loan_repayment	500	Loan repayment from Gokul (Magic)	payments	bacfc6df-9523-4b24-a62c-cf455634f690	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 07:53:02.060552+00	f	\N	\N
7037d97b-1e4a-4048-8c0d-c6d6c005314d	loan_repayment	250	Loan repayment from R.Murugan(Auto)	payments	4229663a-d410-419f-85ae-866c349cf81e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 07:54:18.60968+00	f	\N	\N
7d3db1b9-20aa-40ba-8357-963ef23aba61	loan_repayment	400	Loan repayment from N.Manikandan	payments	92b81932-8977-496e-b874-0b85b99c465c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 07:58:58.426798+00	f	\N	\N
8dd7ba49-fd2e-4890-8edf-67093ef9d514	loan_repayment	1500	Loan repayment from Iqbal	payments	a2a020f5-e42d-4c07-944f-d89e7994493a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 08:00:37.30882+00	f	\N	\N
018e3b4d-a419-4182-9f62-34d52deb36c6	loan_repayment	150	Loan repayment from Basheerbai	payments	abd4ab18-6243-4468-8316-1877b3c2af63	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 13:28:44.162852+00	f	\N	\N
d299dc4e-ab75-41c2-a441-401ac80a2779	loan_repayment	1000	Loan repayment from Varanasi.Ayyer.	payments	4946550a-1324-4b14-8973-75332b936b28	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 13:29:06.912105+00	f	\N	\N
f8765604-8892-4e3b-801b-fe5ffe763c41	loan_repayment	1000	Loan repayment from Rajesh ( Elc )	payments	fdd2b238-74ff-49d3-8d1e-e2dc8ed5457e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 13:29:43.485101+00	f	\N	\N
494e01c1-236d-436c-9e20-5d148ed7d262	loan_repayment	400	Loan repayment from Ramesh.guru	payments	d57af1b5-9bf7-4fe4-b6df-1a6574f8c1db	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 15:18:50.975083+00	f	\N	\N
7252d43a-ecf9-4e77-9ca4-8c0b8e79ffc6	loan_repayment	50	Loan repayment from Mani.Angala	payments	c64abdef-db9a-4357-b4e2-65c429ad3708	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 16:30:21.237616+00	f	\N	\N
06ccc19f-1ff5-41b5-946b-fe971c1cf85b	loan_disbursement	8500	Loan disbursed to Ponnaiyan	customers	2ef2bbe9-b267-4369-9bd3-51063fe4a3fa	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 05:53:48.675486+00	f	\N	\N
24e61ccc-9c17-4c02-b598-21a47dd9f297	loan_repayment	600	Loan repayment from Ramesh.Megic	payments	4699964c-1936-4799-8211-cc3a603b412e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 07:26:49.115769+00	f	\N	\N
4f09039c-2b26-4e83-8831-4945e17cc909	loan_repayment	100	Loan repayment from Vinoth.Mesthiri	payments	7b0c7d85-9d37-40d2-a51b-13a8cdb5ea8e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 13:10:00.767914+00	f	\N	\N
a125d7d7-4e40-4b77-b581-615418de27e5	loan_repayment	1000	Loan repayment from P.Mariyappan	payments	1487b2f3-64b8-4c55-b4b4-480d9fbac9fb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 14:16:05.600019+00	f	\N	\N
9ba48ff1-ca5d-4fb2-a403-92d9e9d0cde9	loan_repayment	500	Loan repayment from P.Selvam	payments	4316cfcd-8a11-40a8-a437-e5027fef5056	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 14:34:40.524608+00	f	\N	\N
763f3536-4bde-4567-bc24-15a2c2800599	loan_repayment	200	Loan repayment from Pandit	payments	82aa4c7d-0ea8-462f-b1e9-49d8660f09bf	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 15:28:53.717627+00	f	\N	\N
9fb9fdc6-9b52-4cc1-85aa-fb064f6ca1b8	loan_repayment	300	Loan repayment from Ramanathan(Soop)	payments	c08a8d98-5c0e-4818-a46e-98e57f917944	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 15:30:42.273534+00	f	\N	\N
aa64e6ba-2653-4f81-8a5a-fb8d3eab3ad9	loan_repayment	200	Loan repayment from Banu.Mohamed	payments	186c77c2-5b61-45cf-89b1-be72259c1bd8	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 15:44:29.265862+00	f	\N	\N
d7a35abd-ad3d-461b-97b3-31bb5e4f11d9	loan_repayment	400	Loan repayment from N.Manikandan	payments	dd90a94e-facf-4de5-a769-6ea28ad55f74	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-14 03:19:01.976499+00	f	\N	\N
d49434f9-0b9a-4464-b6b9-bc4e69cde168	loan_repayment	1500	Loan repayment from Thangapandy	payments	4fe514c6-1b92-4efa-a9f2-6eabd4758185	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03 07:05:09.393008+00	f	\N	\N
bd468a5e-b7ab-4180-b1d0-b928e708817f	loan_repayment	200	Loan repayment from Vengatesh.Mec	payments	616b8cf0-ab03-4c81-a610-c36077a1e912	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03 07:05:33.420383+00	f	\N	\N
1f98e150-0e3d-4980-8a0a-53a06f077853	loan_repayment	2500	Loan repayment from Dhanush Kodi	payments	89aa5dca-f49c-4fed-8188-b2e290bc66d5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 16:07:48.8709+00	f	\N	\N
03294082-a2f9-4a4b-a71a-fcbd66b3b456	loan_repayment	1000	Loan repayment from E.Saravanan	payments	1788e316-4412-4365-acd7-d19b5c827a54	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 16:08:09.74847+00	f	\N	\N
d7dce1eb-ddfe-4f85-9cf5-00d03920ec0a	loan_repayment	300	Loan repayment from Selvam.Ration	payments	11833173-8a94-49b3-9d58-dd16e555ea8d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11 07:07:39.919339+00	f	\N	\N
1fba5b24-bd40-417c-822b-6c72b600b56d	loan_repayment	300	Loan repayment from Sheela	payments	cafc3e6f-0262-48b9-a0a9-f912931eacf9	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11 15:47:31.09112+00	f	\N	\N
60b1e2c9-212a-4be6-8c56-b67a0af985a5	loan_repayment	200	Loan repayment from Jaffer	payments	c5308a26-a8fb-4231-a995-a5fb164503ac	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11 15:49:00.325316+00	f	\N	\N
c9ba6fd5-9d78-4bbc-ace7-6b26ac976248	loan_disbursement	12750	Loan disbursed to Bhavani (Pichaimuthu)	customers	8d1aa297-ebb1-4cbb-94f7-ef5d2b2bbb12	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 07:43:10.921236+00	f	\N	\N
9bb9ad2d-ff61-4c4e-a792-2e8f8ad38711	loan_repayment	200	Loan repayment from Banu.Mohamed	payments	5363172a-c9b9-444b-886f-50dd532dbfc8	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 07:55:53.174641+00	f	\N	\N
5c41cd09-2f87-48e3-b653-9c03d8dc48ca	loan_repayment	500	Loan repayment from P.Selvam	payments	66600f9e-4fbd-4269-a38e-c7a4f847d832	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 07:56:21.821718+00	f	\N	\N
be6d98df-d10b-4244-879b-0281ccd3c81d	loan_repayment	500	Loan repayment from Gandhi	payments	24f0f2e8-eb75-443c-b97d-1fab81be7a63	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 07:56:54.165084+00	f	\N	\N
62b41b13-2e6e-452d-a9b8-2a8b5555da8c	loan_repayment	500	Loan repayment from G.vengatesh	payments	2207c037-10c8-4b89-80ab-8f6a44f3cc43	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 07:57:42.495735+00	f	\N	\N
af134863-b812-4c49-8f00-f647ceedf6a1	loan_repayment	50	Loan repayment from K.Kumaran.1	payments	0c117b9e-45e9-45e3-b352-c0387da08440	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 08:00:15.872552+00	f	\N	\N
01469642-d369-40f0-b24b-213dc5d82f5f	loan_repayment	500	Loan repayment from R.Gopi (Auto)	payments	27253e37-8c6e-4b66-be11-3c78c065e815	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 14:19:34.316349+00	f	\N	\N
232b76bc-6e58-4c70-bd4f-9f6b071439f9	loan_repayment	200	Loan repayment from Harideva	payments	0ecd7f50-2d4d-48ad-a748-1b2a1aeb58de	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 15:30:16.545817+00	f	\N	\N
30904417-8923-454e-adc7-e0d991838c5d	loan_repayment	300	Loan repayment from Sheela	payments	a13f47ac-8632-441a-b474-39a8c293d70a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 15:30:41.511689+00	f	\N	\N
5a56d9b2-f997-426b-8863-70e7f0949df3	loan_repayment	200	Loan repayment from Karthi (Veg)	payments	10073e2b-42b4-42bd-b775-26cb5c88302b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 16:38:03.799792+00	f	\N	\N
7bf90a51-9f8b-4ffe-a9fe-fe0ebe845a74	loan_repayment	500	Loan repayment from Ponnaiyan	payments	440e8047-94c9-4f01-bd04-631eef997b2f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 06:06:05.94184+00	f	\N	\N
f754a3e8-19b0-47c8-ad3c-b4c0c0e61e7b	loan_repayment	500	Loan repayment from Anitha	payments	c97eb6fe-3bc4-4969-9fb4-2e145306003c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 07:27:33.232754+00	f	\N	\N
6aba8efd-d21d-44c3-ade8-20ca578fdeb9	loan_repayment	100	Loan repayment from Rajkumar (DMDK)	payments	729fe4fe-6842-4f90-8e28-1fa1aeb8d83e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 13:10:27.359645+00	f	\N	\N
fc16021a-19e7-4553-a9c0-fc7cfb3b9adb	loan_repayment	3000	Loan repayment from Vasu (iyyar)	payments	bd4a8451-059e-4f1e-b110-209cfa876d56	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 13:12:04.778553+00	f	\N	\N
5648143c-3470-4bce-a7c3-50dab564d547	loan_repayment	50	Loan repayment from K.Kumaran	payments	afe7f138-7a0f-467b-895a-95c2f8c58804	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 14:16:52.977124+00	f	\N	\N
3c3b1c31-f1b8-44a5-b765-b167809bf241	loan_repayment	200	Loan repayment from Bhavani.Venkat	payments	cad2c01e-1a5f-4af3-a723-cc46a1e10116	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 15:03:48.082274+00	f	\N	\N
8376cbb1-8f60-4f7e-a621-aa43bf18ee31	loan_repayment	200	Loan repayment from Ramesh(Pori)	payments	0b779e53-672f-443b-be51-17c44d57791c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 15:29:31.266955+00	f	\N	\N
f0388feb-894e-4fb7-b9a3-ad1b4481b830	loan_repayment	1500	Loan repayment from Thangapandy	payments	4fac2a7e-48c3-4572-b61a-5921f43e6512	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 15:45:06.732267+00	f	\N	\N
44a97db8-07dd-4626-9b81-53fbd3352d34	loan_repayment	50	Loan repayment from K.Kumaran	payments	33fb63f8-d644-4a75-a873-7c3b42a7df8c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03 07:05:50.691151+00	f	\N	\N
11b30236-5efc-4df4-a6d3-6acd7e785064	loan_repayment	1500	Loan repayment from Gokul (Magic)	payments	79d51c6c-6d97-4037-a781-4393a6fc9540	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03 07:07:13.195842+00	f	\N	\N
fffb8002-645c-4d82-b498-7e6c54c5de90	loan_repayment	600	Loan repayment from Murugan(mec)	payments	4feb2e84-791e-45c8-9751-7b18026669ea	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03 07:09:39.100744+00	f	\N	\N
b7cc883d-6d56-42cc-9ed6-2f1fd35585b3	loan_repayment	500	Loan repayment from Anitha	payments	30afae42-a3e2-48d9-b0ca-ada4a00e8fbc	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03 10:31:29.548436+00	f	\N	\N
268cb42a-2b90-4846-84e8-ee7a292faab5	loan_repayment	500	Loan repayment from Maha	payments	5282ce10-e317-4d8f-bbd3-721936656dec	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03 11:34:11.034467+00	f	\N	\N
52dd8dd3-375a-460f-ad31-9f1fb78e171f	loan_repayment	1500	Loan repayment from Thangapandy	payments	0b3da709-c2c6-4232-b966-13285e0b5d6a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03 11:34:47.761487+00	f	\N	\N
6184eb52-980b-4475-b019-afa964c4d7ce	loan_repayment	200	Loan repayment from Balamurali (sekar)	payments	49482294-572f-4f0b-80a9-b7e05004a83a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03 12:56:25.864732+00	f	\N	\N
4659b309-f0ae-4312-9611-fccb741d1943	loan_repayment	300	Loan repayment from Gopal (Veg)	payments	4c1f5a48-bc6e-44fd-bc9e-e89bd9fe98fc	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03 13:04:40.89+00	f	\N	\N
ffdfb369-8719-46af-98a2-3497c3f3e6e5	loan_repayment	2000	Loan repayment from Varanasi.Ayyer.	payments	397e9ae4-87be-4984-993d-f2b04c711a86	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03 14:34:34.862092+00	f	\N	\N
e400e5cc-9419-47cb-af51-b6e1175702a6	loan_repayment	200	Loan repayment from Kumaran.E.B	payments	eda988c3-805d-4681-adaf-fe9a7d806603	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03 14:35:03.210634+00	f	\N	\N
761b48e8-ffbf-4422-8294-23f75927e305	loan_repayment	500	Loan repayment from R.Gopi (Auto)	payments	ef484a34-4f49-4507-b864-cc591c9bf382	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03 14:35:33.540009+00	f	\N	\N
4e400fee-0e75-4845-9f1a-b91bfeb27a16	loan_repayment	500	Loan repayment from Vijaya	payments	56c5ea9a-bd0a-4969-a085-827d9fbc94b5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03 14:36:05.770651+00	f	\N	\N
baec78b0-f096-4bb8-ab5d-010fd7495883	loan_repayment	250	Loan repayment from R.Murugan(Auto)	payments	512b938d-d57f-41c1-b827-e860e9cd3d49	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03 14:36:35.812009+00	f	\N	\N
4476c05a-2c62-4080-acbf-86c7671b1fc2	loan_repayment	2000	Loan repayment from K.V.Ramesh	payments	c120b923-7e5a-42b8-95c8-4ebd261f3bee	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03 14:37:08.545356+00	f	\N	\N
0b1ed1eb-7d8a-4ff7-91e4-412f5c9c4a2c	loan_repayment	400	Loan repayment from Sriman	payments	67421bdc-6be7-46ae-b4a1-4b26269cece5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03 14:37:39.050619+00	f	\N	\N
1a56547a-62e4-47ac-806f-4427a9b852f0	loan_repayment	200	Loan repayment from Bhavani.Venkat	payments	23c590a8-e5ad-46ea-a61b-cfa1a04d0b03	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03 15:14:49.248719+00	f	\N	\N
ab1fb973-c28b-4ed5-b365-9bb008e558a6	loan_repayment	2000	Loan repayment from Karunakaran	payments	a896a471-b35b-4e61-8b93-2948913ab80a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03 15:15:10.033552+00	f	\N	\N
9d1abb20-ee5c-4ec8-a294-167fd58d6cf9	loan_repayment	500	Loan repayment from P.Selvam	payments	2720a307-742d-47ac-a05d-e60c9300aa12	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03 15:16:24.610358+00	f	\N	\N
a48ffcf0-f617-4b73-92fb-26226b34bb3f	loan_repayment	200	Loan repayment from Jaffer	payments	cbd2e17f-b4ab-464e-a5e8-8724871a904c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03 15:24:16.617439+00	f	\N	\N
44f9b6d3-6345-46ff-9f49-a4c152fa8db0	loan_repayment	100	Loan repayment from Divya (poo kadai)	payments	bac74d1d-62c6-4e86-8650-9830a118ff75	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03 15:24:37.551798+00	f	\N	\N
3d549e2d-8121-4362-82d8-5bcee7938dcc	loan_repayment	400	Loan repayment from Lakshmi.(Tiffin)	payments	fbe6ca8c-35e6-4ac2-88f9-8e61ae601235	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03 15:24:53.02657+00	f	\N	\N
f9f4f697-2a13-45e8-b237-020d5e0a3d7e	loan_repayment	300	Loan repayment from Ramanathan(Soop)	payments	d22fe6c2-6613-4dd6-bd3c-bf96f71a96d7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03 15:26:41.495932+00	f	\N	\N
7f2dfc7b-e562-4c1f-b174-b2764cc42ed2	loan_repayment	200	Loan repayment from Pandit	payments	9d5563d9-694c-4b49-8c23-8bf8eab4ab4c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03 15:27:38.551768+00	f	\N	\N
be694027-a54e-44b0-bd72-817db1735901	loan_repayment	400	Loan repayment from Karthikeyan	payments	2dc558b0-4a24-4417-9655-9c54a82dc685	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03 15:48:14.513928+00	f	\N	\N
1d1a99b2-9db4-4ba0-95ba-7aac841970bf	loan_repayment	700	Loan repayment from V.Saravanan.Pillar	payments	1615f7db-4398-4a72-bf65-65ab93c947c4	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03 16:00:16.353972+00	f	\N	\N
ceee34c8-a8c9-449e-b6a8-4604ff48e1a0	loan_repayment	500	Loan repayment from E.Saravanan	payments	2fb2c7ed-8335-4901-83c4-f709fa6812b3	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03 16:26:46.936249+00	f	\N	\N
652992b8-57da-4e2c-a836-872803918f05	loan_repayment	150	Loan repayment from Sathish (Piller) V.C	payments	36e5f69b-ba86-4aa4-9959-23f7cca8acf0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03 16:43:40.478653+00	f	\N	\N
f6e15891-18fb-4c6a-b3e3-7787e40d2899	loan_repayment	400	Loan repayment from N.Manikandan	payments	29ad3c40-7bbe-407a-a61b-c1e2e6a1876a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03 18:38:26.538186+00	f	\N	\N
faa8bc95-01cf-4464-8189-af7345897178	loan_repayment	300	Loan repayment from Selvam.Ration	payments	85e2cdd8-ad9b-4712-bda6-a884e6d0c714	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04 05:48:16.595765+00	f	\N	\N
5c31bc3a-5b6b-4525-9b09-ae3073712c4c	loan_disbursement	8500	Loan disbursed to Kadumpadi	customers	9daa6e18-5bdb-420a-a5bf-8420c72c9e6e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04 06:18:39.316621+00	f	\N	\N
1acf2076-b3bf-4795-ad52-861a4c0bc7a7	loan_repayment	250	Loan repayment from R.Murugan(Auto)	payments	7981b45b-3976-497d-96d4-b19b8bfa9c89	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04 06:22:05.758058+00	f	\N	\N
20bc3393-be4a-4559-a9c1-40f52de9503b	loan_repayment	1500	Loan repayment from G.vengatesh	payments	09b0dc96-3c52-4f47-8f97-6cbf84b6875b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04 06:23:07.698072+00	f	\N	\N
34c3daff-f289-4be5-a5a1-1f773c9e46e6	loan_repayment	50	Loan repayment from K.Kumaran	payments	e3fc2e20-3426-4696-8b4f-318c6e7d6a1f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04 06:25:16.569178+00	f	\N	\N
bd31f112-4fbc-4f06-8abd-c337467e583a	loan_disbursement	21250	Loan disbursed to Gandhi	customers	481d1580-100a-4f65-bc22-32aac9182e37	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04 06:50:24.542009+00	f	\N	\N
0c39cba2-7528-447b-9f03-2bbe097aaf71	loan_disbursement	4250	Loan disbursed to Mani.Angala	customers	0730e6a0-07e6-44f1-b129-097c3fb6e85c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04 07:07:32.331332+00	f	\N	\N
51773515-71a8-4387-ac6b-7d891f8e4262	loan_disbursement	25500	Loan disbursed to Sivaraj.Sekar	customers	586c004c-3e6b-40bf-a2f5-cd3a1fdfe4c0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04 07:10:36.084122+00	f	\N	\N
d2c7f624-9469-47e6-8e8f-601b10509c26	loan_disbursement	8500	Loan disbursed to Elumalai.mani	customers	a529d878-71a9-4774-8ef5-b4e2ce601e22	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04 07:20:09.650111+00	f	\N	\N
4de55f12-fcde-489a-a738-a1abc41bb0d8	loan_disbursement	4250	Loan disbursed to K.Kumaran.1	customers	dcf458bf-10c7-41f7-ab08-ed37fbfc4b2b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04 07:25:32.796443+00	f	\N	\N
4317bc5b-58a2-439d-ab79-d63934b6f525	loan_repayment	400	Loan repayment from UMA.(Teacher)	payments	f487c92c-329a-4b13-8739-6b927bd9e301	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04 07:27:14.965952+00	f	\N	\N
777428f2-5289-437d-8459-5ed9aa6c71a4	loan_repayment	500	Loan repayment from Karthi.Suba	payments	f2bd450f-7872-4b77-b6ea-1322ebd453b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04 07:27:52.744618+00	f	\N	\N
9db29b5e-99d2-4e08-a125-e8b1f797619b	loan_repayment	500	Loan repayment from Vijaya	payments	c2fbb154-8b80-4273-9923-234e573ad438	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04 07:28:22.558317+00	f	\N	\N
32d67979-ee6f-45f9-9f9b-41d48cd1b978	loan_repayment	1500	Loan repayment from Dhanush Kodi	payments	75fdce0a-d4f6-4067-9e4b-28527413fdfc	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04 07:29:10.845491+00	f	\N	\N
c10ace91-30dd-4360-a057-c3ebcff4e0ff	loan_repayment	2000	Loan repayment from Mani (Magic)	payments	14044aaf-cad4-43eb-be73-3fe2c47e0924	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04 07:42:31.661333+00	f	\N	\N
21e3237c-28c5-4550-91ab-d3ab064e61b1	loan_repayment	1500	Loan repayment from Ramya(Murugan T kadai) 	payments	a7cffc87-0dfa-4124-a892-8bc968f6a8b7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04 07:59:50.209289+00	f	\N	\N
f9d69a3a-9899-4575-bff9-fe917bdab3f0	loan_repayment	500	Loan repayment from Ramya(Murugan T kadai) 	payments	e6eac99c-9b4d-4f25-929e-3a3185425659	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04 08:15:28.561923+00	f	\N	\N
8cb108b8-43e4-4e67-95c5-35f5631fd2b4	loan_repayment	300	Loan repayment from Gopal (Veg)	payments	a72e87ea-09ac-4a0a-bdfd-bb2b2e8393c7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04 13:07:02.549345+00	f	\N	\N
a8f9ead3-4c65-44ea-87d3-bdee4279563d	loan_repayment	500	Loan repayment from Stella Mery	payments	17f3a77f-95a3-4254-9aef-eb88c94bc557	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04 13:10:07.36131+00	f	\N	\N
c5557742-605c-4901-8b59-dc564098c2f4	loan_repayment	500	Loan repayment from Anitha	payments	6003cbad-5bd1-4638-86e9-5adac0596d5d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04 13:10:24.189334+00	f	\N	\N
ea307863-1a48-435c-a23f-505b4f46d631	loan_repayment	1000	Loan repayment from Vasu (iyyar)	payments	4b1f2db5-52ec-422b-bcfb-33ab3ee84e54	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04 14:29:21.113349+00	f	\N	\N
b4f0541c-4712-416d-a327-c6e237fab7dc	loan_repayment	200	Loan repayment from Bhavani.Venkat	payments	d3f6dc44-836e-419c-a789-c29e1160576e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04 14:30:08.113541+00	f	\N	\N
a1b83cc0-78db-4d75-b136-fa36b57ef043	loan_disbursement	17000	Loan disbursed to Ramesh.guru	customers	b0ad6445-eed2-49f7-9b7c-78fdf8a2a53d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04 14:37:45.73139+00	f	\N	\N
57a8236e-8322-498a-afd7-793dcca19c4a	loan_repayment	100	Loan repayment from Kumaran.E.B	payments	58c3adba-0291-416d-8e55-dd47d1355c5b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04 14:59:28.468007+00	f	\N	\N
e18e01e6-1c93-46e1-b135-8155c64206b9	loan_repayment	500	Loan repayment from P.Selvam	payments	d53529b9-167e-48d5-ae66-ff6f9f952031	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04 15:00:05.016818+00	f	\N	\N
2e4d9a65-f920-476a-ab37-0f1bee64caf5	loan_repayment	200	Loan repayment from Rajaselvam	payments	f303042f-0768-4c28-8d96-c73d0ffdfc95	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04 15:00:37.186487+00	f	\N	\N
755e7151-d175-46aa-8607-e5ed205660bd	loan_repayment	3000	Loan repayment from Brijesh	payments	5c8fd915-bd4d-4a42-add9-40040f3e5666	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04 15:01:05.965003+00	f	\N	\N
67ead1a5-eeea-4856-9679-750fc75baf1f	loan_repayment	200	Loan repayment from Balamurali (sekar)	payments	87818001-ddb1-4fcf-bc48-c811e8b7e119	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04 15:22:56.45573+00	f	\N	\N
fb5c9e40-4bec-4c39-971e-13a44f248eaf	loan_repayment	1500	Loan repayment from Thangapandy	payments	98b3d008-5644-4c69-8d70-8323f058f5a6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04 15:23:24.967849+00	f	\N	\N
516e84de-4693-4c47-a3b8-044d41a16f1d	loan_repayment	100	Loan repayment from Divya (poo kadai)	payments	09e719eb-4db9-47d6-8861-9f233fa62d65	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04 15:41:02.127551+00	f	\N	\N
b76fc8ea-a7be-45b9-b203-bc95bbe625b4	loan_repayment	500	Loan repayment from Lakshmi.(Tiffin)	payments	1a9c584c-15bb-40fa-bb1b-4d81cad32e0e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04 15:41:32.62267+00	f	\N	\N
48be2d06-ecea-4d26-a545-4e6d5f0c4630	loan_repayment	300	Loan repayment from Sheela	payments	699539c8-7c0a-40d1-83ff-ebbafcebbce8	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04 15:41:56.211342+00	f	\N	\N
b06dc751-7ced-4f60-b0a2-473aca527a01	loan_repayment	200	Loan repayment from Pandit	payments	551a1dc1-0913-4dec-b953-c5959c15115b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04 15:42:16.171639+00	f	\N	\N
bb132698-488d-4efb-b2aa-279796fff4f2	loan_repayment	300	Loan repayment from Ramanathan(Soop)	payments	130eee86-f66c-4c9c-a12a-d1e35d2c850e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04 15:42:48.740531+00	f	\N	\N
8e26b40a-390a-445b-a6a9-3446d5995d95	loan_repayment	400	Loan repayment from Jaffer	payments	72045972-4650-4a11-8ba7-f1cb20e7f1de	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04 15:43:07.172804+00	f	\N	\N
70f5c01a-cdc4-4b1f-9cb1-c295c999fba3	loan_repayment	200	Loan repayment from Rubini	payments	a8d23987-07fb-4cf2-b983-bc12d9498616	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04 15:43:29.327017+00	f	\N	\N
4976dca9-9d86-40d3-9742-61e2a45ceb9a	loan_disbursement	17000	Loan disbursed to Sundharamoorthy.Magic.6382566774	customers	a03836bd-4e58-4dcf-b429-ad094f601d2d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04 15:53:47.540317+00	f	\N	\N
de08271d-72fd-4da8-a46f-1b3f60c4b58d	loan_repayment	500	Loan repayment from Varanasi.Ayyer.	payments	4c2af397-ae59-47f4-877d-5b4e08a306b8	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04 18:19:18.653068+00	f	\N	\N
03c5eafb-7275-4869-8658-a59f5f7c5dc8	loan_repayment	500	Loan repayment from Maha	payments	72f4dd91-c207-4713-9c53-66f30ecb60d9	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-05 04:44:32.712883+00	f	\N	\N
834e56b9-3be9-4a40-ab45-7be3ca475eeb	loan_repayment	50	Loan repayment from K.Kumaran	payments	5d57edc0-ea2b-42da-8b45-1910d20c0245	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-05 04:45:17.30699+00	f	\N	\N
2efa918f-4343-4421-8a30-749f73787c54	loan_repayment	50	Loan repayment from K.Kumaran.1	payments	cf42b83c-6845-4de6-99e9-024a3c486054	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-05 04:45:42.526207+00	f	\N	\N
25cd912f-6c72-4c3f-a0c8-e743aec83240	loan_repayment	200	Loan repayment from Paramaguru	payments	210bd182-6c3c-43c2-9273-03d0854defee	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-05 04:46:32.050158+00	f	\N	\N
ab1eebf5-88f1-4194-8154-adc4e91eb56f	loan_repayment	600	Loan repayment from Shankar.ilaiyaraja	payments	ae5a9f88-4610-4e8d-ad2d-a92ec28161f3	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-05 05:19:02.790875+00	f	\N	\N
7215ddbb-28fd-4714-9c03-d941e164307f	loan_repayment	100	Loan repayment from Karthi (Veg)	payments	995c618d-6a66-48de-98e6-bab91cdb51ef	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-05 06:36:13.651736+00	f	\N	\N
866ab4f7-f71a-41a0-ae9f-0456ba9eb9cd	loan_repayment	1400	Loan repayment from V.Saravanan.Pillar	payments	f443a9ab-54f8-47cb-b366-164d319a8cf7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-05 07:10:14.59037+00	f	\N	\N
b4862550-f2a2-48ce-a640-f85ffbf16c9d	loan_repayment	300	Loan repayment from Selvam.Ration	payments	f2702b11-84c9-42f9-9731-f6aa885cc54c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-05 07:18:58.143088+00	f	\N	\N
b6dfe09b-093e-4ce4-b34d-c128936d2298	loan_repayment	300	Loan repayment from Murugan(mec)	payments	704d9794-ce7d-446b-a3ad-c54b6c09982a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-05 07:19:47.206098+00	f	\N	\N
a758fcfe-1963-4a2b-9336-cbdb54545406	loan_disbursement	4250	Loan disbursed to Sagunthala	customers	019b4424-175f-4bb1-9c64-bd2fb04a8ae4	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-05 07:50:26.471547+00	f	\N	\N
2d18265f-eb66-4333-90d6-b8691fdf31c1	loan_repayment	500	Loan repayment from S.Saravanan	payments	85c507b4-eebe-484b-a316-4a98e99012c0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-05 07:52:25.010498+00	f	\N	\N
b8cac8eb-f23f-4d8d-af29-0c9de73993f6	loan_repayment	1500	Loan repayment from Thangapandy	payments	cc8ff054-5569-4686-9adf-a8070c6b95c8	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-05 11:52:37.862088+00	f	\N	\N
557a7b6b-3aa8-413c-9909-e304d9bceb5a	loan_repayment	300	Loan repayment from Gopal (Veg)	payments	23780585-33af-4dc8-b416-886bf24df945	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-05 11:52:57.65197+00	f	\N	\N
39505ec8-e7b5-432b-be11-86d6d86f2540	loan_repayment	1000	Loan repayment from Rajesh ( Elc )	payments	cd07958a-b26b-4544-a670-93232fad7cc3	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-05 11:53:15.579875+00	f	\N	\N
6273a04c-e774-4146-9a1c-8182e816b451	loan_repayment	800	Loan repayment from Sriman	payments	fb4c05a5-3d2f-4b68-8cd5-42394b291e73	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-05 13:42:19.616281+00	f	\N	\N
ba2e03ff-74d6-4472-a014-99f5fa01b7a2	loan_repayment	250	Loan repayment from Gandhi	payments	5bca1200-9cd4-43b3-9516-fb2004687559	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-05 14:37:53.888961+00	f	\N	\N
d98a0647-5866-49cc-8ac9-b71fbf52fc2a	loan_repayment	4000	Loan repayment from K.V.Ramesh	payments	0b230a79-1a2c-43e1-9824-f818f2916204	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-05 14:48:46.845288+00	f	\N	\N
966e5a36-fd84-4e88-8f17-ec1e7168dc07	loan_repayment	100	Loan repayment from Divya (poo kadai)	payments	ec5ffb9e-0aa8-478c-abea-408b192afec6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-05 15:06:34.394263+00	f	\N	\N
98e0bb41-9642-46a0-9115-9b207cbdc247	loan_repayment	300	Loan repayment from Chandran.(Malathi) - 8925450236	payments	7a538c31-d1b7-467d-a2e3-c664072baef1	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-05 15:06:49.387765+00	f	\N	\N
c3f7bbc9-3179-4705-940d-dbd7eaea5491	loan_repayment	500	Loan repayment from Uma.Elumalai	payments	ec478142-6693-4cf2-acae-f64ea66e278a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-05 15:07:54.715148+00	f	\N	\N
085ceb32-cd1c-4e2d-bbe8-a795da57e07a	loan_repayment	300	Loan repayment from Sheela	payments	8df584f2-f779-4569-8f8e-451e5e4ef5f3	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-05 15:08:20.686229+00	f	\N	\N
2d3a9c91-9c60-490a-bc97-9eb0e483157f	loan_repayment	100	Loan repayment from Elumalai.mani	payments	5d090a9e-1c87-48a8-a21d-e407b0c21511	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-05 15:08:40.278822+00	f	\N	\N
3e1bd4be-0ae1-41f6-a591-e93ec41bab17	loan_repayment	200	Loan repayment from Ramesh.guru	payments	b759d6e9-cff4-40fc-9c70-488cdef24327	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-05 15:12:47.662161+00	f	\N	\N
a16e8d5a-6b25-4dd0-b97e-7422e8005f8d	loan_disbursement	4250	Loan disbursed to Prasanna	customers	d02bef4a-06c7-4717-b494-968be98c5e8b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-05 15:18:56.437513+00	f	\N	\N
e31b6dad-01a4-4d1e-8ebb-2e1b5b35c06e	loan_repayment	500	Loan repayment from E.Saravanan	payments	d0e10458-c784-49cd-b71b-a253fad16acb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-05 15:57:54.752293+00	f	\N	\N
b08de76a-cf65-4922-90ad-6dd9bb35b983	loan_repayment	500	Loan repayment from Anitha	payments	fd6aee38-d97d-4ee0-84ff-e4d443a05300	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-05 16:43:33.984674+00	f	\N	\N
985faa0d-737d-4946-8251-8a92e94ff3b6	loan_repayment	500	Loan repayment from Varanasi.Ayyer.	payments	64bc3f8b-426e-4a6c-9bc1-a7e3d8705b59	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-05 16:43:54.249896+00	f	\N	\N
d9842ffe-e53e-4cf5-94de-b6cccc335b84	loan_repayment	300	Loan repayment from Sivaraj.Sekar	payments	c95e46a2-1bfa-4f08-9766-c6143fb92ece	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-05 17:37:49.472542+00	f	\N	\N
87fcc305-c49c-4b3e-aded-722c2d0f0697	loan_repayment	500	Loan repayment from Karthi.Suba	payments	a2ea4a2c-008b-4b6e-a301-66438ce41d19	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-05 19:28:30.266254+00	f	\N	\N
5046d3c3-7cc4-438c-a47b-32df7a68247c	loan_repayment	200	Loan repayment from Paramaguru	payments	fa7be925-d067-46a5-96b3-76de702b702c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06 03:52:53.632261+00	f	\N	\N
f42c817e-4ed7-475e-a48e-18e21ea6003d	loan_repayment	50	Loan repayment from K.Kumaran	payments	264bdd7a-f3be-4bce-92b7-566fde10772d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06 03:53:14.384436+00	f	\N	\N
f0466165-a1a0-4e78-a03f-4684fd407673	loan_repayment	50	Loan repayment from K.Kumaran.1	payments	55d3d4d6-f93c-42a1-be12-59f64918dc48	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06 03:53:39.370324+00	f	\N	\N
449a6327-01c6-4631-89db-8510102df8bd	loan_repayment	700	Loan repayment from V.Saravanan.Pillar	payments	97e10d90-b23b-46c4-bcf3-c5cb3dd73b18	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06 03:54:06.66754+00	f	\N	\N
03d92c9e-ab0d-4d71-aa53-866dfb7e1140	loan_repayment	2200	Loan repayment from Manipaul	payments	69d296e4-1ada-4a01-a93e-b199b97303be	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06 05:24:55.420714+00	f	\N	\N
79f66e07-535c-4bcc-a0ff-84a72021130b	loan_repayment	450	Loan repayment from Sathish (Piller) V.C	payments	1cdc0e20-dfdb-48c8-83a0-5be57bc7164e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06 05:34:05.945034+00	f	\N	\N
1346ae37-8fbe-4ce2-a25e-905d16e975f8	loan_repayment	3000	Loan repayment from D.Shankar	payments	58df439b-d362-4ff3-b926-2e39e0f33212	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06 05:34:37.666345+00	f	\N	\N
b6bd7334-b60c-43ec-9fc3-b9713ea3696b	loan_repayment	500	Loan repayment from Anitha	payments	e7e6b101-64c7-416d-8d55-b0a49e459c61	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06 05:40:58.035973+00	f	\N	\N
8941f755-0b77-488e-9ef6-9e5d605ed475	loan_repayment	500	Loan repayment from Hari(Arvind)	payments	1bd8e2f6-5b87-4474-89bc-cbe6e9d88942	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06 06:55:24.532981+00	f	\N	\N
9b7c197c-e957-4a30-8213-3272fdd3d50d	loan_repayment	50	Loan repayment from Sagunthala	payments	c2ba852f-cac4-467d-aed1-f1f9c04ed6ee	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06 07:27:34.479775+00	f	\N	\N
a91353f8-e505-42d6-92ea-2f107e57629b	loan_repayment	300	Loan repayment from Selvam.Ration	payments	53f2e78d-6b22-4318-ba36-0fd6a4203999	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06 07:27:56.598883+00	f	\N	\N
6dc61d25-c668-4399-97c5-e30233a753e6	loan_repayment	500	Loan repayment from Parthasarathy	payments	1390c7d5-339c-4209-99b1-e6b52307ee3c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06 07:39:20.254617+00	f	\N	\N
091ac1ff-4c91-4241-be1e-f9e9fc79fb01	loan_repayment	2000	Loan repayment from Nandhini	payments	3da638c6-d606-4f17-bd92-c97d643fe304	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06 07:48:04.114765+00	f	\N	\N
cd2d278b-aeb3-4adf-b75b-d9633526c271	loan_repayment	200	Loan repayment from Ajith	payments	42c62178-9605-49be-999d-ca9c494db55c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06 07:48:28.397838+00	f	\N	\N
9c662246-1fd6-460f-b0eb-25cccf341521	loan_repayment	300	Loan repayment from Gopal (Veg)	payments	27f48a2f-3a8e-415b-bdaf-f5e1ac4903c2	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06 09:34:15.349215+00	f	\N	\N
ee1662d8-fc3e-457e-8cac-c69e5bf37795	loan_repayment	1200	Loan repayment from R.Kumar (Yazhini)	payments	23f00b1a-5f56-4ad4-a5c7-c604e48a0882	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06 11:44:35.464344+00	f	\N	\N
ec0f1299-fcfe-45c1-9d68-bdfa7ac97ab2	loan_repayment	1500	Loan repayment from Gokul (Magic)	payments	06542776-0273-433a-8bd2-be385efe5ff1	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06 12:10:53.435077+00	f	\N	\N
f833eaf8-0116-4fd4-9391-9f34775f7204	loan_repayment	1800	Loan repayment from Vinoth.Munusamy	payments	4804d921-1695-48d5-8e8c-31db83f551b3	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06 13:17:42.685417+00	f	\N	\N
0bfc6861-d9fa-435a-acd2-6e08cbf541ab	loan_repayment	100	Loan repayment from Kumaran.E.B	payments	c696f854-9351-40bc-b14d-9975530329aa	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06 13:37:50.254618+00	f	\N	\N
51eb1a92-69fb-4e07-a543-29ba254b4fca	loan_repayment	2100	Loan repayment from Sendhil (Sathiyanagar)	payments	c6c83805-5e68-483d-a085-0f76ea4785e5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06 13:56:25.985178+00	f	\N	\N
c270efb9-c64b-42cf-9cff-5fbc028f1dc4	loan_repayment	200	Loan repayment from Bhavani.Venkat	payments	e7fb39b5-c3d8-4572-9c4a-f123a2f1e07b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06 14:14:10.583262+00	f	\N	\N
cc244b94-be51-427f-a0e2-3c16de12ae02	loan_repayment	500	Loan repayment from P.Selvam	payments	1dd6b0e6-73a5-4b50-bfd8-27406d21f75a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06 14:25:48.813559+00	f	\N	\N
cc6ae66d-ab1c-4836-80c8-b0ca1f465acc	loan_disbursement	34000	Loan disbursed to Iliyas.Dhaadi Baai	customers	e9b6d72d-0b4a-450d-8c1d-4d79ce11223a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06 14:41:37.690557+00	f	\N	\N
9df439e6-75db-4202-bb4f-06f5d40f623a	loan_repayment	200	Loan repayment from Rubini	payments	194946ad-df76-4d28-be63-72f84270f96f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06 14:47:41.530369+00	f	\N	\N
4c6a9d0c-7328-4671-a614-fddca34b0b66	loan_repayment	200	Loan repayment from Balamurali (sekar)	payments	90ee762c-6ee8-4215-b002-5b670021b05e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06 14:50:17.248853+00	f	\N	\N
4cb18d8d-a599-49a0-8c27-9ba9ee8d9849	loan_repayment	500	Loan repayment from Mani (Magic)	payments	f396ac66-ea1b-4567-9d52-a4adbb44b316	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06 15:04:05.655775+00	f	\N	\N
77d6c3ac-302d-4d19-8adf-ed0abf412d3a	loan_repayment	100	Loan repayment from Divya (poo kadai)	payments	81efaae2-fee0-4b2d-9e94-a9fe7cce9bdc	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06 15:05:39.178492+00	f	\N	\N
ffdaa082-c414-4c56-b189-e17296ee0ce4	loan_repayment	500	Loan repayment from Uma.Elumalai	payments	5327bd7d-8a6c-4176-8a3b-7b5c300c1059	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06 15:06:14.259233+00	f	\N	\N
1b4ea99f-30b9-4b76-922c-e1156112ab86	loan_repayment	500	Loan repayment from Lakshmi.(Tiffin)	payments	64b4d357-4219-4151-bbf4-fc28c09ca442	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06 15:06:41.937279+00	f	\N	\N
fe68f5d2-9aa6-4fe3-87eb-8ef147df3690	loan_repayment	600	Loan repayment from Ramesh(Pori)	payments	68f15a26-60e0-40f9-b4d7-cdffd824442b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06 15:07:43.09189+00	f	\N	\N
edad1741-982e-45f5-a8f4-851f316e3435	loan_repayment	300	Loan repayment from Sheela	payments	adc49dc9-895f-4825-9b96-e179d3716b2c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06 15:08:06.998918+00	f	\N	\N
12a8b291-cf8a-4cb9-a048-125909284d53	loan_repayment	200	Loan repayment from Jaffer	payments	19832733-bbd3-48ce-a978-aa631620220f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06 15:08:47.757427+00	f	\N	\N
c4ff58ae-e167-4695-b6a4-bfcddcd9220b	loan_repayment	300	Loan repayment from Ramanathan(Soop)	payments	b53ec2bd-dd19-4f2e-8ff7-1d9e4b2fb736	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06 15:09:18.438923+00	f	\N	\N
e1e5460a-0a71-4dc4-992a-8d985f94e787	loan_repayment	100	Loan repayment from Elumalai.mani	payments	3e4b511f-4578-4212-b693-484d9e8d4e98	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06 15:09:46.312963+00	f	\N	\N
af1cbc19-ca29-43be-98da-3eab0da8e1fb	loan_repayment	250	Loan repayment from R.Murugan(Auto)	payments	0eb664fd-572e-4426-90a7-6f35c059879f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06 15:29:11.738857+00	f	\N	\N
bf0683d6-2312-4c5c-a9ef-51be6072c3d0	loan_repayment	1000	Loan repayment from G.vengatesh	payments	91e8d023-c21b-4021-8374-abcefd45d35f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06 15:29:36.897635+00	f	\N	\N
c8f55ebf-381e-471c-94b1-8c882ba4e9b6	loan_repayment	2800	Loan repayment from Chizhyan. DMDK	payments	ebb401cc-259c-45d8-a353-d61df074002d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06 15:30:36.107922+00	f	\N	\N
6579e074-cb6a-45af-b6c4-886fc113a0f9	loan_disbursement	17000	Loan disbursed to Harideva	customers	b22b99e0-ad0d-4b0b-bdeb-7f6883ff97c1	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06 15:36:39.726631+00	f	\N	\N
c605903e-8434-4964-afbc-3a8144fef83c	loan_repayment	50	Loan repayment from Mani.Angala	payments	5313c5d3-3eef-4cc6-a97d-e7cf0daff1d9	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06 15:44:56.347678+00	f	\N	\N
8acd5cb6-3861-4198-be9e-2c0a67acf8c8	loan_repayment	500	Loan repayment from Varanasi.Ayyer.	payments	285e261c-417c-4b1a-93e9-61e485375510	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06 15:54:09.976482+00	f	\N	\N
a962d123-d36a-4dc8-a322-0d9e043aee20	loan_repayment	300	Loan repayment from Iliyas	payments	ea328caa-7db1-4fc9-b734-0881cdc6f60c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06 16:05:06.911659+00	f	\N	\N
546a4ea9-5447-4b98-a57d-92406168cf3b	loan_disbursement	55250	Loan disbursed to Vishwanathan.9600058274	customers	70b6dbb8-0fb8-4661-a0cd-21955635a422	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06 16:27:24.229825+00	f	\N	\N
c63d0a79-8b0c-4860-90a5-855f6d5360d6	loan_repayment	1500	Loan repayment from Thangapandy	payments	5b50c275-0d7c-4798-ab88-4bc4c43aca95	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06 16:46:58.016089+00	f	\N	\N
d49b612c-5227-470c-bff6-e060e9cec587	loan_repayment	300	Loan repayment from Kadumpadi	payments	cc9e0832-55c9-4e46-baad-d0335f14b3a5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07 01:32:59.514438+00	f	\N	\N
33563ac4-5254-485e-81f2-c0f175cfba7e	loan_repayment	50	Loan repayment from K.Kumaran	payments	8f385337-637a-4083-a49b-78e71e03dd2c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07 01:34:02.188842+00	f	\N	\N
8bd5db5a-8811-4714-807b-89d28556058c	loan_repayment	50	Loan repayment from K.Kumaran.1	payments	22882270-6af4-4a01-bfb0-aad60f115871	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07 01:34:29.637804+00	f	\N	\N
532925b5-b57a-427d-8abd-322475d9f1d4	loan_repayment	500	Loan repayment from Maha	payments	b4b99334-9b70-4a07-b83c-411dfcd0a1f3	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07 06:13:31.439861+00	f	\N	\N
caad4540-a026-45c1-ac3a-0c0fa1517e09	loan_repayment	50	Loan repayment from Sagunthala	payments	0513a361-2e79-4d29-bed7-66ef4851d917	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07 06:20:22.923519+00	f	\N	\N
37c06d04-4c47-4b73-86df-d8df1b90b4ff	loan_repayment	400	Loan repayment from Iliyas.Dhaadi Baai	payments	916dff10-8dc2-4941-b4d2-e8e806ee649c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07 13:59:35.9152+00	f	\N	\N
34a537df-3cfd-4bc2-be9c-5b0d55f1c514	loan_repayment	3000	Loan repayment from Baai ( Thaadi )	payments	2e08b078-7ce6-4092-8765-aed64705c5cf	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07 14:00:04.654867+00	f	\N	\N
bf38d98f-687d-4589-8ffb-49ad84093981	loan_repayment	100	Loan repayment from Divya (poo kadai)	payments	0ece9803-e73a-4575-9da3-2a761366e1b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07 15:18:29.102905+00	f	\N	\N
8765432c-26cd-4a7c-9293-2007e9e1e72c	loan_repayment	200	Loan repayment from Bhavani.Venkat	payments	8f7e24b1-6301-425c-88f9-4a8000461646	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07 15:20:06.407049+00	f	\N	\N
68aac04b-6644-41c7-96b1-0fa2b9d86eab	loan_repayment	300	Loan repayment from Sheela	payments	e712d014-78de-4d8d-99b3-dd3e45bc9837	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07 15:20:30.534562+00	f	\N	\N
1bb423ed-21a4-4220-b297-fa66f98802bc	loan_repayment	600	Loan repayment from Kumaravel.megic	payments	e5d8f496-196a-4232-a01a-20f67034bd3b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07 15:22:31.678156+00	f	\N	\N
7b8b6bd5-b105-43b0-a201-b7ffaaf49df8	loan_repayment	1300	Loan repayment from Vishwanathan.9600058274	payments	34b191bc-5af9-4fa4-8eb6-d3cd2d5615ac	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 16:26:31.390759+00	f	\N	\N
0143b7de-9170-43a1-b258-a0697bdb14c5	loan_disbursement	8500	Loan disbursed to Raj Kumar (DMDK)	customers	5f1540b7-3eda-41e6-87f9-f6a13d0a1980	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11 14:27:41.128008+00	f	\N	\N
eabc0fc4-08f3-4582-9fb4-5defb56a63f4	loan_repayment	500	Loan repayment from Lakshmi.(Tiffin)	payments	7f958be5-6148-4882-9069-5f9d839127d6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11 15:47:50.71938+00	f	\N	\N
42620fb7-9b93-43b8-a475-47e69f5792c5	loan_repayment	500	Loan repayment from Hamsa	payments	07286cb3-4cee-43fb-b8da-1a24a839359d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11 15:48:42.428352+00	f	\N	\N
0c930d9a-5e8e-4fb3-94f8-45cdde4dbc73	loan_repayment	200	Loan repayment from Harideva	payments	d61c4a13-b90a-40be-975f-a511c56df175	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11 15:50:01.841185+00	f	\N	\N
d9ecacea-2614-4af2-87ec-f1d1d2414e1e	loan_repayment	1000	Loan repayment from Nandhini.vasanthakumar	payments	e4d8c7dc-bcc7-4ab2-bb31-30f4c5e52f4d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 07:44:54.82973+00	f	\N	\N
b6793e08-e875-48ca-b8ba-23acca7e5452	loan_repayment	500	Loan repayment from Anitha	payments	9ab16ed6-af05-47a5-8ba3-1c5361bce9e9	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 13:22:22.002079+00	f	\N	\N
0fd7a76f-8365-4d7f-a68f-fbbc03c5099e	loan_repayment	1500	Loan repayment from D.Shankar	payments	10a69164-8c10-4d1c-a47e-25c527317cb9	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 13:23:24.154113+00	f	\N	\N
95a22bcd-e694-4d30-947e-1bffa8c8e89b	loan_disbursement	17000	Loan disbursed to Palani.soopu	customers	69862c5d-a6f2-48c9-83d8-364820586103	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 14:49:01.03548+00	f	\N	\N
a258372e-732c-4659-981d-f2b135cd3c3e	loan_repayment	500	Loan repayment from Lakshmi.(Tiffin)	payments	8a1f27d4-84b6-4c9c-b58f-4167ee6ad0e9	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 15:31:09.045209+00	f	\N	\N
c3eb67e3-f6d9-4089-b64b-f6549ad93f07	loan_repayment	200	Loan repayment from Balamurali (sekar)	payments	afdc4d22-3826-4bc4-8619-c757045d4294	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 17:23:35.274342+00	f	\N	\N
5556310d-fde8-4ba1-8d5d-24009f2e8588	loan_repayment	500	Loan repayment from Maha	payments	66dde5c0-c864-4fdf-a41b-4c8725bf059e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 06:07:20.45338+00	f	\N	\N
cfa4d7f9-f90d-45af-ae79-beace6c880c1	loan_repayment	5000	Loan repayment from Brijesh	payments	29557d3c-7b87-4192-bcbf-e1626fb99862	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 07:28:35.014504+00	f	\N	\N
1acd1970-ab8f-4087-9fc8-5f9c3b2d65c4	loan_repayment	150	Loan repayment from Basheerbai	payments	ce42cbee-af4c-4663-9fff-54a851189fab	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 13:10:57.463707+00	f	\N	\N
bf17a23b-46c4-4b14-9f8f-fcc9958268c3	loan_repayment	1000	Loan repayment from Varanasi.Ayyer.	payments	39fc270e-622e-413f-af71-1381c67f142b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 13:11:50.491138+00	f	\N	\N
36991f0a-b2f8-49c2-a5dc-3b4ff2f84158	loan_repayment	50	Loan repayment from K.Kumaran.1	payments	7500cb60-08c8-4870-a1f9-11caffe2d28b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 14:17:13.108581+00	f	\N	\N
7ae8a3ce-f0dd-48eb-aecf-41832c34f10d	loan_repayment	15000	Loan repayment from Jegan (Car)	payments	6cc672c7-cca4-46e7-a9cc-5e1637a01efe	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 15:08:37.587119+00	f	\N	\N
db0e9217-6eee-4896-ae14-c6c5225e39be	loan_repayment	700	Loan repayment from Chandran.(Malathi) - 8925450236	payments	e9048418-317d-4877-a951-8f445b45b006	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 15:30:19.188865+00	f	\N	\N
9c63a971-2536-44b4-9189-c12ab1c48c97	loan_disbursement	21250	Loan disbursed to Shanthi	customers	a518ab91-c839-427f-9118-f38636c91f1e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 15:48:33.664711+00	f	\N	\N
2c9dcb7a-50d5-40f0-bff8-c8c06c7cb928	loan_repayment	200	Loan repayment from Pandit	payments	7a605db2-debc-4650-b9f0-41faf775a025	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07 15:21:05.176691+00	f	\N	\N
c99d5ecf-68ab-4eb4-9af0-70fd4187535a	loan_repayment	700	Loan repayment from Chandran.(Malathi) - 8925450236	payments	db43e2dd-c396-4f83-8da1-afff1adcb834	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07 15:21:40.414809+00	f	\N	\N
b8b7a216-bde8-4551-bee5-b7d0a409691d	loan_repayment	200	Loan repayment from Jaffer	payments	adf45059-acc0-40f3-a74e-24a891bd5b33	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07 15:22:05.770813+00	f	\N	\N
3f134af6-0241-4813-9aae-b26f0565c5c1	loan_repayment	200	Loan repayment from Harideva	payments	57c03558-6f73-43a7-a8ff-2451a519692c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07 15:23:00.045417+00	f	\N	\N
fe724bfe-0c7e-4704-ad43-b5f3aae94c7f	loan_repayment	500	Loan repayment from Lakshmi.(Tiffin)	payments	1f47b964-f159-4713-b61a-76b77e520153	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07 15:35:31.101183+00	f	\N	\N
77d07a69-0377-46ff-86c1-4abfd666438b	loan_repayment	600	Loan repayment from Sundharamoorthy.Magic.6382566774	payments	096487e6-80b6-4c41-a51d-a0ecb9c23532	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07 15:35:58.857474+00	f	\N	\N
9938549f-9062-4a30-b1a6-b96a7c951ce9	loan_repayment	400	Loan repayment from Iliyas.Dhaadi Baai	payments	c824e5d5-f0d1-48d6-a681-81ec70c9a363	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 05:04:03.195304+00	f	\N	\N
8a832fdc-891a-4396-9a70-3ee5e9c11e12	loan_repayment	1800	Loan repayment from Baai ( Thaadi )	payments	546532c5-1181-4729-93f1-1c5e20a7a5e5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 05:04:27.696046+00	f	\N	\N
c7ea78e5-9b32-4432-8ed9-4355ab4f013d	loan_repayment	200	Loan repayment from Karthi (Veg)	payments	f25de401-1524-406e-bff5-97902335ce4f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 06:26:32.97247+00	f	\N	\N
f91ad3e8-d999-4b5e-afae-7ab46ed7e61a	loan_repayment	200	Loan repayment from Ramesh.guru	payments	ed54c744-ae11-4921-a1ad-7cbe20b45ac1	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 06:27:05.745545+00	f	\N	\N
9ebf0ba7-2dc6-4fe4-8010-00dca530c01f	loan_repayment	50	Loan repayment from K.Kumaran	payments	13fa913f-f1e0-4e7e-b362-d66cf676f75d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 06:27:33.151015+00	f	\N	\N
0d9386d8-70de-4b46-9526-9788c01e7cb4	loan_repayment	50	Loan repayment from K.Kumaran.1	payments	41c31fab-e85e-471b-9621-d9e817d1c159	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 06:27:52.666476+00	f	\N	\N
35ac97e2-5515-4c2a-92f0-c327708e4551	loan_repayment	300	Loan repayment from Kadumpadi	payments	a90b18ff-55fa-44fb-81d4-2f66de2206bd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 06:28:16.666077+00	f	\N	\N
88467093-391e-486c-9d2f-8dd98e2bb921	loan_repayment	200	Loan repayment from Paramaguru	payments	4f0641a2-91b8-4423-b7a1-4ab8169add7b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 06:28:41.61499+00	f	\N	\N
74b62d06-23c9-4c15-ae6e-bf1f40221a1c	loan_repayment	500	Loan repayment from Vijaya	payments	f36b55ee-67a5-413a-8b2a-3a9b415d0eb7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 06:29:04.90969+00	f	\N	\N
7316cad0-07a5-4164-9150-4e5770168650	loan_repayment	150	Loan repayment from Sathish (Piller) V.C	payments	60ba6912-1734-409c-a984-7a7501ba5f5d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 06:29:26.971527+00	f	\N	\N
5a7209bd-3e55-4b63-863f-3828e1f6004d	loan_repayment	500	Loan repayment from Anitha	payments	6d93716e-be98-4bb0-b316-87a9abe6b578	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 06:29:49.662387+00	f	\N	\N
9fadf34c-8fe1-4a86-89d9-2d08176c7542	loan_repayment	1500	Loan repayment from Thangapandy	payments	b2029d45-4823-4116-899c-dd2547308b97	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 06:30:16.114717+00	f	\N	\N
a654d6aa-55c7-45a0-ab22-07527f703f93	loan_repayment	700	Loan repayment from V.Saravanan.Pillar	payments	23bb5e4d-5702-40c5-8253-9a8b27df4911	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 06:30:42.093818+00	f	\N	\N
4f994606-d0d6-4bf0-8371-0db052838b9a	loan_repayment	300	Loan repayment from Sivaraj.Sekar	payments	9974471c-69a1-4ec8-8c63-c41fba96dc26	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 06:31:18.630365+00	f	\N	\N
123b74fd-53c7-4dd5-9199-d84a3602c610	loan_repayment	600	Loan repayment from Ilaiyaraja (Auto)	payments	acbafed1-0530-43fc-b9dc-7c4008383167	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 06:31:40.681791+00	f	\N	\N
94495ea2-88c4-4362-b4fe-cb607d8603d1	loan_repayment	6000	Loan repayment from Thangam.Akka	payments	42db212d-e81f-4c47-bea2-fa0ca00fcd96	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 06:32:04.599019+00	f	\N	\N
a35e1ef3-c18d-4163-857c-e136c0379b3c	loan_repayment	1800	Loan repayment from Sudhagar	payments	406bc5ef-e366-434c-8389-dba889fdae1c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 06:32:27.334217+00	f	\N	\N
2b44bc84-eee0-4648-b578-11fee79665ee	loan_repayment	300	Loan repayment from Gopal (Veg)	payments	999d4996-6803-4dfd-87ee-85c9cd8a88fd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 06:32:54.36697+00	f	\N	\N
497ac62b-c577-403e-bdf9-eeb5a8d6da07	loan_repayment	2000	Loan repayment from Loganathan.DMDK	payments	e380ef84-bafb-414d-90a4-18ebb62b36d4	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 06:33:14.439727+00	f	\N	\N
a26f4f5c-5d2b-4c0f-8faf-0f03cfcb4272	loan_repayment	200	Loan repayment from Rajaselvam	payments	31314f02-3b23-4d63-9bf7-ecffca0a38a4	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 06:33:55.683214+00	f	\N	\N
b02f3f29-51fd-4ab2-b6d6-b74f52325df3	loan_repayment	400	Loan repayment from Karthikeyan	payments	fd2086a1-6868-4335-9965-1b9d75de7300	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 06:34:26.669809+00	f	\N	\N
8c055363-c0e1-4fca-babc-67473d254251	loan_repayment	200	Loan repayment from Balamurali (sekar)	payments	9a4dcc9d-826f-4205-a165-d4c2de5889e9	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 06:34:48.305103+00	f	\N	\N
2fa6b81f-1b8e-4bad-b2f2-13af6c73a395	loan_repayment	2000	Loan repayment from Brijesh	payments	6b62a607-4458-4224-a463-943b108b1cf2	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 06:35:12.343142+00	f	\N	\N
d1aa9dc6-18b0-438c-abe8-a80905dba95d	loan_repayment	250	Loan repayment from R.Murugan(Auto)	payments	e03c2988-0eb1-4787-b03f-45bdc50567e3	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 06:35:47.020633+00	f	\N	\N
41b47b46-0f80-4c7e-8f42-79de844d7499	loan_repayment	500	Loan repayment from Karthi.Suba	payments	76de0b1a-fac7-4da8-9f2d-a2eaa40997d6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 06:36:14.471615+00	f	\N	\N
bc361bc8-2c50-4803-8d8c-af426c96030a	loan_repayment	600	Loan repayment from Vinoth.Munusamy	payments	5f1b6615-ed69-4853-acf1-62ac22b3cd9f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 06:37:47.834727+00	f	\N	\N
732489cc-3f75-4114-8eb8-fd764f9bd3db	loan_repayment	250	Loan repayment from Gandhi	payments	874db7b6-9310-4394-b060-0ca2b522eb1d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 06:38:15.758313+00	f	\N	\N
b9365fa5-e0b9-4d36-978e-64826265cda2	loan_repayment	200	Loan repayment from Rubini	payments	35defb68-320b-4c17-af73-90c1528d2d86	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 06:38:39.386353+00	f	\N	\N
d4b0b769-a4f2-4af6-9ed1-b6e86b19daef	loan_repayment	200	Loan repayment from Sathya (Tailor)	payments	e190e302-b9f1-4971-81cd-37afe8d6ac29	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 06:39:09.96397+00	f	\N	\N
0967576c-31a7-49b4-91eb-01ed1b3260dd	loan_repayment	100	Loan repayment from Kumaran.E.B	payments	cc42c018-1fbd-43a7-90e3-30d7569e0376	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 06:39:31.248582+00	f	\N	\N
c01a9609-9205-47fb-a694-0aec25642881	loan_repayment	500	Loan repayment from G.vengatesh	payments	adc12283-10b8-49ba-b989-044adb3030e5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 06:39:55.714528+00	f	\N	\N
db43a3fc-facb-40d3-8ae9-02aee76bad7f	loan_repayment	500	Loan repayment from G.vengatesh	payments	f575936c-973c-40c6-81d7-fe9ae28efd22	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 06:41:11.090353+00	f	\N	\N
b4e56c32-b016-46d2-a76f-37166afd9d27	loan_repayment	200	Loan repayment from Ramesh.guru	payments	9d2a46cc-9b39-4f9e-8865-870c96296a63	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 06:41:45.37854+00	f	\N	\N
ea86bf06-1ba4-4b0a-958e-f0a136aacaa0	loan_repayment	2000	Loan repayment from Vasu (iyyar)	payments	fcf3b0a6-3ea7-4e00-b577-8c62e59efcdf	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 06:42:09.038442+00	f	\N	\N
8d76ddd5-bc8a-46be-9a3b-48e968368d40	loan_repayment	600	Loan repayment from N.Manikandan	payments	cfd47c19-dce4-4d9d-9fc5-eae49361170f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 06:42:38.392226+00	f	\N	\N
1d4a138a-cbd9-49aa-97c5-79230d724e54	loan_repayment	200	Loan repayment from Vengatesh.Mec	payments	a7e9bd27-599c-4b05-82f4-81455ca7574e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 06:42:58.131021+00	f	\N	\N
9dcf39ea-3397-479d-b740-6fa09e8d76b8	loan_repayment	5000	Loan repayment from Muthukumar.7338758742	payments	5b6b5ed8-3ee8-4e3a-9024-8bcbfcba1cb6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 06:43:19.313073+00	f	\N	\N
8b8ee1b2-1795-4d25-b571-41b59b9dd815	loan_repayment	500	Loan repayment from Anitha	payments	574cc5b1-e9ab-498e-9bed-881a0ec865ab	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 06:43:41.150223+00	f	\N	\N
4a563868-53f3-462f-b196-28cd24abc76c	loan_repayment	100	Loan repayment from Paramaguru	payments	29d6ced3-0c0b-4eaf-af5e-38f1419a06c2	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 06:43:59.422225+00	f	\N	\N
6aed61a0-686f-46a7-944a-97db66bc754f	loan_repayment	2000	Loan repayment from Brijesh	payments	63af2932-f0be-4602-8314-da848ec5d0b4	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 06:44:17.218516+00	f	\N	\N
4325231e-744f-4363-9381-3e558b01fc7d	loan_repayment	300	Loan repayment from Selvam.Ration	payments	79d20e88-2509-4de9-8bb8-861594b86164	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 06:46:28.144028+00	f	\N	\N
30e64d7e-4def-4242-8140-774de2c99389	loan_repayment	50	Loan repayment from Sagunthala	payments	4af1cb2b-09ce-4d83-a9ef-dee406a504b1	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 06:46:58.03718+00	f	\N	\N
28c1c970-5795-41eb-8482-d7f8a4c4a5bb	loan_repayment	500	Loan repayment from Maha	payments	afd59da7-b8ac-46af-ab67-4b3e448ac8e0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 06:48:04.10971+00	f	\N	\N
d63ca5df-8fe9-4a72-bfdf-d3805c15657e	loan_repayment	50	Loan repayment from K.Kumaran	payments	2e85ebfa-97c6-4c1f-988c-3f6b659e5073	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 08:02:56.087069+00	f	\N	\N
5311f799-0d30-44bb-90d5-4a17f3836809	loan_repayment	50	Loan repayment from K.Kumaran.1	payments	9c6a8099-6185-49c5-89c1-6c985441bef6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 08:03:13.899351+00	f	\N	\N
9aa995e5-afcf-4faf-bb8b-b519b45718af	loan_repayment	3000	Loan repayment from Amutha.DMDK	payments	2d582046-f227-4b54-a8a9-ca20040bffbb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 12:34:07.553479+00	f	\N	\N
340b00da-d1a8-453f-8969-de5a062cfd25	loan_repayment	300	Loan repayment from Gopal (Veg)	payments	99d76a80-1d36-4731-be4f-1f3dbc5fd62a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 13:37:20.080953+00	f	\N	\N
f31c97a4-35e5-4149-ac03-dab43dc53134	loan_repayment	1500	Loan repayment from Thangapandy	payments	4bc3179f-17cd-4cfe-b8d5-6f439238e031	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 13:38:05.63339+00	f	\N	\N
eecd30e2-efa3-410d-a9ed-b17d24c35565	loan_repayment	300	Loan repayment from Udhayakumar(Sekar)	payments	b2859a19-eb92-4b23-9d9e-9d64b407d800	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 13:38:46.605862+00	f	\N	\N
b0b3eec8-a53e-4530-bbbc-0c3c543f06fa	loan_repayment	1000	Loan repayment from R.Gopi (Auto)	payments	6d78d42f-9e3b-4e32-b256-13563d8a109b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 13:39:04.908638+00	f	\N	\N
80ff1be5-bf01-4cf8-bca8-93d5580dc62f	loan_repayment	500	Loan repayment from P.Selvam	payments	7028d60b-530e-46ce-b4e1-ccfeb8391ffd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 13:48:15.282848+00	f	\N	\N
071e6fe1-d027-4477-ac73-e13131178e30	loan_repayment	1000	Loan repayment from Mani.Magic	payments	7f47eb2f-dda8-4722-b1bc-01ff713f65d1	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 13:49:37.770401+00	f	\N	\N
1e6aaf02-1f58-4242-b353-2dd38a52e834	loan_repayment	500	Loan repayment from Hamsa	payments	1ed996cd-70a6-47b6-a086-cf1cdcf2a10a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 13:53:09.327658+00	f	\N	\N
3d5ca19c-7c19-4c8c-89cb-f2568cc56ec3	loan_repayment	1000	Loan repayment from Veeramani (vaiko)	payments	3463a3fe-7b6d-48c2-a318-a592c0adc044	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 13:58:34.437407+00	f	\N	\N
6fb3cdfc-08af-4f20-a66d-b9be1541980f	loan_repayment	500	Loan repayment from Karthi.Suba	payments	4bd396fb-f825-42a2-8a02-c8b622732399	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 13:58:54.548073+00	f	\N	\N
678c1b3d-6417-4ebd-9f91-398c03f646d0	loan_repayment	700	Loan repayment from V.Saravanan.Pillar	payments	90be2755-5672-490f-81af-d59312922317	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 14:15:00.460355+00	f	\N	\N
6f2ea60d-e031-4728-8880-cb5414053514	loan_repayment	5500	Loan repayment from Raju.F.C	payments	c8fa54fa-f589-44aa-ac83-92b9b3b10773	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 14:21:45.669129+00	f	\N	\N
f89052ed-2196-4cf0-b9d2-f9af2241b485	loan_repayment	500	Loan repayment from G.vengatesh	payments	827d4381-6681-4cde-8556-5cfffeec5fc2	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 14:48:21.822697+00	f	\N	\N
085f0d66-e2f0-47ab-8569-ae6b909c1ffb	loan_repayment	2000	Loan repayment from Karthi (School)	payments	81a0b220-8c07-4239-b0bc-821bfaa009f0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 14:50:04.238177+00	f	\N	\N
8b30a622-6dca-4dc3-b26c-8530b30ea009	loan_repayment	300	Loan repayment from Sivaraj.Sekar	payments	b42c17ea-dad5-4d5d-8870-91881d13c428	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 15:06:36.263814+00	f	\N	\N
2bf50880-738a-49a0-83e2-2c0fb639a14b	loan_repayment	700	Loan repayment from Chandran.(Malathi) - 8925450236	payments	092dd942-f377-4740-91f1-0ef2cda8dce5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 15:32:36.226393+00	f	\N	\N
f7f551b2-2f51-46c3-ac6f-6b4a623170f8	loan_repayment	200	Loan repayment from Harideva	payments	abd8d239-b96c-4785-99e7-bba8d07082e1	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 15:33:12.77877+00	f	\N	\N
fb1152da-6f45-4d68-9261-7b2aeaf5cba2	loan_repayment	100	Loan repayment from Elumalai.mani	payments	7d31f0b7-8ba5-46c6-b3b3-b9d5b9fc95d3	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 15:33:34.386946+00	f	\N	\N
5bb4721b-1c4c-41ca-909c-ddb8a0ed1628	loan_repayment	600	Loan repayment from Ramesh(Pori)	payments	e37a3b9e-340f-4747-a961-02d1a1bac317	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 15:34:29.944843+00	f	\N	\N
913a0a6d-3976-4075-b331-e829709ac147	loan_repayment	300	Loan repayment from Sheela	payments	b4ea1ab8-b690-4f9b-a796-8e04f1c2b488	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 15:34:58.406016+00	f	\N	\N
9d12adac-84fb-4d99-a761-0752d165fc63	loan_repayment	200	Loan repayment from Bhavani.Venkat	payments	014e8674-3461-496f-84e2-769cb4e3aa45	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 15:35:42.983121+00	f	\N	\N
c8d02479-43f6-479f-8265-23c388e0d0a8	loan_repayment	500	Loan repayment from Uma.Elumalai	payments	892ffa4c-8dc0-45b7-a291-47056a680213	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 15:42:32.604219+00	f	\N	\N
e0cf4ad1-d0ab-4d8c-aa22-5c00be83d6ec	loan_repayment	300	Loan repayment from Ramanathan(Soop)	payments	316d4de0-8386-40a2-b8a2-abeae3840b40	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 15:43:49.486817+00	f	\N	\N
6a18f3ff-0d17-479e-bbaf-5b949151216e	loan_repayment	200	Loan repayment from Pandit	payments	d81f2b54-8e02-467a-9be3-f5082c188f38	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 15:49:41.329846+00	f	\N	\N
898b5f27-b159-406c-89d1-f7482a095f27	loan_repayment	100	Loan repayment from Divya (poo kadai)	payments	b21fe8ec-1bca-4c56-b409-1a3f73ad864e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 15:50:25.627073+00	f	\N	\N
e17640e4-1201-4a3b-8c02-7a448be5efb5	loan_repayment	200	Loan repayment from Jaffer	payments	96d90a1f-db09-410a-ae04-837986ead369	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 15:53:40.327738+00	f	\N	\N
655da481-c445-4a02-9497-048d3ce515a8	loan_disbursement	17000	Loan disbursed to Banu.Mohamed	customers	2c143dd6-c039-4a59-8c14-02bf93b00f0a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 16:17:16.953109+00	f	\N	\N
33a71481-eec3-433c-900d-3a3ee5c2145b	loan_disbursement	42500	Loan disbursed to Nandhini.vasanthakumar	customers	61b47ec3-e7e1-4a78-8784-836a84315124	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 16:25:32.92166+00	f	\N	\N
0aae490f-2cfa-47ed-ad0c-89f556129d0e	loan_repayment	1300	Loan repayment from Vishwanathan.9600058274	payments	76b4af8d-8194-434e-a55d-1a5b36d20313	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 16:52:07.683048+00	f	\N	\N
93f7062f-75ed-4647-bd8c-6837df771d99	loan_repayment	1200	Loan repayment from Sriman	payments	c768d033-2329-4128-a44d-b9c5c2be5914	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09 03:23:50.054421+00	f	\N	\N
c333d474-f90f-4912-8245-0165019cdb72	loan_repayment	200	Loan repayment from Sathya (Tailor)	payments	2348992e-f7af-45d3-8885-cfb7ffdb0c80	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09 03:24:39.733715+00	f	\N	\N
521ce08b-4a8c-427c-a0b5-807e6d8cdde2	loan_repayment	50	Loan repayment from K.Kumaran	payments	a92a8c5c-0751-42d1-90cf-f2b6abf579a6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09 03:25:09.343422+00	f	\N	\N
a1634873-bd5c-4eeb-a078-3918406e365b	loan_repayment	50	Loan repayment from K.Kumaran.1	payments	72f11017-d63c-40f3-a928-feffb2d6346e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09 03:25:22.816703+00	f	\N	\N
5c8daa38-5dd5-47f1-bd4e-23323bf0ac1d	loan_repayment	500	Loan repayment from Maha	payments	657eab98-20c9-4a4e-b858-6fb8b6272786	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09 05:20:00.044784+00	f	\N	\N
6aff9823-ce8e-4396-985d-01702fa5a358	loan_repayment	300	Loan repayment from Selvam.Ration	payments	b6725bad-6e98-43c8-923c-955dad8309a2	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09 05:20:51.640327+00	f	\N	\N
b86436e7-d9fb-4b82-85f6-677173c24bca	loan_repayment	500	Loan repayment from Anitha	payments	e7c9f4bd-3e84-4c0b-9120-92162ddde725	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09 05:42:13.501516+00	f	\N	\N
43dfede6-3091-4296-9833-ddb0793f5763	loan_repayment	2000	Loan repayment from Jegadesh	payments	0ba41e28-7e48-4be2-9c43-c7af83cf4535	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09 05:44:02.43977+00	f	\N	\N
0cca7405-ef4f-4c28-b55a-1a7e66bec30f	loan_repayment	50	Loan repayment from Sagunthala	payments	70c594ac-347b-41bf-9ac2-9b1c71a66186	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09 05:48:52.546748+00	f	\N	\N
158fa4b1-f93d-4baf-ac3f-27551cfe98d8	loan_disbursement	42500	Loan disbursed to Parthipan	customers	1f87a89f-83e6-4c4a-ab6b-15d208b3b778	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09 06:02:44.546461+00	f	\N	\N
6987c930-ab5b-4ccd-9d03-2db71a380215	loan_repayment	400	Loan repayment from Karthikeyan	payments	a1d77093-2ec5-436e-a013-900b04928325	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09 07:16:27.065553+00	f	\N	\N
e2ea8468-cdc4-4b60-b4a9-424f979220f8	loan_repayment	700	Loan repayment from V.Saravanan.Pillar	payments	1a952f9f-8ca0-422e-a27b-045e97c63d61	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09 07:17:22.952498+00	f	\N	\N
22f0853e-1591-4dc2-8fae-f53a84806331	loan_repayment	400	Loan repayment from Iliyas.Dhaadi Baai	payments	590cd3be-73a3-447b-873d-bb81c9849b3a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09 14:33:41.594669+00	f	\N	\N
ee874b1e-2c00-4987-b19a-594574d80959	loan_repayment	600	Loan repayment from Baai ( Thaadi )	payments	424a4284-8897-4f6e-800a-db4a65c34c88	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09 14:34:36.600978+00	f	\N	\N
27f19acd-a140-4bf7-af28-42bbb821fbf1	loan_repayment	1200	Loan repayment from Raja.megic	payments	d1446196-2d2c-453e-a889-65a73cfb36ad	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09 15:34:28.998299+00	f	\N	\N
0633d421-271f-4cdc-b639-ba6ee1f9b880	loan_repayment	100	Loan repayment from Divya (poo kadai)	payments	f0c8ad3b-e347-40ed-959c-5e7270ba3e8f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09 15:40:22.798311+00	f	\N	\N
2f9c2fd7-8710-4d07-bb65-3235fddcd4b5	loan_repayment	200	Loan repayment from Pandit	payments	d9e4b05c-8867-42f8-9d99-a37c7abe4c9d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09 15:40:43.995396+00	f	\N	\N
1ca78f15-c594-437c-b893-b15468361eaf	loan_repayment	200	Loan repayment from Jaffer	payments	98e13551-6ce8-46ee-9a2f-547d878e0f41	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09 15:42:41.361343+00	f	\N	\N
99a4e96b-b190-4a36-a382-5cf4a9c7af49	loan_repayment	100	Loan repayment from Elumalai.mani	payments	48a0619a-ee61-4bf6-b9aa-13edcb2218c1	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09 15:43:14.906063+00	f	\N	\N
4b33e5ac-f053-4d4b-8172-2d16031e2f35	loan_repayment	200	Loan repayment from Harideva	payments	c4a2e82f-9e5e-4b8c-aaf8-5c20ae947a47	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09 15:43:35.8597+00	f	\N	\N
7cf8c093-f56b-42e1-87d7-2bbc5daf5e74	loan_repayment	3500	Loan repayment from Valli	payments	744def65-cd3e-4540-9b4c-371042ddad23	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 05:40:38.195083+00	f	\N	\N
50ea3196-13c2-4c64-9801-499e97892a60	loan_repayment	50	Loan repayment from Mani.Angala	payments	1337b7f0-a904-4f57-b6ad-6a8820f83e8b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 05:43:42.920095+00	f	\N	\N
8e1a7cc5-b4bc-4781-877d-0e1145f518e7	loan_repayment	400	Loan repayment from Karthikeyan	payments	0a671af7-2d6f-441e-9c77-370d9a64a106	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 05:44:08.431674+00	f	\N	\N
de29cd9f-b643-4d4d-96cd-d6202aed766f	loan_repayment	1000	Loan repayment from Nandhini.vasanthakumar	payments	4e749728-b8bd-42c5-8aa2-dc3185ed68be	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 05:44:40.347643+00	f	\N	\N
00b8d19d-a849-41b1-9b63-3333ad522117	loan_repayment	500	Loan repayment from Parthasarathy	payments	7af3287e-b739-4ba9-a253-b115896ebd01	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 05:45:10.474114+00	f	\N	\N
3d5558b7-e736-4ad1-9817-9eb4ca1399f9	loan_repayment	1500	Loan repayment from Thangapandy	payments	9cccd191-6652-451d-b38b-20291b110dc8	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 05:45:33.94074+00	f	\N	\N
b63c87fb-6efa-4a7a-90e3-0b95e221c87e	loan_repayment	300	Loan repayment from Gopal (Veg)	payments	37648639-b889-4167-b57a-e29bf4fae2a1	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 05:46:14.464195+00	f	\N	\N
5be1c21f-2f56-494a-ba34-413cca6c47b9	loan_repayment	150	Loan repayment from Sathish (Piller) V.C	payments	cd4162f4-db3c-48fc-a87a-6e97f6db65ad	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 05:46:48.288773+00	f	\N	\N
0dcf403a-56ce-4f0a-88ba-2c5d720c29e4	loan_repayment	300	Loan repayment from Udhayakumar(Sekar)	payments	f59b77c9-a719-4e64-a09d-619fb48d533e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 05:47:10.880831+00	f	\N	\N
3d4cc994-efc8-4a76-9001-5b5cd72d888c	loan_repayment	200	Loan repayment from N.Manikandan	payments	c4e6ccdb-d22e-4672-9bd7-929481fdd5db	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 05:47:35.499974+00	f	\N	\N
ff358aa2-33e3-4dcd-afb7-e4943c40b369	loan_repayment	200	Loan repayment from Balamurali (sekar)	payments	7d346405-2e7d-4281-8bcd-691e1a0974ef	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 05:47:57.454577+00	f	\N	\N
caf9ac68-335d-4270-a93d-bbab0bcbd3fb	loan_repayment	500	Loan repayment from R.Gopi (Auto)	payments	5fff48e2-d196-442e-8917-5e37eb94a6c9	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 05:48:23.216108+00	f	\N	\N
6f13918d-5ca8-4544-99c7-e2da12bd0c98	loan_repayment	500	Loan repayment from P.Selvam	payments	115f29b2-ef09-4e66-a7e3-35e0cd0d465d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 05:48:50.222802+00	f	\N	\N
bc81b3a9-fd98-4a04-a1bd-f4848901b39c	loan_repayment	400	Loan repayment from Ramesh.guru	payments	5da4bf05-f763-4b75-acb9-f262013746f1	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 05:49:11.134364+00	f	\N	\N
0bfde926-fb58-48af-a2e9-94f9ce0beede	loan_repayment	500	Loan repayment from G.vengatesh	payments	64646fdb-05fa-4bd8-ac5a-2a35b7055e20	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 05:49:44.586025+00	f	\N	\N
afe9e8ce-84fd-4018-91b5-75cb8a178c61	loan_repayment	500	Loan repayment from Gokul (Magic)	payments	ca00da6a-bdbe-4370-a3a3-4426699c2550	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 05:50:07.375643+00	f	\N	\N
c196a789-8467-429a-9739-c6967c4000dc	loan_repayment	100	Loan repayment from Kumaran.E.B	payments	9a4800ec-ea39-429c-adb6-329261cd76c8	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 05:50:29.923186+00	f	\N	\N
e295226d-81f6-474c-b5ae-39a26f40d05c	loan_repayment	500	Loan repayment from Gandhi	payments	725c3352-afe3-4912-8a5d-9e95ae3f7f3b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 05:51:06.682701+00	f	\N	\N
32133a6d-38c9-4be9-89f3-39a33ef460a7	loan_repayment	500	Loan repayment from S.Saravanan	payments	6dbceeef-5f4c-4e53-94db-4cfd2c628a02	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 05:51:25.69764+00	f	\N	\N
027198dc-7c0d-4a3b-a004-fbb00d8d7d52	loan_repayment	3000	Loan repayment from Iqbal	payments	efd7c930-c8ae-4b05-8dcb-f2a8a8079d30	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 05:51:52.218005+00	f	\N	\N
c21b37f7-b6b3-4cba-a878-ba7bc54cfe1e	loan_repayment	1000	Loan repayment from Magesh(mec)	payments	6b727061-2262-49db-8307-4835a641d2f3	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 05:52:16.504236+00	f	\N	\N
1404265f-18ef-42b3-a12c-48b1bdf9c3c6	loan_repayment	100	Loan repayment from Karthi (Veg)	payments	e569be0b-3fae-45de-8586-e2b59c412263	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 05:53:38.265332+00	f	\N	\N
db590bbb-9d0a-41d2-affd-692bc8731c56	loan_repayment	50	Loan repayment from Mani.Angala	payments	93076fa1-4092-4f5a-9f53-65bc637ebadb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 05:54:02.112289+00	f	\N	\N
75c118f1-fa8d-44a3-a5b4-c3b52930477e	loan_repayment	300	Loan repayment from Kadumpadi	payments	994dc8aa-88a0-4b81-8a04-c525691fb9ca	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 05:55:41.678392+00	f	\N	\N
60b90c02-c111-46da-a9e4-4c4274180917	loan_repayment	900	Loan repayment from R.Kumar (Yazhini)	payments	d5f8a8fd-dcbb-444b-aed2-518ac5f1470d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 05:56:03.064339+00	f	\N	\N
7fd2498d-701b-4039-9d27-e98990fe9394	loan_repayment	200	Loan repayment from Sathya (Tailor)	payments	dd417d1f-bc1d-410b-9d81-adf27081e2b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 05:56:20.867244+00	f	\N	\N
f90767ec-c452-46f3-9862-f21395431285	loan_repayment	100	Loan repayment from Karthi (Veg)	payments	5347e812-7ad1-430d-9d17-ba448e8c597d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 06:15:30.726303+00	f	\N	\N
3b274741-f055-4128-b581-36989003811c	loan_repayment	500	Loan repayment from Mani.Magic	payments	12c62701-8f3e-49db-b6c8-49814ad727f2	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 08:46:42.247336+00	f	\N	\N
129461d5-2833-4939-bed4-f56e5d3e41aa	loan_repayment	600	Loan repayment from Ilaiyaraja (Auto)	payments	fd0901e1-be70-4a35-8014-0cd35b518337	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 08:47:09.985851+00	f	\N	\N
d629b509-5ac3-433f-ae3c-efc58b53590e	loan_repayment	500	Loan repayment from Anitha	payments	af063555-a223-4218-bc09-7582feb45f7a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 08:47:42.690761+00	f	\N	\N
04dea9f0-1402-48ec-a885-832738c7f321	loan_repayment	400	Loan repayment from Veeramani (vaiko)	payments	cc83d964-f324-4951-97fa-9baea559ed9b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 13:25:10.74255+00	f	\N	\N
6c72fbdc-95d6-41b6-b5fe-7a776559bc21	loan_repayment	1000	Loan repayment from Varanasi.Ayyer.	payments	7368272f-6aeb-48ed-a054-e1d3b23bbeec	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 13:25:48.215116+00	f	\N	\N
0d40aa27-f000-4c48-b5cb-201dcf038c4c	loan_repayment	500	Loan repayment from R.Gopi (Auto)	payments	53690c12-213d-4950-a468-37e7996c5e37	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 13:26:08.813837+00	f	\N	\N
da1cfc1d-8c8f-4f3a-8f68-15e8c7f4d0b6	loan_repayment	50	Loan repayment from K.Kumaran	payments	b0a6acf9-273f-4965-bc6c-2310e14e7472	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 13:26:31.177157+00	f	\N	\N
5f003bd5-8505-44ca-a805-2d56ef3ada4e	loan_repayment	50	Loan repayment from K.Kumaran.1	payments	a57bcda2-4653-4b37-9d45-a1fa76835c62	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 13:26:46.593967+00	f	\N	\N
a41df881-b7b6-4907-b6f7-ab71f908dfff	loan_repayment	300	Loan repayment from Gopal (Veg)	payments	38b2ae29-ba08-419e-8c3c-238d1359d709	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 13:27:20.407702+00	f	\N	\N
0a7a3d8b-ff12-403a-9c50-1bcee87e06a3	loan_repayment	1500	Loan repayment from Thangapandy	payments	31342768-f36f-4233-9698-ac879d74e5cf	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 13:27:39.72965+00	f	\N	\N
498d560e-246a-4e9f-9d90-c98d2be4dd2f	loan_repayment	500	Loan repayment from Parthipan	payments	b740ee88-5cd2-4563-8b05-1ea6dcffd739	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 13:40:20.250741+00	f	\N	\N
a45e1495-1e83-4020-bdb5-ba4e07c43de6	loan_repayment	200	Loan repayment from Bhavani.Venkat	payments	1d1e6980-bf18-45cf-b1c4-aae01baeb47e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 13:44:43.160565+00	f	\N	\N
8e4415a4-2b12-4b80-acb4-d7f5025f8868	loan_repayment	500	Loan repayment from G.vengatesh	payments	95601a4d-dbed-459a-8140-b5164a3097ff	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 13:45:10.047864+00	f	\N	\N
95922a75-c3e8-43f7-8522-970ed1ddf072	loan_repayment	200	Loan repayment from Banu.Mohamed	payments	31b6af1d-1591-4c63-a720-03aff61f39df	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 14:02:33.658115+00	f	\N	\N
217247db-d7b8-4194-8e65-02129d84c57f	loan_repayment	700	Loan repayment from V.Saravanan.Pillar	payments	a4d1c626-da49-4d2a-9e0a-221b3cfbba6a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 14:03:06.241634+00	f	\N	\N
93549fe0-1540-4cb5-aea3-96519a6ad8c9	loan_disbursement	17000	Loan disbursed to Kumar.pillar	customers	c458c3a2-4dd1-432a-b480-b8675bd14584	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 14:12:09.79194+00	f	\N	\N
50eaa42f-80b1-4443-9169-36b26894d3b5	loan_repayment	200	Loan repayment from Rajaselvam	payments	cf096a7e-dd6d-4ea1-892c-e289fb3c33a8	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 14:13:35.682416+00	f	\N	\N
f55d2db5-e3b0-4ea9-9713-7cace71b7c31	loan_repayment	100	Loan repayment from Divya (poo kadai)	payments	606b2fce-10db-479b-b7f7-c015885f3f69	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 14:41:44.022083+00	f	\N	\N
d2687862-9547-4557-8e97-050b3a8c5cd7	loan_repayment	300	Loan repayment from Sheela	payments	9fc347a6-5ca3-49d6-90a0-afb898f679cb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 14:42:05.789141+00	f	\N	\N
c4d56e9a-d97a-4183-b230-8c525c6dceb2	loan_repayment	500	Loan repayment from Chandran.(Malathi) - 8925450236	payments	c33ed901-dc9a-4e98-9a7e-7bf6042b4c2c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 14:42:26.317886+00	f	\N	\N
866f2fcb-c79a-4020-9076-34d52b0a071e	loan_repayment	200	Loan repayment from Jaffer	payments	9f43bf71-983d-4aa6-a0fb-a80998cef894	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 14:42:46.246699+00	f	\N	\N
18fd29c4-4832-417f-ae5b-77308e20cd3e	loan_repayment	100	Loan repayment from Elumalai.mani	payments	66dff9dd-2f3a-4cb4-92cf-10ce1ce791f4	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 14:43:19.311871+00	f	\N	\N
31486c8f-8942-41d9-b707-29c4b1bcb7bd	loan_repayment	200	Loan repayment from Harideva	payments	f0a64ca7-3c82-498d-839e-2d0b1faa3554	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 14:43:42.974413+00	f	\N	\N
65ce3b48-3a81-45f3-ab5b-bfc04d0b29c5	loan_repayment	600	Loan repayment from Kumaravel.megic	payments	3627d8e3-1ae4-43e6-ad2d-4a176b261ce5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 14:58:26.909718+00	f	\N	\N
01b8e129-6c8c-4375-8822-f2c3d9a6a961	loan_repayment	1000	Loan repayment from Karthi.Suba	payments	abc4d949-06b2-4df3-998f-a9a69f1cc1cb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 17:15:03.766262+00	f	\N	\N
365651e9-c8e3-415d-a55b-2e700bc36d21	loan_disbursement	12750	Loan disbursed to Basheerbai	customers	ae9b4b5a-e5ed-4d12-a2c3-fc021439ac60	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11 14:54:17.912339+00	f	\N	\N
fe339436-0930-4e62-b72f-5554c9571874	loan_repayment	200	Loan repayment from Pandit	payments	6eda9853-b1f1-4211-ae00-e0070a4af9ca	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11 16:11:34.346995+00	f	\N	\N
d2ba771f-9c88-41e8-8c57-7337cab11a74	loan_repayment	1000	Loan repayment from Nandhini.vasanthakumar	payments	6ea59cc1-f76b-406a-a367-bcb81ce935f2	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 07:45:24.783089+00	f	\N	\N
ed68e23d-608a-4bf5-8f3e-cce7830eefa1	loan_repayment	1000	Loan repayment from Nandhini.vasanthakumar	payments	4b02c024-f35f-44b3-b9de-47bbed4da7e7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 07:46:36.467853+00	f	\N	\N
0265acc0-95bc-4cff-ad8d-bde7dcf87dc1	loan_repayment	100	Loan repayment from Paramaguru	payments	bb4849d9-29e0-4bb9-876b-681a80d4b74f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 13:22:51.333838+00	f	\N	\N
27677db4-2f6f-4cd4-bf9f-17ec33e0a1e5	loan_repayment	100	Loan repayment from Rajkumar (DMDK)	payments	e1148f45-e70f-4581-ab0e-7af31712ef95	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 14:52:35.125535+00	f	\N	\N
5d30caaf-9c65-4679-858b-bb3bc2e470de	loan_repayment	100	Loan repayment from Divya (poo kadai)	payments	8fee7f2d-bc3a-434a-a2f3-af630bee5871	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 15:31:33.047309+00	f	\N	\N
451bed1f-c785-4209-a080-236a9abd4d77	loan_repayment	500	Loan repayment from Karthi.Suba	payments	22639590-5063-478f-b075-9a1180ba01f4	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 18:02:52.594212+00	f	\N	\N
b653d7e9-c40f-4994-b814-6d5b994e2703	loan_repayment	300	Loan repayment from Selvam.Ration	payments	e10b13c1-1ba9-4515-9740-49d3d1a69d7b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 06:07:46.082514+00	f	\N	\N
b68dba40-69d0-4689-83f2-fb936558c479	loan_disbursement	42500	Loan disbursed to Kalieaswaran	customers	d88ba32e-2497-4cd8-a1c5-f997143c88bd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 08:30:21.470033+00	f	\N	\N
09e487c9-c84d-406a-b8d4-20deaa38746e	loan_repayment	500	Loan repayment from R.Gopi (Auto)	payments	84157b9f-4d96-4217-abc4-59805fc7ad81	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 13:11:23.355734+00	f	\N	\N
5e68af9a-c3fb-4249-8373-fc13eeef5c09	loan_repayment	1000	Loan repayment from G.vengatesh	payments	a840440b-055d-4b59-bcba-acc840172704	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 14:18:48.39661+00	f	\N	\N
860666f4-3f91-4d05-901e-3d717d3b075b	loan_repayment	400	Loan repayment from Karthikeyan	payments	ac90b708-a22b-438f-b31f-125238e39fa9	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 15:21:23.75344+00	f	\N	\N
505c22f9-e098-4f23-bf8c-4e0b4ab0cefd	loan_repayment	200	Loan repayment from Palani.soup	payments	c762f27f-d780-412c-a2fd-221a9480b160	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 15:31:00.471835+00	f	\N	\N
8d4d8242-5384-43f2-a4b6-95065224f1f7	loan_repayment	500	Loan repayment from Karthi.Suba	payments	aa77387b-39df-4d6a-ad1f-8bf295d193f4	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 16:07:19.355709+00	f	\N	\N
\.


--
-- Data for Name: loans; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.loans (id, customer_id, loan_number, loan_display_id, loan_amount, daily_amount, interest_rate, processing_fee_rate, other_deductions, other_deduction_remarks, include_charges_in_outstanding, disbursal_amount, outstanding_amount, start_date, end_date, status, created_by, created_at, updated_at, is_deleted, deleted_at, deleted_by) FROM stdin;
135460a0-56bf-4c17-a4a8-5e66f29b52f6	80752817-7c75-426b-a97e-361b246ec563	45	VVL98841734310000	30000	300	12.5	2.5	0	\N	f	25500	22800	2026-03-10	2026-06-17	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-09 14:26:11.151281+00	2026-04-13 06:07:46.317311+00	f	\N	\N
8d22f5f4-95f7-41a5-9819-ca25a18de27f	30e2e57d-801d-4c86-9ecc-5df01dfc0696	38	VVL72001797310000	60000	600	12.5	2.5	0	\N	f	51000	58200	2026-03-06	2026-06-13	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-05 14:11:18.3869+00	2026-03-09 14:18:22.193232+00	f	\N	\N
3a181c18-8f9e-4467-96a8-c09687ebea27	c5f80bd8-670e-4df5-8c6a-ac7378801077	33	VVL90032928110000	50000	500	12.5	2.5	0	\N	f	42500	30500	2026-03-05	2026-06-12	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-04 15:34:01.838702+00	2026-04-13 13:12:05.011067+00	f	\N	\N
def4d986-3767-4793-a6e8-c767351fd93f	02889b17-5d17-4dc1-ace1-381b0d733984	25	VVL99621421330000	25000	250	12.5	2.5	0	\N	f	21250	15500	2026-03-02	2026-06-09	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-01 15:29:10.206863+00	2026-04-13 12:58:08.483779+00	f	\N	\N
dc623009-9752-43d7-b22a-384740599eb7	f5064908-4ea0-42c7-8a63-0ddfc2a80531	7	VVL63824493300000	40000	400	12.5	2.5	0	\N	f	34000	21200	2026-02-19	2026-05-29	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-24 16:17:31.331279+00	2026-04-13 15:28:37.368317+00	f	\N	\N
ecb49778-5d46-4840-9796-12a3fbe11412	064b4a2b-34b6-4da3-9286-a5d88700fe07	18	VVL98844874310000	10000	100	12.5	2.5	0	\N	f	8500	5700	2026-02-25	2026-06-04	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 07:33:53.578612+00	2026-03-15 15:44:09.550463+00	f	\N	\N
a3f57a0f-8bdf-47f7-a94d-819924cdc08a	ba9ab57b-e2d8-4c2a-902d-effb7b810b03	21	VVL93614067270000	100000	1000	12.5	2.5	0	\N	f	85000	53000	2026-02-26	2026-06-05	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 16:09:14.632845+00	2026-04-13 07:28:35.3123+00	f	\N	\N
9c2457d7-dd54-4968-bf51-e43a0ecb49f3	27559805-98ca-4b40-a167-933eea4a69bb	8	VVL93617442370000	30000	300	12.5	2.5	0	\N	f	25500	15000	2026-02-19	2026-05-29	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-24 16:22:23.990339+00	2026-04-08 06:32:04.810025+00	f	\N	\N
7a331756-19b2-4a9f-a2ee-2b3f6a641e72	ac85d0d3-a358-46b8-bf3e-4f4468ca5670	30	VVL98415333610000	30000	300	12.5	2.5	0	\N	f	25500	19200	2026-03-03	2026-06-10	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-02 15:45:01.541999+00	2026-04-06 13:56:26.21626+00	f	\N	\N
b4a8d905-3198-4d75-8ee3-3800ec8f2b40	bcb87a68-a59d-438f-b81a-e5a4a6b666c1	6	VVL98405546020000	50000	500	12.5	2.5	0	\N	f	42500	25500	2026-02-19	2026-05-29	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-24 15:32:36.764296+00	2026-04-13 13:11:50.698544+00	f	\N	\N
eab03433-a240-440d-8140-9be3f7ccf9a7	3765d341-7b06-463d-82fa-add7d738b854	34	VVL82485756210000	15000	150	12.5	2.5	0	\N	f	12750	9000	2026-03-05	2026-06-12	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-04 15:39:33.537781+00	2026-04-12 13:29:43.697956+00	f	\N	\N
43615615-48b3-4cb6-b3ff-cfcb63bb8a20	c62f3118-4803-4149-8621-2473aec070c1	35	VVL86681138050000	20000	200	12.5	2.5	0	\N	f	17000	15500	2026-03-05	2026-06-12	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-04 15:59:45.830094+00	2026-04-13 14:16:05.849179+00	f	\N	\N
7ebb952f-b8ce-452d-a076-36b5efc9d1c5	67eb359b-25a2-481e-ae53-c208688f5940	26	VVL95145011830000	30000	300	12.5	2.5	0	\N	f	25500	19500	2026-03-02	2026-06-09	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-01 15:34:39.055736+00	2026-04-10 05:56:03.275176+00	f	\N	\N
5dbe34e7-1ce9-4640-b617-a2529d3479d8	63a8b08e-b8dd-451a-bb89-b38b0bb2d9b2	15	VVL98402365530000	10000	100	12.5	2.5	0	\N	f	8500	6000	2026-02-22	2026-06-01	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 07:25:19.118612+00	2026-04-03 07:00:22.519898+00	f	\N	\N
191731f2-5b78-401c-8cec-590024f34df2	aed1fa37-b39e-453a-96ac-b79ba3f4889c	24	VVL80727584630000	35000	350	12.5	2.5	0	\N	f	29750	21000	2026-02-28	2026-06-07	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-28 15:54:44.817465+00	2026-04-10 05:40:38.405873+00	f	\N	\N
735cd1ad-a76d-4026-87dc-60f501454b7a	8926b943-bda3-4c36-aa29-4f8576e75e90	4	VVL90940972660000	20000	200	12.5	0	0	\N	f	17500	9600	2026-02-19	2026-05-29	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-24 15:20:15.626848+00	2026-04-13 15:29:31.496547+00	f	\N	\N
eed1102c-8dcc-4caf-9239-6a9cd7332ccc	8d648ef9-92ca-4513-8639-f0b3ec50a392	31	VVL91502940170000	20000	200	12.5	2.5	0	\N	f	17000	16400	2026-03-03	2026-06-10	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-02 16:10:26.239064+00	2026-04-04 07:27:15.183752+00	f	\N	\N
6398b3f9-45c4-45b0-a7fc-0e3e1ced4173	f35169da-5d69-4e7e-a35e-ed6237a94cff	43	VVL97107332630000	50000	500	12.5	2.5	0	\N	f	42500	35500	2026-03-09	2026-06-16	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-08 13:50:10.936838+00	2026-04-13 16:07:19.595777+00	f	\N	\N
aa68ef20-1754-401b-9bfc-b8f2c49b0a4e	bee2c977-93c0-44ef-874e-a76e53e40a51	14	VVL86676567040000	40000	400	12.5	2.5	0	\N	f	34000	22800	2026-02-22	2026-06-01	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 07:21:26.074348+00	2026-04-09 03:23:50.371468+00	f	\N	\N
010a0aaf-0be5-46b5-a0dc-f5fcc85ed2cf	c8e35247-1c57-4290-9904-8553d3c7cad5	20	VVL63833262960000	60000	600	12.5	2.5	0	\N	f	51000	50400	2026-02-26	2026-06-05	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 16:05:41.671543+00	2026-03-28 14:36:48.495976+00	f	\N	\N
6f37b184-d886-4b91-a179-60f467b3e51d	4bf7d91d-6da6-4d5d-9db0-30b196a13651	11	VVL77088778320000	30000	300	12.5	2.5	0	\N	f	25500	17700	2026-02-20	2026-05-30	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 07:03:58.952315+00	2026-04-13 15:30:42.649084+00	f	\N	\N
71d81887-5e21-4486-97e6-faea2c876cff	860f25ca-39ff-42f0-bacb-e409bd6007d7	23	VVL63691490650000	20000	200	12.5	2.5	0	\N	f	17000	16200	2026-03-01	2026-06-08	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-28 13:26:53.248377+00	2026-04-13 07:25:10.827353+00	f	\N	\N
111a604f-46f8-4271-8912-ccbe479ab3ef	89d5c659-aa6c-4a99-b0fc-f737d9e8e0e4	17	VVL81244608100000	150000	1500	12.5	2.5	0	\N	f	127500	75000	2026-02-23	2026-06-02	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 07:30:46.307809+00	2026-04-13 15:45:06.997738+00	f	\N	\N
6edc184d-553a-4ab7-b3bc-924f1ea007d6	e00a821e-300f-432b-8519-5ef03b42b09c	12	VVL88387434070000	30000	300	12.5	2.5	0	\N	f	25500	18000	2026-02-20	2026-05-30	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 07:13:59.559014+00	2026-04-12 13:23:24.378677+00	f	\N	\N
696b495b-35b0-4393-b4ec-68ed91e19550	72e0cd6d-f353-4cbc-b59f-e63ee38dd833	16	VVL89395857910000	30000	300	12.5	2.5	0	\N	f	25500	21600	2026-02-22	2026-06-01	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 07:27:05.927459+00	2026-03-26 13:25:26.335781+00	f	\N	\N
6ded35ce-a2e8-4856-827d-ab18be14743b	dede5547-d440-4d63-a9ac-ad427b2895c9	40	VVL99436645730000	20000	200	12.5	2.5	0	\N	f	17000	15200	2026-03-09	2026-06-16	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-08 13:22:13.076748+00	2026-04-12 07:53:26.276267+00	f	\N	\N
6043f054-834d-437f-860a-7f9269935958	cb5975f3-72b1-4cc9-bd02-81342334cb40	28	VVL97890534560000	20000	200	12.5	2.5	0	\N	f	17000	14200	2026-03-03	2026-06-10	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-02 15:25:03.535017+00	2026-04-14 03:19:02.281306+00	f	\N	\N
5d640f92-1900-47f5-bb7e-a6ab5061d564	1cac3c77-d86c-41b8-ba55-2b1f74410661	27	VVL97907839300000	20000	200	12.5	2.5	0	\N	f	17000	13400	2026-03-02	2026-06-09	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-01 15:54:06.145208+00	2026-04-08 06:38:39.59756+00	f	\N	\N
18d2e760-ed6d-44b0-af27-6b7cb9d6ddbb	1ca2f5d0-fc1b-49ab-8443-25574737d3cf	19	VVL89393801810000	10000	100	12.5	2.5	0	\N	f	8500	5700	2026-02-25	2026-06-04	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 07:36:21.356271+00	2026-04-13 15:28:15.727557+00	f	\N	\N
0df2b337-87db-4802-a5f9-6944970e2ff5	b55df5ce-674c-47c2-9c54-73bed3e8e571	10	VVL97890405650000	30000	300	12.5	2.5	0	\N	f	25500	20400	2026-02-20	2026-05-30	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 07:00:13.893306+00	2026-03-28 16:05:33.075584+00	f	\N	\N
bd6c3241-ee7a-49a4-8f31-6ca7af5980d8	eec56395-bc3e-4592-8a21-7b694944b6eb	29	VVL98414220720000	20000	200	12.5	2.5	0	\N	f	17000	13300	2026-03-03	2026-06-10	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-02 15:39:50.314274+00	2026-04-10 08:47:10.200726+00	f	\N	\N
804dc780-cd95-46c8-a131-47013ca5eb56	de282179-bb22-45ff-b75f-6bb22109cb12	37	VVL93459453310000	60000	600	12.5	2.5	0	\N	f	51000	42000	2026-03-06	2026-06-13	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-05 14:05:47.062269+00	2026-04-13 15:08:37.846183+00	f	\N	\N
27e0e2f9-8d55-4cf8-a605-3a1b95f3c368	93906c36-47ae-41bb-bb4c-a594f08896b3	9	VVL98845545930000	60000	600	12.5	2.5	0	\N	f	51000	52000	2026-02-20	2026-05-30	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-24 16:24:08.955639+00	2026-04-11 15:48:42.729959+00	f	\N	\N
abf45939-1742-4ed0-adf6-0a8813234da2	6cf22fba-6b26-402d-bb6f-abe871f7f809	36	VVL93444698450000	20000	200	12.5	2.5	0	\N	f	17000	18000	2026-03-06	2026-06-13	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-05 06:30:22.714388+00	2026-04-09 05:44:02.708361+00	f	\N	\N
3271ace3-8b99-4f7c-bf11-2d83f9ae9711	9ef2ed06-c135-411b-9768-fe38919bf751	42	VVL91768677150000	20000	200	12.5	2.5	0	\N	f	17000	16000	2026-03-09	2026-06-16	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-08 13:46:42.338374+00	2026-04-03 15:15:10.27547+00	f	\N	\N
794af05e-0e94-449e-90ee-691d82534c27	35038458-ade9-412d-877d-814bb95adf5d	39	VVL63742439330000	20000	200	12.5	2.5	0	\N	f	17000	17200	2026-03-09	2026-06-16	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-08 08:15:42.176192+00	2026-04-10 05:56:21.075177+00	f	\N	\N
b80d47c9-3d98-41cd-9037-7ddcdac87f0c	b9bd3700-24a0-4fa2-9afa-ca0827c26188	32	VVL96771629730000	20000	200	12.5	2.5	0	\N	f	17000	13600	2026-03-05	2026-06-12	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-04 15:27:18.989393+00	2026-04-12 07:55:28.44317+00	f	\N	\N
0d99cdf2-2edc-4baa-bf1a-14c97c0df949	db6c8835-21b0-4c54-b4ff-2e6ec0441891	44	VVL89391339420000	20000	200	12.5	2.5	0	\N	f	17000	15000	2026-03-09	2026-06-16	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-08 15:43:03.177188+00	2026-04-06 07:48:04.32696+00	f	\N	\N
6778d224-f980-48ed-801f-bef1220cd43c	c9a697e2-d1d0-4f48-9f8b-b0a12d06de0d	5	VVL87789363540000	10000	100	12.5	2.5	0	\N	f	8500	7400	2026-02-19	2026-05-29	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-24 15:26:02.760791+00	2026-04-06 06:55:24.742051+00	f	\N	\N
9b9a19c0-f88e-46eb-afd6-b823511a12e9	271816e2-6379-480d-92c3-c5f6fc561298	41	VVL90031043580000	15000	150	12.5	2.5	0	\N	f	12750	12300	2026-03-09	2026-06-16	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-08 13:40:49.279451+00	2026-04-05 07:19:47.43919+00	f	\N	\N
fe889acf-38cf-4a1f-8fce-804d5304f246	e9d54922-42db-42b1-ab59-8dd42d68af4c	22	VVL81484844990000	30000	300	12.5	2.5	0	\N	f	25500	22500	2026-03-01	2026-06-08	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-28 13:23:52.378254+00	2026-04-10 14:58:27.257465+00	f	\N	\N
d1929534-e23a-4d75-8031-6998ec8b0810	34977a0a-e657-40cb-840d-a6df47bba8d3	53	VVL93806067270000	10000	100	12.5	2.5	0	\N	f	8500	7200	2026-03-12	2026-06-19	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11 15:58:45.281688+00	2026-04-13 07:24:36.436638+00	f	\N	\N
7a03a63d-e3f1-48dd-b082-63ea18330321	f8e88dc3-4e2d-4526-b66d-743bc434bc6e	57	VVL98416213450000	40000	400	12.5	2.5	0	\N	f	34000	36000	2026-03-13	2026-06-20	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-12 15:52:48.502006+00	2026-04-08 14:50:04.487362+00	f	\N	\N
c18d8b95-c031-4110-85c8-b265a89efc50	e0fca0e1-df99-497f-87e4-41be32ec1780	59	VVL73585633740000	50000	500	12.5	2.5	0	\N	f	42500	37000	2026-03-15	2026-06-22	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-14 15:18:22.97556+00	2026-04-13 13:11:23.573778+00	f	\N	\N
8419a9be-df12-416f-81ce-3570f9a82a4c	cf301afd-a3ed-4bea-9794-b4fe432d8861	51	VVL91764640400000	60000	600	12.5	2.5	0	\N	f	51000	44400	2026-03-12	2026-06-19	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11 14:06:39.907644+00	2026-04-12 07:07:40.98962+00	f	\N	\N
9ca88703-194e-4620-9685-63969504382a	fb079db0-2262-4017-bd24-5d42ca326ff9	63	VVL78450320330000	20000	200	12.5	2.5	0	\N	f	17000	10000	2026-03-17	2026-06-24	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16 06:58:21.181581+00	2026-04-13 05:18:22.347929+00	f	\N	\N
2647ddf3-5d7a-405f-be10-8cb5f12edb5d	44e44d3f-1c42-41fa-8bf1-2bdb5bf219c7	81	VVL98401811450000	20000	200	12.5	2.5	0	\N	f	17000	16800	2026-03-23	2026-06-30	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-22 06:30:56.095891+00	2026-04-13 15:28:53.92706+00	f	\N	\N
02d3bf14-a0ef-4ed8-85fb-146ca7ab0fe4	df704001-715c-495c-832e-1971c5655106	76	VVL75502714310000	30000	300	12.5	2.5	0	\N	f	25500	25500	2026-03-20	2026-06-27	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19 15:36:20.807405+00	2026-04-13 07:26:49.360707+00	f	\N	\N
17f01068-23e4-438e-8322-5e4a12f3f332	6340050f-5246-43c5-9297-d14267b9bad0	56	VVL99400104380000	40000	400	12.5	2.5	0	\N	f	34000	31900	2026-03-13	2026-06-20	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-12 13:50:57.469964+00	2026-04-12 07:57:20.423728+00	f	\N	\N
682ad2e5-1d22-4c44-a132-b8580c165d1d	0d8641d3-1860-4dac-8f9c-a7362226fe97	46	VVL94445780780000	30000	300	12.5	2.5	0	\N	f	25500	22500	2026-03-10	2026-06-17	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-09 14:34:36.363735+00	2026-04-08 06:32:27.567009+00	f	\N	\N
ebc8c94f-09bf-41ca-8522-f81f98fb1469	84cf3d8e-64cc-4a90-8b33-12c94640d00b	49	VVL70104785050000	70000	700	12.5	2.5	0	\N	f	59500	60700	2026-03-11	2026-06-18	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-10 06:04:18.517217+00	2026-04-13 15:30:19.421729+00	f	\N	\N
59a0fc44-facd-4cdd-82ce-d5d7ba011765	dd17dc7d-fde3-4770-bdf7-c30ba3dbcca6	74	VVL80983417330000	30000	300	12.5	2.5	0	\N	f	25500	23700	2026-03-20	2026-06-27	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19 14:14:31.902225+00	2026-03-21 08:48:07.40738+00	f	\N	\N
b9ea214a-e90e-4ad5-a848-3b1005f2e89f	9920fe35-b725-4a78-802d-61689d6993b2	66	VVL97898570950000	30000	300	12.5	2.5	0	\N	f	25500	26400	2026-03-17	2026-06-24	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16 15:22:40.815973+00	2026-04-12 13:27:27.99678+00	f	\N	\N
d6c2f318-e81a-4465-9b5e-8cf67bfe9f19	a00d5979-396d-4d33-b05c-a102fb0bb7a8	84	VVL98843660060000	40000	400	12.5	2.5	0	\N	f	34000	40000	2026-03-23	2026-06-30	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-22 13:39:43.798656+00	2026-03-22 13:39:43.798656+00	f	\N	\N
7983d2f3-d1b5-4f40-afba-dfadeeb8e0bd	b86ae36d-afe4-41a9-8d69-af6178efda6c	60	VVL98406777980000	20000	200	12.5	2.5	0	\N	f	17000	16400	2026-03-16	2026-06-23	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-15 15:24:50.590167+00	2026-04-02 05:09:31.126397+00	f	\N	\N
91f3e941-a2bf-44ce-9e3b-6a6f4a19af54	9a636e37-de02-451a-981d-4bf513dce4eb	85	VVL86104411050000	60000	600	12.5	2.5	0	\N	f	51000	52800	2026-03-24	2026-07-01	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-23 14:47:42.076612+00	2026-04-08 06:37:48.068024+00	f	\N	\N
757d4684-58bf-40d2-bfdd-ec9921ff94d7	32e40b35-8c4b-4552-b8b8-7c233d31c03d	47	VVL99623079330000	25000	250	12.5	2.5	0	\N	f	21250	19250	2026-03-10	2026-06-17	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-09 14:39:36.176242+00	2026-04-12 07:54:18.808751+00	f	\N	\N
e3c2af50-d0e2-461a-bfc2-67efd23feb46	250eeece-4579-4cc4-86f9-0cdd866fbd24	83	VVL99403101250000	10000	100	12.5	2.5	0	\N	f	8500	8300	2026-03-23	2026-06-30	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-22 13:22:47.878362+00	2026-04-12 07:53:55.908526+00	f	\N	\N
400fb688-b2dd-42c2-b2f6-c2c3a6bff5bd	d59ecb10-5af9-4f75-8f43-dfc52d537f0c	50	VVL99403842530000	20000	200	12.5	2.5	0	\N	f	17000	14400	2026-03-12	2026-06-19	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11 07:43:35.39292+00	2026-04-13 15:35:43.035681+00	f	\N	\N
4de5c872-61eb-4f7e-9c00-c5b032e1fcf7	3292a221-dac6-489f-9624-6f993ac28f7d	64	VVL88386822300000	20000	200	12.5	2.5	0	\N	f	17000	17000	2026-03-17	2026-06-24	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16 07:20:21.102576+00	2026-03-31 16:00:33.327515+00	f	\N	\N
c2c54c13-fb99-4e5d-9f99-1bddf98beb5b	e3325ec8-264a-41e1-a2d5-84fb33eb4412	55	VVL97890692880000	50000	500	12.5	2.5	0	\N	f	42500	41000	2026-03-13	2026-06-20	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-12 07:16:18.039277+00	2026-04-12 07:49:28.659698+00	f	\N	\N
d6c5de5c-32f1-4075-bce2-9a151bb80cb0	6d60857f-7cd1-437e-a536-c9d04949b1c7	70	VVL73056640840000	50000	500	12.5	2.5	0	\N	f	42500	37000	2026-03-19	2026-06-26	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18 15:59:54.779972+00	2026-04-13 07:27:33.846291+00	f	\N	\N
e425ae02-2a03-4e18-af85-4b3990eefd11	cf6ae0f5-381e-455f-8bda-1dda692f14a4	58	VVL89390375100000	20000	200	12.5	2.5	0	\N	f	17000	15600	2026-03-15	2026-06-22	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-14 14:09:19.191983+00	2026-04-06 15:30:36.352414+00	f	\N	\N
a22b5f37-a3d4-48de-a5d3-5717343478be	cb86aae2-de85-41b5-bf5f-20645840e270	69	VVL73387995230000	5000	50	12.5	2.5	0	\N	f	4250	3700	2026-03-19	2026-06-26	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18 14:30:45.150939+00	2026-04-12 15:08:33.707218+00	f	\N	\N
c6d50066-619d-458b-afc1-f3d1ac5f2920	eb67be15-b51a-4b91-b2ae-6645450cb3cf	80	VVL63811990030000	45000	450	12.5	2.5	0	\N	f	38250	45000	2026-03-22	2026-06-29	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-21 16:20:17.604065+00	2026-03-21 16:20:17.604065+00	f	\N	\N
61588824-28f6-4f24-b902-3044b3b05a19	b2f4bd25-a426-4b1a-b0f6-3ef0115ba281	48	VVL84284477300000	50000	500	12.5	2.5	0	\N	f	42500	46000	2026-03-11	2026-06-18	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-10 05:57:13.554562+00	2026-03-28 14:55:40.338177+00	f	\N	\N
20ccdb2b-c6ad-4063-9dfd-a34c50adac5e	7d755464-aa72-4aab-9028-a75e09410ff6	82	VVL63853481860000	50000	500	12.5	2.5	0	\N	f	42500	45500	2026-03-23	2026-06-30	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-22 07:17:02.860702+00	2026-04-08 06:29:05.145863+00	f	\N	\N
dfa34099-366b-4a3e-85ef-eb12e94f4083	a0d4dce0-9bdd-4cf1-ad5d-1c95cf18e2dd	52	VVL97908016670000	30000	300	12.5	2.5	0	\N	f	25500	23700	2026-03-12	2026-06-19	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-11 15:07:36.502343+00	2026-04-12 13:24:31.975074+00	f	\N	\N
b9357402-e54d-4f75-abc5-6690cb4b9288	894bed8a-dcbc-44c1-b441-fa5be29868d6	78	VVL73387176240000	5000	50	12.5	2.5	0	\N	f	4250	4350	2026-03-22	2026-06-29	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-21 15:30:43.16156+00	2026-04-06 07:48:28.630834+00	f	\N	\N
5ba941ae-382e-452e-a5b3-8cdff26f1c7d	6735cbe7-8e3f-41f0-b16c-9b60d974d6ec	73	VVL81241021660000	20000	200	12.5	2.5	0	\N	f	17000	16000	2026-03-20	2026-06-27	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19 07:40:03.189862+00	2026-04-08 06:33:14.649847+00	f	\N	\N
bbc128c4-c3e1-4281-82c7-652d7065c721	23ac8ae5-7452-4182-b51c-a70026bbe0d8	67	VVL93639813840000	5000	50	12.5	2.5	0	\N	f	4250	4100	2026-03-18	2026-06-25	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-17 12:54:39.559138+00	2026-04-12 16:38:04.300617+00	f	\N	\N
249ae28b-3ceb-4a1c-a279-a9affb4d8090	db40f757-c1ca-42a3-bb92-2df13793998d	68	VVL72002871380000	10000	100	12.5	2.5	0	\N	f	8500	8400	2026-03-19	2026-06-26	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18 14:24:49.872195+00	2026-04-05 05:19:03.00143+00	f	\N	\N
a3742c80-66e9-443f-8ab2-a145af754194	b16866ff-ba34-412f-aeea-fa734ccf88a1	54	VVL86810721530000	50000	500	12.5	2.5	0	\N	f	42500	39000	2026-03-13	2026-06-20	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-12 06:38:45.897952+00	2026-04-10 16:08:09.992533+00	f	\N	\N
8e9719ac-05c9-42c8-8485-6fb4bd7d46d9	6c56e1c0-92ef-426c-8b5f-f6a9eac0ebc0	75	VVL96778549940000	30000	300	12.5	2.5	0	\N	f	25500	25500	2026-03-20	2026-06-27	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19 14:33:06.672817+00	2026-04-09 15:34:29.304351+00	f	\N	\N
6f78d33f-a984-4473-8399-ef2303ccc92e	f196fdd7-e224-44d7-b6f4-4cbde8b41ae7	77	VVL97899017230000	10000	100	12.5	2.5	0	\N	f	8500	7000	2026-03-22	2026-06-29	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-21 14:06:07.678205+00	2026-04-08 12:34:07.798693+00	f	\N	\N
6d5f5859-9f8b-466b-8a58-336b620889eb	651c7fb2-68bf-46d8-bf93-3f25bf5c8dab	86	VVL98402748840000	50000	500	12.5	2.5	0	\N	f	42500	42500	2026-03-24	2026-07-01	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-23 15:56:43.185518+00	2026-04-10 16:07:49.13783+00	f	\N	\N
afce7d49-4090-4783-be84-18d8cd7ca24f	9252d856-84b5-47ad-870a-5df022b6adad	79	VVL90429902610000	30000	300	12.5	2.5	0	\N	f	25500	25000	2026-03-22	2026-06-29	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-21 15:57:24.113783+00	2026-04-08 06:43:19.516757+00	f	\N	\N
5b8d0035-4b51-4aaf-9abe-8079a7b11334	d61b213f-26ab-40b6-ac19-bc6fb34eaf79	72	VVL86376013260000	20000	200	12.5	2.5	0	\N	f	17000	18000	2026-03-20	2026-06-27	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19 07:32:27.238737+00	2026-03-30 07:22:44.728439+00	f	\N	\N
adbe0a7a-d431-41af-9a40-6fdc864df6ab	2d860b86-e289-45b9-b108-3ecc32fafe18	65	VVL97902498370000	50000	500	12.5	2.5	0	\N	f	42500	45500	2026-03-17	2026-06-24	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-16 14:30:48.016116+00	2026-04-08 15:42:32.9401+00	f	\N	\N
db261798-826e-4d7b-9fc7-a4dba55df1f3	22d10045-ef1c-4807-9278-c35dbb01d73f	62	VVL80724252260000	20000	200	12.5	2.5	0	\N	f	17000	17600	2026-03-16	2026-06-23	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-15 15:58:16.209479+00	2026-04-13 14:25:27.897219+00	f	\N	\N
8e423e8d-c1ce-4d07-9860-fd7df34eaf44	6aac96ea-eb26-460a-8340-ffb355953ae0	13	VVL95141718280000	40000	400	12.5	2.5	0	\N	f	34000	27600	2026-02-22	2026-06-01	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-02-25 07:17:51.960694+00	2026-04-13 15:21:23.974388+00	f	\N	\N
0e59bad3-eae7-435d-b166-6f5e876b3785	56da2e53-1358-4168-8c6e-cee12fe29c59	71	VVL86086676560000	50000	500	12.5	2.5	0	\N	f	42500	38000	2026-03-19	2026-06-26	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-18 16:09:52.988631+00	2026-04-12 13:27:54.749915+00	f	\N	\N
7eefc2c2-db0f-431e-b5d8-bbf24c08ab3e	d02bef4a-06c7-4717-b494-968be98c5e8b	113	VVL76718176840000	5000	50	12.5	2.5	0	\N	f	4250	5000	2026-04-06	2026-07-14	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-05 15:18:56.18976+00	2026-04-05 15:18:56.18976+00	f	\N	\N
6ffdf62b-44f6-4010-8ceb-e2878900e1b0	591f4d1e-01f6-4c59-a2b0-7358e00a485d	93	VVL89396049190000	25000	250	12.5	2.5	0	\N	f	21250	23000	2026-03-29	2026-07-06	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28 13:08:43.781346+00	2026-04-10 05:51:25.951673+00	f	\N	\N
1ff2e9b9-5867-4348-a67b-0a6601d52ce9	019b4424-175f-4bb1-9c64-bd2fb04a8ae4	112	VVL73582371120000	5000	50	12.5	2.5	0	\N	f	4250	4650	2026-04-06	2026-07-14	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-05 07:50:26.190937+00	2026-04-12 08:01:35.583704+00	f	\N	\N
16844e34-775b-4f49-a6fc-69e52bc24cfe	bdfb7101-8e1c-4167-9c21-77c4defe8ce5	103	VVL82205907940000	50000	500	12.5	2.5	0	\N	f	42500	45000	2026-04-02	2026-07-10	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-01 15:26:49.949673+00	2026-04-13 12:57:30.464672+00	f	\N	\N
b80a9434-712e-4a9a-aadb-75c2ee7549a8	e9b6d72d-0b4a-450d-8c1d-4d79ce11223a	114	VVL89408188940000	40000	400	12.5	2.5	0	\N	f	34000	37600	2026-04-07	2026-07-15	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06 14:41:37.434187+00	2026-04-12 07:06:53.464447+00	f	\N	\N
bb4f8bc1-b2a3-443c-826d-f83a53345b35	b5e377bf-be6c-4609-9ed7-af18422a1b4a	101	VVL74185169320000	15000	150	12.5	2.5	0	\N	f	12750	14850	2026-03-31	2026-07-08	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 16:37:11.757816+00	2026-03-31 17:59:30.91531+00	f	\N	\N
f8942243-6f41-4580-bb7a-b78101128ade	7d1ca2e6-5ac0-47d0-9b5b-6080fb746026	100	VVL98417942020000	70000	700	12.5	2.5	0	\N	f	59500	60900	2026-03-31	2026-07-08	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 15:53:03.545305+00	2026-04-13 07:25:40.720576+00	f	\N	\N
8fdc0983-6869-49ab-ba2e-866ebe6f7f5b	481d1580-100a-4f65-bc22-32aac9182e37	105	VVL74184417240000	25000	250	12.5	2.5	0	\N	f	21250	23500	2026-04-05	2026-07-13	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04 06:50:24.309979+00	2026-04-12 07:56:54.372321+00	f	\N	\N
e7f677ba-fc98-4aa6-b8e1-f5365ecb34c7	61b47ec3-e7e1-4a78-8784-836a84315124	118	VVL98423205880000	50000	500	12.5	2.5	0	\N	f	42500	44000	2026-04-09	2026-07-17	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 16:25:32.545929+00	2026-04-12 18:54:28.414359+00	f	\N	\N
5aba3feb-ba24-4c1f-9d91-7836728dcfe1	45758843-0035-4992-a067-2c4d561bf31b	125	VVL73059415850000	30000	300	12.5	2.5	0	\N	f	25500	30000	2026-04-13	2026-07-21	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 07:52:50.95819+00	2026-04-12 07:52:50.95819+00	f	\N	\N
755a8d09-2a14-49f6-b70f-147b5f5fa531	2ff85cab-09cd-4175-94ce-d7ccba40ae21	90	VVL98415284250000	50000	500	12.5	2.5	0	\N	f	42500	43000	2026-03-26	2026-07-03	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25 15:55:18.109105+00	2026-04-08 14:21:45.868544+00	f	\N	\N
cc475a57-bcdd-42fc-a0a1-00504909a4e0	eccc41c7-9d86-41a5-8c93-ae01f74f8080	97	VVL98418968880000	40000	400	12.5	2.5	0	\N	f	34000	32000	2026-03-31	2026-07-08	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 07:26:34.540946+00	2026-04-12 16:29:36.697921+00	f	\N	\N
7c60c422-8ba1-4fcc-8a40-81a7d8cab098	30d6e5ab-ae5d-4ea9-93ff-3655cdedc049	99	VVL90434831170000	30000	300	12.5	2.5	0	\N	f	25500	28000	2026-03-31	2026-07-08	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 14:51:02.98308+00	2026-03-30 15:12:28.030621+00	f	\N	\N
e953cf25-fc2f-47cf-93d6-d74ca66951dd	9daa6e18-5bdb-420a-a5bf-8420c72c9e6e	104	VVL95660326190000	10000	100	12.5	2.5	0	\N	f	8500	9100	2026-04-05	2026-07-13	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04 06:18:38.975022+00	2026-04-10 05:55:41.906904+00	f	\N	\N
35899642-c883-4c26-a7ad-8e41a391be2b	2a8f0801-a95d-49fb-a6a0-f9a9a84c463b	96	VVL98408360840000	50000	500	12.5	2.5	0	\N	f	42500	42500	2026-03-31	2026-07-08	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 07:22:11.57028+00	2026-04-13 14:18:48.629759+00	f	\N	\N
8933fd28-5d64-4ec9-9cd9-d5b594fff1eb	0730e6a0-07e6-44f1-b129-097c3fb6e85c	106	VVL63690720760000	5000	50	12.5	2.5	0	\N	f	4250	4700	2026-04-05	2026-07-13	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04 07:07:32.077906+00	2026-04-13 16:10:24.538284+00	f	\N	\N
767b5de8-3ba8-4b67-ad24-b0681feb51a5	dcf458bf-10c7-41f7-ab08-ed37fbfc4b2b	109	VVL82206084060000	5000	50	12.5	2.5	0	\N	f	4250	4450	2026-04-05	2026-07-13	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04 07:25:32.500398+00	2026-04-13 14:17:13.349621+00	f	\N	\N
e69b67ff-1841-47c7-832c-f2e85f48bae0	586c004c-3e6b-40bf-a2f5-cd3a1fdfe4c0	107	VVL95662665230000	30000	300	12.5	2.5	0	\N	f	25500	29100	2026-04-05	2026-07-13	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04 07:10:35.855743+00	2026-04-08 15:06:36.672112+00	f	\N	\N
58be7354-d953-4974-a887-1ccc5ccb1acd	dbb5444e-976f-4d00-9769-c0111b85f5b6	102	VVL86105667100000	5000	50	12.5	2.5	0	\N	f	4250	4300	2026-04-02	2026-07-10	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-01 13:19:07.349741+00	2026-04-13 14:16:53.208919+00	f	\N	\N
4f5d3a5e-a1e8-4652-8a3e-1053a1e760d7	8388404f-fd37-4f07-be34-7e919c686e8a	123	VVL97907696750000	20000	200	12.5	2.5	0	\N	f	17000	19800	2026-04-12	2026-07-20	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11 15:33:01.894951+00	2026-04-12 07:08:09.612622+00	f	\N	\N
1bc4abc0-e370-49f3-b77c-87aabf4bfa85	1f87a89f-83e6-4c4a-ab6b-15d208b3b778	119	VVL95970634350000	50000	500	12.5	2.5	0	\N	f	42500	49000	2026-04-10	2026-07-18	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09 06:02:44.313061+00	2026-04-12 07:50:38.069457+00	f	\N	\N
6064efcd-d142-44c8-864b-7f882850d18a	963ccc89-3e62-4787-ae26-1b8b908b51c4	92	VVL81244999820000	50000	500	12.5	2.5	0	\N	f	42500	44500	2026-03-29	2026-07-06	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28 12:38:03.337051+00	2026-04-12 08:00:37.538419+00	f	\N	\N
e4c1ab58-7506-40bb-87cd-40a3069fb9d7	70b6dbb8-0fb8-4661-a0cd-21955635a422	116	VVL73585418710000	65000	650	12.5	2.5	0	\N	f	55250	61100	2026-04-07	2026-07-15	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06 16:27:23.947169+00	2026-04-13 13:51:36.001422+00	f	\N	\N
55efd7cf-1188-4423-9a53-8ee2c53002fa	6245a2e8-2eb5-4d5f-8b8a-aac817bfee18	61	VVL73973975360000	20000	200	12.5	2.5	0	\N	f	17000	15400	2026-03-16	2026-06-23	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-15 15:36:43.396499+00	2026-04-12 17:23:37.708777+00	f	\N	\N
cb603d85-d775-4680-bee6-2c42f0b3e767	ea7436e5-3b5c-49c8-87e4-6d727b2c2e50	89	VVL63819671870000	10000	100	12.5	2.5	0	\N	f	8500	8300	2026-03-25	2026-07-02	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25 14:35:57.181486+00	2026-04-10 05:45:10.672822+00	f	\N	\N
54e534e0-ac57-4107-8217-5216c1e4eed2	a03836bd-4e58-4dcf-b429-ad094f601d2d	111	VVL63693603500000	20000	200	12.5	2.5	0	\N	f	17000	19400	2026-04-05	2026-07-13	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04 15:53:47.189164+00	2026-04-07 15:35:59.089451+00	f	\N	\N
7c5e25ec-8d9d-4d6c-80b8-2ad0bfd12cee	d11d1904-a5c2-4fd5-8ebc-c800d6ced0b2	87	VVL91769121470000	5000	50	12.5	2.5	0	\N	f	4250	2950	2026-03-24	2026-07-01	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-24 05:50:55.590789+00	2026-04-10 05:46:48.51122+00	f	\N	\N
5cebdb10-f359-495d-983b-766489065f26	4686827e-4849-4bfa-88aa-129912510008	98	VVL63821252800000	20000	200	12.5	2.5	0	\N	f	17000	17800	2026-03-31	2026-07-08	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30 14:15:26.533105+00	2026-04-13 15:03:48.325828+00	f	\N	\N
9b75966e-2f2f-476f-b255-0bd24264a797	b22b99e0-ad0d-4b0b-bdeb-7f6883ff97c1	115	VVL82489769620000	20000	200	12.5	2.5	0	\N	f	17000	18600	2026-04-07	2026-07-15	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06 15:36:39.47298+00	2026-04-13 15:32:01.692365+00	f	\N	\N
ed00e1c1-e744-4da2-a624-7dbc07c94b87	2c143dd6-c039-4a59-8c14-02bf93b00f0a	117	VVL88258733530000	20000	200	12.5	2.5	0	\N	f	17000	19400	2026-04-09	2026-07-17	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08 16:17:16.606172+00	2026-04-13 15:44:29.700982+00	f	\N	\N
4a8b4664-03cc-4c63-a5e4-3cabf38d7ebe	c458c3a2-4dd1-432a-b480-b8675bd14584	120	VVL91760230400000	20000	200	12.5	2.5	0	\N	f	17000	19400	2026-04-11	2026-07-19	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10 14:12:09.488912+00	2026-04-13 14:25:22.928477+00	f	\N	\N
f89e18c3-e636-4922-8646-d69aeae8d592	69862c5d-a6f2-48c9-83d8-364820586103	126	VVL70946423820000	20000	200	12.5	2.5	0	\N	f	17000	19800	2026-04-13	2026-07-21	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 14:49:00.774817+00	2026-04-13 15:31:00.791793+00	f	\N	\N
2c2fec84-b45b-456c-87b2-de7365174599	790d3d01-21ef-4976-82d4-af3adacb886c	88	VVL88703732830000	10000	100	12.5	2.5	0	\N	f	8500	8100	2026-03-26	2026-07-03	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25 14:16:19.487228+00	2026-04-12 13:22:51.618038+00	f	\N	\N
126eb443-dc6f-410b-91b3-40439719597c	8d1aa297-ebb1-4cbb-94f7-ef5d2b2bbb12	124	VVL63693737090000	15000	150	12.5	2.5	0	\N	f	12750	15000	2026-04-13	2026-07-21	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 07:43:10.665452+00	2026-04-12 07:43:10.665452+00	f	\N	\N
de360bdb-ec38-4f27-ae4f-69ebeac5f619	046f033d-2013-4dbe-9ac8-947af0d1e115	91	VVL63813106910000	50000	500	12.5	2.5	0	\N	f	42500	44000	2026-03-26	2026-07-03	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-26 15:57:49.021642+00	2026-04-13 06:07:20.681136+00	f	\N	\N
509f1fd9-7517-4b8b-a57b-817bd7e6f823	5fecec3a-5262-4cfd-8464-57abf6fd6c0c	95	VVL86819131020000	30000	300	12.5	2.5	0	\N	f	25500	25800	2026-03-29	2026-07-06	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28 15:22:48.600614+00	2026-04-13 15:29:50.539658+00	f	\N	\N
db8b2887-3836-45d0-b9ba-0f3a36a3ac8f	ae9b4b5a-e5ed-4d12-a2c3-fc021439ac60	122	VVL99624458540000	15000	150	12.5	2.5	0	\N	f	12750	14700	2026-04-12	2026-07-20	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11 14:54:17.623411+00	2026-04-13 13:10:57.690959+00	f	\N	\N
821de303-68d9-438d-8f21-b30da4ae6993	66a5baef-e9ee-4830-8b91-10c5b91c0d5a	127	VVL99401689910000	10000	100	12.5	2.5	0	\N	f	8500	9900	2026-04-13	2026-07-21	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12 15:15:10.054415+00	2026-04-13 13:10:01.079022+00	f	\N	\N
a919714d-f972-4455-a828-e37bfbea4c34	5f1540b7-3eda-41e6-87f9-f6a13d0a1980	121	VVL98400717940000	10000	100	12.5	2.5	0	\N	f	8500	9800	2026-04-12	2026-07-19	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11 14:27:40.816132+00	2026-04-13 13:10:27.602645+00	f	\N	\N
e71a649a-865d-492c-a7ac-b2f37247b836	f076e587-f2c0-423c-9441-07bde93baeb3	94	VVL97907268890000	50000	500	12.5	2.5	0	\N	f	42500	44500	2026-03-29	2026-07-06	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28 14:20:32.463496+00	2026-04-13 14:34:40.784272+00	f	\N	\N
c7a9948d-1c6b-40d9-a8b5-23c2597bf9f0	a529d878-71a9-4774-8ef5-b4e2ce601e22	108	VVL78679365160000	10000	100	12.5	2.5	0	\N	f	8500	9300	2026-04-05	2026-07-13	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04 07:20:09.41829+00	2026-04-13 15:31:43.999972+00	f	\N	\N
2ee2c1a7-5fa1-4a20-9185-b1385b754870	b0ad6445-eed2-49f7-9b7c-78fdf8a2a53d	110	VVL90948575860000	20000	200	12.5	2.5	0	\N	f	17000	18400	2026-04-05	2026-07-13	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04 14:37:45.493775+00	2026-04-12 15:18:51.204306+00	f	\N	\N
2aeaa481-3253-43a4-a686-c3baf68e3693	2ef2bbe9-b267-4369-9bd3-51063fe4a3fa	128	VVL81489346550000	10000	100	12.5	2.5	0	\N	f	8500	9500	2026-04-14	2026-07-22	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 05:53:48.42488+00	2026-04-13 06:06:06.159208+00	f	\N	\N
b53b2dae-cb2d-4ce5-a686-e7f723a3e72a	d88ba32e-2497-4cd8-a1c5-f997143c88bd	129	VVL95977949130000	50000	500	12.5	2.5	0	\N	f	42500	50000	2026-04-14	2026-07-22	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 08:30:21.024646+00	2026-04-13 08:30:21.024646+00	f	\N	\N
bce8c5be-2350-4c08-ae36-9fe67bdf9aa0	1020dca0-c5c1-4720-843b-40aeeea968c9	130	VVL97915758020000	30000	300	12.5	2.5	0	\N	f	25500	30000	2026-04-14	2026-07-22	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 13:41:50.188809+00	2026-04-13 13:41:50.188809+00	f	\N	\N
c7fec7a6-3d2c-487a-88d6-7d87a7fb40ab	9d8d49c7-f547-4022-aec3-2f51631c9189	131	VVL90872208190000	20000	200	12.5	2.5	0	\N	f	17000	20000	2026-04-14	2026-07-22	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 14:28:28.687928+00	2026-04-13 14:28:28.687928+00	f	\N	\N
a5e7d40a-52e2-41ef-a68a-81819fcc83fc	a518ab91-c839-427f-9118-f38636c91f1e	132	VVL96000582740000	25000	250	12.5	2.5	0	\N	f	21250	25000	2026-04-14	2026-07-22	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 15:48:33.431188+00	2026-04-13 15:48:33.431188+00	f	\N	\N
1c65bcb9-6c60-494d-90b0-ec77920e0107	f025048e-8e5a-4053-9066-4c63b2111890	133	VVL99627055400000	20000	200	12.5	2.5	0	\N	f	17000	20000	2026-04-14	2026-07-22	active	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13 16:18:21.749162+00	2026-04-13 16:18:21.749162+00	f	\N	\N
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
84157b9f-4d96-4217-abc4-59805fc7ad81	e0fca0e1-df99-497f-87e4-41be32ec1780	c18d8b95-c031-4110-85c8-b265a89efc50	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13	500	online	paid	\N	\N	2026-04-13 13:11:23.065888+00	f	\N	\N
5f4c09cb-0691-49c1-b306-7b05e1c781d2	bee2c977-93c0-44ef-874e-a76e53e40a51	aa68ef20-1754-401b-9bfc-b8f2c49b0a4e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-02	400	online	paid	\N	\N	2026-03-02 08:13:04.714666+00	f	\N	\N
7303c960-ab05-467f-9b6e-4791e589affa	72e0cd6d-f353-4cbc-b59f-e63ee38dd833	696b495b-35b0-4393-b4ec-68ed91e19550	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-02	300	online	paid	\N	\N	2026-03-02 08:13:39.719614+00	f	\N	\N
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
39fc270e-622e-413f-af71-1381c67f142b	bcb87a68-a59d-438f-b81a-e5a4a6b666c1	b4a8d905-3198-4d75-8ee3-3800ec8f2b40	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13	1000	online	paid	\N	\N	2026-04-13 13:11:50.271331+00	f	\N	\N
4316cfcd-8a11-40a8-a437-e5027fef5056	f076e587-f2c0-423c-9441-07bde93baeb3	e71a649a-865d-492c-a7ac-b2f37247b836	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13	500	online	paid	\N	\N	2026-04-13 14:34:40.24808+00	f	\N	\N
c762f27f-d780-412c-a2fd-221a9480b160	69862c5d-a6f2-48c9-83d8-364820586103	f89e18c3-e636-4922-8646-d69aeae8d592	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13	200	cash	paid	\N	\N	2026-04-13 15:31:00.116464+00	f	\N	\N
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
bd4a8451-059e-4f1e-b110-209cfa876d56	c5f80bd8-670e-4df5-8c6a-ac7378801077	3a181c18-8f9e-4467-96a8-c09687ebea27	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13	3000	online	paid	\N	\N	2026-04-13 13:12:04.554959+00	f	\N	\N
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
1e5812a6-d734-424c-9dcf-544504acabc7	02889b17-5d17-4dc1-ace1-381b0d733984	def4d986-3767-4793-a6e8-c767351fd93f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-12	500	cash	paid	\N	\N	2026-03-12 17:10:09.092616+00	t	\N	\N
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
f44ad72d-cd25-4c10-9f1f-f9521a3028cd	72e0cd6d-f353-4cbc-b59f-e63ee38dd833	696b495b-35b0-4393-b4ec-68ed91e19550	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19	1800	online	paid	\N	\N	2026-03-19 07:34:47.764991+00	f	\N	\N
d6022f39-784a-43d6-94a8-4d08036810fe	f35169da-5d69-4e7e-a35e-ed6237a94cff	6398b3f9-45c4-45b0-a7fc-0e3e1ced4173	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19	500	online	paid	\N	\N	2026-03-19 07:59:24.383108+00	f	\N	\N
2d687d02-6a59-4c78-be96-8c750a6f8068	32e40b35-8c4b-4552-b8b8-7c233d31c03d	757d4684-58bf-40d2-bfdd-ec9921ff94d7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19	250	online	paid	\N	\N	2026-03-19 08:28:17.663586+00	f	\N	\N
63a39dba-aac2-460d-aae8-4f2bc9242f91	3292a221-dac6-489f-9624-6f993ac28f7d	4de5c872-61eb-4f7e-9c00-c5b032e1fcf7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19	600	online	paid	\N	\N	2026-03-19 13:15:07.404043+00	f	\N	\N
15793f4f-8f8d-49ce-85be-cb15f4080e72	e0fca0e1-df99-497f-87e4-41be32ec1780	c18d8b95-c031-4110-85c8-b265a89efc50	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19	1000	online	paid	\N	\N	2026-03-19 13:16:13.755407+00	f	\N	\N
5b38cf27-ee58-4416-a388-13ba644847f6	6245a2e8-2eb5-4d5f-8b8a-aac817bfee18	55efd7cf-1188-4423-9a53-8ee2c53002fa	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19	200	online	paid	\N	\N	2026-03-19 13:24:24.311714+00	f	\N	\N
0cd5a2cd-9c7b-42a8-8192-88f197c00f73	bcb87a68-a59d-438f-b81a-e5a4a6b666c1	b4a8d905-3198-4d75-8ee3-3800ec8f2b40	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19	1000	online	paid	\N	\N	2026-03-19 13:55:57.97381+00	f	\N	\N
017641ee-f6b8-444c-8d78-c106bd49a93e	93906c36-47ae-41bb-bb4c-a594f08896b3	27e0e2f9-8d55-4cf8-a605-3a1b95f3c368	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19	500	online	paid	\N	\N	2026-03-19 13:56:14.776829+00	f	\N	\N
9fee64ef-1d8e-4ae5-a4ce-5c012c39b867	b16866ff-ba34-412f-aeea-fa734ccf88a1	a3742c80-66e9-443f-8ab2-a145af754194	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19	500	online	paid	\N	\N	2026-03-19 14:02:51.807+00	f	\N	\N
3a9550cd-688f-44ed-9236-2559e0e622d4	dd17dc7d-fde3-4770-bdf7-c30ba3dbcca6	59a0fc44-facd-4cdd-82ce-d5d7ba011765	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19	300	online	paid	\N	\N	2026-03-19 14:16:20.255441+00	f	\N	\N
c76f0656-a4be-4579-b437-75ea49bfb931	6d60857f-7cd1-437e-a536-c9d04949b1c7	d6c5de5c-32f1-4075-bce2-9a151bb80cb0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19	500	online	paid	\N	\N	2026-03-19 14:26:28.858413+00	f	\N	\N
226a8875-ffdc-477f-a888-749c1418ceb6	56da2e53-1358-4168-8c6e-cee12fe29c59	0e59bad3-eae7-435d-b166-6f5e876b3785	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19	500	online	paid	\N	\N	2026-03-19 14:49:36.010851+00	f	\N	\N
6522a134-95e8-45f6-b43c-8f120528ff43	b2f4bd25-a426-4b1a-b0f6-3ef0115ba281	61588824-28f6-4f24-b902-3044b3b05a19	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19	500	cash	paid	\N	\N	2026-03-19 14:59:45.551707+00	f	\N	\N
a8d11bd1-aff7-43ab-8e01-e0d8937cd158	4bf7d91d-6da6-4d5d-9db0-30b196a13651	6f37b184-d886-4b91-a179-60f467b3e51d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19	300	cash	paid	\N	\N	2026-03-19 15:00:22.999646+00	f	\N	\N
bd38ed1f-fa77-4cfb-865d-9b740a0ec3e5	d59ecb10-5af9-4f75-8f43-dfc52d537f0c	400fb688-b2dd-42c2-b2f6-c2c3a6bff5bd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19	200	cash	paid	\N	\N	2026-03-19 15:00:51.719655+00	f	\N	\N
2e074954-d89e-4964-82eb-01166f88d848	2d860b86-e289-45b9-b108-3ecc32fafe18	adbe0a7a-d431-41af-9a40-6fdc864df6ab	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19	600	cash	paid	\N	\N	2026-03-19 15:01:23.973684+00	f	\N	\N
6bd3cb7a-8d5f-4874-90c6-43bcf4098619	f5064908-4ea0-42c7-8a63-0ddfc2a80531	dc623009-9752-43d7-b22a-384740599eb7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19	400	cash	paid	\N	\N	2026-03-19 15:02:00.16313+00	f	\N	\N
2bac413c-c230-4420-9475-6959251aa488	8926b943-bda3-4c36-aa29-4f8576e75e90	735cd1ad-a76d-4026-87dc-60f501454b7a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19	200	cash	paid	\N	\N	2026-03-19 15:02:31.777286+00	f	\N	\N
ff3e6819-b7f4-4d1d-8764-cfdc9d52e131	1cac3c77-d86c-41b8-ba55-2b1f74410661	5d640f92-1900-47f5-bb7e-a6ab5061d564	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19	200	online	paid	\N	\N	2026-03-19 15:03:14.597425+00	f	\N	\N
1cc65ac6-b1ad-4248-a4e5-245fae477d6a	34977a0a-e657-40cb-840d-a6df47bba8d3	d1929534-e23a-4d75-8031-6998ec8b0810	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19	100	online	paid	\N	\N	2026-03-19 15:13:54.919476+00	f	\N	\N
dc245389-e636-4ce6-b982-58fd862b7d90	6340050f-5246-43c5-9297-d14267b9bad0	17f01068-23e4-438e-8322-5e4a12f3f332	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19	1200	online	paid	\N	\N	2026-03-19 15:40:51.598692+00	f	\N	\N
24be1fd2-6645-4720-86c9-7fc14b00eadc	b9bd3700-24a0-4fa2-9afa-ca0827c26188	b80d47c9-3d98-41cd-9037-7ddcdac87f0c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19	200	online	paid	\N	\N	2026-03-19 15:42:12.992723+00	f	\N	\N
182a161f-9ffd-4fab-8124-0149141e55cb	bee2c977-93c0-44ef-874e-a76e53e40a51	aa68ef20-1754-401b-9bfc-b8f2c49b0a4e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19	400	online	paid	\N	\N	2026-03-19 15:49:50.721164+00	f	\N	\N
29bef954-3996-409e-975a-b20affd8e850	ba9ab57b-e2d8-4c2a-902d-effb7b810b03	a3f57a0f-8bdf-47f7-a94d-819924cdc08a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19	1000	online	paid	\N	\N	2026-03-19 18:22:55.764036+00	f	\N	\N
b9ed54a1-2ea3-433e-942d-e884fa552a78	89d5c659-aa6c-4a99-b0fc-f737d9e8e0e4	111a604f-46f8-4271-8912-ccbe479ab3ef	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-19	1500	online	paid	\N	\N	2026-03-19 18:23:14.257679+00	f	\N	\N
996c60d0-75c8-49e2-bfa3-c4203e431318	c8e35247-1c57-4290-9904-8553d3c7cad5	010a0aaf-0be5-46b5-a0dc-f5fcc85ed2cf	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-20	1200	cash	paid	\N	\N	2026-03-20 06:11:48.743322+00	f	\N	\N
b3e943e1-0b16-46f4-8660-c277ac3949c4	8d648ef9-92ca-4513-8639-f0b3ec50a392	eed1102c-8dcc-4caf-9239-6a9cd7332ccc	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-20	200	online	paid	\N	\N	2026-03-20 07:26:55.215801+00	f	\N	\N
02d8c28c-8a52-473c-9800-721d3856f204	35038458-ade9-412d-877d-814bb95adf5d	794af05e-0e94-449e-90ee-691d82534c27	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-20	200	online	paid	\N	\N	2026-03-20 07:27:59.437766+00	f	\N	\N
415398f1-af86-4eeb-b270-ac879b353bd2	6d60857f-7cd1-437e-a536-c9d04949b1c7	d6c5de5c-32f1-4075-bce2-9a151bb80cb0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-20	500	online	paid	\N	\N	2026-03-20 07:28:26.457378+00	f	\N	\N
33aa2ee2-75db-415f-b538-14c84bc8cc26	6aac96ea-eb26-460a-8340-ffb355953ae0	8e423e8d-c1ce-4d07-9860-fd7df34eaf44	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-20	400	online	paid	\N	\N	2026-03-20 09:34:35.548835+00	f	\N	\N
6f1b28af-ac7c-40a1-8bf1-431e71242e49	0d8641d3-1860-4dac-8f9c-a7362226fe97	682ad2e5-1d22-4c44-a132-b8580c165d1d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-20	1200	online	paid	\N	\N	2026-03-20 12:40:25.799464+00	f	\N	\N
d47f048d-fb64-4983-90b5-f0216c5b1c0e	6245a2e8-2eb5-4d5f-8b8a-aac817bfee18	55efd7cf-1188-4423-9a53-8ee2c53002fa	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-20	200	online	paid	\N	\N	2026-03-20 12:40:53.833072+00	f	\N	\N
21296d99-5f4e-447e-b407-d6a9eccfa8ab	56da2e53-1358-4168-8c6e-cee12fe29c59	0e59bad3-eae7-435d-b166-6f5e876b3785	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-20	500	online	paid	\N	\N	2026-03-20 12:41:47.649092+00	f	\N	\N
65851c48-dfb9-44a3-a089-3a8b9deeac54	80752817-7c75-426b-a97e-361b246ec563	135460a0-56bf-4c17-a4a8-5e66f29b52f6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-20	300	cash	paid	\N	\N	2026-03-20 13:16:23.888706+00	f	\N	\N
7c3cd7b2-8490-46df-bc3a-1391ec557ca8	c5f80bd8-670e-4df5-8c6a-ac7378801077	3a181c18-8f9e-4467-96a8-c09687ebea27	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-20	1500	online	paid	\N	\N	2026-03-20 13:17:08.35069+00	f	\N	\N
03ab640f-2259-4876-a3aa-09320ae85344	e3325ec8-264a-41e1-a2d5-84fb33eb4412	c2c54c13-fb99-4e5d-9f99-1bddf98beb5b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-20	500	online	paid	\N	\N	2026-03-20 13:18:26.139654+00	f	\N	\N
8f88d7dc-dcdf-408f-8399-98be07cd2a77	93906c36-47ae-41bb-bb4c-a594f08896b3	27e0e2f9-8d55-4cf8-a605-3a1b95f3c368	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-20	500	online	paid	\N	\N	2026-03-20 13:47:06.460778+00	f	\N	\N
868ca7df-65ec-4648-957c-9fb13a170b2c	bcb87a68-a59d-438f-b81a-e5a4a6b666c1	b4a8d905-3198-4d75-8ee3-3800ec8f2b40	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-20	500	online	paid	\N	\N	2026-03-20 14:01:45.982136+00	f	\N	\N
4f60b275-13c2-44f4-a9b4-7f642ecfdc28	9920fe35-b725-4a78-802d-61689d6993b2	b9ea214a-e90e-4ad5-a848-3b1005f2e89f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-20	300	online	paid	\N	\N	2026-03-20 14:36:28.928056+00	f	\N	\N
50e08d69-70be-44c7-b445-081968c5ad45	e0fca0e1-df99-497f-87e4-41be32ec1780	c18d8b95-c031-4110-85c8-b265a89efc50	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-20	500	online	paid	\N	\N	2026-03-20 14:37:17.94987+00	f	\N	\N
aa031338-68e5-47cb-b7c6-af447a5e271d	b86ae36d-afe4-41a9-8d69-af6178efda6c	7983d2f3-d1b5-4f40-afba-dfadeeb8e0bd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-20	200	online	paid	\N	\N	2026-03-20 14:37:49.226513+00	f	\N	\N
856a61ad-fbfc-411f-a76e-7c54bc626602	dd17dc7d-fde3-4770-bdf7-c30ba3dbcca6	59a0fc44-facd-4cdd-82ce-d5d7ba011765	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-20	3000	online	paid	\N	\N	2026-03-20 14:51:17.335786+00	f	\N	\N
150dc901-85f5-4cd9-a568-8ee43f203edf	f5064908-4ea0-42c7-8a63-0ddfc2a80531	dc623009-9752-43d7-b22a-384740599eb7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-20	400	cash	paid	\N	\N	2026-03-20 15:03:01.438954+00	f	\N	\N
30bf9133-f7bb-4a6a-b7e0-a4f957593c0e	8926b943-bda3-4c36-aa29-4f8576e75e90	735cd1ad-a76d-4026-87dc-60f501454b7a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-20	200	cash	paid	\N	\N	2026-03-20 15:03:25.94235+00	f	\N	\N
bf194712-1fdc-4bc3-a3b8-9a6ad0bc4215	84cf3d8e-64cc-4a90-8b33-12c94640d00b	ebc8c94f-09bf-41ca-8522-f81f98fb1469	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-20	500	cash	paid	\N	\N	2026-03-20 15:03:47.283577+00	f	\N	\N
2e48db32-b8ab-44e3-bba8-272c760506e5	4bf7d91d-6da6-4d5d-9db0-30b196a13651	6f37b184-d886-4b91-a179-60f467b3e51d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-20	300	cash	paid	\N	\N	2026-03-20 15:04:05.174587+00	f	\N	\N
58bfc235-d775-42b6-b5ed-af45fd391a96	1cac3c77-d86c-41b8-ba55-2b1f74410661	5d640f92-1900-47f5-bb7e-a6ab5061d564	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-20	200	cash	paid	\N	\N	2026-03-20 15:04:25.853679+00	f	\N	\N
315ba264-96e5-40d2-82c3-067d46a2ef81	d59ecb10-5af9-4f75-8f43-dfc52d537f0c	400fb688-b2dd-42c2-b2f6-c2c3a6bff5bd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-20	200	cash	paid	\N	\N	2026-03-20 15:04:54.12092+00	f	\N	\N
e8778b71-a5f5-4518-aad3-88a0305c108a	70b6dbb8-0fb8-4661-a0cd-21955635a422	e4c1ab58-7506-40bb-87cd-40a3069fb9d7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13	1300	online	paid	\N	\N	2026-04-13 13:51:35.39512+00	f	\N	\N
cad2c01e-1a5f-4af3-a723-cc46a1e10116	4686827e-4849-4bfa-88aa-129912510008	5cebdb10-f359-495d-983b-766489065f26	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13	200	online	paid	\N	\N	2026-04-13 15:03:47.766615+00	f	\N	\N
1def4570-48de-4862-a5f1-e8f730989494	d59ecb10-5af9-4f75-8f43-dfc52d537f0c	400fb688-b2dd-42c2-b2f6-c2c3a6bff5bd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13	200	cash	paid	\N	\N	2026-04-13 15:35:42.609466+00	f	\N	\N
881ede1d-c014-4a54-8df2-4e58b51ec059	e9d54922-42db-42b1-ab59-8dd42d68af4c	fe889acf-38cf-4a1f-8fce-804d5304f246	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-20	300	cash	paid	\N	\N	2026-03-20 15:05:10.830701+00	f	\N	\N
1ec66a6c-fc50-47fb-8366-605070b2ecb2	bee2c977-93c0-44ef-874e-a76e53e40a51	aa68ef20-1754-401b-9bfc-b8f2c49b0a4e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-20	400	online	paid	\N	\N	2026-03-20 15:20:53.711743+00	f	\N	\N
0144e73b-0bc6-4972-ab2e-4597811d5d20	df704001-715c-495c-832e-1971c5655106	02d3bf14-a0ef-4ed8-85fb-146ca7ab0fe4	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-20	600	online	paid	\N	\N	2026-03-20 15:46:26.154954+00	f	\N	\N
979f47d9-f685-4436-8141-068855be296e	b16866ff-ba34-412f-aeea-fa734ccf88a1	a3742c80-66e9-443f-8ab2-a145af754194	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-20	500	online	paid	\N	\N	2026-03-20 16:10:18.505932+00	f	\N	\N
414db79e-8df8-44e5-a9f8-b15bacb9f6fb	cb5975f3-72b1-4cc9-bd02-81342334cb40	6043f054-834d-437f-860a-7f9269935958	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-20	200	online	paid	\N	\N	2026-03-20 16:12:46.508876+00	f	\N	\N
95be0a61-5d91-4230-9053-7f2982fdd1d8	b9bd3700-24a0-4fa2-9afa-ca0827c26188	b80d47c9-3d98-41cd-9037-7ddcdac87f0c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-20	200	online	paid	\N	\N	2026-03-20 16:33:11.814416+00	f	\N	\N
48a98716-8bba-4149-acce-386ac2846bfb	ba9ab57b-e2d8-4c2a-902d-effb7b810b03	a3f57a0f-8bdf-47f7-a94d-819924cdc08a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-20	1000	online	paid	\N	\N	2026-03-20 16:33:31.525972+00	f	\N	\N
7d91df2a-39d9-4908-9d50-e3b3227b48f1	34977a0a-e657-40cb-840d-a6df47bba8d3	d1929534-e23a-4d75-8031-6998ec8b0810	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-20	100	online	paid	\N	\N	2026-03-20 17:05:52.022793+00	f	\N	\N
6d03356c-bda5-4ae3-9905-3220143f8373	89d5c659-aa6c-4a99-b0fc-f737d9e8e0e4	111a604f-46f8-4271-8912-ccbe479ab3ef	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-20	1500	online	paid	\N	\N	2026-03-20 17:06:41.795043+00	f	\N	\N
1b3be3cd-513e-40ee-a8e8-de762638ae27	e3325ec8-264a-41e1-a2d5-84fb33eb4412	c2c54c13-fb99-4e5d-9f99-1bddf98beb5b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-21	500	online	paid	\N	\N	2026-03-21 05:24:20.398839+00	f	\N	\N
f761822b-2e21-47c5-b74a-277a15a6a484	fb079db0-2262-4017-bd24-5d42ca326ff9	9ca88703-194e-4620-9685-63969504382a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-21	1800	cash	paid	\N	\N	2026-03-21 07:05:07.706829+00	f	\N	\N
36d6692a-b9d8-43c3-9891-336f1239bcde	6245a2e8-2eb5-4d5f-8b8a-aac817bfee18	55efd7cf-1188-4423-9a53-8ee2c53002fa	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-21	200	online	paid	\N	\N	2026-03-21 08:47:48.948608+00	f	\N	\N
1952859e-a636-4622-9266-8d40bf641769	dd17dc7d-fde3-4770-bdf7-c30ba3dbcca6	59a0fc44-facd-4cdd-82ce-d5d7ba011765	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-21	3000	online	paid	\N	\N	2026-03-21 08:48:06.782242+00	f	\N	\N
1409959a-30c7-48f1-b82e-b18c27168681	9920fe35-b725-4a78-802d-61689d6993b2	b9ea214a-e90e-4ad5-a848-3b1005f2e89f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-21	300	online	paid	\N	\N	2026-03-21 09:40:05.031514+00	f	\N	\N
c58bc072-f0c7-4b5f-8223-029cacf22c4f	72e0cd6d-f353-4cbc-b59f-e63ee38dd833	696b495b-35b0-4393-b4ec-68ed91e19550	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-21	600	online	paid	\N	\N	2026-03-21 13:39:06.218473+00	f	\N	\N
2c875f21-e62c-4065-a94f-e2c5d49b48c4	6d60857f-7cd1-437e-a536-c9d04949b1c7	d6c5de5c-32f1-4075-bce2-9a151bb80cb0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-21	500	online	paid	\N	\N	2026-03-21 13:39:38.014448+00	f	\N	\N
569a2a72-0054-44aa-8bac-5f53d393556f	f35169da-5d69-4e7e-a35e-ed6237a94cff	6398b3f9-45c4-45b0-a7fc-0e3e1ced4173	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-21	500	online	paid	\N	\N	2026-03-21 13:40:07.160086+00	f	\N	\N
865aaba0-821f-470a-8c0c-4df44fe2441e	1ca2f5d0-fc1b-49ab-8443-25574737d3cf	18d2e760-ed6d-44b0-af27-6b7cb9d6ddbb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-21	300	online	paid	\N	\N	2026-03-21 14:12:32.189679+00	f	\N	\N
9cd2c926-01e2-4a12-85ea-f5ec50f6c435	22d10045-ef1c-4807-9278-c35dbb01d73f	db261798-826e-4d7b-9fc7-a4dba55df1f3	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-21	200	online	paid	\N	\N	2026-03-21 14:18:30.421262+00	f	\N	\N
b98fbef9-10f0-4b4f-85d2-842b98e2fec1	56da2e53-1358-4168-8c6e-cee12fe29c59	0e59bad3-eae7-435d-b166-6f5e876b3785	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-21	500	online	paid	\N	\N	2026-03-21 14:33:38.247276+00	f	\N	\N
7cca3b96-1d36-4f2e-a2c7-efe1f70558a0	1cac3c77-d86c-41b8-ba55-2b1f74410661	5d640f92-1900-47f5-bb7e-a6ab5061d564	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-21	200	online	paid	\N	\N	2026-03-21 14:56:45.135112+00	f	\N	\N
bc13ab72-6123-48ff-901a-c295e30e5d09	f5064908-4ea0-42c7-8a63-0ddfc2a80531	dc623009-9752-43d7-b22a-384740599eb7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-21	400	cash	paid	\N	\N	2026-03-21 14:59:47.913416+00	f	\N	\N
9a7d3086-f699-4f7c-bb21-fee6759e89f2	2d860b86-e289-45b9-b108-3ecc32fafe18	adbe0a7a-d431-41af-9a40-6fdc864df6ab	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-21	500	cash	paid	\N	\N	2026-03-21 15:00:12.812851+00	f	\N	\N
28461d1f-3619-4934-b70a-a3629541080a	db6c8835-21b0-4c54-b4ff-2e6ec0441891	0d99cdf2-2edc-4baa-bf1a-14c97c0df949	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-21	1000	online	paid	\N	\N	2026-03-21 15:19:12.587748+00	f	\N	\N
824defa5-1cc6-4f38-b19f-985111e396dc	e0fca0e1-df99-497f-87e4-41be32ec1780	c18d8b95-c031-4110-85c8-b265a89efc50	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-21	1000	online	paid	\N	\N	2026-03-21 15:32:54.482444+00	f	\N	\N
5983faff-8bdf-48fd-97f6-48a761556409	eec56395-bc3e-4592-8a21-7b694944b6eb	bd6c3241-ee7a-49a4-8f31-6ca7af5980d8	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-21	1000	online	paid	\N	\N	2026-03-21 15:34:32.106587+00	f	\N	\N
f0679d8f-5c41-486a-b6e2-d55e13b4882e	b9bd3700-24a0-4fa2-9afa-ca0827c26188	b80d47c9-3d98-41cd-9037-7ddcdac87f0c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-21	200	online	paid	\N	\N	2026-03-21 18:43:25.568735+00	f	\N	\N
1c46f36d-35a4-4932-b61a-c6e780df6e79	35038458-ade9-412d-877d-814bb95adf5d	794af05e-0e94-449e-90ee-691d82534c27	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-21	200	online	paid	\N	\N	2026-03-21 18:44:16.11618+00	f	\N	\N
a10c531e-0f97-435e-b090-316c16a8e56e	b2f4bd25-a426-4b1a-b0f6-3ef0115ba281	61588824-28f6-4f24-b902-3044b3b05a19	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-21	500	online	paid	\N	\N	2026-03-21 18:45:11.82324+00	f	\N	\N
e949d1c2-b23b-4fc0-a32e-4d2d335144e1	89d5c659-aa6c-4a99-b0fc-f737d9e8e0e4	111a604f-46f8-4271-8912-ccbe479ab3ef	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-21	1500	online	paid	\N	\N	2026-03-21 18:46:07.772995+00	f	\N	\N
dad29ade-3737-4bfd-8b29-0a91ab6c618a	8d648ef9-92ca-4513-8639-f0b3ec50a392	eed1102c-8dcc-4caf-9239-6a9cd7332ccc	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-22	400	online	paid	\N	\N	2026-03-22 02:08:05.09503+00	f	\N	\N
516a2a70-fa65-4a62-86fa-4f16e3e42945	89d5c659-aa6c-4a99-b0fc-f737d9e8e0e4	111a604f-46f8-4271-8912-ccbe479ab3ef	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-22	1500	online	paid	\N	\N	2026-03-22 13:26:28.334982+00	f	\N	\N
ee84fbc7-4c04-4422-b798-3f754280c4e4	bee2c977-93c0-44ef-874e-a76e53e40a51	aa68ef20-1754-401b-9bfc-b8f2c49b0a4e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-22	800	online	paid	\N	\N	2026-03-22 13:27:02.449533+00	f	\N	\N
2ee744d6-2602-4376-8680-77b98832c0b6	0d8641d3-1860-4dac-8f9c-a7362226fe97	682ad2e5-1d22-4c44-a132-b8580c165d1d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-22	600	online	paid	\N	\N	2026-03-22 13:27:36.604346+00	f	\N	\N
e6b2992c-0e1c-4356-92dd-69b444300601	6245a2e8-2eb5-4d5f-8b8a-aac817bfee18	55efd7cf-1188-4423-9a53-8ee2c53002fa	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-22	200	online	paid	\N	\N	2026-03-22 13:28:21.892934+00	f	\N	\N
29658c9b-c50a-4c45-8121-5b1e91655b45	6d60857f-7cd1-437e-a536-c9d04949b1c7	d6c5de5c-32f1-4075-bce2-9a151bb80cb0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-22	500	online	paid	\N	\N	2026-03-22 13:28:53.84769+00	f	\N	\N
1c06af56-b2ce-459f-a196-ec0a0ddbe29b	ac85d0d3-a358-46b8-bf3e-4f4468ca5670	7a331756-19b2-4a9f-a2ee-2b3f6a641e72	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-22	2100	online	paid	\N	\N	2026-03-22 13:29:30.886437+00	f	\N	\N
8a316f42-f121-4a91-9cd6-46c7b4d33b4f	9920fe35-b725-4a78-802d-61689d6993b2	b9ea214a-e90e-4ad5-a848-3b1005f2e89f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-22	300	online	paid	\N	\N	2026-03-22 14:01:27.203162+00	f	\N	\N
d486d745-af78-43b2-9825-0437d4cbd45b	1cac3c77-d86c-41b8-ba55-2b1f74410661	5d640f92-1900-47f5-bb7e-a6ab5061d564	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-22	200	online	paid	\N	\N	2026-03-22 14:06:38.5605+00	f	\N	\N
2ed083fb-6d96-4d13-909d-514ec83cf855	02889b17-5d17-4dc1-ace1-381b0d733984	def4d986-3767-4793-a6e8-c767351fd93f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-22	750	cash	paid	\N	\N	2026-03-22 14:07:00.564508+00	f	\N	\N
8b0ad247-1cf7-4fdd-a1b3-275a60cf1bbe	3765d341-7b06-463d-82fa-add7d738b854	eab03433-a240-440d-8140-9be3f7ccf9a7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-22	1000	online	paid	\N	\N	2026-03-22 14:43:46.856543+00	f	\N	\N
c567bf18-6b90-4c02-9665-62624d456d28	894bed8a-dcbc-44c1-b441-fa5be29868d6	b9357402-e54d-4f75-abc5-6690cb4b9288	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-22	50	online	paid	\N	\N	2026-03-22 15:37:02.353694+00	f	\N	\N
de48b1c6-dc4e-464f-b673-69625a625884	b9bd3700-24a0-4fa2-9afa-ca0827c26188	b80d47c9-3d98-41cd-9037-7ddcdac87f0c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-22	400	online	paid	\N	\N	2026-03-22 15:37:51.865541+00	f	\N	\N
7a37691f-c716-40c5-ae07-88c150a40c5d	e0fca0e1-df99-497f-87e4-41be32ec1780	c18d8b95-c031-4110-85c8-b265a89efc50	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-22	500	online	paid	\N	\N	2026-03-22 15:38:17.264339+00	f	\N	\N
753331a4-a320-417d-9ace-6284098e06f1	b16866ff-ba34-412f-aeea-fa734ccf88a1	a3742c80-66e9-443f-8ab2-a145af754194	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-22	500	online	paid	\N	\N	2026-03-22 15:38:49.308963+00	f	\N	\N
e42a54d9-94dd-4632-a5f6-9b8054b4c2b5	cb5975f3-72b1-4cc9-bd02-81342334cb40	6043f054-834d-437f-860a-7f9269935958	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-22	400	online	paid	\N	\N	2026-03-22 15:39:15.221106+00	f	\N	\N
16f25a18-eb46-40be-961a-52e5248762a4	271816e2-6379-480d-92c3-c5f6fc561298	9b9a19c0-f88e-46eb-afd6-b823511a12e9	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-22	150	cash	paid	\N	\N	2026-03-22 15:48:51.251951+00	f	\N	\N
845e1d5f-b80f-4d51-b6fe-9678942ea6be	f5064908-4ea0-42c7-8a63-0ddfc2a80531	dc623009-9752-43d7-b22a-384740599eb7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-22	400	cash	paid	\N	\N	2026-03-22 15:49:26.166665+00	f	\N	\N
674fc9bd-d3d7-415c-a9b9-69529c878c57	1ca2f5d0-fc1b-49ab-8443-25574737d3cf	18d2e760-ed6d-44b0-af27-6b7cb9d6ddbb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-22	100	cash	paid	\N	\N	2026-03-22 15:49:59.128334+00	f	\N	\N
8df8207e-161f-4ae6-a663-9b2b7847b849	84cf3d8e-64cc-4a90-8b33-12c94640d00b	ebc8c94f-09bf-41ca-8522-f81f98fb1469	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-22	700	cash	paid	\N	\N	2026-03-22 15:50:24.583815+00	f	\N	\N
a3019b9e-a752-44f2-82a9-fed2e20e8124	f8e88dc3-4e2d-4526-b66d-743bc434bc6e	7a03a63d-e3f1-48dd-b082-63ea18330321	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-22	2000	online	paid	\N	\N	2026-03-22 16:21:06.222199+00	f	\N	\N
10236e8a-750a-42db-8e35-1b04e09b5d69	6340050f-5246-43c5-9297-d14267b9bad0	17f01068-23e4-438e-8322-5e4a12f3f332	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-22	1200	online	paid	\N	\N	2026-03-22 16:34:41.122519+00	f	\N	\N
371fe285-5267-45ef-a3cd-fc40210a33f6	c5f80bd8-670e-4df5-8c6a-ac7378801077	3a181c18-8f9e-4467-96a8-c09687ebea27	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-22	1000	online	paid	\N	\N	2026-03-22 18:03:39.278385+00	f	\N	\N
ad14375f-4d76-4d1d-85ca-07cdda7fa541	f35169da-5d69-4e7e-a35e-ed6237a94cff	6398b3f9-45c4-45b0-a7fc-0e3e1ced4173	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-22	500	online	paid	\N	\N	2026-03-22 18:04:18.58765+00	f	\N	\N
a138e61c-5ad5-42e5-b93a-fc7c11d90104	db40f757-c1ca-42a3-bb92-2df13793998d	249ae28b-3ceb-4a1c-a279-a9affb4d8090	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-23	500	cash	paid	\N	\N	2026-03-23 05:08:30.009362+00	f	\N	\N
62908e8c-ebbc-4d3e-9936-7f2cbabe8411	80752817-7c75-426b-a97e-361b246ec563	135460a0-56bf-4c17-a4a8-5e66f29b52f6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-23	300	cash	paid	\N	\N	2026-03-23 07:38:41.968457+00	f	\N	\N
5c53aad3-7c84-4d47-85c6-e8f0c5b1cfba	b86ae36d-afe4-41a9-8d69-af6178efda6c	7983d2f3-d1b5-4f40-afba-dfadeeb8e0bd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-23	600	online	paid	\N	\N	2026-03-23 07:51:18.21303+00	f	\N	\N
49892609-a554-469b-8713-3b5bd088d872	6d60857f-7cd1-437e-a536-c9d04949b1c7	d6c5de5c-32f1-4075-bce2-9a151bb80cb0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-23	500	online	paid	\N	\N	2026-03-23 07:51:37.680186+00	f	\N	\N
af0ace36-b834-48aa-b137-4fafa06e7e4a	dede5547-d440-4d63-a9ac-ad427b2895c9	6ded35ce-a2e8-4856-827d-ab18be14743b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-23	500	online	paid	\N	\N	2026-03-23 07:52:11.203188+00	f	\N	\N
249d8fd3-8dd1-4750-b1c7-0c6607daacc1	6735cbe7-8e3f-41f0-b16c-9b60d974d6ec	5ba941ae-382e-452e-a5b3-8cdff26f1c7d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-23	1000	online	paid	\N	\N	2026-03-23 13:27:59.668502+00	f	\N	\N
17b6c9d9-ab8f-4e74-9748-fd47182488c9	250eeece-4579-4cc4-86f9-0cdd866fbd24	e3c2af50-d0e2-461a-bfc2-67efd23feb46	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-23	100	online	paid	\N	\N	2026-03-23 13:28:32.793936+00	f	\N	\N
31f290c4-9b1a-41a7-9cb7-05db88e614a5	32e40b35-8c4b-4552-b8b8-7c233d31c03d	757d4684-58bf-40d2-bfdd-ec9921ff94d7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-23	250	online	paid	\N	\N	2026-03-23 13:28:56.171539+00	f	\N	\N
d3a47515-b410-44e9-ac64-e4b0395a38e3	72e0cd6d-f353-4cbc-b59f-e63ee38dd833	696b495b-35b0-4393-b4ec-68ed91e19550	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-23	900	online	paid	\N	\N	2026-03-23 14:17:33.94529+00	f	\N	\N
46d91f08-a0df-474f-80ee-4d924852ada3	63a8b08e-b8dd-451a-bb89-b38b0bb2d9b2	5dbe34e7-1ce9-4640-b617-a2529d3479d8	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-23	500	online	paid	\N	\N	2026-03-23 14:18:07.62932+00	f	\N	\N
ac6dbdbe-944e-4ad1-ac42-ae6bdbfd6684	b2f4bd25-a426-4b1a-b0f6-3ef0115ba281	61588824-28f6-4f24-b902-3044b3b05a19	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-23	500	online	paid	\N	\N	2026-03-23 14:18:25.001432+00	f	\N	\N
104018d6-111a-4b55-a37d-b52891f4f73f	bcb87a68-a59d-438f-b81a-e5a4a6b666c1	b4a8d905-3198-4d75-8ee3-3800ec8f2b40	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-23	500	online	paid	\N	\N	2026-03-23 15:03:45.572113+00	f	\N	\N
080a46ad-b19f-410e-9886-54cdff2f6e1d	1cac3c77-d86c-41b8-ba55-2b1f74410661	5d640f92-1900-47f5-bb7e-a6ab5061d564	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-23	200	online	paid	\N	\N	2026-03-23 15:17:57.225348+00	f	\N	\N
b9f41895-9d8d-4b63-ac91-12fd2c5a161d	860f25ca-39ff-42f0-bacb-e409bd6007d7	71d81887-5e21-4486-97e6-faea2c876cff	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-23	200	online	paid	\N	\N	2026-03-23 15:18:21.546195+00	f	\N	\N
b672d21f-ed2c-4112-ad40-69f414f46bcd	f35169da-5d69-4e7e-a35e-ed6237a94cff	6398b3f9-45c4-45b0-a7fc-0e3e1ced4173	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-23	500	online	paid	\N	\N	2026-03-23 15:18:47.615762+00	f	\N	\N
02d2dde3-628c-4b90-a78a-2bafae436fcf	22d10045-ef1c-4807-9278-c35dbb01d73f	db261798-826e-4d7b-9fc7-a4dba55df1f3	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-23	200	online	paid	\N	\N	2026-03-23 15:19:11.713023+00	f	\N	\N
e3849104-79f5-4f52-a117-ae3325a25fa4	7d755464-aa72-4aab-9028-a75e09410ff6	20ccdb2b-c6ad-4063-9dfd-a34c50adac5e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-23	500	online	paid	\N	\N	2026-03-23 15:27:56.262801+00	f	\N	\N
ca4f50b5-6075-4107-86a8-ab99583cc13b	44e44d3f-1c42-41fa-8bf1-2bdb5bf219c7	2647ddf3-5d7a-405f-be10-8cb5f12edb5d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-23	200	cash	paid	\N	\N	2026-03-23 15:37:43.57885+00	f	\N	\N
50775378-ecc1-4154-8e85-4db2cac056c9	8926b943-bda3-4c36-aa29-4f8576e75e90	735cd1ad-a76d-4026-87dc-60f501454b7a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-23	600	cash	paid	\N	\N	2026-03-23 15:38:21.413976+00	f	\N	\N
330e8a9c-4447-46ad-9d3d-9abada35a8d9	f5064908-4ea0-42c7-8a63-0ddfc2a80531	dc623009-9752-43d7-b22a-384740599eb7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-23	400	cash	paid	\N	\N	2026-03-23 15:38:47.624567+00	f	\N	\N
d302bb04-cc7b-4646-9ca0-50800009ca6e	1ca2f5d0-fc1b-49ab-8443-25574737d3cf	18d2e760-ed6d-44b0-af27-6b7cb9d6ddbb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-23	100	cash	paid	\N	\N	2026-03-23 15:39:07.75182+00	f	\N	\N
e989836d-b59e-496b-bc0c-a28f753838dd	2d860b86-e289-45b9-b108-3ecc32fafe18	adbe0a7a-d431-41af-9a40-6fdc864df6ab	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-23	500	cash	paid	\N	\N	2026-03-23 15:39:54.172866+00	f	\N	\N
b85c0ad8-b282-4ba0-b939-0597c2d23840	84cf3d8e-64cc-4a90-8b33-12c94640d00b	ebc8c94f-09bf-41ca-8522-f81f98fb1469	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-23	700	cash	paid	\N	\N	2026-03-23 15:40:10.503262+00	f	\N	\N
fb97ff57-bc41-4b78-b657-00a00c87e23c	4bf7d91d-6da6-4d5d-9db0-30b196a13651	6f37b184-d886-4b91-a179-60f467b3e51d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-23	300	cash	paid	\N	\N	2026-03-23 15:40:34.270408+00	f	\N	\N
5f409fe3-7b4d-4cc8-95af-775f2ad154fb	d59ecb10-5af9-4f75-8f43-dfc52d537f0c	400fb688-b2dd-42c2-b2f6-c2c3a6bff5bd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-23	200	cash	paid	\N	\N	2026-03-23 15:41:02.224924+00	f	\N	\N
e454c8b2-fe8a-424b-8725-56095200bdd2	e9d54922-42db-42b1-ab59-8dd42d68af4c	fe889acf-38cf-4a1f-8fce-804d5304f246	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-23	600	cash	paid	\N	\N	2026-03-23 15:41:24.777576+00	f	\N	\N
76e26bf0-3ee9-4eb2-958d-ab0d113a268c	bee2c977-93c0-44ef-874e-a76e53e40a51	aa68ef20-1754-401b-9bfc-b8f2c49b0a4e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-23	400	online	paid	\N	\N	2026-03-23 18:22:35.467807+00	f	\N	\N
48ee6ac8-9db1-44c3-8f3d-f5af8481d97e	6245a2e8-2eb5-4d5f-8b8a-aac817bfee18	55efd7cf-1188-4423-9a53-8ee2c53002fa	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-23	200	online	paid	\N	\N	2026-03-23 18:23:06.703171+00	f	\N	\N
b8414a6e-6fc5-4cd1-b973-8fd4940c4335	89d5c659-aa6c-4a99-b0fc-f737d9e8e0e4	111a604f-46f8-4271-8912-ccbe479ab3ef	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-23	1500	online	paid	\N	\N	2026-03-23 18:23:45.070505+00	f	\N	\N
26014c2b-7569-46de-98e2-3e0d18a14b0f	6aac96ea-eb26-460a-8340-ffb355953ae0	8e423e8d-c1ce-4d07-9860-fd7df34eaf44	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-24	400	online	paid	\N	\N	2026-03-24 02:13:38.786991+00	f	\N	\N
aa028eee-e58b-4c1a-9e16-74c58a94be93	8d648ef9-92ca-4513-8639-f0b3ec50a392	eed1102c-8dcc-4caf-9239-6a9cd7332ccc	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-24	600	online	paid	\N	\N	2026-03-24 05:16:37.482961+00	f	\N	\N
ea3afea6-e42d-42a7-84a7-bae74a418f5b	df704001-715c-495c-832e-1971c5655106	02d3bf14-a0ef-4ed8-85fb-146ca7ab0fe4	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-24	900	online	paid	\N	\N	2026-03-24 05:17:33.056914+00	f	\N	\N
04651c0e-d160-4182-a5b2-8f371bcd4e80	56da2e53-1358-4168-8c6e-cee12fe29c59	0e59bad3-eae7-435d-b166-6f5e876b3785	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-24	1500	online	paid	\N	\N	2026-03-24 05:17:56.093424+00	f	\N	\N
846be268-f6f8-4758-b87a-c1fedad7f895	cf301afd-a3ed-4bea-9794-b4fe432d8861	8419a9be-df12-416f-81ce-3570f9a82a4c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-24	3000	cash	paid	\N	\N	2026-03-24 06:35:27.803506+00	f	\N	\N
e0f9817c-f658-4465-9ef3-971be5e04c66	80752817-7c75-426b-a97e-361b246ec563	135460a0-56bf-4c17-a4a8-5e66f29b52f6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-24	300	cash	paid	\N	\N	2026-03-24 07:43:30.888366+00	f	\N	\N
0d3397fb-e0b9-4d83-8e22-f57bf0ab9e1e	27559805-98ca-4b40-a167-933eea4a69bb	9c2457d7-dd54-4968-bf51-e43a0ecb49f3	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-24	3000	online	paid	\N	\N	2026-03-24 07:58:08.900305+00	f	\N	\N
15b7e0d8-40ae-44e6-a0b6-7104cd1d01cf	ba9ab57b-e2d8-4c2a-902d-effb7b810b03	a3f57a0f-8bdf-47f7-a94d-819924cdc08a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-24	4000	online	paid	\N	\N	2026-03-24 13:09:37.043697+00	f	\N	\N
e7939cc6-9e50-49c3-82a9-1e82cac639ef	6d60857f-7cd1-437e-a536-c9d04949b1c7	d6c5de5c-32f1-4075-bce2-9a151bb80cb0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-24	500	online	paid	\N	\N	2026-03-24 13:10:02.692709+00	f	\N	\N
70b60340-1019-4f58-a4e6-919543bd80ea	9a636e37-de02-451a-981d-4bf513dce4eb	91f3e941-a2bf-44ce-9e3b-6a6f4a19af54	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-24	600	online	paid	\N	\N	2026-03-24 13:10:33.909098+00	f	\N	\N
845751f3-5183-4841-ace8-600506341e71	dede5547-d440-4d63-a9ac-ad427b2895c9	6ded35ce-a2e8-4856-827d-ab18be14743b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-24	500	online	paid	\N	\N	2026-03-24 13:11:37.303822+00	f	\N	\N
2f3da0a1-ce00-46e9-84a7-d1aefd12f5c8	b9bd3700-24a0-4fa2-9afa-ca0827c26188	b80d47c9-3d98-41cd-9037-7ddcdac87f0c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-24	400	online	paid	\N	\N	2026-03-24 13:42:58.396317+00	f	\N	\N
d46abeb5-f989-4c85-9b01-d6a1c849da32	250eeece-4579-4cc4-86f9-0cdd866fbd24	e3c2af50-d0e2-461a-bfc2-67efd23feb46	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-24	100	online	paid	\N	\N	2026-03-24 13:43:22.278677+00	f	\N	\N
e7284654-718d-4ce2-8c03-a5e5084813c0	1cac3c77-d86c-41b8-ba55-2b1f74410661	5d640f92-1900-47f5-bb7e-a6ab5061d564	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-24	200	online	paid	\N	\N	2026-03-24 14:19:07.052845+00	f	\N	\N
d6567c00-84f9-490f-a527-1dbc43071709	d59ecb10-5af9-4f75-8f43-dfc52d537f0c	400fb688-b2dd-42c2-b2f6-c2c3a6bff5bd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-24	200	cash	paid	\N	\N	2026-03-24 15:06:28.910384+00	f	\N	\N
fdf0b9af-97eb-4fa7-9f50-d47e93225298	1ca2f5d0-fc1b-49ab-8443-25574737d3cf	18d2e760-ed6d-44b0-af27-6b7cb9d6ddbb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-24	100	cash	paid	\N	\N	2026-03-24 15:06:52.344425+00	f	\N	\N
2d5ee989-6eef-445a-92f6-9895b52656f2	2d860b86-e289-45b9-b108-3ecc32fafe18	adbe0a7a-d431-41af-9a40-6fdc864df6ab	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-24	500	cash	paid	\N	\N	2026-03-24 15:07:41.934353+00	f	\N	\N
afff9397-7570-4318-b1b7-88c042880f83	4bf7d91d-6da6-4d5d-9db0-30b196a13651	6f37b184-d886-4b91-a179-60f467b3e51d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-24	300	cash	paid	\N	\N	2026-03-24 15:08:07.517245+00	f	\N	\N
9c81d5a1-8f6e-482f-9874-b954a8d0583b	84cf3d8e-64cc-4a90-8b33-12c94640d00b	ebc8c94f-09bf-41ca-8522-f81f98fb1469	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-24	700	cash	paid	\N	\N	2026-03-24 15:08:29.022905+00	f	\N	\N
67c7a3c6-fe21-4e39-b89e-dcb2cf9826ef	894bed8a-dcbc-44c1-b441-fa5be29868d6	b9357402-e54d-4f75-abc5-6690cb4b9288	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-24	100	online	paid	\N	\N	2026-03-24 15:09:47.374214+00	f	\N	\N
02509e5a-efa8-4bda-bd49-9b5a0b5c59da	651c7fb2-68bf-46d8-bf93-3f25bf5c8dab	6d5f5859-9f8b-466b-8a58-336b620889eb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-24	500	online	paid	\N	\N	2026-03-24 15:11:28.377292+00	f	\N	\N
dfa1b9b2-72de-40a3-96e7-6085d09c0d4f	32e40b35-8c4b-4552-b8b8-7c233d31c03d	757d4684-58bf-40d2-bfdd-ec9921ff94d7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-24	250	online	paid	\N	\N	2026-03-24 15:17:14.12996+00	f	\N	\N
af237246-c9da-42ac-91ab-a4396a2def14	bee2c977-93c0-44ef-874e-a76e53e40a51	aa68ef20-1754-401b-9bfc-b8f2c49b0a4e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-24	400	online	paid	\N	\N	2026-03-24 15:37:56.908846+00	f	\N	\N
ae859795-9035-4cd5-a667-21afd197cd26	cb86aae2-de85-41b5-bf5f-20645840e270	a22b5f37-a3d4-48de-a5d3-5717343478be	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-24	500	cash	paid	\N	\N	2026-03-24 16:08:53.066496+00	f	\N	\N
4c84c80f-50fd-43d1-a3b3-9255d9441271	f35169da-5d69-4e7e-a35e-ed6237a94cff	6398b3f9-45c4-45b0-a7fc-0e3e1ced4173	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-24	500	online	paid	\N	\N	2026-03-24 17:40:26.429221+00	f	\N	\N
1ad417a0-684c-42ca-9178-c100adf00482	860f25ca-39ff-42f0-bacb-e409bd6007d7	71d81887-5e21-4486-97e6-faea2c876cff	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-24	200	online	paid	\N	\N	2026-03-24 23:28:48.470001+00	f	\N	\N
95943292-2c34-4658-b038-a87637b2e2b7	89d5c659-aa6c-4a99-b0fc-f737d9e8e0e4	111a604f-46f8-4271-8912-ccbe479ab3ef	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-24	1500	online	paid	\N	\N	2026-03-24 23:29:42.252407+00	f	\N	\N
076a33e2-c249-46ab-90de-95b2459b3c90	fb079db0-2262-4017-bd24-5d42ca326ff9	9ca88703-194e-4620-9685-63969504382a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25	1800	cash	paid	\N	\N	2026-03-25 05:05:52.924848+00	f	\N	\N
346f3bb9-cf4f-4c21-860b-83c7c0aa4e35	80752817-7c75-426b-a97e-361b246ec563	135460a0-56bf-4c17-a4a8-5e66f29b52f6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25	300	cash	paid	\N	\N	2026-03-25 13:19:02.934649+00	f	\N	\N
b55f9246-7633-4b7c-8d1e-10ca0346cb7b	d11d1904-a5c2-4fd5-8ebc-c800d6ced0b2	7c5e25ec-8d9d-4d6c-80b8-2ad0bfd12cee	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25	150	online	paid	\N	\N	2026-03-25 13:43:19.049234+00	f	\N	\N
14ae9b82-82b4-4a78-81ff-a4ca2e53da1f	34977a0a-e657-40cb-840d-a6df47bba8d3	d1929534-e23a-4d75-8031-6998ec8b0810	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25	200	online	paid	\N	\N	2026-03-25 13:51:30.532777+00	f	\N	\N
2a1e3f34-c8b8-40e4-b1d3-7d67de54276c	9920fe35-b725-4a78-802d-61689d6993b2	b9ea214a-e90e-4ad5-a848-3b1005f2e89f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25	300	online	paid	\N	\N	2026-03-25 13:52:45.168623+00	f	\N	\N
a543c4e0-1c91-4db5-a645-60b87b3965fd	6d60857f-7cd1-437e-a536-c9d04949b1c7	d6c5de5c-32f1-4075-bce2-9a151bb80cb0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25	500	online	paid	\N	\N	2026-03-25 14:09:20.004073+00	f	\N	\N
b8a9de08-c6b2-4bc5-9d57-138697d51d21	67eb359b-25a2-481e-ae53-c208688f5940	7ebb952f-b8ce-452d-a076-36b5efc9d1c5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25	1500	online	paid	\N	\N	2026-03-25 14:09:42.062843+00	f	\N	\N
92f71386-acab-4fb3-9f64-2fc1b2bf10c5	250eeece-4579-4cc4-86f9-0cdd866fbd24	e3c2af50-d0e2-461a-bfc2-67efd23feb46	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25	100	online	paid	\N	\N	2026-03-25 14:10:35.146669+00	f	\N	\N
14f37e0c-979b-4b12-b396-eab6adcc8bc6	bee2c977-93c0-44ef-874e-a76e53e40a51	aa68ef20-1754-401b-9bfc-b8f2c49b0a4e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25	400	online	paid	\N	\N	2026-03-25 14:11:03.429048+00	f	\N	\N
83788520-ae16-442e-8445-e5d4c6907176	9a636e37-de02-451a-981d-4bf513dce4eb	91f3e941-a2bf-44ce-9e3b-6a6f4a19af54	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25	600	online	paid	\N	\N	2026-03-25 14:11:28.570322+00	f	\N	\N
7ca63ef3-28ae-4256-b0ab-1decee8b2c8a	6245a2e8-2eb5-4d5f-8b8a-aac817bfee18	55efd7cf-1188-4423-9a53-8ee2c53002fa	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25	400	online	paid	\N	\N	2026-03-25 14:11:56.330033+00	f	\N	\N
66170a83-907e-4d0b-9039-98589aebc339	32e40b35-8c4b-4552-b8b8-7c233d31c03d	757d4684-58bf-40d2-bfdd-ec9921ff94d7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25	250	online	paid	\N	\N	2026-03-25 14:12:25.693672+00	f	\N	\N
9cd30e76-5cb9-4f6d-941a-99611f6495cd	0d8641d3-1860-4dac-8f9c-a7362226fe97	682ad2e5-1d22-4c44-a132-b8580c165d1d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25	600	online	paid	\N	\N	2026-03-25 14:12:51.663495+00	f	\N	\N
2da746db-c554-408c-9c29-226d995f611e	b16866ff-ba34-412f-aeea-fa734ccf88a1	a3742c80-66e9-443f-8ab2-a145af754194	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25	1000	online	paid	\N	\N	2026-03-25 14:13:17.378566+00	f	\N	\N
08d101d2-5020-4e38-ab1d-0559996def7b	93906c36-47ae-41bb-bb4c-a594f08896b3	27e0e2f9-8d55-4cf8-a605-3a1b95f3c368	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25	500	online	paid	\N	\N	2026-03-25 14:13:35.32343+00	f	\N	\N
e7c9f0c1-95fa-40cf-adeb-887a9458c0f1	e0fca0e1-df99-497f-87e4-41be32ec1780	c18d8b95-c031-4110-85c8-b265a89efc50	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25	500	online	paid	\N	\N	2026-03-25 14:24:18.527704+00	f	\N	\N
fd3e8e5c-e5b0-48bc-9ec3-ff08921db00d	c8e35247-1c57-4290-9904-8553d3c7cad5	010a0aaf-0be5-46b5-a0dc-f5fcc85ed2cf	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25	1200	cash	paid	\N	\N	2026-03-25 14:27:09.615816+00	f	\N	\N
ee61c717-28ef-433b-b09a-9dfa1ff8776f	44e44d3f-1c42-41fa-8bf1-2bdb5bf219c7	2647ddf3-5d7a-405f-be10-8cb5f12edb5d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25	400	cash	paid	\N	\N	2026-03-25 15:15:49.062129+00	f	\N	\N
538dead3-d602-4cd6-8944-6b8edd34c7ff	1ca2f5d0-fc1b-49ab-8443-25574737d3cf	18d2e760-ed6d-44b0-af27-6b7cb9d6ddbb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25	100	cash	paid	\N	\N	2026-03-25 15:16:09.849369+00	f	\N	\N
53f743cb-8673-4b8b-b99d-e30f6ce3fb92	f5064908-4ea0-42c7-8a63-0ddfc2a80531	dc623009-9752-43d7-b22a-384740599eb7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25	400	cash	paid	\N	\N	2026-03-25 15:16:33.431383+00	f	\N	\N
7a032445-bb65-47af-ad44-feafe68291f3	4bf7d91d-6da6-4d5d-9db0-30b196a13651	6f37b184-d886-4b91-a179-60f467b3e51d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25	300	cash	paid	\N	\N	2026-03-25 15:16:59.676556+00	f	\N	\N
66006242-66d0-44cd-a288-c658887020d4	d59ecb10-5af9-4f75-8f43-dfc52d537f0c	400fb688-b2dd-42c2-b2f6-c2c3a6bff5bd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25	200	cash	paid	\N	\N	2026-03-25 15:17:18.131838+00	f	\N	\N
6d03e90b-c8de-4841-bcf2-345620d64fbd	e9d54922-42db-42b1-ab59-8dd42d68af4c	fe889acf-38cf-4a1f-8fce-804d5304f246	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25	600	cash	paid	\N	\N	2026-03-25 15:17:38.521561+00	f	\N	\N
7bf0a0de-2c0b-4939-8700-decb56f45e07	f35169da-5d69-4e7e-a35e-ed6237a94cff	6398b3f9-45c4-45b0-a7fc-0e3e1ced4173	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25	500	online	paid	\N	\N	2026-03-25 15:24:22.835434+00	f	\N	\N
32f8032f-1ca8-4258-bc52-e3c32f5a42db	cf6ae0f5-381e-455f-8bda-1dda692f14a4	e425ae02-2a03-4e18-af85-4b3990eefd11	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25	1000	cash	paid	\N	\N	2026-03-25 15:27:38.409911+00	f	\N	\N
bceee938-d226-4f47-ab02-309df72c2eea	b2f4bd25-a426-4b1a-b0f6-3ef0115ba281	61588824-28f6-4f24-b902-3044b3b05a19	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25	500	online	paid	\N	\N	2026-03-25 15:53:20.420272+00	f	\N	\N
6f096700-dc8b-448c-b935-54cd5431bf09	6aac96ea-eb26-460a-8340-ffb355953ae0	8e423e8d-c1ce-4d07-9860-fd7df34eaf44	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25	400	online	paid	\N	\N	2026-03-25 16:07:56.636693+00	f	\N	\N
87dd8234-925c-497d-badc-18640abf5b23	651c7fb2-68bf-46d8-bf93-3f25bf5c8dab	6d5f5859-9f8b-466b-8a58-336b620889eb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25	500	online	paid	\N	\N	2026-03-25 16:44:38.519856+00	f	\N	\N
08d07610-48c6-4205-a1d8-682f178a8727	df704001-715c-495c-832e-1971c5655106	02d3bf14-a0ef-4ed8-85fb-146ca7ab0fe4	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25	300	online	paid	\N	\N	2026-03-25 16:45:10.161482+00	f	\N	\N
8c915b67-bd75-4182-b828-8c9052708d61	c5f80bd8-670e-4df5-8c6a-ac7378801077	3a181c18-8f9e-4467-96a8-c09687ebea27	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-25	1500	online	paid	\N	\N	2026-03-25 18:20:41.092062+00	f	\N	\N
c49e377a-76e1-4dcf-99bb-4cc214304a8d	cb5975f3-72b1-4cc9-bd02-81342334cb40	6043f054-834d-437f-860a-7f9269935958	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-26	400	online	paid	\N	\N	2026-03-26 01:00:02.341928+00	f	\N	\N
7daea1bf-01c3-44bc-b1e5-e80b42435fd5	c9a697e2-d1d0-4f48-9f8b-b0a12d06de0d	6778d224-f980-48ed-801f-bef1220cd43c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-26	300	online	paid	\N	\N	2026-03-26 06:34:22.340284+00	f	\N	\N
520c0bd7-6148-49a9-b70e-fc1fd16bcbb3	80752817-7c75-426b-a97e-361b246ec563	135460a0-56bf-4c17-a4a8-5e66f29b52f6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-26	300	cash	paid	\N	\N	2026-03-26 13:09:16.482802+00	f	\N	\N
813d3bb0-45da-4435-a8a5-c3582eaa4b93	02889b17-5d17-4dc1-ace1-381b0d733984	def4d986-3767-4793-a6e8-c767351fd93f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-26	1000	cash	paid	\N	\N	2026-03-26 13:09:48.130072+00	f	\N	\N
fac9cc7d-8f23-4a2d-91d3-05a0fbb474cd	271816e2-6379-480d-92c3-c5f6fc561298	9b9a19c0-f88e-46eb-afd6-b823511a12e9	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-26	300	cash	paid	\N	\N	2026-03-26 13:10:08.736521+00	f	\N	\N
0c8951c7-9d39-4cf4-8a60-fa72c8d98bd0	bcb87a68-a59d-438f-b81a-e5a4a6b666c1	b4a8d905-3198-4d75-8ee3-3800ec8f2b40	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-26	1000	online	paid	\N	\N	2026-03-26 13:23:25.233343+00	f	\N	\N
2f52cdea-a890-477c-b531-967edfbd6adc	df704001-715c-495c-832e-1971c5655106	02d3bf14-a0ef-4ed8-85fb-146ca7ab0fe4	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-26	600	online	paid	\N	\N	2026-03-26 13:24:42.780635+00	f	\N	\N
4622ea62-e079-4750-ace8-f588a9876b6c	72e0cd6d-f353-4cbc-b59f-e63ee38dd833	696b495b-35b0-4393-b4ec-68ed91e19550	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-26	600	online	paid	\N	\N	2026-03-26 13:25:25.913717+00	f	\N	\N
9c592890-7884-4a2a-8668-65cb3aa39bd2	d11d1904-a5c2-4fd5-8ebc-c800d6ced0b2	7c5e25ec-8d9d-4d6c-80b8-2ad0bfd12cee	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-26	150	online	paid	\N	\N	2026-03-26 13:26:01.723504+00	f	\N	\N
824bc39d-0738-427e-9a42-ea87b5296ab6	6245a2e8-2eb5-4d5f-8b8a-aac817bfee18	55efd7cf-1188-4423-9a53-8ee2c53002fa	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-26	200	online	paid	\N	\N	2026-03-26 13:26:39.043906+00	f	\N	\N
42e9a259-6d84-4020-aa8c-f47847375dc9	bee2c977-93c0-44ef-874e-a76e53e40a51	aa68ef20-1754-401b-9bfc-b8f2c49b0a4e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-26	400	online	paid	\N	\N	2026-03-26 13:26:56.997535+00	f	\N	\N
78743664-0c61-4e22-9250-45f0b842b90d	6d60857f-7cd1-437e-a536-c9d04949b1c7	d6c5de5c-32f1-4075-bce2-9a151bb80cb0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-26	500	online	paid	\N	\N	2026-03-26 14:14:41.808058+00	f	\N	\N
d5708bdb-d94d-41d2-a9aa-7c5e01f767a7	34977a0a-e657-40cb-840d-a6df47bba8d3	d1929534-e23a-4d75-8031-6998ec8b0810	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-26	100	online	paid	\N	\N	2026-03-26 14:18:48.712687+00	f	\N	\N
1071f031-020e-4127-a940-557a38453681	22d10045-ef1c-4807-9278-c35dbb01d73f	db261798-826e-4d7b-9fc7-a4dba55df1f3	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-26	200	online	paid	\N	\N	2026-03-26 14:30:05.553208+00	f	\N	\N
092b2ced-8b92-4316-a92f-4d049bf266a2	250eeece-4579-4cc4-86f9-0cdd866fbd24	e3c2af50-d0e2-461a-bfc2-67efd23feb46	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-26	100	online	paid	\N	\N	2026-03-26 14:30:26.063467+00	f	\N	\N
47dca8cd-165d-41f9-9a15-242fbe4f5c98	9a636e37-de02-451a-981d-4bf513dce4eb	91f3e941-a2bf-44ce-9e3b-6a6f4a19af54	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-26	600	online	paid	\N	\N	2026-03-26 15:15:49.256871+00	f	\N	\N
5d2722d9-8394-401c-b53a-51bd955951e6	1cac3c77-d86c-41b8-ba55-2b1f74410661	5d640f92-1900-47f5-bb7e-a6ab5061d564	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-26	200	online	paid	\N	\N	2026-03-26 15:16:23.53488+00	f	\N	\N
cccdd7cf-5cb3-4b38-86d7-72fc7e71e14e	ea7436e5-3b5c-49c8-87e4-6d727b2c2e50	cb603d85-d775-4680-bee6-2c42f0b3e767	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-26	200	online	paid	\N	\N	2026-03-26 15:17:15.278711+00	f	\N	\N
96aff583-71ea-4959-bf8b-fc8dcfe93ec5	44e44d3f-1c42-41fa-8bf1-2bdb5bf219c7	2647ddf3-5d7a-405f-be10-8cb5f12edb5d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-26	200	cash	paid	\N	\N	2026-03-26 15:36:10.039202+00	f	\N	\N
095b9114-32c2-4efe-99c5-195eaadd3146	f5064908-4ea0-42c7-8a63-0ddfc2a80531	dc623009-9752-43d7-b22a-384740599eb7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-26	400	cash	paid	\N	\N	2026-03-26 15:36:33.96864+00	f	\N	\N
f6e1cd69-65c4-45b8-8d00-bba48c871afd	8926b943-bda3-4c36-aa29-4f8576e75e90	735cd1ad-a76d-4026-87dc-60f501454b7a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-26	600	cash	paid	\N	\N	2026-03-26 15:36:56.32917+00	f	\N	\N
96c09814-4138-4601-aea6-fd6e00796313	1ca2f5d0-fc1b-49ab-8443-25574737d3cf	18d2e760-ed6d-44b0-af27-6b7cb9d6ddbb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-26	100	cash	paid	\N	\N	2026-03-26 15:37:16.140322+00	f	\N	\N
eee92444-8d33-4c89-b24c-993f3334da6c	32e40b35-8c4b-4552-b8b8-7c233d31c03d	757d4684-58bf-40d2-bfdd-ec9921ff94d7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-26	250	cash	paid	\N	\N	2026-03-26 15:37:37.62919+00	f	\N	\N
42ad76b2-d52d-4971-9a07-03d2c5a3e66e	2d860b86-e289-45b9-b108-3ecc32fafe18	adbe0a7a-d431-41af-9a40-6fdc864df6ab	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-26	500	cash	paid	\N	\N	2026-03-26 15:38:21.322078+00	f	\N	\N
6d8f238e-51ba-43c2-ac8e-126a9700b86e	4bf7d91d-6da6-4d5d-9db0-30b196a13651	6f37b184-d886-4b91-a179-60f467b3e51d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-26	300	cash	paid	\N	\N	2026-03-26 15:38:44.73582+00	f	\N	\N
384d1b51-35a6-414a-a27a-9c64487be787	84cf3d8e-64cc-4a90-8b33-12c94640d00b	ebc8c94f-09bf-41ca-8522-f81f98fb1469	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-26	700	cash	paid	\N	\N	2026-03-26 15:39:03.113501+00	f	\N	\N
4c815174-b3d1-4dd6-853b-a2f5903643ca	b16866ff-ba34-412f-aeea-fa734ccf88a1	a3742c80-66e9-443f-8ab2-a145af754194	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-26	500	online	paid	\N	\N	2026-03-26 16:06:18.060474+00	f	\N	\N
68637286-2a36-4224-ba3f-b7d3e6c92ba1	bcb87a68-a59d-438f-b81a-e5a4a6b666c1	b4a8d905-3198-4d75-8ee3-3800ec8f2b40	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-26	2000	online	paid	\N	\N	2026-03-26 17:43:54.083569+00	f	\N	\N
ec65c2a6-9383-4ced-96b8-386587651ec8	f35169da-5d69-4e7e-a35e-ed6237a94cff	6398b3f9-45c4-45b0-a7fc-0e3e1ced4173	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-26	500	online	paid	\N	\N	2026-03-26 17:44:29.475034+00	f	\N	\N
e0f48468-4397-4909-aa62-283df2ea0f4a	ba9ab57b-e2d8-4c2a-902d-effb7b810b03	a3f57a0f-8bdf-47f7-a94d-819924cdc08a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-26	2000	online	paid	\N	\N	2026-03-26 17:45:06.453442+00	f	\N	\N
42274a28-781d-4044-9e55-f5807bc06e8b	eec56395-bc3e-4592-8a21-7b694944b6eb	bd6c3241-ee7a-49a4-8f31-6ca7af5980d8	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-27	800	online	paid	\N	\N	2026-03-27 04:13:32.156135+00	f	\N	\N
d2cf798a-f52b-43af-a6b4-eaefb6494e77	9ef2ed06-c135-411b-9768-fe38919bf751	3271ace3-8b99-4f7c-bf11-2d83f9ae9711	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-27	2000	online	paid	\N	\N	2026-03-27 04:14:12.539561+00	f	\N	\N
fa81124e-5bfb-4aec-98df-5829d45722d5	d11d1904-a5c2-4fd5-8ebc-c800d6ced0b2	7c5e25ec-8d9d-4d6c-80b8-2ad0bfd12cee	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-27	150	online	paid	\N	\N	2026-03-27 04:21:05.149224+00	f	\N	\N
ef77b2c2-e2dd-4458-a197-3317f78c4643	860f25ca-39ff-42f0-bacb-e409bd6007d7	71d81887-5e21-4486-97e6-faea2c876cff	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-27	200	online	paid	\N	\N	2026-03-27 07:15:30.886713+00	f	\N	\N
23e8c7cf-4ce4-4b39-9289-cd3b21b5875a	80752817-7c75-426b-a97e-361b246ec563	135460a0-56bf-4c17-a4a8-5e66f29b52f6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-27	300	cash	paid	\N	\N	2026-03-27 08:00:19.769323+00	f	\N	\N
a41574be-1f5c-42bb-9d9c-142f189dcdb6	e00a821e-300f-432b-8519-5ef03b42b09c	6edc184d-553a-4ab7-b3bc-924f1ea007d6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-27	1200	online	paid	\N	\N	2026-03-27 08:09:53.308124+00	f	\N	\N
d3076d4d-e7a1-4bfe-85a1-1bd9de2f174b	6d60857f-7cd1-437e-a536-c9d04949b1c7	d6c5de5c-32f1-4075-bce2-9a151bb80cb0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-27	500	online	paid	\N	\N	2026-03-27 08:10:19.514096+00	f	\N	\N
e5d5d9b3-7945-4515-b364-fcbccac2f804	790d3d01-21ef-4976-82d4-af3adacb886c	2c2fec84-b45b-456c-87b2-de7365174599	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-27	200	online	paid	\N	\N	2026-03-27 08:10:48.941327+00	f	\N	\N
17d7f9b0-b513-4549-a31e-891120ab0138	89d5c659-aa6c-4a99-b0fc-f737d9e8e0e4	111a604f-46f8-4271-8912-ccbe479ab3ef	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-27	4500	online	paid	\N	\N	2026-03-27 13:26:41.333071+00	f	\N	\N
3adc1dfb-f7bf-4255-8436-1916b660ac84	02889b17-5d17-4dc1-ace1-381b0d733984	def4d986-3767-4793-a6e8-c767351fd93f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-27	500	cash	paid	\N	\N	2026-03-27 14:11:52.734088+00	f	\N	\N
4157e064-5f84-4c17-82ac-fd928cb03f91	6245a2e8-2eb5-4d5f-8b8a-aac817bfee18	55efd7cf-1188-4423-9a53-8ee2c53002fa	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-27	200	online	paid	\N	\N	2026-03-27 14:25:26.121852+00	f	\N	\N
e85b3f43-074a-4002-bae2-337f6187af5b	9a636e37-de02-451a-981d-4bf513dce4eb	91f3e941-a2bf-44ce-9e3b-6a6f4a19af54	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-27	600	online	paid	\N	\N	2026-03-27 14:32:15.872807+00	f	\N	\N
934dd680-89aa-4ef6-9aaf-f3fea5d5eab9	b16866ff-ba34-412f-aeea-fa734ccf88a1	a3742c80-66e9-443f-8ab2-a145af754194	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-27	500	online	paid	\N	\N	2026-03-27 14:36:20.281698+00	f	\N	\N
2302cafa-f80a-49f1-ad57-ff4a7f34df01	c5f80bd8-670e-4df5-8c6a-ac7378801077	3a181c18-8f9e-4467-96a8-c09687ebea27	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-27	1000	online	paid	\N	\N	2026-03-27 14:36:37.067541+00	f	\N	\N
c241eb12-3293-446a-8d9a-783f43c5e9db	1cac3c77-d86c-41b8-ba55-2b1f74410661	5d640f92-1900-47f5-bb7e-a6ab5061d564	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-27	200	online	paid	\N	\N	2026-03-27 14:48:03.424282+00	f	\N	\N
20801021-f7ed-48f2-a52e-ab0dee8daa57	44e44d3f-1c42-41fa-8bf1-2bdb5bf219c7	2647ddf3-5d7a-405f-be10-8cb5f12edb5d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-27	200	cash	paid	\N	\N	2026-03-27 15:17:27.867734+00	f	\N	\N
c7c0d2bc-56e8-4cad-af8e-47b7e24e8b38	f5064908-4ea0-42c7-8a63-0ddfc2a80531	dc623009-9752-43d7-b22a-384740599eb7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-27	400	cash	paid	\N	\N	2026-03-27 15:17:55.236779+00	f	\N	\N
65c2630f-f1ee-484c-b918-2dc35f114712	1ca2f5d0-fc1b-49ab-8443-25574737d3cf	18d2e760-ed6d-44b0-af27-6b7cb9d6ddbb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-27	100	cash	paid	\N	\N	2026-03-27 15:18:16.392913+00	f	\N	\N
d5ecd5ff-e7d1-4064-a219-d23157fdf339	84cf3d8e-64cc-4a90-8b33-12c94640d00b	ebc8c94f-09bf-41ca-8522-f81f98fb1469	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-27	300	cash	paid	\N	\N	2026-03-27 15:18:33.728965+00	f	\N	\N
3bc3f3dd-ad47-49bc-9ab6-4f299db9b9cc	4bf7d91d-6da6-4d5d-9db0-30b196a13651	6f37b184-d886-4b91-a179-60f467b3e51d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-27	300	cash	paid	\N	\N	2026-03-27 15:18:56.371524+00	f	\N	\N
d01d5af5-e64a-426f-b57d-381be86b5c0c	d59ecb10-5af9-4f75-8f43-dfc52d537f0c	400fb688-b2dd-42c2-b2f6-c2c3a6bff5bd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-27	400	cash	paid	\N	\N	2026-03-27 15:19:14.424984+00	f	\N	\N
729c0fe3-f18c-4445-8eeb-9958bb64dc1f	56da2e53-1358-4168-8c6e-cee12fe29c59	0e59bad3-eae7-435d-b166-6f5e876b3785	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-27	1500	cash	paid	\N	\N	2026-03-27 15:19:32.712412+00	f	\N	\N
d350b33e-6ad6-493f-83a2-2ec2476b451d	6c56e1c0-92ef-426c-8b5f-f6a9eac0ebc0	8e9719ac-05c9-42c8-8485-6fb4bd7d46d9	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-27	1800	cash	paid	\N	\N	2026-03-27 15:19:59.877465+00	f	\N	\N
135f7655-7c40-46ee-abc1-f6a1248c699d	7d755464-aa72-4aab-9028-a75e09410ff6	20ccdb2b-c6ad-4063-9dfd-a34c50adac5e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-27	1000	online	paid	\N	\N	2026-03-27 15:22:25.825658+00	f	\N	\N
62d9efae-e57f-47ea-8ba5-56c64063803f	f35169da-5d69-4e7e-a35e-ed6237a94cff	6398b3f9-45c4-45b0-a7fc-0e3e1ced4173	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-27	500	online	paid	\N	\N	2026-03-27 15:22:53.500353+00	f	\N	\N
4f71736b-d5df-4461-a2a2-706e8e41a243	1cac3c77-d86c-41b8-ba55-2b1f74410661	5d640f92-1900-47f5-bb7e-a6ab5061d564	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-27	200	online	paid	\N	\N	2026-03-27 15:23:21.35446+00	f	\N	\N
b81e733f-87e2-48de-bb7e-aa4a44f9c2b6	2ff85cab-09cd-4175-94ce-d7ccba40ae21	755a8d09-2a14-49f6-b70f-147b5f5fa531	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-27	1500	online	paid	\N	\N	2026-03-27 15:47:29.709313+00	f	\N	\N
008c6639-b7f2-4275-b185-7526bfd4c689	32e40b35-8c4b-4552-b8b8-7c233d31c03d	757d4684-58bf-40d2-bfdd-ec9921ff94d7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-27	250	online	paid	\N	\N	2026-03-27 15:48:37.110369+00	f	\N	\N
0d86681c-e66e-4dc7-b025-c7e42b08ec02	bee2c977-93c0-44ef-874e-a76e53e40a51	aa68ef20-1754-401b-9bfc-b8f2c49b0a4e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-27	400	online	paid	\N	\N	2026-03-27 15:49:39.457183+00	f	\N	\N
707315e2-7a86-475b-8026-6a54daf9fbbc	34977a0a-e657-40cb-840d-a6df47bba8d3	d1929534-e23a-4d75-8031-6998ec8b0810	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-27	100	online	paid	\N	\N	2026-03-27 17:54:45.044775+00	f	\N	\N
174530c5-b771-475e-86b2-46c91b6b865b	bcb87a68-a59d-438f-b81a-e5a4a6b666c1	b4a8d905-3198-4d75-8ee3-3800ec8f2b40	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28	1000	online	paid	\N	\N	2026-03-28 06:34:50.63519+00	f	\N	\N
165f4131-37f8-4455-84aa-92e890a5b9c1	d11d1904-a5c2-4fd5-8ebc-c800d6ced0b2	7c5e25ec-8d9d-4d6c-80b8-2ad0bfd12cee	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28	150	online	paid	\N	\N	2026-03-28 06:35:25.344437+00	f	\N	\N
bfe65a89-1eed-4b8e-848a-193af20ae8cb	db40f757-c1ca-42a3-bb92-2df13793998d	249ae28b-3ceb-4a1c-a279-a9affb4d8090	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28	500	cash	paid	\N	\N	2026-03-28 06:42:53.157463+00	f	\N	\N
51248123-82c3-49cc-bbeb-d3e8a146967c	35038458-ade9-412d-877d-814bb95adf5d	794af05e-0e94-449e-90ee-691d82534c27	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28	200	online	paid	\N	\N	2026-03-28 06:43:56.314866+00	f	\N	\N
1c22ae00-d7a5-418d-9ae6-ec59588b7bb5	80752817-7c75-426b-a97e-361b246ec563	135460a0-56bf-4c17-a4a8-5e66f29b52f6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28	300	cash	paid	\N	\N	2026-03-28 07:41:20.090762+00	f	\N	\N
197689b2-92ef-497e-81a9-b8eb5804f715	cb5975f3-72b1-4cc9-bd02-81342334cb40	6043f054-834d-437f-860a-7f9269935958	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28	400	online	paid	\N	\N	2026-03-28 12:34:33.552121+00	f	\N	\N
e66f01d9-94ae-41ba-a114-a113600f4c67	6d60857f-7cd1-437e-a536-c9d04949b1c7	d6c5de5c-32f1-4075-bce2-9a151bb80cb0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28	500	online	paid	\N	\N	2026-03-28 12:34:45.857116+00	f	\N	\N
42a1e9f7-73ea-4fe1-9a19-a17266056ff8	ba9ab57b-e2d8-4c2a-902d-effb7b810b03	a3f57a0f-8bdf-47f7-a94d-819924cdc08a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28	2000	online	paid	\N	\N	2026-03-28 13:31:22.211441+00	f	\N	\N
1839e78b-3b10-4e5c-96b6-4b2bb06ef63d	c5f80bd8-670e-4df5-8c6a-ac7378801077	3a181c18-8f9e-4467-96a8-c09687ebea27	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28	500	online	paid	\N	\N	2026-03-28 14:21:30.237895+00	f	\N	\N
8fcde289-e5bd-4ef0-8131-4e88175b2279	e0fca0e1-df99-497f-87e4-41be32ec1780	c18d8b95-c031-4110-85c8-b265a89efc50	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28	500	online	paid	\N	\N	2026-03-28 14:21:51.266932+00	f	\N	\N
8a2bb0a1-7cbb-45ed-86a5-b96b2b16a98f	e0fca0e1-df99-497f-87e4-41be32ec1780	c18d8b95-c031-4110-85c8-b265a89efc50	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28	500	online	paid	\N	\N	2026-03-28 14:23:57.707732+00	f	\N	\N
5c816394-7327-43e0-a515-78a00d3e3bd5	c8e35247-1c57-4290-9904-8553d3c7cad5	010a0aaf-0be5-46b5-a0dc-f5fcc85ed2cf	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28	1200	cash	paid	\N	\N	2026-03-28 14:36:47.95104+00	f	\N	\N
894e7254-003b-423c-abba-969f857404d1	b2f4bd25-a426-4b1a-b0f6-3ef0115ba281	61588824-28f6-4f24-b902-3044b3b05a19	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28	500	online	paid	\N	\N	2026-03-28 14:55:39.829619+00	f	\N	\N
11ce3ce0-751d-4ea3-9293-776eb75935cd	f5064908-4ea0-42c7-8a63-0ddfc2a80531	dc623009-9752-43d7-b22a-384740599eb7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28	400	cash	paid	\N	\N	2026-03-28 15:06:16.201404+00	f	\N	\N
b73d63d8-9a51-4320-9db5-488674cffa22	1ca2f5d0-fc1b-49ab-8443-25574737d3cf	18d2e760-ed6d-44b0-af27-6b7cb9d6ddbb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28	100	cash	paid	\N	\N	2026-03-28 15:06:37.912672+00	f	\N	\N
1d60549c-0d4c-4835-9bea-86a188cf17c2	8926b943-bda3-4c36-aa29-4f8576e75e90	735cd1ad-a76d-4026-87dc-60f501454b7a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28	400	cash	paid	\N	\N	2026-03-28 15:07:01.996636+00	f	\N	\N
2dd3f4a4-cc7d-4593-bda3-1a5870e7157d	aed1fa37-b39e-453a-96ac-b79ba3f4889c	191731f2-5b78-401c-8cec-590024f34df2	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28	3500	cash	paid	\N	\N	2026-03-28 15:07:41.934096+00	f	\N	\N
cee7d033-f10a-44e9-94c9-14dfbdf6787d	44e44d3f-1c42-41fa-8bf1-2bdb5bf219c7	2647ddf3-5d7a-405f-be10-8cb5f12edb5d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28	200	cash	paid	\N	\N	2026-03-28 15:08:07.566345+00	f	\N	\N
c7d01469-8a16-4330-a857-85b41e6eecfe	84cf3d8e-64cc-4a90-8b33-12c94640d00b	ebc8c94f-09bf-41ca-8522-f81f98fb1469	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28	700	cash	paid	\N	\N	2026-03-28 15:08:29.041279+00	f	\N	\N
4aff9906-9d90-4cc6-a8d2-cfff50f85eca	4bf7d91d-6da6-4d5d-9db0-30b196a13651	6f37b184-d886-4b91-a179-60f467b3e51d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28	300	cash	paid	\N	\N	2026-03-28 15:09:16.340572+00	f	\N	\N
1a338952-b9d4-4c35-937f-9bf71fbcf176	d59ecb10-5af9-4f75-8f43-dfc52d537f0c	400fb688-b2dd-42c2-b2f6-c2c3a6bff5bd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28	200	cash	paid	\N	\N	2026-03-28 15:09:59.825032+00	f	\N	\N
d26c98be-36a7-4042-a458-828d2eaf4614	c62f3118-4803-4149-8621-2473aec070c1	43615615-48b3-4cb6-b3ff-cfcb63bb8a20	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28	2000	online	paid	\N	\N	2026-03-28 15:14:49.117958+00	f	\N	\N
5f7ff5d8-1b56-4e54-bcc9-9b3b351884a0	7d755464-aa72-4aab-9028-a75e09410ff6	20ccdb2b-c6ad-4063-9dfd-a34c50adac5e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28	500	online	paid	\N	\N	2026-03-28 15:27:50.459133+00	f	\N	\N
1b1c2e12-2878-4148-8adf-67c429581683	ea7436e5-3b5c-49c8-87e4-6d727b2c2e50	cb603d85-d775-4680-bee6-2c42f0b3e767	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28	300	online	paid	\N	\N	2026-03-28 15:52:43.495252+00	f	\N	\N
7f413869-ab92-4209-92cc-4c9c7e71d6c8	32e40b35-8c4b-4552-b8b8-7c233d31c03d	757d4684-58bf-40d2-bfdd-ec9921ff94d7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28	250	online	paid	\N	\N	2026-03-28 15:55:27.145013+00	f	\N	\N
5f6901fe-d934-42af-bac4-f859982f6860	9a636e37-de02-451a-981d-4bf513dce4eb	91f3e941-a2bf-44ce-9e3b-6a6f4a19af54	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28	600	online	paid	\N	\N	2026-03-28 15:56:31.641564+00	f	\N	\N
dec6dcd5-6868-4ada-b481-f0e0dbec958a	b55df5ce-674c-47c2-9c54-73bed3e8e571	0df2b337-87db-4802-a5f9-6944970e2ff5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28	3000	online	paid	\N	\N	2026-03-28 16:05:32.563944+00	f	\N	\N
2f3461d4-d620-43db-b1d4-48e3f8f809f3	250eeece-4579-4cc4-86f9-0cdd866fbd24	e3c2af50-d0e2-461a-bfc2-67efd23feb46	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28	200	online	paid	\N	\N	2026-03-28 16:05:48.096844+00	f	\N	\N
65c79ce3-4707-47e2-a2a2-02201b20c99c	6aac96ea-eb26-460a-8340-ffb355953ae0	8e423e8d-c1ce-4d07-9860-fd7df34eaf44	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28	800	online	paid	\N	\N	2026-03-28 16:13:23.79599+00	f	\N	\N
0379626e-1986-483c-8acd-85f63107ee7b	f35169da-5d69-4e7e-a35e-ed6237a94cff	6398b3f9-45c4-45b0-a7fc-0e3e1ced4173	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28	500	online	paid	\N	\N	2026-03-28 16:13:45.865193+00	f	\N	\N
6553f88a-67f6-4f96-9805-35614269b2b9	1cac3c77-d86c-41b8-ba55-2b1f74410661	5d640f92-1900-47f5-bb7e-a6ab5061d564	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28	200	online	paid	\N	\N	2026-03-28 16:20:11.61434+00	f	\N	\N
c3e7c2fb-7893-4048-b379-603ebca1a64e	89d5c659-aa6c-4a99-b0fc-f737d9e8e0e4	111a604f-46f8-4271-8912-ccbe479ab3ef	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-28	1500	online	paid	\N	\N	2026-03-28 18:17:48.546409+00	f	\N	\N
c76b9445-32ed-4d6f-8e74-a40735ca161e	cf301afd-a3ed-4bea-9794-b4fe432d8861	8419a9be-df12-416f-81ce-3570f9a82a4c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-29	1800	cash	paid	\N	\N	2026-03-29 14:45:00.658741+00	f	\N	\N
00a509e3-b5b5-49c9-9b99-6fa2bde8dd2b	cb86aae2-de85-41b5-bf5f-20645840e270	a22b5f37-a3d4-48de-a5d3-5717343478be	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-29	200	cash	paid	\N	\N	2026-03-29 15:16:46.22721+00	f	\N	\N
4bb2e2a7-96d2-4eaf-a4dd-fe98e046f500	1ca2f5d0-fc1b-49ab-8443-25574737d3cf	18d2e760-ed6d-44b0-af27-6b7cb9d6ddbb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-29	100	cash	paid	\N	\N	2026-03-29 15:28:31.408223+00	f	\N	\N
c8e4add4-7258-47b6-82ef-76105cb21acc	44e44d3f-1c42-41fa-8bf1-2bdb5bf219c7	2647ddf3-5d7a-405f-be10-8cb5f12edb5d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-29	200	cash	paid	\N	\N	2026-03-29 15:29:02.66975+00	f	\N	\N
3bfcc8c4-bc05-4d4e-a7e5-ea454c93ce31	5fecec3a-5262-4cfd-8464-57abf6fd6c0c	509f1fd9-7517-4b8b-a57b-817bd7e6f823	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-29	300	cash	paid	\N	\N	2026-03-29 15:29:31.024572+00	f	\N	\N
7b520306-0b22-4dbd-9a4d-4a9573e17cd1	1cac3c77-d86c-41b8-ba55-2b1f74410661	5d640f92-1900-47f5-bb7e-a6ab5061d564	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-29	200	cash	paid	\N	\N	2026-03-29 15:29:57.166232+00	f	\N	\N
b3602212-a689-4966-8364-380a9bd9be84	f5064908-4ea0-42c7-8a63-0ddfc2a80531	dc623009-9752-43d7-b22a-384740599eb7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-29	400	cash	paid	\N	\N	2026-03-29 15:33:09.003692+00	f	\N	\N
5ac3eb03-c530-4ee5-aab6-f2343e48c86f	fb079db0-2262-4017-bd24-5d42ca326ff9	9ca88703-194e-4620-9685-63969504382a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30	2200	cash	paid	\N	\N	2026-03-30 05:16:18.648084+00	f	\N	\N
584a8123-e917-42df-aef6-37f8b76975bf	dede5547-d440-4d63-a9ac-ad427b2895c9	6ded35ce-a2e8-4856-827d-ab18be14743b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-29	1000	online	paid	\N	\N	2026-03-30 06:45:19.151146+00	f	\N	\N
b2e160be-135d-4dcb-8383-1192f3bd51d5	6d60857f-7cd1-437e-a536-c9d04949b1c7	d6c5de5c-32f1-4075-bce2-9a151bb80cb0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-29	500	online	paid	\N	\N	2026-03-30 06:45:40.506432+00	f	\N	\N
54456e77-2ec0-4954-9817-2c8489ba9f3e	d11d1904-a5c2-4fd5-8ebc-c800d6ced0b2	7c5e25ec-8d9d-4d6c-80b8-2ad0bfd12cee	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-29	150	online	paid	\N	\N	2026-03-30 06:46:15.858323+00	f	\N	\N
8b46ec2d-414b-4c1c-b863-4f64cc62e6ef	db6c8835-21b0-4c54-b4ff-2e6ec0441891	0d99cdf2-2edc-4baa-bf1a-14c97c0df949	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-29	1000	online	paid	\N	\N	2026-03-30 06:46:54.217921+00	f	\N	\N
67ced17e-a5ea-43f7-9ca9-8485014e8541	591f4d1e-01f6-4c59-a2b0-7358e00a485d	6ffdf62b-44f6-4010-8ceb-e2878900e1b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-29	250	online	paid	\N	\N	2026-03-30 06:47:22.187892+00	f	\N	\N
f13e05a3-60fc-452f-88b4-fda5b7e6935c	3765d341-7b06-463d-82fa-add7d738b854	eab03433-a240-440d-8140-9be3f7ccf9a7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-29	1000	online	paid	\N	\N	2026-03-30 06:47:50.184817+00	f	\N	\N
8db22ce5-3393-43af-864e-c99fc1c342f1	ba9ab57b-e2d8-4c2a-902d-effb7b810b03	a3f57a0f-8bdf-47f7-a94d-819924cdc08a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-29	1000	online	paid	\N	\N	2026-03-30 06:48:23.880717+00	f	\N	\N
3330ea96-828b-4251-9a0d-5c87679eea4a	e0fca0e1-df99-497f-87e4-41be32ec1780	c18d8b95-c031-4110-85c8-b265a89efc50	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-29	500	online	paid	\N	\N	2026-03-30 06:48:48.692873+00	f	\N	\N
c791250f-b998-4639-b1f8-6108c7a8023a	f076e587-f2c0-423c-9441-07bde93baeb3	e71a649a-865d-492c-a7ac-b2f37247b836	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-29	500	online	paid	\N	\N	2026-03-30 06:49:16.717528+00	f	\N	\N
a4e03e71-9be8-44a0-8cef-bc229f1e832a	b9bd3700-24a0-4fa2-9afa-ca0827c26188	b80d47c9-3d98-41cd-9037-7ddcdac87f0c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-29	400	online	paid	\N	\N	2026-03-30 06:49:37.590574+00	f	\N	\N
71b2f5bd-789d-4f43-a237-b10dd142b6f7	7d755464-aa72-4aab-9028-a75e09410ff6	20ccdb2b-c6ad-4063-9dfd-a34c50adac5e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-29	500	online	paid	\N	\N	2026-03-30 06:50:01.725651+00	f	\N	\N
80602b59-9c97-4681-ad2b-ec23626eb7bc	894bed8a-dcbc-44c1-b441-fa5be29868d6	b9357402-e54d-4f75-abc5-6690cb4b9288	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-29	150	online	paid	\N	\N	2026-03-30 06:50:23.006203+00	f	\N	\N
648a12c2-e2c7-420d-a510-db8e4e25685d	c5f80bd8-670e-4df5-8c6a-ac7378801077	3a181c18-8f9e-4467-96a8-c09687ebea27	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-29	500	online	paid	\N	\N	2026-03-30 06:50:55.824878+00	f	\N	\N
2a5de140-94ce-4dd9-9e8c-90059c191318	80752817-7c75-426b-a97e-361b246ec563	135460a0-56bf-4c17-a4a8-5e66f29b52f6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30	300	cash	paid	\N	\N	2026-03-30 06:51:42.423461+00	f	\N	\N
658c1ea5-33ef-4256-9dbe-d0e143fc9fb2	046f033d-2013-4dbe-9ac8-947af0d1e115	de360bdb-ec38-4f27-ae4f-69ebeac5f619	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30	500	cash	paid	\N	\N	2026-03-30 06:52:03.930226+00	f	\N	\N
945b205d-c30a-4e0f-9e15-896892cd8e5f	32e40b35-8c4b-4552-b8b8-7c233d31c03d	757d4684-58bf-40d2-bfdd-ec9921ff94d7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30	250	online	paid	\N	\N	2026-03-30 06:52:35.032859+00	f	\N	\N
eb31d94a-f320-4e2a-a5f5-12276e5bc911	f35169da-5d69-4e7e-a35e-ed6237a94cff	6398b3f9-45c4-45b0-a7fc-0e3e1ced4173	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30	500	online	paid	\N	\N	2026-03-30 06:52:57.579918+00	f	\N	\N
c7019492-6abd-4e5f-b679-7d295c053b5c	ac85d0d3-a358-46b8-bf3e-4f4468ca5670	7a331756-19b2-4a9f-a2ee-2b3f6a641e72	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30	2100	cash	paid	\N	\N	2026-03-30 06:54:42.647345+00	f	\N	\N
cf439710-3067-46c2-9977-46983141ce77	d61b213f-26ab-40b6-ac19-bc6fb34eaf79	5b8d0035-4b51-4aaf-9abe-8079a7b11334	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30	2000	online	paid	\N	\N	2026-03-30 07:22:44.195842+00	f	\N	\N
7963ebc0-3114-4fc4-8a0b-82e65f7eb44c	23ac8ae5-7452-4182-b51c-a70026bbe0d8	def4d986-3767-4793-a6e8-c767351fd93f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-12	500	cash	paid	\N	\N	2026-03-12 17:10:15.585642+00	f	\N	\N
f92952ec-9432-44c2-b553-72f9ab6d8ddc	bee2c977-93c0-44ef-874e-a76e53e40a51	aa68ef20-1754-401b-9bfc-b8f2c49b0a4e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-02	400	online	not_paid	\N	\N	2026-03-02 01:58:19.63033+00	t	\N	\N
cd27d9ca-bf62-4a12-b52c-aec524774c52	6d60857f-7cd1-437e-a536-c9d04949b1c7	d6c5de5c-32f1-4075-bce2-9a151bb80cb0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30	500	online	paid	\N	\N	2026-03-30 11:36:49.285329+00	f	\N	\N
460aab6d-065d-45fe-8222-bcba348be43a	651c7fb2-68bf-46d8-bf93-3f25bf5c8dab	6d5f5859-9f8b-466b-8a58-336b620889eb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30	1500	online	paid	\N	\N	2026-03-30 11:37:19.77092+00	f	\N	\N
61f2656c-d314-4463-ae09-068f50906ba3	d11d1904-a5c2-4fd5-8ebc-c800d6ced0b2	7c5e25ec-8d9d-4d6c-80b8-2ad0bfd12cee	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30	150	online	paid	\N	\N	2026-03-30 11:37:44.960139+00	f	\N	\N
e0ef6042-533a-4076-a4b3-fa839daa2b35	790d3d01-21ef-4976-82d4-af3adacb886c	2c2fec84-b45b-456c-87b2-de7365174599	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30	200	online	paid	\N	\N	2026-03-30 11:39:17.27432+00	f	\N	\N
406b2019-b092-45b3-a7e1-2f1c25ac1115	a0d4dce0-9bdd-4cf1-ad5d-1c95cf18e2dd	dfa34099-366b-4a3e-85ef-eb12e94f4083	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30	300	online	paid	\N	\N	2026-03-30 12:09:58.062669+00	f	\N	\N
be3fbd24-3416-4e90-a2fb-ce17f374cd35	963ccc89-3e62-4787-ae26-1b8b908b51c4	6064efcd-d142-44c8-864b-7f882850d18a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30	1000	online	paid	\N	\N	2026-03-30 12:10:50.154501+00	f	\N	\N
43d1bbbd-6cc0-423d-a246-d0bf82c8bab1	9a636e37-de02-451a-981d-4bf513dce4eb	91f3e941-a2bf-44ce-9e3b-6a6f4a19af54	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30	600	online	paid	\N	\N	2026-03-30 12:11:14.014465+00	f	\N	\N
d334c85b-cbc5-4ee0-9984-120e6feaeb90	89d5c659-aa6c-4a99-b0fc-f737d9e8e0e4	111a604f-46f8-4271-8912-ccbe479ab3ef	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30	3000	online	paid	\N	\N	2026-03-30 13:11:43.77199+00	f	\N	\N
ebc15ff1-6d99-43ba-839c-806cff60f63b	0d8641d3-1860-4dac-8f9c-a7362226fe97	682ad2e5-1d22-4c44-a132-b8580c165d1d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30	1200	cash	paid	\N	\N	2026-03-30 14:10:02.652578+00	f	\N	\N
5a93dc70-5bb4-403c-9e71-837d33c7433f	22d10045-ef1c-4807-9278-c35dbb01d73f	db261798-826e-4d7b-9fc7-a4dba55df1f3	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30	200	online	paid	\N	\N	2026-03-30 14:18:43.531279+00	f	\N	\N
e6292293-8cff-4d0d-829a-a9199c2f024b	6245a2e8-2eb5-4d5f-8b8a-aac817bfee18	55efd7cf-1188-4423-9a53-8ee2c53002fa	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30	200	online	paid	\N	\N	2026-03-30 14:19:01.272401+00	f	\N	\N
1c29896f-b0f6-43a8-ada5-df4e279b2520	e0fca0e1-df99-497f-87e4-41be32ec1780	c18d8b95-c031-4110-85c8-b265a89efc50	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30	500	online	paid	\N	\N	2026-03-30 14:20:31.275628+00	f	\N	\N
beda3c44-b8c0-4634-9835-3db6855be1aa	e0fca0e1-df99-497f-87e4-41be32ec1780	c18d8b95-c031-4110-85c8-b265a89efc50	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30	0	online	not_paid	\N	\N	2026-03-30 14:20:51.732607+00	f	\N	\N
d1f98dbc-5e5d-4cb6-a4b8-4a22799a1cb9	9920fe35-b725-4a78-802d-61689d6993b2	b9ea214a-e90e-4ad5-a848-3b1005f2e89f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30	300	online	paid	\N	\N	2026-03-30 14:35:23.934802+00	f	\N	\N
9e16b495-9bb1-4a4f-b3f4-69de09012555	30d6e5ab-ae5d-4ea9-93ff-3655cdedc049	7c60c422-8ba1-4fcc-8a40-81a7d8cab098	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30	2000	cash	paid	\N	\N	2026-03-30 15:12:27.556007+00	f	\N	\N
740bdf6c-fb1d-4323-9c3b-29d1a7476592	ea7436e5-3b5c-49c8-87e4-6d727b2c2e50	cb603d85-d775-4680-bee6-2c42f0b3e767	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30	200	online	paid	\N	\N	2026-03-30 15:25:15.594732+00	f	\N	\N
d201bd22-4566-45b6-9037-57429cb51026	44e44d3f-1c42-41fa-8bf1-2bdb5bf219c7	2647ddf3-5d7a-405f-be10-8cb5f12edb5d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30	200	cash	paid	\N	\N	2026-03-30 15:38:32.318497+00	f	\N	\N
798e482c-8320-4241-b1b2-e1ff9a785c6f	32e40b35-8c4b-4552-b8b8-7c233d31c03d	757d4684-58bf-40d2-bfdd-ec9921ff94d7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30	250	cash	paid	\N	\N	2026-03-30 15:38:52.954465+00	f	\N	\N
67fc8ae2-ffa0-42c7-bed7-ec75df325644	f5064908-4ea0-42c7-8a63-0ddfc2a80531	dc623009-9752-43d7-b22a-384740599eb7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30	400	cash	paid	\N	\N	2026-03-30 15:39:20.790524+00	f	\N	\N
651adb74-002f-4f57-9097-7de4363f49d4	1ca2f5d0-fc1b-49ab-8443-25574737d3cf	18d2e760-ed6d-44b0-af27-6b7cb9d6ddbb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30	100	cash	paid	\N	\N	2026-03-30 15:39:38.945505+00	f	\N	\N
676a13e6-cef5-4b6f-b7b7-90bd05123876	8926b943-bda3-4c36-aa29-4f8576e75e90	735cd1ad-a76d-4026-87dc-60f501454b7a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30	400	cash	paid	\N	\N	2026-03-30 15:40:06.66933+00	f	\N	\N
d8464bed-6384-41cb-902b-400a2be7ef83	5fecec3a-5262-4cfd-8464-57abf6fd6c0c	509f1fd9-7517-4b8b-a57b-817bd7e6f823	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30	300	cash	paid	\N	\N	2026-03-30 15:40:25.661365+00	f	\N	\N
a1525765-6d63-4418-ad90-a8e431534f9c	4bf7d91d-6da6-4d5d-9db0-30b196a13651	6f37b184-d886-4b91-a179-60f467b3e51d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30	300	cash	paid	\N	\N	2026-03-30 15:40:50.016533+00	f	\N	\N
c1e00078-4023-41e0-856a-9125979f20b7	d59ecb10-5af9-4f75-8f43-dfc52d537f0c	400fb688-b2dd-42c2-b2f6-c2c3a6bff5bd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30	200	cash	paid	\N	\N	2026-03-30 15:41:12.307154+00	f	\N	\N
75170d12-c16c-4b45-a09c-888ee211f3d2	93906c36-47ae-41bb-bb4c-a594f08896b3	27e0e2f9-8d55-4cf8-a605-3a1b95f3c368	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30	500	cash	paid	\N	\N	2026-03-30 15:41:28.899129+00	f	\N	\N
cfe15b6c-401a-4711-9bd6-c1733dabe80b	e9d54922-42db-42b1-ab59-8dd42d68af4c	fe889acf-38cf-4a1f-8fce-804d5304f246	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30	600	cash	paid	\N	\N	2026-03-30 15:41:53.70314+00	f	\N	\N
7dafd7e4-d97e-48ef-8fc2-86e9497c4a0c	7d755464-aa72-4aab-9028-a75e09410ff6	20ccdb2b-c6ad-4063-9dfd-a34c50adac5e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30	500	online	paid	\N	\N	2026-03-30 16:20:33.778213+00	f	\N	\N
afb45054-e92a-42f0-9f5a-f6684a3af758	bee2c977-93c0-44ef-874e-a76e53e40a51	aa68ef20-1754-401b-9bfc-b8f2c49b0a4e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30	400	online	paid	\N	\N	2026-03-30 16:38:43.963539+00	f	\N	\N
f429a34b-d8b1-4bb5-8f65-8438f12cd79a	860f25ca-39ff-42f0-bacb-e409bd6007d7	71d81887-5e21-4486-97e6-faea2c876cff	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30	200	online	paid	\N	\N	2026-03-30 17:32:28.248256+00	f	\N	\N
cdc3996b-c141-4c51-bfd9-2dcae4fd5e23	250eeece-4579-4cc4-86f9-0cdd866fbd24	e3c2af50-d0e2-461a-bfc2-67efd23feb46	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30	200	online	paid	\N	\N	2026-03-30 17:33:08.955083+00	f	\N	\N
1487b2f3-64b8-4c55-b4b4-480d9fbac9fb	c62f3118-4803-4149-8621-2473aec070c1	43615615-48b3-4cb6-b3ff-cfcb63bb8a20	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13	1000	online	paid	\N	\N	2026-04-13 14:16:05.295335+00	f	\N	\N
6cc672c7-cca4-46e7-a9cc-5e1637a01efe	de282179-bb22-45ff-b75f-6bb22109cb12	804dc780-cd95-46c8-a131-47013ca5eb56	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13	15000	online	paid	\N	\N	2026-04-13 15:08:37.271561+00	f	\N	\N
186c77c2-5b61-45cf-89b1-be72259c1bd8	2c143dd6-c039-4a59-8c14-02bf93b00f0a	ed00e1c1-e744-4da2-a624-7dbc07c94b87	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13	200	online	paid	\N	\N	2026-04-13 15:44:28.594005+00	f	\N	\N
0492c18e-37a4-4cbb-9cfe-7e05adb6327d	23ac8ae5-7452-4182-b51c-a70026bbe0d8	bbc128c4-c3e1-4281-82c7-652d7065c721	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30	100	cash	paid	\N	\N	2026-03-30 17:33:30.916083+00	f	\N	\N
6dcafd0f-8909-42f7-b705-a40c08632360	cb5975f3-72b1-4cc9-bd02-81342334cb40	6043f054-834d-437f-860a-7f9269935958	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-30	400	online	paid	\N	\N	2026-03-30 17:35:25.485074+00	f	\N	\N
8729a894-b29a-46a0-adff-f0a11a94e534	046f033d-2013-4dbe-9ac8-947af0d1e115	de360bdb-ec38-4f27-ae4f-69ebeac5f619	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-31	500	cash	paid	\N	\N	2026-03-31 06:12:51.371314+00	f	\N	\N
6e0004d6-1973-4fe7-97c0-718b6a5a417f	6aac96ea-eb26-460a-8340-ffb355953ae0	8e423e8d-c1ce-4d07-9860-fd7df34eaf44	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-31	800	online	paid	\N	\N	2026-03-31 06:18:15.716476+00	f	\N	\N
6c0ef556-58f4-4aab-9eed-78ad5d1da8d6	ba9ab57b-e2d8-4c2a-902d-effb7b810b03	a3f57a0f-8bdf-47f7-a94d-819924cdc08a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-31	2000	online	paid	\N	\N	2026-03-31 06:40:34.077726+00	f	\N	\N
7cbb5d26-eeab-4ab6-be61-9e9d713bf2f6	6735cbe7-8e3f-41f0-b16c-9b60d974d6ec	5ba941ae-382e-452e-a5b3-8cdff26f1c7d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-31	1000	online	paid	\N	\N	2026-03-31 06:40:56.289103+00	f	\N	\N
4d772ea8-8fe3-4214-b5db-f3d5d1f23dbe	6340050f-5246-43c5-9297-d14267b9bad0	17f01068-23e4-438e-8322-5e4a12f3f332	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-31	2000	online	paid	\N	\N	2026-03-31 06:41:45.773444+00	f	\N	\N
0e0e1218-8558-477d-af2e-5478026727f5	b86ae36d-afe4-41a9-8d69-af6178efda6c	7983d2f3-d1b5-4f40-afba-dfadeeb8e0bd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-31	1400	online	paid	\N	\N	2026-03-31 07:13:07.781197+00	f	\N	\N
68f3ab9f-c3dc-44c9-aa16-c407851bcc22	a0d4dce0-9bdd-4cf1-ad5d-1c95cf18e2dd	dfa34099-366b-4a3e-85ef-eb12e94f4083	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-31	300	online	paid	\N	\N	2026-03-31 13:24:33.920836+00	f	\N	\N
80cb2c14-6dba-4e38-8fec-b8fc9d6d57b7	56da2e53-1358-4168-8c6e-cee12fe29c59	0e59bad3-eae7-435d-b166-6f5e876b3785	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-31	2000	online	paid	\N	\N	2026-03-31 13:25:09.664971+00	f	\N	\N
a45d9d93-06c3-4f3e-8422-32282c0bce4f	e3325ec8-264a-41e1-a2d5-84fb33eb4412	c2c54c13-fb99-4e5d-9f99-1bddf98beb5b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-31	500	online	paid	\N	\N	2026-03-31 13:25:53.804129+00	f	\N	\N
91f1ccea-7565-4781-ba56-ebc2d5b1180d	e3325ec8-264a-41e1-a2d5-84fb33eb4412	c2c54c13-fb99-4e5d-9f99-1bddf98beb5b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-31	500	online	paid	\N	\N	2026-03-31 13:26:40.02446+00	f	\N	\N
b4d6681e-690f-471b-8699-cd24f86c861a	591f4d1e-01f6-4c59-a2b0-7358e00a485d	6ffdf62b-44f6-4010-8ceb-e2878900e1b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-31	500	online	paid	\N	\N	2026-03-31 13:28:40.261042+00	f	\N	\N
9bc160d9-bb31-4bc7-9b79-808cb875aacb	b16866ff-ba34-412f-aeea-fa734ccf88a1	a3742c80-66e9-443f-8ab2-a145af754194	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-31	1000	online	paid	\N	\N	2026-03-31 13:29:24.640895+00	f	\N	\N
aa97ea60-63a4-4210-af8d-f3cabeadd3e0	6d60857f-7cd1-437e-a536-c9d04949b1c7	d6c5de5c-32f1-4075-bce2-9a151bb80cb0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-31	500	online	paid	\N	\N	2026-03-31 13:29:52.351625+00	f	\N	\N
92cd2fd9-537e-4e85-aea2-9ee95b556466	9920fe35-b725-4a78-802d-61689d6993b2	b9ea214a-e90e-4ad5-a848-3b1005f2e89f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-31	300	online	paid	\N	\N	2026-03-31 13:30:58.79722+00	f	\N	\N
283b912f-366c-4b79-b10e-b705a5df4e8e	6245a2e8-2eb5-4d5f-8b8a-aac817bfee18	55efd7cf-1188-4423-9a53-8ee2c53002fa	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-31	200	online	paid	\N	\N	2026-03-31 13:32:03.293607+00	f	\N	\N
8225c222-4b4b-4214-8f33-cf77fdd83975	4686827e-4849-4bfa-88aa-129912510008	5cebdb10-f359-495d-983b-766489065f26	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-31	200	online	paid	\N	\N	2026-03-31 13:33:00.190538+00	f	\N	\N
633772f7-e5d3-401b-8e4b-87b6225a5cd6	c5f80bd8-670e-4df5-8c6a-ac7378801077	3a181c18-8f9e-4467-96a8-c09687ebea27	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-31	1000	online	paid	\N	\N	2026-03-31 15:18:34.902+00	f	\N	\N
aa38e162-5b30-4f07-ab82-0acb284993ef	22d10045-ef1c-4807-9278-c35dbb01d73f	db261798-826e-4d7b-9fc7-a4dba55df1f3	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-31	200	online	paid	\N	\N	2026-03-31 15:19:01.392792+00	f	\N	\N
29f78f40-25db-4346-b481-c5583b3c4ea6	d59ecb10-5af9-4f75-8f43-dfc52d537f0c	400fb688-b2dd-42c2-b2f6-c2c3a6bff5bd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-31	200	cash	paid	\N	\N	2026-03-31 15:28:44.024789+00	f	\N	\N
2d03e3b3-c1be-4576-b31e-0f91bbae286e	1cac3c77-d86c-41b8-ba55-2b1f74410661	5d640f92-1900-47f5-bb7e-a6ab5061d564	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-31	200	cash	paid	\N	\N	2026-03-31 15:29:46.950385+00	f	\N	\N
bf39f025-de7c-42b6-89ce-109a7fb4dd62	5fecec3a-5262-4cfd-8464-57abf6fd6c0c	509f1fd9-7517-4b8b-a57b-817bd7e6f823	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-31	300	cash	paid	\N	\N	2026-03-31 15:30:09.361986+00	f	\N	\N
93be0d90-3352-4a5c-a545-93624f5da304	44e44d3f-1c42-41fa-8bf1-2bdb5bf219c7	2647ddf3-5d7a-405f-be10-8cb5f12edb5d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-31	200	cash	paid	\N	\N	2026-03-31 15:30:47.55853+00	f	\N	\N
05ede501-b1eb-4258-bdcb-503596fbcff2	3292a221-dac6-489f-9624-6f993ac28f7d	4de5c872-61eb-4f7e-9c00-c5b032e1fcf7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-31	2400	online	paid	\N	\N	2026-03-31 16:00:32.637222+00	f	\N	\N
364fd4ce-4083-4ee3-8ab2-24ab1d4303bf	f076e587-f2c0-423c-9441-07bde93baeb3	e71a649a-865d-492c-a7ac-b2f37247b836	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-31	500	online	paid	\N	\N	2026-03-31 16:11:44.970731+00	f	\N	\N
5409a5a4-03f4-4d11-afc3-e1c39ee919a8	b5e377bf-be6c-4609-9ed7-af18422a1b4a	bb4f8bc1-b2a3-443c-826d-f83a53345b35	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-31	150	online	paid	\N	\N	2026-03-31 17:59:30.407696+00	f	\N	\N
896dcad6-302f-424d-aa14-aa67c36f53a6	bee2c977-93c0-44ef-874e-a76e53e40a51	aa68ef20-1754-401b-9bfc-b8f2c49b0a4e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-31	400	online	paid	\N	\N	2026-03-31 17:59:59.771473+00	f	\N	\N
c6ce0909-e94c-44f5-9179-a6b42fcb7d1f	9a636e37-de02-451a-981d-4bf513dce4eb	91f3e941-a2bf-44ce-9e3b-6a6f4a19af54	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-31	600	online	paid	\N	\N	2026-03-31 18:00:30.548877+00	f	\N	\N
f5b06b2b-280e-4345-96ca-506f2754a24e	651c7fb2-68bf-46d8-bf93-3f25bf5c8dab	6d5f5859-9f8b-466b-8a58-336b620889eb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-03-31	1000	online	paid	\N	\N	2026-03-31 18:01:43.350808+00	f	\N	\N
587bae3f-4024-4163-9605-675bd29ea5e4	f35169da-5d69-4e7e-a35e-ed6237a94cff	6398b3f9-45c4-45b0-a7fc-0e3e1ced4173	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-01	1000	online	paid	\N	\N	2026-04-01 05:38:26.602012+00	f	\N	\N
df7d36e8-c240-4bf4-8eb7-979e5a6d064e	dede5547-d440-4d63-a9ac-ad427b2895c9	6ded35ce-a2e8-4856-827d-ab18be14743b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-01	500	online	paid	\N	\N	2026-04-01 05:39:11.007642+00	f	\N	\N
7a3b2ae4-70d6-4f14-967b-bcbe86294640	80752817-7c75-426b-a97e-361b246ec563	135460a0-56bf-4c17-a4a8-5e66f29b52f6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-01	300	cash	paid	\N	\N	2026-04-01 06:03:29.359144+00	f	\N	\N
78ef4dea-10da-4b34-b87b-f1c405a41844	35038458-ade9-412d-877d-814bb95adf5d	794af05e-0e94-449e-90ee-691d82534c27	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-01	200	online	paid	\N	\N	2026-04-01 06:47:38.497137+00	f	\N	\N
05ea7fbd-107e-4027-9c70-f2da20b102bf	6d60857f-7cd1-437e-a536-c9d04949b1c7	d6c5de5c-32f1-4075-bce2-9a151bb80cb0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-01	500	online	paid	\N	\N	2026-04-01 13:08:33.925366+00	f	\N	\N
28a47319-ec13-40e2-83d5-a024c48767cb	a0d4dce0-9bdd-4cf1-ad5d-1c95cf18e2dd	dfa34099-366b-4a3e-85ef-eb12e94f4083	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-01	300	online	paid	\N	\N	2026-04-01 13:09:24.093956+00	f	\N	\N
570aaade-6352-4ed8-a6e0-fa4d7e4ee35c	89d5c659-aa6c-4a99-b0fc-f737d9e8e0e4	111a604f-46f8-4271-8912-ccbe479ab3ef	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-01	3000	online	paid	\N	\N	2026-04-01 13:10:08.527296+00	f	\N	\N
949c1f1b-80c2-463f-b17d-e51b4be7a224	894bed8a-dcbc-44c1-b441-fa5be29868d6	b9357402-e54d-4f75-abc5-6690cb4b9288	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-01	150	online	paid	\N	\N	2026-04-01 13:10:38.578937+00	f	\N	\N
17f28ab6-2e09-4717-a75a-ce0c56e6dbef	6245a2e8-2eb5-4d5f-8b8a-aac817bfee18	55efd7cf-1188-4423-9a53-8ee2c53002fa	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-01	200	online	paid	\N	\N	2026-04-01 13:16:29.119805+00	f	\N	\N
acb57de9-2f78-40cd-afbd-e37114ce242b	d11d1904-a5c2-4fd5-8ebc-c800d6ced0b2	7c5e25ec-8d9d-4d6c-80b8-2ad0bfd12cee	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-01	100	online	paid	\N	\N	2026-04-01 13:32:35.103394+00	f	\N	\N
b1d01f95-643a-45f6-961e-2e562897a65f	67eb359b-25a2-481e-ae53-c208688f5940	7ebb952f-b8ce-452d-a076-36b5efc9d1c5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-01	1200	online	paid	\N	\N	2026-04-01 13:46:26.166872+00	f	\N	\N
4c2be374-5bed-4537-8a13-933204e10ec2	9920fe35-b725-4a78-802d-61689d6993b2	b9ea214a-e90e-4ad5-a848-3b1005f2e89f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-01	300	online	paid	\N	\N	2026-04-01 13:50:56.162547+00	f	\N	\N
b068328e-b9b3-443d-b010-4c594b2fee3c	ba9ab57b-e2d8-4c2a-902d-effb7b810b03	a3f57a0f-8bdf-47f7-a94d-819924cdc08a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-01	1000	online	paid	\N	\N	2026-04-01 14:02:02.904707+00	f	\N	\N
cec7f2e8-e828-4ba1-9d39-245f4247da49	22d10045-ef1c-4807-9278-c35dbb01d73f	db261798-826e-4d7b-9fc7-a4dba55df1f3	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-01	200	online	paid	\N	\N	2026-04-01 14:49:38.667468+00	f	\N	\N
afb55341-1bee-42cd-b463-64272b57896f	df704001-715c-495c-832e-1971c5655106	02d3bf14-a0ef-4ed8-85fb-146ca7ab0fe4	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-01	1500	online	paid	\N	\N	2026-04-01 14:51:33.288692+00	f	\N	\N
0cf59de7-7b8d-440e-a74d-9f5bafe9a023	4686827e-4849-4bfa-88aa-129912510008	5cebdb10-f359-495d-983b-766489065f26	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-01	200	cash	paid	\N	\N	2026-04-01 15:10:51.349272+00	f	\N	\N
cc34ba9e-cdc7-49f6-91cc-583fc6ad1650	f5064908-4ea0-42c7-8a63-0ddfc2a80531	dc623009-9752-43d7-b22a-384740599eb7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-01	400	cash	paid	\N	\N	2026-04-01 15:11:14.587916+00	f	\N	\N
2656c239-02cb-44af-9796-67bc74351353	5fecec3a-5262-4cfd-8464-57abf6fd6c0c	509f1fd9-7517-4b8b-a57b-817bd7e6f823	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-01	300	cash	paid	\N	\N	2026-04-01 15:11:38.773648+00	f	\N	\N
58534086-e91c-4833-8ac4-213450bcca28	d59ecb10-5af9-4f75-8f43-dfc52d537f0c	400fb688-b2dd-42c2-b2f6-c2c3a6bff5bd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-01	200	cash	paid	\N	\N	2026-04-01 15:11:57.238291+00	f	\N	\N
5a0e693e-cca9-41ca-a82c-1ff2a5bda22a	bee2c977-93c0-44ef-874e-a76e53e40a51	aa68ef20-1754-401b-9bfc-b8f2c49b0a4e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-01	400	online	paid	\N	\N	2026-04-01 15:20:56.882296+00	f	\N	\N
5297f1dc-0833-47ff-8a27-92025a18964e	2a8f0801-a95d-49fb-a6a0-f9a9a84c463b	35899642-c883-4c26-a7ad-8e41a391be2b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-01	1000	online	paid	\N	\N	2026-04-01 15:33:21.827612+00	f	\N	\N
14444f3a-c518-44a4-be59-eaf2478083e3	f076e587-f2c0-423c-9441-07bde93baeb3	e71a649a-865d-492c-a7ac-b2f37247b836	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-01	500	online	paid	\N	\N	2026-04-01 15:37:36.252514+00	f	\N	\N
6e442019-26ab-423f-9327-f806a03ff059	23ac8ae5-7452-4182-b51c-a70026bbe0d8	bbc128c4-c3e1-4281-82c7-652d7065c721	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-01	100	cash	paid	\N	\N	2026-04-01 15:57:50.288668+00	f	\N	\N
5f857d08-a257-4bad-939a-cc8d7a941ec1	250eeece-4579-4cc4-86f9-0cdd866fbd24	e3c2af50-d0e2-461a-bfc2-67efd23feb46	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-01	100	online	paid	\N	\N	2026-04-02 00:26:41.046878+00	f	\N	\N
9b2c2636-87a9-4d5f-b468-07714c7cbc10	046f033d-2013-4dbe-9ac8-947af0d1e115	de360bdb-ec38-4f27-ae4f-69ebeac5f619	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-02	1000	online	paid	\N	\N	2026-04-02 00:27:29.077956+00	f	\N	\N
4e026e0b-d411-4f17-87bd-6603fe8427b8	790d3d01-21ef-4976-82d4-af3adacb886c	2c2fec84-b45b-456c-87b2-de7365174599	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-02	500	online	paid	\N	\N	2026-04-02 00:42:42.678024+00	f	\N	\N
95eb556a-a2fa-4d09-9537-9581c4af656f	dbb5444e-976f-4d00-9769-c0111b85f5b6	58be7354-d953-4974-a887-1ccc5ccb1acd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-02	50	online	paid	\N	\N	2026-04-02 05:06:17.420738+00	f	\N	\N
0c893f1a-e0f7-4174-a7df-74849d7f4ea1	b86ae36d-afe4-41a9-8d69-af6178efda6c	7983d2f3-d1b5-4f40-afba-dfadeeb8e0bd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-02	600	online	paid	\N	\N	2026-04-02 05:09:29.443205+00	f	\N	\N
78304f69-77be-4f11-98c4-9f26d080b085	6aac96ea-eb26-460a-8340-ffb355953ae0	8e423e8d-c1ce-4d07-9860-fd7df34eaf44	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-02	400	online	paid	\N	\N	2026-04-02 05:09:49.535082+00	f	\N	\N
84f51afc-6008-4b41-9725-a6761335e4c1	e3325ec8-264a-41e1-a2d5-84fb33eb4412	c2c54c13-fb99-4e5d-9f99-1bddf98beb5b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-02	500	online	paid	\N	\N	2026-04-02 08:56:01.232072+00	f	\N	\N
51a45981-fda5-45b7-8b1b-c0abe4d8d49e	a0d4dce0-9bdd-4cf1-ad5d-1c95cf18e2dd	dfa34099-366b-4a3e-85ef-eb12e94f4083	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-02	300	online	paid	\N	\N	2026-04-02 08:56:54.59129+00	f	\N	\N
ba5de993-d294-4dbb-be67-d173d37dba97	6c56e1c0-92ef-426c-8b5f-f6a9eac0ebc0	8e9719ac-05c9-42c8-8485-6fb4bd7d46d9	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-02	1500	cash	paid	\N	\N	2026-04-02 15:19:44.473363+00	f	\N	\N
fc8eee15-22fd-4a88-8751-479260cdb355	1ca2f5d0-fc1b-49ab-8443-25574737d3cf	18d2e760-ed6d-44b0-af27-6b7cb9d6ddbb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-02	100	cash	paid	\N	\N	2026-04-02 15:41:26.760748+00	f	\N	\N
f63da06e-5de2-41eb-aaf5-7db773862bd6	8926b943-bda3-4c36-aa29-4f8576e75e90	735cd1ad-a76d-4026-87dc-60f501454b7a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-02	400	cash	paid	\N	\N	2026-04-02 15:41:57.000713+00	f	\N	\N
7a2db8f0-26d2-4336-9fa6-fdbe14428eb6	5fecec3a-5262-4cfd-8464-57abf6fd6c0c	509f1fd9-7517-4b8b-a57b-817bd7e6f823	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-02	300	cash	paid	\N	\N	2026-04-02 15:42:21.76896+00	f	\N	\N
8a2e60b9-f402-4dc3-8ded-0a0054c92545	4bf7d91d-6da6-4d5d-9db0-30b196a13651	6f37b184-d886-4b91-a179-60f467b3e51d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-02	300	cash	paid	\N	\N	2026-04-02 15:42:58.206956+00	f	\N	\N
bf52efb0-4d61-4f26-9faa-e934ded7f4cd	d59ecb10-5af9-4f75-8f43-dfc52d537f0c	400fb688-b2dd-42c2-b2f6-c2c3a6bff5bd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-02	200	cash	paid	\N	\N	2026-04-02 15:43:39.497214+00	f	\N	\N
1239850e-0015-47df-94c3-0568289d5d14	63a8b08e-b8dd-451a-bb89-b38b0bb2d9b2	5dbe34e7-1ce9-4640-b617-a2529d3479d8	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-02	1100	online	paid	\N	\N	2026-04-03 07:00:21.915783+00	f	\N	\N
954474f9-75d2-4b33-a29d-7d99ba30b320	b16866ff-ba34-412f-aeea-fa734ccf88a1	a3742c80-66e9-443f-8ab2-a145af754194	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-02	1000	online	paid	\N	\N	2026-04-03 07:00:46.91665+00	f	\N	\N
706b978e-839c-4f3f-95b9-17972494f49a	eec56395-bc3e-4592-8a21-7b694944b6eb	bd6c3241-ee7a-49a4-8f31-6ca7af5980d8	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-02	1000	online	paid	\N	\N	2026-04-03 07:01:13.247709+00	f	\N	\N
8753822c-97e4-431e-ad8b-4a10e51f3209	7d1ca2e6-5ac0-47d0-9b5b-6080fb746026	f8942243-6f41-4580-bb7a-b78101128ade	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-02	1400	online	paid	\N	\N	2026-04-03 07:01:41.856634+00	f	\N	\N
31694355-69d5-4728-bc3e-2769a03d07f8	d11d1904-a5c2-4fd5-8ebc-c800d6ced0b2	7c5e25ec-8d9d-4d6c-80b8-2ad0bfd12cee	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-02	150	online	paid	\N	\N	2026-04-03 07:02:03.133642+00	f	\N	\N
ed9c1877-0bf2-4d15-9cce-ddb1f6d2f5e7	e0fca0e1-df99-497f-87e4-41be32ec1780	c18d8b95-c031-4110-85c8-b265a89efc50	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-02	1000	online	paid	\N	\N	2026-04-03 07:02:26.227229+00	f	\N	\N
710e54af-fc10-4f41-beb3-9bff8d3d5a03	6d60857f-7cd1-437e-a536-c9d04949b1c7	d6c5de5c-32f1-4075-bce2-9a151bb80cb0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-02	500	online	paid	\N	\N	2026-04-03 07:02:45.649723+00	f	\N	\N
654f3bc6-f5bc-4e48-8d9b-0d44d84bdf69	9a636e37-de02-451a-981d-4bf513dce4eb	91f3e941-a2bf-44ce-9e3b-6a6f4a19af54	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-02	600	online	paid	\N	\N	2026-04-03 07:03:10.77038+00	f	\N	\N
ef356e79-9f62-4ab1-a716-8f2e1dfa962b	1cac3c77-d86c-41b8-ba55-2b1f74410661	5d640f92-1900-47f5-bb7e-a6ab5061d564	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-02	200	online	paid	\N	\N	2026-04-03 07:03:33.167641+00	f	\N	\N
bda8aa20-7f88-40cc-917b-a13bad2df903	6245a2e8-2eb5-4d5f-8b8a-aac817bfee18	55efd7cf-1188-4423-9a53-8ee2c53002fa	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-02	200	online	paid	\N	\N	2026-04-03 07:04:30.698387+00	f	\N	\N
3c3eb0c8-dc3e-48c8-ada5-9782bc72c408	4686827e-4849-4bfa-88aa-129912510008	5cebdb10-f359-495d-983b-766489065f26	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-02	200	online	paid	\N	\N	2026-04-03 07:04:46.323709+00	f	\N	\N
4fe514c6-1b92-4efa-a9f2-6eabd4758185	89d5c659-aa6c-4a99-b0fc-f737d9e8e0e4	111a604f-46f8-4271-8912-ccbe479ab3ef	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-02	1500	online	paid	\N	\N	2026-04-03 07:05:09.169078+00	f	\N	\N
616b8cf0-ab03-4c81-a610-c36077a1e912	860f25ca-39ff-42f0-bacb-e409bd6007d7	71d81887-5e21-4486-97e6-faea2c876cff	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-02	200	online	paid	\N	\N	2026-04-03 07:05:33.198556+00	f	\N	\N
33fb63f8-d644-4a75-a873-7c3b42a7df8c	dbb5444e-976f-4d00-9769-c0111b85f5b6	58be7354-d953-4974-a887-1ccc5ccb1acd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03	50	online	paid	\N	\N	2026-04-03 07:05:50.480446+00	f	\N	\N
aeafc5c5-5d19-4bb0-825b-bdc6c2638eae	f35169da-5d69-4e7e-a35e-ed6237a94cff	6398b3f9-45c4-45b0-a7fc-0e3e1ced4173	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03	1000	online	paid	\N	\N	2026-04-03 07:06:30.474783+00	f	\N	\N
e7a7a7b3-2178-4907-9ad2-c048e603ec77	591f4d1e-01f6-4c59-a2b0-7358e00a485d	6ffdf62b-44f6-4010-8ceb-e2878900e1b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03	250	online	paid	\N	\N	2026-04-03 07:06:54.016543+00	f	\N	\N
79d51c6c-6d97-4037-a781-4393a6fc9540	56da2e53-1358-4168-8c6e-cee12fe29c59	0e59bad3-eae7-435d-b166-6f5e876b3785	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03	1500	online	paid	\N	\N	2026-04-03 07:07:12.998876+00	f	\N	\N
4feb2e84-791e-45c8-9751-7b18026669ea	271816e2-6379-480d-92c3-c5f6fc561298	9b9a19c0-f88e-46eb-afd6-b823511a12e9	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03	600	cash	paid	\N	\N	2026-04-03 07:09:38.877332+00	f	\N	\N
30afae42-a3e2-48d9-b0ca-ada4a00e8fbc	6d60857f-7cd1-437e-a536-c9d04949b1c7	d6c5de5c-32f1-4075-bce2-9a151bb80cb0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03	500	online	paid	\N	\N	2026-04-03 10:31:29.088126+00	f	\N	\N
5282ce10-e317-4d8f-bbd3-721936656dec	046f033d-2013-4dbe-9ac8-947af0d1e115	de360bdb-ec38-4f27-ae4f-69ebeac5f619	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03	500	online	paid	\N	\N	2026-04-03 11:34:10.675945+00	f	\N	\N
0b3da709-c2c6-4232-b966-13285e0b5d6a	89d5c659-aa6c-4a99-b0fc-f737d9e8e0e4	111a604f-46f8-4271-8912-ccbe479ab3ef	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03	1500	online	paid	\N	\N	2026-04-03 11:34:47.476625+00	f	\N	\N
49482294-572f-4f0b-80a9-b7e05004a83a	6245a2e8-2eb5-4d5f-8b8a-aac817bfee18	55efd7cf-1188-4423-9a53-8ee2c53002fa	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03	200	online	paid	\N	\N	2026-04-03 12:56:25.559898+00	f	\N	\N
4c1f5a48-bc6e-44fd-bc9e-e89bd9fe98fc	a0d4dce0-9bdd-4cf1-ad5d-1c95cf18e2dd	dfa34099-366b-4a3e-85ef-eb12e94f4083	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03	300	online	paid	\N	\N	2026-04-03 13:04:40.585816+00	f	\N	\N
397e9ae4-87be-4984-993d-f2b04c711a86	bcb87a68-a59d-438f-b81a-e5a4a6b666c1	b4a8d905-3198-4d75-8ee3-3800ec8f2b40	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03	2000	online	paid	\N	\N	2026-04-03 14:34:34.601316+00	f	\N	\N
eda988c3-805d-4681-adaf-fe9a7d806603	250eeece-4579-4cc4-86f9-0cdd866fbd24	e3c2af50-d0e2-461a-bfc2-67efd23feb46	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03	200	online	paid	\N	\N	2026-04-03 14:35:02.999654+00	f	\N	\N
ef484a34-4f49-4507-b864-cc591c9bf382	e0fca0e1-df99-497f-87e4-41be32ec1780	c18d8b95-c031-4110-85c8-b265a89efc50	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03	500	online	paid	\N	\N	2026-04-03 14:35:33.331035+00	f	\N	\N
56c5ea9a-bd0a-4969-a085-827d9fbc94b5	7d755464-aa72-4aab-9028-a75e09410ff6	20ccdb2b-c6ad-4063-9dfd-a34c50adac5e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03	500	online	paid	\N	\N	2026-04-03 14:36:05.558293+00	f	\N	\N
512b938d-d57f-41c1-b827-e860e9cd3d49	32e40b35-8c4b-4552-b8b8-7c233d31c03d	757d4684-58bf-40d2-bfdd-ec9921ff94d7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03	250	online	paid	\N	\N	2026-04-03 14:36:35.594805+00	f	\N	\N
c120b923-7e5a-42b8-95c8-4ebd261f3bee	eccc41c7-9d86-41a5-8c93-ae01f74f8080	cc475a57-bcdd-42fc-a0a1-00504909a4e0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03	2000	online	paid	\N	\N	2026-04-03 14:37:08.334451+00	f	\N	\N
67421bdc-6be7-46ae-b4a1-4b26269cece5	bee2c977-93c0-44ef-874e-a76e53e40a51	aa68ef20-1754-401b-9bfc-b8f2c49b0a4e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03	400	online	paid	\N	\N	2026-04-03 14:37:38.785465+00	f	\N	\N
23c590a8-e5ad-46ea-a61b-cfa1a04d0b03	4686827e-4849-4bfa-88aa-129912510008	5cebdb10-f359-495d-983b-766489065f26	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03	200	online	paid	\N	\N	2026-04-03 15:14:48.912619+00	f	\N	\N
a896a471-b35b-4e61-8b93-2948913ab80a	9ef2ed06-c135-411b-9768-fe38919bf751	3271ace3-8b99-4f7c-bf11-2d83f9ae9711	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03	2000	online	paid	\N	\N	2026-04-03 15:15:09.803905+00	f	\N	\N
2720a307-742d-47ac-a05d-e60c9300aa12	f076e587-f2c0-423c-9441-07bde93baeb3	e71a649a-865d-492c-a7ac-b2f37247b836	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03	500	online	paid	\N	\N	2026-04-03 15:16:24.395481+00	f	\N	\N
cbd2e17f-b4ab-464e-a5e8-8724871a904c	d59ecb10-5af9-4f75-8f43-dfc52d537f0c	400fb688-b2dd-42c2-b2f6-c2c3a6bff5bd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03	200	cash	paid	\N	\N	2026-04-03 15:24:16.399715+00	f	\N	\N
bac74d1d-62c6-4e86-8650-9830a118ff75	1ca2f5d0-fc1b-49ab-8443-25574737d3cf	18d2e760-ed6d-44b0-af27-6b7cb9d6ddbb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03	100	cash	paid	\N	\N	2026-04-03 15:24:37.350587+00	f	\N	\N
d22fe6c2-6613-4dd6-bd3c-bf96f71a96d7	4bf7d91d-6da6-4d5d-9db0-30b196a13651	6f37b184-d886-4b91-a179-60f467b3e51d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03	300	cash	paid	\N	\N	2026-04-03 15:26:41.076291+00	f	\N	\N
9d5563d9-694c-4b49-8c23-8bf8eab4ab4c	44e44d3f-1c42-41fa-8bf1-2bdb5bf219c7	2647ddf3-5d7a-405f-be10-8cb5f12edb5d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03	200	cash	paid	\N	\N	2026-04-03 15:27:38.255756+00	f	\N	\N
fbe6ca8c-35e6-4ac2-88f9-8e61ae601235	f5064908-4ea0-42c7-8a63-0ddfc2a80531	dc623009-9752-43d7-b22a-384740599eb7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03	500	cash	paid	\N	\N	2026-04-03 15:24:52.497057+00	f	\N	\N
2dc558b0-4a24-4417-9655-9c54a82dc685	6aac96ea-eb26-460a-8340-ffb355953ae0	8e423e8d-c1ce-4d07-9860-fd7df34eaf44	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03	400	online	paid	\N	\N	2026-04-03 15:48:13.908634+00	f	\N	\N
1615f7db-4398-4a72-bf65-65ab93c947c4	7d1ca2e6-5ac0-47d0-9b5b-6080fb746026	f8942243-6f41-4580-bb7a-b78101128ade	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03	700	online	paid	\N	\N	2026-04-03 16:00:16.075737+00	f	\N	\N
2fb2c7ed-8335-4901-83c4-f709fa6812b3	b16866ff-ba34-412f-aeea-fa734ccf88a1	a3742c80-66e9-443f-8ab2-a145af754194	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03	500	online	paid	\N	\N	2026-04-03 16:26:46.654038+00	f	\N	\N
36e5f69b-ba86-4aa4-9959-23f7cca8acf0	d11d1904-a5c2-4fd5-8ebc-c800d6ced0b2	7c5e25ec-8d9d-4d6c-80b8-2ad0bfd12cee	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03	150	online	paid	\N	\N	2026-04-03 16:43:40.181121+00	f	\N	\N
29ad3c40-7bbe-407a-a61b-c1e2e6a1876a	cb5975f3-72b1-4cc9-bd02-81342334cb40	6043f054-834d-437f-860a-7f9269935958	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-03	400	online	paid	\N	\N	2026-04-03 18:38:23.244365+00	f	\N	\N
85e2cdd8-ad9b-4712-bda6-a884e6d0c714	80752817-7c75-426b-a97e-361b246ec563	135460a0-56bf-4c17-a4a8-5e66f29b52f6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04	300	cash	paid	\N	\N	2026-04-04 05:48:16.32342+00	f	\N	\N
7981b45b-3976-497d-96d4-b19b8bfa9c89	32e40b35-8c4b-4552-b8b8-7c233d31c03d	757d4684-58bf-40d2-bfdd-ec9921ff94d7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04	250	online	paid	\N	\N	2026-04-04 06:22:05.443854+00	f	\N	\N
09b0dc96-3c52-4f47-8f97-6cbf84b6875b	2a8f0801-a95d-49fb-a6a0-f9a9a84c463b	35899642-c883-4c26-a7ad-8e41a391be2b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04	1500	online	paid	\N	\N	2026-04-04 06:23:07.479828+00	f	\N	\N
e3fc2e20-3426-4696-8b4f-318c6e7d6a1f	dbb5444e-976f-4d00-9769-c0111b85f5b6	58be7354-d953-4974-a887-1ccc5ccb1acd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04	50	online	paid	\N	\N	2026-04-04 06:25:16.350683+00	f	\N	\N
f487c92c-329a-4b13-8739-6b927bd9e301	8d648ef9-92ca-4513-8639-f0b3ec50a392	eed1102c-8dcc-4caf-9239-6a9cd7332ccc	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04	400	online	paid	\N	\N	2026-04-04 07:27:14.741161+00	f	\N	\N
f2bd450f-7872-4b77-b6ea-1322ebd453b0	f35169da-5d69-4e7e-a35e-ed6237a94cff	6398b3f9-45c4-45b0-a7fc-0e3e1ced4173	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04	500	online	paid	\N	\N	2026-04-04 07:27:52.542509+00	f	\N	\N
c2fbb154-8b80-4273-9923-234e573ad438	7d755464-aa72-4aab-9028-a75e09410ff6	20ccdb2b-c6ad-4063-9dfd-a34c50adac5e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04	500	online	paid	\N	\N	2026-04-04 07:28:22.242145+00	f	\N	\N
75fdce0a-d4f6-4067-9e4b-28527413fdfc	651c7fb2-68bf-46d8-bf93-3f25bf5c8dab	6d5f5859-9f8b-466b-8a58-336b620889eb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04	1500	online	paid	\N	\N	2026-04-04 07:29:10.644647+00	f	\N	\N
14044aaf-cad4-43eb-be73-3fe2c47e0924	e3325ec8-264a-41e1-a2d5-84fb33eb4412	c2c54c13-fb99-4e5d-9f99-1bddf98beb5b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04	2000	online	paid	\N	\N	2026-04-04 07:42:31.393205+00	f	\N	\N
a7cffc87-0dfa-4124-a892-8bc968f6a8b7	02889b17-5d17-4dc1-ace1-381b0d733984	def4d986-3767-4793-a6e8-c767351fd93f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04	1500	cash	paid	\N	\N	2026-04-04 07:59:49.984329+00	f	\N	\N
e6eac99c-9b4d-4f25-929e-3a3185425659	02889b17-5d17-4dc1-ace1-381b0d733984	def4d986-3767-4793-a6e8-c767351fd93f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04	500	cash	paid	\N	\N	2026-04-04 08:15:28.254029+00	f	\N	\N
a72e87ea-09ac-4a0a-bdfd-bb2b2e8393c7	a0d4dce0-9bdd-4cf1-ad5d-1c95cf18e2dd	dfa34099-366b-4a3e-85ef-eb12e94f4083	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04	300	online	paid	\N	\N	2026-04-04 13:07:02.254023+00	f	\N	\N
17f3a77f-95a3-4254-9aef-eb88c94bc557	dede5547-d440-4d63-a9ac-ad427b2895c9	6ded35ce-a2e8-4856-827d-ab18be14743b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04	500	online	paid	\N	\N	2026-04-04 13:10:07.106796+00	f	\N	\N
6003cbad-5bd1-4638-86e9-5adac0596d5d	6d60857f-7cd1-437e-a536-c9d04949b1c7	d6c5de5c-32f1-4075-bce2-9a151bb80cb0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04	500	online	paid	\N	\N	2026-04-04 13:10:23.89873+00	f	\N	\N
4b1f2db5-52ec-422b-bcfb-33ab3ee84e54	c5f80bd8-670e-4df5-8c6a-ac7378801077	3a181c18-8f9e-4467-96a8-c09687ebea27	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04	1000	online	paid	\N	\N	2026-04-04 14:29:20.862286+00	f	\N	\N
d3f6dc44-836e-419c-a789-c29e1160576e	4686827e-4849-4bfa-88aa-129912510008	5cebdb10-f359-495d-983b-766489065f26	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04	200	online	paid	\N	\N	2026-04-04 14:30:07.906857+00	f	\N	\N
58c3adba-0291-416d-8e55-dd47d1355c5b	250eeece-4579-4cc4-86f9-0cdd866fbd24	e3c2af50-d0e2-461a-bfc2-67efd23feb46	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04	100	online	paid	\N	\N	2026-04-04 14:59:28.18172+00	f	\N	\N
d53529b9-167e-48d5-ae66-ff6f9f952031	f076e587-f2c0-423c-9441-07bde93baeb3	e71a649a-865d-492c-a7ac-b2f37247b836	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04	500	online	paid	\N	\N	2026-04-04 15:00:04.795477+00	f	\N	\N
f303042f-0768-4c28-8d96-c73d0ffdfc95	22d10045-ef1c-4807-9278-c35dbb01d73f	db261798-826e-4d7b-9fc7-a4dba55df1f3	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04	200	online	paid	\N	\N	2026-04-04 15:00:36.987717+00	f	\N	\N
5c8fd915-bd4d-4a42-add9-40040f3e5666	ba9ab57b-e2d8-4c2a-902d-effb7b810b03	a3f57a0f-8bdf-47f7-a94d-819924cdc08a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04	3000	online	paid	\N	\N	2026-04-04 15:01:05.75818+00	f	\N	\N
87818001-ddb1-4fcf-bc48-c811e8b7e119	6245a2e8-2eb5-4d5f-8b8a-aac817bfee18	55efd7cf-1188-4423-9a53-8ee2c53002fa	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04	200	online	paid	\N	\N	2026-04-04 15:22:56.152452+00	f	\N	\N
98b3d008-5644-4c69-8d70-8323f058f5a6	89d5c659-aa6c-4a99-b0fc-f737d9e8e0e4	111a604f-46f8-4271-8912-ccbe479ab3ef	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04	1500	online	paid	\N	\N	2026-04-04 15:23:24.77414+00	f	\N	\N
09e719eb-4db9-47d6-8861-9f233fa62d65	1ca2f5d0-fc1b-49ab-8443-25574737d3cf	18d2e760-ed6d-44b0-af27-6b7cb9d6ddbb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04	100	cash	paid	\N	\N	2026-04-04 15:41:01.516772+00	f	\N	\N
1a9c584c-15bb-40fa-bb1b-4d81cad32e0e	f5064908-4ea0-42c7-8a63-0ddfc2a80531	dc623009-9752-43d7-b22a-384740599eb7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04	500	cash	paid	\N	\N	2026-04-04 15:41:32.403809+00	f	\N	\N
699539c8-7c0a-40d1-83ff-ebbafcebbce8	5fecec3a-5262-4cfd-8464-57abf6fd6c0c	509f1fd9-7517-4b8b-a57b-817bd7e6f823	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04	300	cash	paid	\N	\N	2026-04-04 15:41:55.896782+00	f	\N	\N
551a1dc1-0913-4dec-b953-c5959c15115b	44e44d3f-1c42-41fa-8bf1-2bdb5bf219c7	2647ddf3-5d7a-405f-be10-8cb5f12edb5d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04	200	cash	paid	\N	\N	2026-04-04 15:42:15.895033+00	f	\N	\N
130eee86-f66c-4c9c-a12a-d1e35d2c850e	4bf7d91d-6da6-4d5d-9db0-30b196a13651	6f37b184-d886-4b91-a179-60f467b3e51d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04	300	cash	paid	\N	\N	2026-04-04 15:42:48.495296+00	f	\N	\N
72045972-4650-4a11-8ba7-f1cb20e7f1de	d59ecb10-5af9-4f75-8f43-dfc52d537f0c	400fb688-b2dd-42c2-b2f6-c2c3a6bff5bd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04	400	cash	paid	\N	\N	2026-04-04 15:43:06.969935+00	f	\N	\N
a8d23987-07fb-4cf2-b983-bc12d9498616	1cac3c77-d86c-41b8-ba55-2b1f74410661	5d640f92-1900-47f5-bb7e-a6ab5061d564	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04	200	cash	paid	\N	\N	2026-04-04 15:43:29.084405+00	f	\N	\N
4c2af397-ae59-47f4-877d-5b4e08a306b8	bcb87a68-a59d-438f-b81a-e5a4a6b666c1	b4a8d905-3198-4d75-8ee3-3800ec8f2b40	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-04	500	online	paid	\N	\N	2026-04-04 18:19:18.235155+00	f	\N	\N
72f4dd91-c207-4713-9c53-66f30ecb60d9	046f033d-2013-4dbe-9ac8-947af0d1e115	de360bdb-ec38-4f27-ae4f-69ebeac5f619	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-05	500	online	paid	\N	\N	2026-04-05 04:44:32.43882+00	f	\N	\N
5d57edc0-ea2b-42da-8b45-1910d20c0245	dbb5444e-976f-4d00-9769-c0111b85f5b6	58be7354-d953-4974-a887-1ccc5ccb1acd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-05	50	online	paid	\N	\N	2026-04-05 04:45:13.21354+00	f	\N	\N
cf42b83c-6845-4de6-99e9-024a3c486054	dcf458bf-10c7-41f7-ab08-ed37fbfc4b2b	767b5de8-3ba8-4b67-ad24-b0681feb51a5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-05	50	online	paid	\N	\N	2026-04-05 04:45:42.324213+00	f	\N	\N
210bd182-6c3c-43c2-9273-03d0854defee	790d3d01-21ef-4976-82d4-af3adacb886c	2c2fec84-b45b-456c-87b2-de7365174599	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-05	200	online	paid	\N	\N	2026-04-05 04:46:31.850054+00	f	\N	\N
ae5a9f88-4610-4e8d-ad2d-a92ec28161f3	db40f757-c1ca-42a3-bb92-2df13793998d	249ae28b-3ceb-4a1c-a279-a9affb4d8090	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-05	600	cash	paid	\N	\N	2026-04-05 05:19:02.558894+00	f	\N	\N
995c618d-6a66-48de-98e6-bab91cdb51ef	23ac8ae5-7452-4182-b51c-a70026bbe0d8	bbc128c4-c3e1-4281-82c7-652d7065c721	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-05	100	cash	paid	\N	\N	2026-04-05 06:36:13.319479+00	f	\N	\N
f443a9ab-54f8-47cb-b366-164d319a8cf7	7d1ca2e6-5ac0-47d0-9b5b-6080fb746026	f8942243-6f41-4580-bb7a-b78101128ade	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-05	1400	online	paid	\N	\N	2026-04-05 07:10:14.26757+00	f	\N	\N
f2702b11-84c9-42f9-9731-f6aa885cc54c	80752817-7c75-426b-a97e-361b246ec563	135460a0-56bf-4c17-a4a8-5e66f29b52f6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-05	300	cash	paid	\N	\N	2026-04-05 07:18:57.885339+00	f	\N	\N
704d9794-ce7d-446b-a3ad-c54b6c09982a	271816e2-6379-480d-92c3-c5f6fc561298	9b9a19c0-f88e-46eb-afd6-b823511a12e9	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-05	300	cash	paid	\N	\N	2026-04-05 07:19:46.998617+00	f	\N	\N
85c507b4-eebe-484b-a316-4a98e99012c0	591f4d1e-01f6-4c59-a2b0-7358e00a485d	6ffdf62b-44f6-4010-8ceb-e2878900e1b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-05	500	online	paid	\N	\N	2026-04-05 07:52:24.764221+00	f	\N	\N
cc8ff054-5569-4686-9adf-a8070c6b95c8	89d5c659-aa6c-4a99-b0fc-f737d9e8e0e4	111a604f-46f8-4271-8912-ccbe479ab3ef	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-05	1500	online	paid	\N	\N	2026-04-05 11:52:37.567655+00	f	\N	\N
23780585-33af-4dc8-b416-886bf24df945	a0d4dce0-9bdd-4cf1-ad5d-1c95cf18e2dd	dfa34099-366b-4a3e-85ef-eb12e94f4083	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-05	300	online	paid	\N	\N	2026-04-05 11:52:57.448354+00	f	\N	\N
cd07958a-b26b-4544-a670-93232fad7cc3	3765d341-7b06-463d-82fa-add7d738b854	eab03433-a240-440d-8140-9be3f7ccf9a7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-05	1000	online	paid	\N	\N	2026-04-05 11:53:15.351645+00	f	\N	\N
fb4c05a5-3d2f-4b68-8cd5-42394b291e73	bee2c977-93c0-44ef-874e-a76e53e40a51	aa68ef20-1754-401b-9bfc-b8f2c49b0a4e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-05	800	online	paid	\N	\N	2026-04-05 13:42:19.020915+00	f	\N	\N
5bca1200-9cd4-43b3-9516-fb2004687559	481d1580-100a-4f65-bc22-32aac9182e37	8fdc0983-6869-49ab-ba2e-866ebe6f7f5b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-05	250	online	paid	\N	\N	2026-04-05 14:37:53.596567+00	f	\N	\N
0b230a79-1a2c-43e1-9824-f818f2916204	eccc41c7-9d86-41a5-8c93-ae01f74f8080	cc475a57-bcdd-42fc-a0a1-00504909a4e0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-05	4000	online	paid	\N	\N	2026-04-05 14:48:46.578668+00	f	\N	\N
ec5ffb9e-0aa8-478c-abea-408b192afec6	1ca2f5d0-fc1b-49ab-8443-25574737d3cf	18d2e760-ed6d-44b0-af27-6b7cb9d6ddbb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-05	100	cash	paid	\N	\N	2026-04-05 15:06:34.107944+00	f	\N	\N
7a538c31-d1b7-467d-a2e3-c664072baef1	84cf3d8e-64cc-4a90-8b33-12c94640d00b	ebc8c94f-09bf-41ca-8522-f81f98fb1469	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-05	300	cash	paid	\N	\N	2026-04-05 15:06:49.178538+00	f	\N	\N
ec478142-6693-4cf2-acae-f64ea66e278a	2d860b86-e289-45b9-b108-3ecc32fafe18	adbe0a7a-d431-41af-9a40-6fdc864df6ab	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-05	500	cash	paid	\N	\N	2026-04-05 15:07:54.449964+00	f	\N	\N
8df584f2-f779-4569-8f8e-451e5e4ef5f3	5fecec3a-5262-4cfd-8464-57abf6fd6c0c	509f1fd9-7517-4b8b-a57b-817bd7e6f823	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-05	300	cash	paid	\N	\N	2026-04-05 15:08:20.470843+00	f	\N	\N
5d090a9e-1c87-48a8-a21d-e407b0c21511	a529d878-71a9-4774-8ef5-b4e2ce601e22	c7a9948d-1c6b-40d9-a8b5-23c2597bf9f0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-05	100	cash	paid	\N	\N	2026-04-05 15:08:40.042249+00	f	\N	\N
b759d6e9-cff4-40fc-9c70-488cdef24327	b0ad6445-eed2-49f7-9b7c-78fdf8a2a53d	2ee2c1a7-5fa1-4a20-9185-b1385b754870	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-05	200	online	paid	\N	\N	2026-04-05 15:12:47.352103+00	f	\N	\N
d0e10458-c784-49cd-b71b-a253fad16acb	b16866ff-ba34-412f-aeea-fa734ccf88a1	a3742c80-66e9-443f-8ab2-a145af754194	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-05	500	cash	paid	\N	\N	2026-04-05 15:57:54.535107+00	f	\N	\N
fd6aee38-d97d-4ee0-84ff-e4d443a05300	6d60857f-7cd1-437e-a536-c9d04949b1c7	d6c5de5c-32f1-4075-bce2-9a151bb80cb0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-05	500	online	paid	\N	\N	2026-04-05 16:43:33.448815+00	f	\N	\N
64bc3f8b-426e-4a6c-9bc1-a7e3d8705b59	bcb87a68-a59d-438f-b81a-e5a4a6b666c1	b4a8d905-3198-4d75-8ee3-3800ec8f2b40	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-05	500	online	paid	\N	\N	2026-04-05 16:43:54.019624+00	f	\N	\N
c95e46a2-1bfa-4f08-9766-c6143fb92ece	586c004c-3e6b-40bf-a2f5-cd3a1fdfe4c0	e69b67ff-1841-47c7-832c-f2e85f48bae0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-05	300	online	paid	\N	\N	2026-04-05 17:37:49.188969+00	f	\N	\N
a2ea4a2c-008b-4b6e-a301-66438ce41d19	f35169da-5d69-4e7e-a35e-ed6237a94cff	6398b3f9-45c4-45b0-a7fc-0e3e1ced4173	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06	500	online	paid	\N	\N	2026-04-05 19:28:29.961884+00	f	\N	\N
fa7be925-d067-46a5-96b3-76de702b702c	790d3d01-21ef-4976-82d4-af3adacb886c	2c2fec84-b45b-456c-87b2-de7365174599	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06	200	online	paid	\N	\N	2026-04-06 03:52:53.350249+00	f	\N	\N
264bdd7a-f3be-4bce-92b7-566fde10772d	dbb5444e-976f-4d00-9769-c0111b85f5b6	58be7354-d953-4974-a887-1ccc5ccb1acd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06	50	online	paid	\N	\N	2026-04-06 03:53:14.080622+00	f	\N	\N
55d3d4d6-f93c-42a1-be12-59f64918dc48	dcf458bf-10c7-41f7-ab08-ed37fbfc4b2b	767b5de8-3ba8-4b67-ad24-b0681feb51a5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06	50	online	paid	\N	\N	2026-04-06 03:53:39.080782+00	f	\N	\N
97e10d90-b23b-46c4-bcf3-c5cb3dd73b18	7d1ca2e6-5ac0-47d0-9b5b-6080fb746026	f8942243-6f41-4580-bb7a-b78101128ade	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06	700	online	paid	\N	\N	2026-04-06 03:54:06.45908+00	f	\N	\N
69d296e4-1ada-4a01-a93e-b199b97303be	fb079db0-2262-4017-bd24-5d42ca326ff9	9ca88703-194e-4620-9685-63969504382a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06	2200	cash	paid	\N	\N	2026-04-06 05:24:55.164244+00	f	\N	\N
1cdc0e20-dfdb-48c8-83a0-5be57bc7164e	d11d1904-a5c2-4fd5-8ebc-c800d6ced0b2	7c5e25ec-8d9d-4d6c-80b8-2ad0bfd12cee	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06	450	online	paid	\N	\N	2026-04-06 05:34:05.593307+00	f	\N	\N
58df439b-d362-4ff3-b926-2e39e0f33212	e00a821e-300f-432b-8519-5ef03b42b09c	6edc184d-553a-4ab7-b3bc-924f1ea007d6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06	3000	online	paid	\N	\N	2026-04-06 05:34:37.354024+00	f	\N	\N
e7e6b101-64c7-416d-8d55-b0a49e459c61	6d60857f-7cd1-437e-a536-c9d04949b1c7	d6c5de5c-32f1-4075-bce2-9a151bb80cb0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06	500	online	paid	\N	\N	2026-04-06 05:40:57.807826+00	f	\N	\N
1bd8e2f6-5b87-4474-89bc-cbe6e9d88942	c9a697e2-d1d0-4f48-9f8b-b0a12d06de0d	6778d224-f980-48ed-801f-bef1220cd43c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06	500	online	paid	\N	\N	2026-04-06 06:55:24.300608+00	f	\N	\N
c2ba852f-cac4-467d-aed1-f1f9c04ed6ee	019b4424-175f-4bb1-9c64-bd2fb04a8ae4	1ff2e9b9-5867-4348-a67b-0a6601d52ce9	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06	50	cash	paid	\N	\N	2026-04-06 07:27:34.183031+00	f	\N	\N
53f2e78d-6b22-4318-ba36-0fd6a4203999	80752817-7c75-426b-a97e-361b246ec563	135460a0-56bf-4c17-a4a8-5e66f29b52f6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06	300	cash	paid	\N	\N	2026-04-06 07:27:56.406811+00	f	\N	\N
1390c7d5-339c-4209-99b1-e6b52307ee3c	ea7436e5-3b5c-49c8-87e4-6d727b2c2e50	cb603d85-d775-4680-bee6-2c42f0b3e767	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06	500	online	paid	\N	\N	2026-04-06 07:39:19.973263+00	f	\N	\N
3da638c6-d606-4f17-bd92-c97d643fe304	db6c8835-21b0-4c54-b4ff-2e6ec0441891	0d99cdf2-2edc-4baa-bf1a-14c97c0df949	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06	2000	cash	paid	\N	\N	2026-04-06 07:48:03.780655+00	f	\N	\N
42c62178-9605-49be-999d-ca9c494db55c	894bed8a-dcbc-44c1-b441-fa5be29868d6	b9357402-e54d-4f75-abc5-6690cb4b9288	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06	200	online	paid	\N	\N	2026-04-06 07:48:28.1831+00	f	\N	\N
27f48a2f-3a8e-415b-bdaf-f5e1ac4903c2	a0d4dce0-9bdd-4cf1-ad5d-1c95cf18e2dd	dfa34099-366b-4a3e-85ef-eb12e94f4083	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06	300	online	paid	\N	\N	2026-04-06 09:34:15.107561+00	f	\N	\N
23f00b1a-5f56-4ad4-a5c7-c604e48a0882	67eb359b-25a2-481e-ae53-c208688f5940	7ebb952f-b8ce-452d-a076-36b5efc9d1c5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06	1200	online	paid	\N	\N	2026-04-06 11:44:35.133874+00	f	\N	\N
06542776-0273-433a-8bd2-be385efe5ff1	56da2e53-1358-4168-8c6e-cee12fe29c59	0e59bad3-eae7-435d-b166-6f5e876b3785	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06	1500	online	paid	\N	\N	2026-04-06 12:10:53.184392+00	f	\N	\N
4804d921-1695-48d5-8e8c-31db83f551b3	9a636e37-de02-451a-981d-4bf513dce4eb	91f3e941-a2bf-44ce-9e3b-6a6f4a19af54	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06	1800	online	paid	\N	\N	2026-04-06 13:17:42.450017+00	f	\N	\N
c696f854-9351-40bc-b14d-9975530329aa	250eeece-4579-4cc4-86f9-0cdd866fbd24	e3c2af50-d0e2-461a-bfc2-67efd23feb46	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06	100	online	paid	\N	\N	2026-04-06 13:37:49.970618+00	f	\N	\N
c6c83805-5e68-483d-a085-0f76ea4785e5	ac85d0d3-a358-46b8-bf3e-4f4468ca5670	7a331756-19b2-4a9f-a2ee-2b3f6a641e72	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06	2100	cash	paid	\N	\N	2026-04-06 13:56:25.746793+00	f	\N	\N
e7fb39b5-c3d8-4572-9c4a-f123a2f1e07b	4686827e-4849-4bfa-88aa-129912510008	5cebdb10-f359-495d-983b-766489065f26	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06	200	online	paid	\N	\N	2026-04-06 14:14:10.234755+00	f	\N	\N
1dd6b0e6-73a5-4b50-bfd8-27406d21f75a	f076e587-f2c0-423c-9441-07bde93baeb3	e71a649a-865d-492c-a7ac-b2f37247b836	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06	500	online	paid	\N	\N	2026-04-06 14:25:48.574272+00	f	\N	\N
194946ad-df76-4d28-be63-72f84270f96f	1cac3c77-d86c-41b8-ba55-2b1f74410661	5d640f92-1900-47f5-bb7e-a6ab5061d564	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06	200	online	paid	\N	\N	2026-04-06 14:47:41.206808+00	f	\N	\N
90ee762c-6ee8-4215-b002-5b670021b05e	6245a2e8-2eb5-4d5f-8b8a-aac817bfee18	55efd7cf-1188-4423-9a53-8ee2c53002fa	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06	200	online	paid	\N	\N	2026-04-06 14:50:17.012177+00	f	\N	\N
f396ac66-ea1b-4567-9d52-a4adbb44b316	e3325ec8-264a-41e1-a2d5-84fb33eb4412	c2c54c13-fb99-4e5d-9f99-1bddf98beb5b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06	500	online	paid	\N	\N	2026-04-06 15:04:05.342826+00	f	\N	\N
81efaae2-fee0-4b2d-9e94-a9fe7cce9bdc	1ca2f5d0-fc1b-49ab-8443-25574737d3cf	18d2e760-ed6d-44b0-af27-6b7cb9d6ddbb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06	100	cash	paid	\N	\N	2026-04-06 15:05:38.877686+00	f	\N	\N
5327bd7d-8a6c-4176-8a3b-7b5c300c1059	2d860b86-e289-45b9-b108-3ecc32fafe18	adbe0a7a-d431-41af-9a40-6fdc864df6ab	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06	500	cash	paid	\N	\N	2026-04-06 15:06:14.036581+00	f	\N	\N
64b4d357-4219-4151-bbf4-fc28c09ca442	f5064908-4ea0-42c7-8a63-0ddfc2a80531	dc623009-9752-43d7-b22a-384740599eb7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06	500	cash	paid	\N	\N	2026-04-06 15:06:41.704053+00	f	\N	\N
68f15a26-60e0-40f9-b4d7-cdffd824442b	8926b943-bda3-4c36-aa29-4f8576e75e90	735cd1ad-a76d-4026-87dc-60f501454b7a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06	600	cash	paid	\N	\N	2026-04-06 15:07:42.880444+00	f	\N	\N
adc49dc9-895f-4825-9b96-e179d3716b2c	5fecec3a-5262-4cfd-8464-57abf6fd6c0c	509f1fd9-7517-4b8b-a57b-817bd7e6f823	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06	300	cash	paid	\N	\N	2026-04-06 15:08:06.797137+00	f	\N	\N
19832733-bbd3-48ce-a978-aa631620220f	d59ecb10-5af9-4f75-8f43-dfc52d537f0c	400fb688-b2dd-42c2-b2f6-c2c3a6bff5bd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06	200	cash	paid	\N	\N	2026-04-06 15:08:47.555426+00	f	\N	\N
b53ec2bd-dd19-4f2e-8ff7-1d9e4b2fb736	4bf7d91d-6da6-4d5d-9db0-30b196a13651	6f37b184-d886-4b91-a179-60f467b3e51d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06	300	cash	paid	\N	\N	2026-04-06 15:09:18.243357+00	f	\N	\N
3e4b511f-4578-4212-b693-484d9e8d4e98	a529d878-71a9-4774-8ef5-b4e2ce601e22	c7a9948d-1c6b-40d9-a8b5-23c2597bf9f0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06	100	cash	paid	\N	\N	2026-04-06 15:09:46.078693+00	f	\N	\N
0eb664fd-572e-4426-90a7-6f35c059879f	32e40b35-8c4b-4552-b8b8-7c233d31c03d	757d4684-58bf-40d2-bfdd-ec9921ff94d7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06	250	cash	paid	\N	\N	2026-04-06 15:29:11.434901+00	f	\N	\N
91e8d023-c21b-4021-8374-abcefd45d35f	2a8f0801-a95d-49fb-a6a0-f9a9a84c463b	35899642-c883-4c26-a7ad-8e41a391be2b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06	1000	online	paid	\N	\N	2026-04-06 15:29:36.676346+00	f	\N	\N
ebb401cc-259c-45d8-a353-d61df074002d	cf6ae0f5-381e-455f-8bda-1dda692f14a4	e425ae02-2a03-4e18-af85-4b3990eefd11	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06	2800	online	paid	\N	\N	2026-04-06 15:30:35.877125+00	f	\N	\N
5313c5d3-3eef-4cc6-a97d-e7cf0daff1d9	0730e6a0-07e6-44f1-b129-097c3fb6e85c	8933fd28-5d64-4ec9-9cd9-d5b594fff1eb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06	50	cash	paid	\N	\N	2026-04-06 15:44:56.005322+00	f	\N	\N
285e261c-417c-4b1a-93e9-61e485375510	bcb87a68-a59d-438f-b81a-e5a4a6b666c1	b4a8d905-3198-4d75-8ee3-3800ec8f2b40	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06	500	online	paid	\N	\N	2026-04-06 15:54:09.74444+00	f	\N	\N
ea328caa-7db1-4fc9-b734-0881cdc6f60c	cb86aae2-de85-41b5-bf5f-20645840e270	a22b5f37-a3d4-48de-a5d3-5717343478be	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06	300	cash	paid	\N	\N	2026-04-06 16:05:06.682914+00	f	\N	\N
5b50c275-0d7c-4798-ab88-4bc4c43aca95	89d5c659-aa6c-4a99-b0fc-f737d9e8e0e4	111a604f-46f8-4271-8912-ccbe479ab3ef	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06	1500	online	paid	\N	\N	2026-04-06 16:46:57.722839+00	f	\N	\N
cc9e0832-55c9-4e46-baad-d0335f14b3a5	9daa6e18-5bdb-420a-a5bf-8420c72c9e6e	e953cf25-fc2f-47cf-93d6-d74ca66951dd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07	300	online	paid	\N	\N	2026-04-07 01:32:59.115882+00	f	\N	\N
8f385337-637a-4083-a49b-78e71e03dd2c	dbb5444e-976f-4d00-9769-c0111b85f5b6	58be7354-d953-4974-a887-1ccc5ccb1acd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07	50	online	paid	\N	\N	2026-04-07 01:34:01.764944+00	f	\N	\N
22882270-6af4-4a01-bfb0-aad60f115871	dcf458bf-10c7-41f7-ab08-ed37fbfc4b2b	767b5de8-3ba8-4b67-ad24-b0681feb51a5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07	50	online	paid	\N	\N	2026-04-07 01:34:29.400018+00	f	\N	\N
b4b99334-9b70-4a07-b83c-411dfcd0a1f3	046f033d-2013-4dbe-9ac8-947af0d1e115	de360bdb-ec38-4f27-ae4f-69ebeac5f619	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07	500	cash	paid	\N	\N	2026-04-07 06:13:31.203685+00	f	\N	\N
0513a361-2e79-4d29-bed7-66ef4851d917	019b4424-175f-4bb1-9c64-bd2fb04a8ae4	1ff2e9b9-5867-4348-a67b-0a6601d52ce9	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07	50	cash	paid	\N	\N	2026-04-07 06:20:22.726702+00	f	\N	\N
916dff10-8dc2-4941-b4d2-e8e806ee649c	e9b6d72d-0b4a-450d-8c1d-4d79ce11223a	b80a9434-712e-4a9a-aadb-75c2ee7549a8	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07	400	cash	paid	\N	\N	2026-04-07 13:59:35.60883+00	f	\N	\N
2e08b078-7ce6-4092-8765-aed64705c5cf	cf301afd-a3ed-4bea-9794-b4fe432d8861	8419a9be-df12-416f-81ce-3570f9a82a4c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07	3000	cash	paid	\N	\N	2026-04-07 14:00:04.464572+00	f	\N	\N
0ece9803-e73a-4575-9da3-2a761366e1b0	1ca2f5d0-fc1b-49ab-8443-25574737d3cf	18d2e760-ed6d-44b0-af27-6b7cb9d6ddbb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07	100	cash	paid	\N	\N	2026-04-07 15:18:28.808026+00	f	\N	\N
8f7e24b1-6301-425c-88f9-4a8000461646	4686827e-4849-4bfa-88aa-129912510008	5cebdb10-f359-495d-983b-766489065f26	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07	200	cash	paid	\N	\N	2026-04-07 15:20:06.200656+00	f	\N	\N
e712d014-78de-4d8d-99b3-dd3e45bc9837	5fecec3a-5262-4cfd-8464-57abf6fd6c0c	509f1fd9-7517-4b8b-a57b-817bd7e6f823	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07	300	cash	paid	\N	\N	2026-04-07 15:20:30.210417+00	f	\N	\N
7a605db2-debc-4650-b9f0-41faf775a025	44e44d3f-1c42-41fa-8bf1-2bdb5bf219c7	2647ddf3-5d7a-405f-be10-8cb5f12edb5d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07	200	cash	paid	\N	\N	2026-04-07 15:21:04.948717+00	f	\N	\N
db43e2dd-c396-4f83-8da1-afff1adcb834	84cf3d8e-64cc-4a90-8b33-12c94640d00b	ebc8c94f-09bf-41ca-8522-f81f98fb1469	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07	700	cash	paid	\N	\N	2026-04-07 15:21:40.178573+00	f	\N	\N
adf45059-acc0-40f3-a74e-24a891bd5b33	d59ecb10-5af9-4f75-8f43-dfc52d537f0c	400fb688-b2dd-42c2-b2f6-c2c3a6bff5bd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07	200	cash	paid	\N	\N	2026-04-07 15:22:05.546063+00	f	\N	\N
e5d8f496-196a-4232-a01a-20f67034bd3b	e9d54922-42db-42b1-ab59-8dd42d68af4c	fe889acf-38cf-4a1f-8fce-804d5304f246	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07	600	cash	paid	\N	\N	2026-04-07 15:22:31.474959+00	f	\N	\N
57c03558-6f73-43a7-a8ff-2451a519692c	b22b99e0-ad0d-4b0b-bdeb-7f6883ff97c1	9b75966e-2f2f-476f-b255-0bd24264a797	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07	200	cash	paid	\N	\N	2026-04-07 15:22:59.846929+00	f	\N	\N
1f47b964-f159-4713-b61a-76b77e520153	f5064908-4ea0-42c7-8a63-0ddfc2a80531	dc623009-9752-43d7-b22a-384740599eb7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07	500	cash	paid	\N	\N	2026-04-07 15:35:30.872791+00	f	\N	\N
096487e6-80b6-4c41-a51d-a0ecb9c23532	a03836bd-4e58-4dcf-b429-ad094f601d2d	54e534e0-ac57-4107-8217-5216c1e4eed2	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07	600	cash	paid	\N	\N	2026-04-07 15:35:58.658818+00	f	\N	\N
c824e5d5-f0d1-48d6-a681-81ec70c9a363	e9b6d72d-0b4a-450d-8c1d-4d79ce11223a	b80a9434-712e-4a9a-aadb-75c2ee7549a8	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08	400	cash	paid	\N	\N	2026-04-08 05:04:02.918556+00	f	\N	\N
546532c5-1181-4729-93f1-1c5e20a7a5e5	cf301afd-a3ed-4bea-9794-b4fe432d8861	8419a9be-df12-416f-81ce-3570f9a82a4c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08	1800	cash	paid	\N	\N	2026-04-08 05:04:27.506515+00	f	\N	\N
f25de401-1524-406e-bff5-97902335ce4f	23ac8ae5-7452-4182-b51c-a70026bbe0d8	bbc128c4-c3e1-4281-82c7-652d7065c721	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07	200	online	paid	\N	\N	2026-04-08 06:26:32.742324+00	f	\N	\N
ed54c744-ae11-4921-a1ad-7cbe20b45ac1	b0ad6445-eed2-49f7-9b7c-78fdf8a2a53d	2ee2c1a7-5fa1-4a20-9185-b1385b754870	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-06	200	online	paid	\N	\N	2026-04-08 06:27:05.551557+00	f	\N	\N
13fa913f-f1e0-4e7e-b362-d66cf676f75d	dbb5444e-976f-4d00-9769-c0111b85f5b6	58be7354-d953-4974-a887-1ccc5ccb1acd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07	50	online	paid	\N	\N	2026-04-08 06:27:32.961013+00	f	\N	\N
41c31fab-e85e-471b-9621-d9e817d1c159	dcf458bf-10c7-41f7-ab08-ed37fbfc4b2b	767b5de8-3ba8-4b67-ad24-b0681feb51a5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07	50	online	paid	\N	\N	2026-04-08 06:27:52.449381+00	f	\N	\N
a90b18ff-55fa-44fb-81d4-2f66de2206bd	9daa6e18-5bdb-420a-a5bf-8420c72c9e6e	e953cf25-fc2f-47cf-93d6-d74ca66951dd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07	300	online	paid	\N	\N	2026-04-08 06:28:16.467407+00	f	\N	\N
4f0641a2-91b8-4423-b7a1-4ab8169add7b	790d3d01-21ef-4976-82d4-af3adacb886c	2c2fec84-b45b-456c-87b2-de7365174599	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07	200	online	paid	\N	\N	2026-04-08 06:28:41.431879+00	f	\N	\N
f36b55ee-67a5-413a-8b2a-3a9b415d0eb7	7d755464-aa72-4aab-9028-a75e09410ff6	20ccdb2b-c6ad-4063-9dfd-a34c50adac5e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07	500	online	paid	\N	\N	2026-04-08 06:29:04.690658+00	f	\N	\N
9974471c-69a1-4ec8-8c63-c41fba96dc26	586c004c-3e6b-40bf-a2f5-cd3a1fdfe4c0	e69b67ff-1841-47c7-832c-f2e85f48bae0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07	300	online	paid	\N	\N	2026-04-08 06:31:18.443022+00	f	\N	\N
acbafed1-0530-43fc-b9dc-7c4008383167	eec56395-bc3e-4592-8a21-7b694944b6eb	bd6c3241-ee7a-49a4-8f31-6ca7af5980d8	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07	600	online	paid	\N	\N	2026-04-08 06:31:40.49213+00	f	\N	\N
42db212d-e81f-4c47-bea2-fa0ca00fcd96	27559805-98ca-4b40-a167-933eea4a69bb	9c2457d7-dd54-4968-bf51-e43a0ecb49f3	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07	6000	online	paid	\N	\N	2026-04-08 06:32:04.413418+00	f	\N	\N
e380ef84-bafb-414d-90a4-18ebb62b36d4	6735cbe7-8e3f-41f0-b16c-9b60d974d6ec	5ba941ae-382e-452e-a5b3-8cdff26f1c7d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07	2000	online	paid	\N	\N	2026-04-08 06:33:14.266102+00	f	\N	\N
fd2086a1-6868-4335-9965-1b9d75de7300	6aac96ea-eb26-460a-8340-ffb355953ae0	8e423e8d-c1ce-4d07-9860-fd7df34eaf44	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07	400	online	paid	\N	\N	2026-04-08 06:34:26.375695+00	f	\N	\N
afe7f138-7a0f-467b-895a-95c2f8c58804	dbb5444e-976f-4d00-9769-c0111b85f5b6	58be7354-d953-4974-a887-1ccc5ccb1acd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13	50	online	paid	\N	\N	2026-04-13 14:16:52.715227+00	f	\N	\N
ac90b708-a22b-438f-b31f-125238e39fa9	6aac96ea-eb26-460a-8340-ffb355953ae0	8e423e8d-c1ce-4d07-9860-fd7df34eaf44	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13	400	online	paid	\N	\N	2026-04-13 15:21:23.479077+00	f	\N	\N
4fac2a7e-48c3-4572-b61a-5921f43e6512	89d5c659-aa6c-4a99-b0fc-f737d9e8e0e4	111a604f-46f8-4271-8912-ccbe479ab3ef	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13	1500	online	paid	\N	\N	2026-04-13 15:45:06.499481+00	f	\N	\N
60ba6912-1734-409c-a984-7a7501ba5f5d	d11d1904-a5c2-4fd5-8ebc-c800d6ced0b2	7c5e25ec-8d9d-4d6c-80b8-2ad0bfd12cee	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07	150	online	paid	\N	\N	2026-04-08 06:29:26.765177+00	f	\N	\N
6d93716e-be98-4bb0-b316-87a9abe6b578	6d60857f-7cd1-437e-a536-c9d04949b1c7	d6c5de5c-32f1-4075-bce2-9a151bb80cb0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07	500	online	paid	\N	\N	2026-04-08 06:29:49.475085+00	f	\N	\N
b2029d45-4823-4116-899c-dd2547308b97	89d5c659-aa6c-4a99-b0fc-f737d9e8e0e4	111a604f-46f8-4271-8912-ccbe479ab3ef	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07	1500	online	paid	\N	\N	2026-04-08 06:30:15.75803+00	f	\N	\N
23bb5e4d-5702-40c5-8253-9a8b27df4911	7d1ca2e6-5ac0-47d0-9b5b-6080fb746026	f8942243-6f41-4580-bb7a-b78101128ade	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07	700	online	paid	\N	\N	2026-04-08 06:30:41.5211+00	f	\N	\N
406bc5ef-e366-434c-8389-dba889fdae1c	0d8641d3-1860-4dac-8f9c-a7362226fe97	682ad2e5-1d22-4c44-a132-b8580c165d1d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07	1800	online	paid	\N	\N	2026-04-08 06:32:27.141473+00	f	\N	\N
999d4996-6803-4dfd-87ee-85c9cd8a88fd	a0d4dce0-9bdd-4cf1-ad5d-1c95cf18e2dd	dfa34099-366b-4a3e-85ef-eb12e94f4083	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07	300	online	paid	\N	\N	2026-04-08 06:32:54.190542+00	f	\N	\N
31314f02-3b23-4d63-9bf7-ecffca0a38a4	22d10045-ef1c-4807-9278-c35dbb01d73f	db261798-826e-4d7b-9fc7-a4dba55df1f3	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07	200	online	paid	\N	\N	2026-04-08 06:33:55.500259+00	f	\N	\N
9a4dcc9d-826f-4205-a165-d4c2de5889e9	6245a2e8-2eb5-4d5f-8b8a-aac817bfee18	55efd7cf-1188-4423-9a53-8ee2c53002fa	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07	200	online	paid	\N	\N	2026-04-08 06:34:48.024514+00	f	\N	\N
6b62a607-4458-4224-a463-943b108b1cf2	ba9ab57b-e2d8-4c2a-902d-effb7b810b03	a3f57a0f-8bdf-47f7-a94d-819924cdc08a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07	2000	online	paid	\N	\N	2026-04-08 06:35:12.108391+00	f	\N	\N
e03c2988-0eb1-4787-b03f-45bdc50567e3	32e40b35-8c4b-4552-b8b8-7c233d31c03d	757d4684-58bf-40d2-bfdd-ec9921ff94d7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07	250	online	paid	\N	\N	2026-04-08 06:35:46.836149+00	f	\N	\N
76de0b1a-fac7-4da8-9f2d-a2eaa40997d6	f35169da-5d69-4e7e-a35e-ed6237a94cff	6398b3f9-45c4-45b0-a7fc-0e3e1ced4173	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07	500	online	paid	\N	\N	2026-04-08 06:36:14.293969+00	f	\N	\N
5f1b6615-ed69-4853-acf1-62ac22b3cd9f	9a636e37-de02-451a-981d-4bf513dce4eb	91f3e941-a2bf-44ce-9e3b-6a6f4a19af54	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07	600	online	paid	\N	\N	2026-04-08 06:37:47.607929+00	f	\N	\N
874db7b6-9310-4394-b060-0ca2b522eb1d	481d1580-100a-4f65-bc22-32aac9182e37	8fdc0983-6869-49ab-ba2e-866ebe6f7f5b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07	250	online	paid	\N	\N	2026-04-08 06:38:15.574017+00	f	\N	\N
35defb68-320b-4c17-af73-90c1528d2d86	1cac3c77-d86c-41b8-ba55-2b1f74410661	5d640f92-1900-47f5-bb7e-a6ab5061d564	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07	200	online	paid	\N	\N	2026-04-08 06:38:39.194262+00	f	\N	\N
e190e302-b9f1-4971-81cd-37afe8d6ac29	35038458-ade9-412d-877d-814bb95adf5d	794af05e-0e94-449e-90ee-691d82534c27	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08	200	online	paid	\N	\N	2026-04-08 06:39:09.742758+00	f	\N	\N
cc42c018-1fbd-43a7-90e3-30d7569e0376	250eeece-4579-4cc4-86f9-0cdd866fbd24	e3c2af50-d0e2-461a-bfc2-67efd23feb46	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07	100	online	paid	\N	\N	2026-04-08 06:39:31.063151+00	f	\N	\N
adc12283-10b8-49ba-b989-044adb3030e5	2a8f0801-a95d-49fb-a6a0-f9a9a84c463b	35899642-c883-4c26-a7ad-8e41a391be2b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07	500	online	paid	\N	\N	2026-04-08 06:39:55.52348+00	f	\N	\N
f575936c-973c-40c6-81d7-fe9ae28efd22	2a8f0801-a95d-49fb-a6a0-f9a9a84c463b	35899642-c883-4c26-a7ad-8e41a391be2b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07	500	online	paid	\N	\N	2026-04-08 06:41:10.898475+00	f	\N	\N
9d2a46cc-9b39-4f9e-8865-870c96296a63	b0ad6445-eed2-49f7-9b7c-78fdf8a2a53d	2ee2c1a7-5fa1-4a20-9185-b1385b754870	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07	200	online	paid	\N	\N	2026-04-08 06:41:45.192157+00	f	\N	\N
fcf3b0a6-3ea7-4e00-b577-8c62e59efcdf	c5f80bd8-670e-4df5-8c6a-ac7378801077	3a181c18-8f9e-4467-96a8-c09687ebea27	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-07	2000	online	paid	\N	\N	2026-04-08 06:42:08.850633+00	f	\N	\N
cfd47c19-dce4-4d9d-9fc5-eae49361170f	cb5975f3-72b1-4cc9-bd02-81342334cb40	6043f054-834d-437f-860a-7f9269935958	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08	600	online	paid	\N	\N	2026-04-08 06:42:38.200468+00	f	\N	\N
a7e9bd27-599c-4b05-82f4-81455ca7574e	860f25ca-39ff-42f0-bacb-e409bd6007d7	71d81887-5e21-4486-97e6-faea2c876cff	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08	200	online	paid	\N	\N	2026-04-08 06:42:57.919547+00	f	\N	\N
5b6b5ed8-3ee8-4e3a-9024-8bcbfcba1cb6	9252d856-84b5-47ad-870a-5df022b6adad	afce7d49-4090-4783-be84-18d8cd7ca24f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08	5000	online	paid	\N	\N	2026-04-08 06:43:19.045119+00	f	\N	\N
574cc5b1-e9ab-498e-9bed-881a0ec865ab	6d60857f-7cd1-437e-a536-c9d04949b1c7	d6c5de5c-32f1-4075-bce2-9a151bb80cb0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08	500	online	paid	\N	\N	2026-04-08 06:43:40.920479+00	f	\N	\N
29d6ced3-0c0b-4eaf-af5e-38f1419a06c2	790d3d01-21ef-4976-82d4-af3adacb886c	2c2fec84-b45b-456c-87b2-de7365174599	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08	100	online	paid	\N	\N	2026-04-08 06:43:59.237444+00	f	\N	\N
63af2932-f0be-4602-8314-da848ec5d0b4	ba9ab57b-e2d8-4c2a-902d-effb7b810b03	a3f57a0f-8bdf-47f7-a94d-819924cdc08a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08	2000	online	paid	\N	\N	2026-04-08 06:44:17.023026+00	f	\N	\N
79d20e88-2509-4de9-8bb8-861594b86164	80752817-7c75-426b-a97e-361b246ec563	135460a0-56bf-4c17-a4a8-5e66f29b52f6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08	300	cash	paid	\N	\N	2026-04-08 06:46:27.486299+00	f	\N	\N
4af1cb2b-09ce-4d83-a9ef-dee406a504b1	019b4424-175f-4bb1-9c64-bd2fb04a8ae4	1ff2e9b9-5867-4348-a67b-0a6601d52ce9	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08	50	cash	paid	\N	\N	2026-04-08 06:46:57.796029+00	f	\N	\N
afd59da7-b8ac-46af-ab67-4b3e448ac8e0	046f033d-2013-4dbe-9ac8-947af0d1e115	de360bdb-ec38-4f27-ae4f-69ebeac5f619	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08	500	cash	paid	\N	\N	2026-04-08 06:48:03.923484+00	f	\N	\N
2e85ebfa-97c6-4c1f-988c-3f6b659e5073	dbb5444e-976f-4d00-9769-c0111b85f5b6	58be7354-d953-4974-a887-1ccc5ccb1acd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08	50	online	paid	\N	\N	2026-04-08 08:02:55.586022+00	f	\N	\N
9c6a8099-6185-49c5-89c1-6c985441bef6	dcf458bf-10c7-41f7-ab08-ed37fbfc4b2b	767b5de8-3ba8-4b67-ad24-b0681feb51a5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08	50	online	paid	\N	\N	2026-04-08 08:03:13.406108+00	f	\N	\N
2d582046-f227-4b54-a8a9-ca20040bffbb	f196fdd7-e224-44d7-b6f4-4cbde8b41ae7	6f78d33f-a984-4473-8399-ef2303ccc92e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08	3000	cash	paid	\N	\N	2026-04-08 12:34:07.255582+00	f	\N	\N
99d76a80-1d36-4731-be4f-1f3dbc5fd62a	a0d4dce0-9bdd-4cf1-ad5d-1c95cf18e2dd	dfa34099-366b-4a3e-85ef-eb12e94f4083	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08	300	online	paid	\N	\N	2026-04-08 13:37:19.810069+00	f	\N	\N
4bc3179f-17cd-4cfe-b8d5-6f439238e031	89d5c659-aa6c-4a99-b0fc-f737d9e8e0e4	111a604f-46f8-4271-8912-ccbe479ab3ef	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08	1500	online	paid	\N	\N	2026-04-08 13:38:05.425806+00	f	\N	\N
b2859a19-eb92-4b23-9d9e-9d64b407d800	9920fe35-b725-4a78-802d-61689d6993b2	b9ea214a-e90e-4ad5-a848-3b1005f2e89f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08	300	online	paid	\N	\N	2026-04-08 13:38:46.406889+00	f	\N	\N
6d78d42f-9e3b-4e32-b256-13563d8a109b	e0fca0e1-df99-497f-87e4-41be32ec1780	c18d8b95-c031-4110-85c8-b265a89efc50	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08	1000	online	paid	\N	\N	2026-04-08 13:39:04.714213+00	f	\N	\N
7028d60b-530e-46ce-b4e1-ccfeb8391ffd	f076e587-f2c0-423c-9441-07bde93baeb3	e71a649a-865d-492c-a7ac-b2f37247b836	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08	500	online	paid	\N	\N	2026-04-08 13:48:14.987576+00	f	\N	\N
7f47eb2f-dda8-4722-b1bc-01ff713f65d1	e3325ec8-264a-41e1-a2d5-84fb33eb4412	c2c54c13-fb99-4e5d-9f99-1bddf98beb5b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08	1000	online	paid	\N	\N	2026-04-08 13:49:37.484724+00	f	\N	\N
1ed996cd-70a6-47b6-a086-cf1cdcf2a10a	93906c36-47ae-41bb-bb4c-a594f08896b3	27e0e2f9-8d55-4cf8-a605-3a1b95f3c368	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08	500	online	paid	\N	\N	2026-04-08 13:53:09.045619+00	f	\N	\N
3463a3fe-7b6d-48c2-a318-a592c0adc044	b9bd3700-24a0-4fa2-9afa-ca0827c26188	b80d47c9-3d98-41cd-9037-7ddcdac87f0c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08	1000	online	paid	\N	\N	2026-04-08 13:58:34.227756+00	f	\N	\N
4bd396fb-f825-42a2-8a02-c8b622732399	f35169da-5d69-4e7e-a35e-ed6237a94cff	6398b3f9-45c4-45b0-a7fc-0e3e1ced4173	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08	500	online	paid	\N	\N	2026-04-08 13:58:54.318222+00	f	\N	\N
90be2755-5672-490f-81af-d59312922317	7d1ca2e6-5ac0-47d0-9b5b-6080fb746026	f8942243-6f41-4580-bb7a-b78101128ade	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08	700	online	paid	\N	\N	2026-04-08 14:15:00.145979+00	f	\N	\N
c8fa54fa-f589-44aa-ac83-92b9b3b10773	2ff85cab-09cd-4175-94ce-d7ccba40ae21	755a8d09-2a14-49f6-b70f-147b5f5fa531	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08	5500	online	paid	\N	\N	2026-04-08 14:21:45.466274+00	f	\N	\N
827d4381-6681-4cde-8556-5cfffeec5fc2	2a8f0801-a95d-49fb-a6a0-f9a9a84c463b	35899642-c883-4c26-a7ad-8e41a391be2b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08	500	online	paid	\N	\N	2026-04-08 14:48:21.413317+00	f	\N	\N
81a0b220-8c07-4239-b0bc-821bfaa009f0	f8e88dc3-4e2d-4526-b66d-743bc434bc6e	7a03a63d-e3f1-48dd-b082-63ea18330321	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08	2000	online	paid	\N	\N	2026-04-08 14:50:04.008472+00	f	\N	\N
b42c17ea-dad5-4d5d-8870-91881d13c428	586c004c-3e6b-40bf-a2f5-cd3a1fdfe4c0	e69b67ff-1841-47c7-832c-f2e85f48bae0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08	300	online	paid	\N	\N	2026-04-08 15:06:35.640623+00	f	\N	\N
092dd942-f377-4740-91f1-0ef2cda8dce5	84cf3d8e-64cc-4a90-8b33-12c94640d00b	ebc8c94f-09bf-41ca-8522-f81f98fb1469	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08	700	cash	paid	\N	\N	2026-04-08 15:32:35.950619+00	f	\N	\N
abd8d239-b96c-4785-99e7-bba8d07082e1	b22b99e0-ad0d-4b0b-bdeb-7f6883ff97c1	9b75966e-2f2f-476f-b255-0bd24264a797	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08	200	cash	paid	\N	\N	2026-04-08 15:33:12.575172+00	f	\N	\N
7d31f0b7-8ba5-46c6-b3b3-b9d5b9fc95d3	a529d878-71a9-4774-8ef5-b4e2ce601e22	c7a9948d-1c6b-40d9-a8b5-23c2597bf9f0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08	100	cash	paid	\N	\N	2026-04-08 15:33:34.167739+00	f	\N	\N
e37a3b9e-340f-4747-a961-02d1a1bac317	8926b943-bda3-4c36-aa29-4f8576e75e90	735cd1ad-a76d-4026-87dc-60f501454b7a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08	600	cash	paid	\N	\N	2026-04-08 15:34:29.644042+00	f	\N	\N
b4ea1ab8-b690-4f9b-a796-8e04f1c2b488	5fecec3a-5262-4cfd-8464-57abf6fd6c0c	509f1fd9-7517-4b8b-a57b-817bd7e6f823	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08	300	cash	paid	\N	\N	2026-04-08 15:34:58.143838+00	f	\N	\N
014e8674-3461-496f-84e2-769cb4e3aa45	4686827e-4849-4bfa-88aa-129912510008	5cebdb10-f359-495d-983b-766489065f26	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08	200	cash	paid	\N	\N	2026-04-08 15:35:42.671632+00	f	\N	\N
892ffa4c-8dc0-45b7-a291-47056a680213	2d860b86-e289-45b9-b108-3ecc32fafe18	adbe0a7a-d431-41af-9a40-6fdc864df6ab	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08	500	cash	paid	\N	\N	2026-04-08 15:42:32.2819+00	f	\N	\N
316d4de0-8386-40a2-b8a2-abeae3840b40	4bf7d91d-6da6-4d5d-9db0-30b196a13651	6f37b184-d886-4b91-a179-60f467b3e51d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08	300	cash	paid	\N	\N	2026-04-08 15:43:49.279614+00	f	\N	\N
d81f2b54-8e02-467a-9be3-f5082c188f38	44e44d3f-1c42-41fa-8bf1-2bdb5bf219c7	2647ddf3-5d7a-405f-be10-8cb5f12edb5d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08	200	cash	paid	\N	\N	2026-04-08 15:49:41.033962+00	f	\N	\N
b21fe8ec-1bca-4c56-b409-1a3f73ad864e	1ca2f5d0-fc1b-49ab-8443-25574737d3cf	18d2e760-ed6d-44b0-af27-6b7cb9d6ddbb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08	100	cash	paid	\N	\N	2026-04-08 15:50:25.435683+00	f	\N	\N
96d90a1f-db09-410a-ae04-837986ead369	d59ecb10-5af9-4f75-8f43-dfc52d537f0c	400fb688-b2dd-42c2-b2f6-c2c3a6bff5bd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08	200	cash	paid	\N	\N	2026-04-08 15:53:40.055175+00	f	\N	\N
76b4af8d-8194-434e-a55d-1a5b36d20313	70b6dbb8-0fb8-4661-a0cd-21955635a422	e4c1ab58-7506-40bb-87cd-40a3069fb9d7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-08	1300	online	paid	\N	\N	2026-04-08 16:52:07.282455+00	f	\N	\N
c768d033-2329-4128-a44d-b9c5c2be5914	bee2c977-93c0-44ef-874e-a76e53e40a51	aa68ef20-1754-401b-9bfc-b8f2c49b0a4e	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09	1200	online	paid	\N	\N	2026-04-09 03:23:49.694989+00	f	\N	\N
2348992e-f7af-45d3-8885-cfb7ffdb0c80	35038458-ade9-412d-877d-814bb95adf5d	794af05e-0e94-449e-90ee-691d82534c27	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09	200	online	paid	\N	\N	2026-04-09 03:24:39.425141+00	f	\N	\N
a92a8c5c-0751-42d1-90cf-f2b6abf579a6	dbb5444e-976f-4d00-9769-c0111b85f5b6	58be7354-d953-4974-a887-1ccc5ccb1acd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09	50	online	paid	\N	\N	2026-04-09 03:25:08.957805+00	f	\N	\N
72f11017-d63c-40f3-a928-feffb2d6346e	dcf458bf-10c7-41f7-ab08-ed37fbfc4b2b	767b5de8-3ba8-4b67-ad24-b0681feb51a5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09	50	online	paid	\N	\N	2026-04-09 03:25:22.455082+00	f	\N	\N
657eab98-20c9-4a4e-b858-6fb8b6272786	046f033d-2013-4dbe-9ac8-947af0d1e115	de360bdb-ec38-4f27-ae4f-69ebeac5f619	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09	500	cash	paid	\N	\N	2026-04-09 05:19:59.742666+00	f	\N	\N
b6725bad-6e98-43c8-923c-955dad8309a2	80752817-7c75-426b-a97e-361b246ec563	135460a0-56bf-4c17-a4a8-5e66f29b52f6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09	300	cash	paid	\N	\N	2026-04-09 05:20:51.381942+00	f	\N	\N
e7c9f4bd-3e84-4c0b-9120-92162ddde725	6d60857f-7cd1-437e-a536-c9d04949b1c7	d6c5de5c-32f1-4075-bce2-9a151bb80cb0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09	500	online	paid	\N	\N	2026-04-09 05:42:13.22523+00	f	\N	\N
0ba41e28-7e48-4be2-9c43-c7af83cf4535	6cf22fba-6b26-402d-bb6f-abe871f7f809	abf45939-1742-4ed0-adf6-0a8813234da2	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09	2000	online	paid	\N	\N	2026-04-09 05:44:02.205346+00	f	\N	\N
70c594ac-347b-41bf-9ac2-9b1c71a66186	019b4424-175f-4bb1-9c64-bd2fb04a8ae4	1ff2e9b9-5867-4348-a67b-0a6601d52ce9	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09	50	online	paid	\N	\N	2026-04-09 05:48:52.269153+00	f	\N	\N
a1d77093-2ec5-436e-a013-900b04928325	6aac96ea-eb26-460a-8340-ffb355953ae0	8e423e8d-c1ce-4d07-9860-fd7df34eaf44	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09	400	online	paid	\N	\N	2026-04-09 07:16:26.698275+00	f	\N	\N
1a952f9f-8ca0-422e-a27b-045e97c63d61	7d1ca2e6-5ac0-47d0-9b5b-6080fb746026	f8942243-6f41-4580-bb7a-b78101128ade	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09	700	online	paid	\N	\N	2026-04-09 07:17:22.498128+00	f	\N	\N
590cd3be-73a3-447b-873d-bb81c9849b3a	e9b6d72d-0b4a-450d-8c1d-4d79ce11223a	b80a9434-712e-4a9a-aadb-75c2ee7549a8	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09	400	cash	paid	\N	\N	2026-04-09 14:33:41.282888+00	f	\N	\N
424a4284-8897-4f6e-800a-db4a65c34c88	cf301afd-a3ed-4bea-9794-b4fe432d8861	8419a9be-df12-416f-81ce-3570f9a82a4c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09	600	cash	paid	\N	\N	2026-04-09 14:34:36.38315+00	f	\N	\N
d1446196-2d2c-453e-a889-65a73cfb36ad	6c56e1c0-92ef-426c-8b5f-f6a9eac0ebc0	8e9719ac-05c9-42c8-8485-6fb4bd7d46d9	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09	1200	cash	paid	\N	\N	2026-04-09 15:34:28.733267+00	f	\N	\N
f0c8ad3b-e347-40ed-959c-5e7270ba3e8f	1ca2f5d0-fc1b-49ab-8443-25574737d3cf	18d2e760-ed6d-44b0-af27-6b7cb9d6ddbb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09	100	cash	paid	\N	\N	2026-04-09 15:40:22.608576+00	f	\N	\N
d9e4b05c-8867-42f8-9d99-a37c7abe4c9d	44e44d3f-1c42-41fa-8bf1-2bdb5bf219c7	2647ddf3-5d7a-405f-be10-8cb5f12edb5d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09	200	cash	paid	\N	\N	2026-04-09 15:40:43.787879+00	f	\N	\N
98e13551-6ce8-46ee-9a2f-547d878e0f41	d59ecb10-5af9-4f75-8f43-dfc52d537f0c	400fb688-b2dd-42c2-b2f6-c2c3a6bff5bd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09	200	cash	paid	\N	\N	2026-04-09 15:42:41.174373+00	f	\N	\N
48a0619a-ee61-4bf6-b9aa-13edcb2218c1	a529d878-71a9-4774-8ef5-b4e2ce601e22	c7a9948d-1c6b-40d9-a8b5-23c2597bf9f0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09	100	cash	paid	\N	\N	2026-04-09 15:43:14.566422+00	f	\N	\N
c4a2e82f-9e5e-4b8c-aaf8-5c20ae947a47	b22b99e0-ad0d-4b0b-bdeb-7f6883ff97c1	9b75966e-2f2f-476f-b255-0bd24264a797	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09	200	cash	paid	\N	\N	2026-04-09 15:43:35.666541+00	f	\N	\N
744def65-cd3e-4540-9b4c-371042ddad23	aed1fa37-b39e-453a-96ac-b79ba3f4889c	191731f2-5b78-401c-8cec-590024f34df2	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09	3500	cash	paid	\N	\N	2026-04-10 05:40:37.965245+00	f	\N	\N
1337b7f0-a904-4f57-b6ad-6a8820f83e8b	0730e6a0-07e6-44f1-b129-097c3fb6e85c	8933fd28-5d64-4ec9-9cd9-d5b594fff1eb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09	50	online	paid	\N	\N	2026-04-10 05:43:42.71704+00	f	\N	\N
0a671af7-2d6f-441e-9c77-370d9a64a106	6aac96ea-eb26-460a-8340-ffb355953ae0	8e423e8d-c1ce-4d07-9860-fd7df34eaf44	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09	400	online	paid	\N	\N	2026-04-10 05:44:08.121319+00	f	\N	\N
4e749728-b8bd-42c5-8aa2-dc3185ed68be	61b47ec3-e7e1-4a78-8784-836a84315124	e7f677ba-fc98-4aa6-b8e1-f5365ecb34c7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09	1000	online	paid	\N	\N	2026-04-10 05:44:40.098686+00	f	\N	\N
7af3287e-b739-4ba9-a253-b115896ebd01	ea7436e5-3b5c-49c8-87e4-6d727b2c2e50	cb603d85-d775-4680-bee6-2c42f0b3e767	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09	500	online	paid	\N	\N	2026-04-10 05:45:10.284246+00	f	\N	\N
9cccd191-6652-451d-b38b-20291b110dc8	89d5c659-aa6c-4a99-b0fc-f737d9e8e0e4	111a604f-46f8-4271-8912-ccbe479ab3ef	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09	1500	online	paid	\N	\N	2026-04-10 05:45:33.623441+00	f	\N	\N
37648639-b889-4167-b57a-e29bf4fae2a1	a0d4dce0-9bdd-4cf1-ad5d-1c95cf18e2dd	dfa34099-366b-4a3e-85ef-eb12e94f4083	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09	300	online	paid	\N	\N	2026-04-10 05:46:14.250152+00	f	\N	\N
cd4162f4-db3c-48fc-a87a-6e97f6db65ad	d11d1904-a5c2-4fd5-8ebc-c800d6ced0b2	7c5e25ec-8d9d-4d6c-80b8-2ad0bfd12cee	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09	150	online	paid	\N	\N	2026-04-10 05:46:48.086535+00	f	\N	\N
f59b77c9-a719-4e64-a09d-619fb48d533e	9920fe35-b725-4a78-802d-61689d6993b2	b9ea214a-e90e-4ad5-a848-3b1005f2e89f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09	300	online	paid	\N	\N	2026-04-10 05:47:10.697103+00	f	\N	\N
c4e6ccdb-d22e-4672-9bd7-929481fdd5db	cb5975f3-72b1-4cc9-bd02-81342334cb40	6043f054-834d-437f-860a-7f9269935958	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09	200	online	paid	\N	\N	2026-04-10 05:47:35.311331+00	f	\N	\N
7d346405-2e7d-4281-8bcd-691e1a0974ef	6245a2e8-2eb5-4d5f-8b8a-aac817bfee18	55efd7cf-1188-4423-9a53-8ee2c53002fa	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09	200	online	paid	\N	\N	2026-04-10 05:47:57.265578+00	f	\N	\N
5fff48e2-d196-442e-8917-5e37eb94a6c9	e0fca0e1-df99-497f-87e4-41be32ec1780	c18d8b95-c031-4110-85c8-b265a89efc50	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09	500	online	paid	\N	\N	2026-04-10 05:48:23.006879+00	f	\N	\N
115f29b2-ef09-4e66-a7e3-35e0cd0d465d	f076e587-f2c0-423c-9441-07bde93baeb3	e71a649a-865d-492c-a7ac-b2f37247b836	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09	500	online	paid	\N	\N	2026-04-10 05:48:50.029509+00	f	\N	\N
5da4bf05-f763-4b75-acb9-f262013746f1	b0ad6445-eed2-49f7-9b7c-78fdf8a2a53d	2ee2c1a7-5fa1-4a20-9185-b1385b754870	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09	400	online	paid	\N	\N	2026-04-10 05:49:10.947712+00	f	\N	\N
64646fdb-05fa-4bd8-ac5a-2a35b7055e20	2a8f0801-a95d-49fb-a6a0-f9a9a84c463b	35899642-c883-4c26-a7ad-8e41a391be2b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09	500	online	paid	\N	\N	2026-04-10 05:49:44.395477+00	f	\N	\N
ca00da6a-bdbe-4370-a3a3-4426699c2550	56da2e53-1358-4168-8c6e-cee12fe29c59	0e59bad3-eae7-435d-b166-6f5e876b3785	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09	500	online	paid	\N	\N	2026-04-10 05:50:07.185114+00	f	\N	\N
9a4800ec-ea39-429c-adb6-329261cd76c8	250eeece-4579-4cc4-86f9-0cdd866fbd24	e3c2af50-d0e2-461a-bfc2-67efd23feb46	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09	100	online	paid	\N	\N	2026-04-10 05:50:29.733001+00	f	\N	\N
725c3352-afe3-4912-8a5d-9e95ae3f7f3b	481d1580-100a-4f65-bc22-32aac9182e37	8fdc0983-6869-49ab-ba2e-866ebe6f7f5b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09	500	online	paid	\N	\N	2026-04-10 05:51:06.499695+00	f	\N	\N
6dbceeef-5f4c-4e53-94db-4cfd2c628a02	591f4d1e-01f6-4c59-a2b0-7358e00a485d	6ffdf62b-44f6-4010-8ceb-e2878900e1b0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09	500	online	paid	\N	\N	2026-04-10 05:51:25.513645+00	f	\N	\N
efd7c930-c8ae-4b05-8dcb-f2a8a8079d30	963ccc89-3e62-4787-ae26-1b8b908b51c4	6064efcd-d142-44c8-864b-7f882850d18a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09	3000	online	paid	\N	\N	2026-04-10 05:51:52.036528+00	f	\N	\N
6b727061-2262-49db-8307-4835a641d2f3	34977a0a-e657-40cb-840d-a6df47bba8d3	d1929534-e23a-4d75-8031-6998ec8b0810	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09	1000	online	paid	\N	\N	2026-04-10 05:52:16.320194+00	f	\N	\N
994dc8aa-88a0-4b81-8a04-c525691fb9ca	9daa6e18-5bdb-420a-a5bf-8420c72c9e6e	e953cf25-fc2f-47cf-93d6-d74ca66951dd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10	300	online	paid	\N	\N	2026-04-10 05:55:41.482008+00	f	\N	\N
d5f8a8fd-dcbb-444b-aed2-518ac5f1470d	67eb359b-25a2-481e-ae53-c208688f5940	7ebb952f-b8ce-452d-a076-36b5efc9d1c5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10	900	online	paid	\N	\N	2026-04-10 05:56:02.875188+00	f	\N	\N
dd417d1f-bc1d-410b-9d81-adf27081e2b0	35038458-ade9-412d-877d-814bb95adf5d	794af05e-0e94-449e-90ee-691d82534c27	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10	200	online	paid	\N	\N	2026-04-10 05:56:20.669354+00	f	\N	\N
7368272f-6aeb-48ed-a054-e1d3b23bbeec	bcb87a68-a59d-438f-b81a-e5a4a6b666c1	b4a8d905-3198-4d75-8ee3-3800ec8f2b40	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10	1000	online	paid	\N	\N	2026-04-10 13:25:47.959649+00	f	\N	\N
e569be0b-3fae-45de-8586-e2b59c412263	23ac8ae5-7452-4182-b51c-a70026bbe0d8	bbc128c4-c3e1-4281-82c7-652d7065c721	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10	0	cash	not_paid	\N	\N	2026-04-10 05:53:37.92642+00	f	\N	\N
5347e812-7ad1-430d-9d17-ba448e8c597d	23ac8ae5-7452-4182-b51c-a70026bbe0d8	bbc128c4-c3e1-4281-82c7-652d7065c721	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-09	100	cash	paid	\N	\N	2026-04-10 06:15:30.442493+00	f	\N	\N
93076fa1-4092-4f5a-9f53-65bc637ebadb	0730e6a0-07e6-44f1-b129-097c3fb6e85c	8933fd28-5d64-4ec9-9cd9-d5b594fff1eb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10	0	cash	not_paid	\N	\N	2026-04-10 05:54:01.909875+00	f	\N	\N
12c62701-8f3e-49db-b6c8-49814ad727f2	e3325ec8-264a-41e1-a2d5-84fb33eb4412	c2c54c13-fb99-4e5d-9f99-1bddf98beb5b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10	500	online	paid	\N	\N	2026-04-10 08:46:41.968663+00	f	\N	\N
fd0901e1-be70-4a35-8014-0cd35b518337	eec56395-bc3e-4592-8a21-7b694944b6eb	bd6c3241-ee7a-49a4-8f31-6ca7af5980d8	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10	600	online	paid	\N	\N	2026-04-10 08:47:09.781117+00	f	\N	\N
af063555-a223-4218-bc09-7582feb45f7a	6d60857f-7cd1-437e-a536-c9d04949b1c7	d6c5de5c-32f1-4075-bce2-9a151bb80cb0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10	500	online	paid	\N	\N	2026-04-10 08:47:42.458441+00	f	\N	\N
cc83d964-f324-4951-97fa-9baea559ed9b	b9bd3700-24a0-4fa2-9afa-ca0827c26188	b80d47c9-3d98-41cd-9037-7ddcdac87f0c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10	400	online	paid	\N	\N	2026-04-10 13:25:10.447022+00	f	\N	\N
53690c12-213d-4950-a468-37e7996c5e37	e0fca0e1-df99-497f-87e4-41be32ec1780	c18d8b95-c031-4110-85c8-b265a89efc50	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10	500	online	paid	\N	\N	2026-04-10 13:26:08.621638+00	f	\N	\N
b0a6acf9-273f-4965-bc6c-2310e14e7472	dbb5444e-976f-4d00-9769-c0111b85f5b6	58be7354-d953-4974-a887-1ccc5ccb1acd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10	50	online	paid	\N	\N	2026-04-10 13:26:30.988208+00	f	\N	\N
a57bcda2-4653-4b37-9d45-a1fa76835c62	dcf458bf-10c7-41f7-ab08-ed37fbfc4b2b	767b5de8-3ba8-4b67-ad24-b0681feb51a5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10	50	online	paid	\N	\N	2026-04-10 13:26:46.404644+00	f	\N	\N
38b2ae29-ba08-419e-8c3c-238d1359d709	a0d4dce0-9bdd-4cf1-ad5d-1c95cf18e2dd	dfa34099-366b-4a3e-85ef-eb12e94f4083	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10	300	online	paid	\N	\N	2026-04-10 13:27:20.175692+00	f	\N	\N
31342768-f36f-4233-9698-ac879d74e5cf	89d5c659-aa6c-4a99-b0fc-f737d9e8e0e4	111a604f-46f8-4271-8912-ccbe479ab3ef	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10	1500	online	paid	\N	\N	2026-04-10 13:27:39.543844+00	f	\N	\N
b740ee88-5cd2-4563-8b05-1ea6dcffd739	1f87a89f-83e6-4c4a-ab6b-15d208b3b778	1bc4abc0-e370-49f3-b77c-87aabf4bfa85	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10	500	online	paid	\N	\N	2026-04-10 13:40:19.974536+00	f	\N	\N
1d1e6980-bf18-45cf-b1c4-aae01baeb47e	4686827e-4849-4bfa-88aa-129912510008	5cebdb10-f359-495d-983b-766489065f26	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10	200	online	paid	\N	\N	2026-04-10 13:44:42.894674+00	f	\N	\N
95601a4d-dbed-459a-8140-b5164a3097ff	2a8f0801-a95d-49fb-a6a0-f9a9a84c463b	35899642-c883-4c26-a7ad-8e41a391be2b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10	500	online	paid	\N	\N	2026-04-10 13:45:09.82611+00	f	\N	\N
31b6af1d-1591-4c63-a720-03aff61f39df	2c143dd6-c039-4a59-8c14-02bf93b00f0a	ed00e1c1-e744-4da2-a624-7dbc07c94b87	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10	200	online	paid	\N	\N	2026-04-10 14:02:33.378132+00	f	\N	\N
a4d1c626-da49-4d2a-9e0a-221b3cfbba6a	7d1ca2e6-5ac0-47d0-9b5b-6080fb746026	f8942243-6f41-4580-bb7a-b78101128ade	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10	700	online	paid	\N	\N	2026-04-10 14:03:05.959155+00	f	\N	\N
cf096a7e-dd6d-4ea1-892c-e289fb3c33a8	22d10045-ef1c-4807-9278-c35dbb01d73f	db261798-826e-4d7b-9fc7-a4dba55df1f3	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10	200	online	paid	\N	\N	2026-04-10 14:13:35.456235+00	f	\N	\N
606b2fce-10db-479b-b7f7-c015885f3f69	1ca2f5d0-fc1b-49ab-8443-25574737d3cf	18d2e760-ed6d-44b0-af27-6b7cb9d6ddbb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10	100	cash	paid	\N	\N	2026-04-10 14:41:43.679114+00	f	\N	\N
9fc347a6-5ca3-49d6-90a0-afb898f679cb	5fecec3a-5262-4cfd-8464-57abf6fd6c0c	509f1fd9-7517-4b8b-a57b-817bd7e6f823	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10	300	cash	paid	\N	\N	2026-04-10 14:42:05.579865+00	f	\N	\N
c33ed901-dc9a-4e98-9a7e-7bf6042b4c2c	84cf3d8e-64cc-4a90-8b33-12c94640d00b	ebc8c94f-09bf-41ca-8522-f81f98fb1469	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10	500	cash	paid	\N	\N	2026-04-10 14:42:26.103113+00	f	\N	\N
9f43bf71-983d-4aa6-a0fb-a80998cef894	d59ecb10-5af9-4f75-8f43-dfc52d537f0c	400fb688-b2dd-42c2-b2f6-c2c3a6bff5bd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10	200	cash	paid	\N	\N	2026-04-10 14:42:46.03565+00	f	\N	\N
66dff9dd-2f3a-4cb4-92cf-10ce1ce791f4	a529d878-71a9-4774-8ef5-b4e2ce601e22	c7a9948d-1c6b-40d9-a8b5-23c2597bf9f0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10	100	cash	paid	\N	\N	2026-04-10 14:43:19.114444+00	f	\N	\N
f0a64ca7-3c82-498d-839e-2d0b1faa3554	b22b99e0-ad0d-4b0b-bdeb-7f6883ff97c1	9b75966e-2f2f-476f-b255-0bd24264a797	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10	200	cash	paid	\N	\N	2026-04-10 14:43:42.75697+00	f	\N	\N
3627d8e3-1ae4-43e6-ad2d-4a176b261ce5	e9d54922-42db-42b1-ab59-8dd42d68af4c	fe889acf-38cf-4a1f-8fce-804d5304f246	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10	600	cash	paid	\N	\N	2026-04-10 14:58:26.631955+00	f	\N	\N
fcee3555-16af-4280-94cf-261a22fb228d	4bf7d91d-6da6-4d5d-9db0-30b196a13651	6f37b184-d886-4b91-a179-60f467b3e51d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10	300	cash	paid	\N	\N	2026-04-10 15:04:37.969411+00	f	\N	\N
58982214-7352-4362-aecf-90ac75025643	f076e587-f2c0-423c-9441-07bde93baeb3	e71a649a-865d-492c-a7ac-b2f37247b836	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10	500	online	paid	\N	\N	2026-04-10 15:47:12.166897+00	f	\N	\N
69810eec-9423-47bd-9f6f-bd59ed19279c	56da2e53-1358-4168-8c6e-cee12fe29c59	0e59bad3-eae7-435d-b166-6f5e876b3785	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10	1000	online	paid	\N	\N	2026-04-10 15:47:53.279166+00	f	\N	\N
c1b9ce49-819a-474c-8d2c-d98290dd7886	f5064908-4ea0-42c7-8a63-0ddfc2a80531	dc623009-9752-43d7-b22a-384740599eb7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10	500	cash	paid	\N	\N	2026-04-10 16:04:13.13623+00	f	\N	\N
708351ea-84b6-4b31-9f7d-6e1ebb002eff	250eeece-4579-4cc4-86f9-0cdd866fbd24	e3c2af50-d0e2-461a-bfc2-67efd23feb46	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10	100	online	paid	\N	\N	2026-04-10 16:05:54.837402+00	f	\N	\N
89ea621f-5a08-48ed-be51-81111c752392	6245a2e8-2eb5-4d5f-8b8a-aac817bfee18	55efd7cf-1188-4423-9a53-8ee2c53002fa	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10	200	online	paid	\N	\N	2026-04-10 16:06:26.691709+00	f	\N	\N
89aa5dca-f49c-4fed-8188-b2e290bc66d5	651c7fb2-68bf-46d8-bf93-3f25bf5c8dab	6d5f5859-9f8b-466b-8a58-336b620889eb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10	2500	online	paid	\N	\N	2026-04-10 16:07:48.411579+00	f	\N	\N
1788e316-4412-4365-acd7-d19b5c827a54	b16866ff-ba34-412f-aeea-fa734ccf88a1	a3742c80-66e9-443f-8ab2-a145af754194	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10	1000	cash	paid	\N	\N	2026-04-10 16:08:09.471513+00	f	\N	\N
34b191bc-5af9-4fa4-8eb6-d3cd2d5615ac	70b6dbb8-0fb8-4661-a0cd-21955635a422	e4c1ab58-7506-40bb-87cd-40a3069fb9d7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10	1300	online	paid	\N	\N	2026-04-10 16:26:31.121501+00	f	\N	\N
abc4d949-06b2-4df3-998f-a9a69f1cc1cb	f35169da-5d69-4e7e-a35e-ed6237a94cff	6398b3f9-45c4-45b0-a7fc-0e3e1ced4173	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10	1000	online	paid	\N	\N	2026-04-10 17:15:03.50329+00	f	\N	\N
9e36ebaa-5940-4947-91a5-97ba69330223	b0ad6445-eed2-49f7-9b7c-78fdf8a2a53d	2ee2c1a7-5fa1-4a20-9185-b1385b754870	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10	200	online	paid	\N	\N	2026-04-10 17:54:01.919212+00	f	\N	\N
3ce2c244-f585-4dd0-b8fb-01c208fc8462	61b47ec3-e7e1-4a78-8784-836a84315124	e7f677ba-fc98-4aa6-b8e1-f5365ecb34c7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11	1000	online	paid	\N	\N	2026-04-11 00:15:32.184146+00	f	\N	\N
1a7afa43-2b6f-4b98-ac07-bb45c1fa0e48	dbb5444e-976f-4d00-9769-c0111b85f5b6	58be7354-d953-4974-a887-1ccc5ccb1acd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11	50	online	paid	\N	\N	2026-04-11 00:16:18.793487+00	f	\N	\N
d46a9224-e3fc-4862-a7c9-58674a1d6f3d	dcf458bf-10c7-41f7-ab08-ed37fbfc4b2b	767b5de8-3ba8-4b67-ad24-b0681feb51a5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11	50	online	paid	\N	\N	2026-04-11 00:16:50.464199+00	f	\N	\N
d59d3858-6af8-4591-a4a8-357ce4e5b680	0730e6a0-07e6-44f1-b129-097c3fb6e85c	8933fd28-5d64-4ec9-9cd9-d5b594fff1eb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-10	50	cash	paid	\N	\N	2026-04-11 07:06:33.929888+00	f	\N	\N
2ad59018-01f2-4856-862a-d265f917be75	046f033d-2013-4dbe-9ac8-947af0d1e115	de360bdb-ec38-4f27-ae4f-69ebeac5f619	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11	1000	cash	paid	\N	\N	2026-04-11 07:07:16.615926+00	f	\N	\N
11833173-8a94-49b3-9d58-dd16e555ea8d	80752817-7c75-426b-a97e-361b246ec563	135460a0-56bf-4c17-a4a8-5e66f29b52f6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11	300	cash	paid	\N	\N	2026-04-11 07:07:39.710651+00	f	\N	\N
868543e9-9a83-4174-a496-f5c13ed06cb8	4bf7d91d-6da6-4d5d-9db0-30b196a13651	6f37b184-d886-4b91-a179-60f467b3e51d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11	300	cash	paid	\N	\N	2026-04-11 15:46:46.650473+00	f	\N	\N
cce62074-d27f-4c9f-bcf6-47013f4af236	1ca2f5d0-fc1b-49ab-8443-25574737d3cf	18d2e760-ed6d-44b0-af27-6b7cb9d6ddbb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11	100	cash	paid	\N	\N	2026-04-11 15:47:09.357787+00	f	\N	\N
cafc3e6f-0262-48b9-a0a9-f912931eacf9	5fecec3a-5262-4cfd-8464-57abf6fd6c0c	509f1fd9-7517-4b8b-a57b-817bd7e6f823	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11	300	cash	paid	\N	\N	2026-04-11 15:47:30.866+00	f	\N	\N
7f958be5-6148-4882-9069-5f9d839127d6	f5064908-4ea0-42c7-8a63-0ddfc2a80531	dc623009-9752-43d7-b22a-384740599eb7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11	500	cash	paid	\N	\N	2026-04-11 15:47:50.526716+00	f	\N	\N
0678a04f-dd2f-4f0d-8b67-042e886bbebe	8926b943-bda3-4c36-aa29-4f8576e75e90	735cd1ad-a76d-4026-87dc-60f501454b7a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11	600	cash	paid	\N	\N	2026-04-11 15:48:11.281146+00	f	\N	\N
07286cb3-4cee-43fb-b8da-1a24a839359d	93906c36-47ae-41bb-bb4c-a594f08896b3	27e0e2f9-8d55-4cf8-a605-3a1b95f3c368	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11	500	cash	paid	\N	\N	2026-04-11 15:48:42.22+00	f	\N	\N
c5308a26-a8fb-4231-a995-a5fb164503ac	d59ecb10-5af9-4f75-8f43-dfc52d537f0c	400fb688-b2dd-42c2-b2f6-c2c3a6bff5bd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11	200	cash	paid	\N	\N	2026-04-11 15:49:00.0692+00	f	\N	\N
81483de8-390b-42af-b7ee-4912a0bf5408	a529d878-71a9-4774-8ef5-b4e2ce601e22	c7a9948d-1c6b-40d9-a8b5-23c2597bf9f0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11	100	cash	paid	\N	\N	2026-04-11 15:49:42.857333+00	f	\N	\N
d61c4a13-b90a-40be-975f-a511c56df175	b22b99e0-ad0d-4b0b-bdeb-7f6883ff97c1	9b75966e-2f2f-476f-b255-0bd24264a797	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11	200	cash	paid	\N	\N	2026-04-11 15:50:01.588234+00	f	\N	\N
6eda9853-b1f1-4211-ae00-e0070a4af9ca	44e44d3f-1c42-41fa-8bf1-2bdb5bf219c7	2647ddf3-5d7a-405f-be10-8cb5f12edb5d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11	200	cash	paid	\N	\N	2026-04-11 16:11:34.110278+00	f	\N	\N
de4accaa-26de-43df-8145-b4be16f3bbbc	019b4424-175f-4bb1-9c64-bd2fb04a8ae4	1ff2e9b9-5867-4348-a67b-0a6601d52ce9	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11	100	cash	paid	\N	\N	2026-04-11 16:11:52.247813+00	f	\N	\N
e74d640b-243a-4b31-aced-76f89eea1381	e9b6d72d-0b4a-450d-8c1d-4d79ce11223a	b80a9434-712e-4a9a-aadb-75c2ee7549a8	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12	1200	cash	paid	\N	\N	2026-04-12 07:06:52.877276+00	f	\N	\N
0777b6d0-461e-4a26-a4ef-4fba110ac8ac	cf301afd-a3ed-4bea-9794-b4fe432d8861	8419a9be-df12-416f-81ce-3570f9a82a4c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12	1800	cash	paid	\N	\N	2026-04-12 07:07:40.549855+00	f	\N	\N
b9903c0d-1c89-4ae0-941f-1069548772d2	8388404f-fd37-4f07-be34-7e919c686e8a	4f5d3a5e-a1e8-4652-8a3e-1053a1e760d7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12	200	cash	paid	\N	\N	2026-04-12 07:08:09.197515+00	f	\N	\N
e4d8c7dc-bcc7-4ab2-bb31-30f4c5e52f4d	61b47ec3-e7e1-4a78-8784-836a84315124	e7f677ba-fc98-4aa6-b8e1-f5365ecb34c7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11	1000	online	paid	\N	\N	2026-04-12 07:44:54.601453+00	f	\N	\N
6ea59cc1-f76b-406a-a367-bcb81ce935f2	61b47ec3-e7e1-4a78-8784-836a84315124	e7f677ba-fc98-4aa6-b8e1-f5365ecb34c7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12	0	online	not_paid	\N	\N	2026-04-12 07:45:24.593991+00	f	\N	\N
4b02c024-f35f-44b3-b9de-47bbed4da7e7	61b47ec3-e7e1-4a78-8784-836a84315124	e7f677ba-fc98-4aa6-b8e1-f5365ecb34c7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11	0	online	not_paid	\N	\N	2026-04-12 07:46:36.267099+00	f	\N	\N
cf8927e8-7989-43be-99e9-3f9b0897a175	dbb5444e-976f-4d00-9769-c0111b85f5b6	58be7354-d953-4974-a887-1ccc5ccb1acd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11	50	online	paid	\N	\N	2026-04-12 07:48:18.742653+00	f	\N	\N
7fa352ef-ab59-4cbf-9380-33c1a04441ce	dcf458bf-10c7-41f7-ab08-ed37fbfc4b2b	767b5de8-3ba8-4b67-ad24-b0681feb51a5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11	50	online	paid	\N	\N	2026-04-12 07:48:40.811503+00	f	\N	\N
09bb7d98-98e2-4d48-b5c2-700c83cf1a29	790d3d01-21ef-4976-82d4-af3adacb886c	2c2fec84-b45b-456c-87b2-de7365174599	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11	200	online	paid	\N	\N	2026-04-12 07:49:02.906398+00	f	\N	\N
a378b038-c967-4d61-9751-21ffec3fd58e	e3325ec8-264a-41e1-a2d5-84fb33eb4412	c2c54c13-fb99-4e5d-9f99-1bddf98beb5b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11	500	online	paid	\N	\N	2026-04-12 07:49:28.267136+00	f	\N	\N
a4b4b984-7dc4-4827-8519-756ffcc92247	6d60857f-7cd1-437e-a536-c9d04949b1c7	d6c5de5c-32f1-4075-bce2-9a151bb80cb0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11	500	online	paid	\N	\N	2026-04-12 07:49:48.744674+00	f	\N	\N
094d1591-48a9-486f-85f7-28bfe0b26bd9	1f87a89f-83e6-4c4a-ab6b-15d208b3b778	1bc4abc0-e370-49f3-b77c-87aabf4bfa85	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11	500	online	paid	\N	\N	2026-04-12 07:50:37.663835+00	f	\N	\N
bc3ca6b4-7e46-4451-b3e7-9409b202cc73	a0d4dce0-9bdd-4cf1-ad5d-1c95cf18e2dd	dfa34099-366b-4a3e-85ef-eb12e94f4083	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11	300	online	paid	\N	\N	2026-04-12 07:50:58.20131+00	f	\N	\N
02de6adc-668e-4bf9-ad36-88a24380aeb8	89d5c659-aa6c-4a99-b0fc-f737d9e8e0e4	111a604f-46f8-4271-8912-ccbe479ab3ef	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11	1500	online	paid	\N	\N	2026-04-12 07:51:21.407677+00	f	\N	\N
dfcff569-10d2-4b2b-ad27-d996a037554e	7d1ca2e6-5ac0-47d0-9b5b-6080fb746026	f8942243-6f41-4580-bb7a-b78101128ade	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11	700	online	paid	\N	\N	2026-04-12 07:51:56.565708+00	f	\N	\N
1ed36d6f-b112-4517-a03e-8cecfe9977d0	e0fca0e1-df99-497f-87e4-41be32ec1780	c18d8b95-c031-4110-85c8-b265a89efc50	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11	1000	online	paid	\N	\N	2026-04-12 07:52:22.979153+00	f	\N	\N
bacfc6df-9523-4b24-a62c-cf455634f690	56da2e53-1358-4168-8c6e-cee12fe29c59	0e59bad3-eae7-435d-b166-6f5e876b3785	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11	500	online	paid	\N	\N	2026-04-12 07:53:01.872726+00	f	\N	\N
e130365f-7953-4818-ae01-34b5d1666228	dede5547-d440-4d63-a9ac-ad427b2895c9	6ded35ce-a2e8-4856-827d-ab18be14743b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11	800	online	paid	\N	\N	2026-04-12 07:53:25.850833+00	f	\N	\N
fb55c28f-1244-470f-9c27-fc654834ccb7	250eeece-4579-4cc4-86f9-0cdd866fbd24	e3c2af50-d0e2-461a-bfc2-67efd23feb46	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11	100	online	paid	\N	\N	2026-04-12 07:53:55.442511+00	f	\N	\N
4229663a-d410-419f-85ae-866c349cf81e	32e40b35-8c4b-4552-b8b8-7c233d31c03d	757d4684-58bf-40d2-bfdd-ec9921ff94d7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11	250	online	paid	\N	\N	2026-04-12 07:54:18.393649+00	f	\N	\N
19324c76-740d-407a-85fe-ed5daa938b7d	f35169da-5d69-4e7e-a35e-ed6237a94cff	6398b3f9-45c4-45b0-a7fc-0e3e1ced4173	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11	500	online	paid	\N	\N	2026-04-12 07:58:14.619394+00	f	\N	\N
65c0cd2e-b288-49d8-8f47-f36ba6a2feb8	019b4424-175f-4bb1-9c64-bd2fb04a8ae4	1ff2e9b9-5867-4348-a67b-0a6601d52ce9	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12	50	cash	paid	\N	\N	2026-04-12 08:01:34.781426+00	f	\N	\N
7500cb60-08c8-4870-a1f9-11caffe2d28b	dcf458bf-10c7-41f7-ab08-ed37fbfc4b2b	767b5de8-3ba8-4b67-ad24-b0681feb51a5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13	50	online	paid	\N	\N	2026-04-13 14:17:12.894405+00	f	\N	\N
3fd08ee2-b2e3-4baf-ad89-3fb6c7fc0ae5	1ca2f5d0-fc1b-49ab-8443-25574737d3cf	18d2e760-ed6d-44b0-af27-6b7cb9d6ddbb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13	100	cash	paid	\N	\N	2026-04-13 15:28:15.227816+00	f	\N	\N
0b779e53-672f-443b-be51-17c44d57791c	8926b943-bda3-4c36-aa29-4f8576e75e90	735cd1ad-a76d-4026-87dc-60f501454b7a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13	200	cash	paid	\N	\N	2026-04-13 15:29:31.07803+00	f	\N	\N
c08a8d98-5c0e-4818-a46e-98e57f917944	4bf7d91d-6da6-4d5d-9db0-30b196a13651	6f37b184-d886-4b91-a179-60f467b3e51d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13	300	cash	paid	\N	\N	2026-04-13 15:30:41.741246+00	f	\N	\N
2148d077-04d3-48b9-8a71-2408d6940c47	b22b99e0-ad0d-4b0b-bdeb-7f6883ff97c1	9b75966e-2f2f-476f-b255-0bd24264a797	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13	200	cash	paid	\N	\N	2026-04-13 15:32:01.265644+00	f	\N	\N
aa77387b-39df-4d6a-ad1f-8bf295d193f4	f35169da-5d69-4e7e-a35e-ed6237a94cff	6398b3f9-45c4-45b0-a7fc-0e3e1ced4173	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13	500	online	paid	\N	\N	2026-04-13 16:07:19.111213+00	f	\N	\N
8b16f268-1ec7-40c8-b0fc-be96cd73e4d5	4686827e-4849-4bfa-88aa-129912510008	5cebdb10-f359-495d-983b-766489065f26	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11	200	online	paid	\N	\N	2026-04-12 07:54:44.752154+00	f	\N	\N
31a289be-3ee8-4a3c-b2f5-e6e0fdd60c0e	b9bd3700-24a0-4fa2-9afa-ca0827c26188	b80d47c9-3d98-41cd-9037-7ddcdac87f0c	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11	200	online	paid	\N	\N	2026-04-12 07:55:27.835017+00	f	\N	\N
5363172a-c9b9-444b-886f-50dd532dbfc8	2c143dd6-c039-4a59-8c14-02bf93b00f0a	ed00e1c1-e744-4da2-a624-7dbc07c94b87	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11	200	online	paid	\N	\N	2026-04-12 07:55:52.986487+00	f	\N	\N
66600f9e-4fbd-4269-a38e-c7a4f847d832	f076e587-f2c0-423c-9441-07bde93baeb3	e71a649a-865d-492c-a7ac-b2f37247b836	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11	500	online	paid	\N	\N	2026-04-12 07:56:21.641099+00	f	\N	\N
66631c12-2f6a-41a4-9c98-f3a22eece1fa	6aac96ea-eb26-460a-8340-ffb355953ae0	8e423e8d-c1ce-4d07-9860-fd7df34eaf44	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11	400	online	paid	\N	\N	2026-04-12 07:58:36.287352+00	f	\N	\N
883f1fcd-ae49-4c21-9eb2-b34986a0722c	dbb5444e-976f-4d00-9769-c0111b85f5b6	58be7354-d953-4974-a887-1ccc5ccb1acd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12	50	online	paid	\N	\N	2026-04-12 08:00:00.862033+00	f	\N	\N
0c117b9e-45e9-45e3-b352-c0387da08440	dcf458bf-10c7-41f7-ab08-ed37fbfc4b2b	767b5de8-3ba8-4b67-ad24-b0681feb51a5	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12	50	online	paid	\N	\N	2026-04-12 08:00:15.677966+00	f	\N	\N
a840440b-055d-4b59-bcba-acc840172704	2a8f0801-a95d-49fb-a6a0-f9a9a84c463b	35899642-c883-4c26-a7ad-8e41a391be2b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13	1000	online	paid	\N	\N	2026-04-13 14:18:48.137885+00	f	\N	\N
055125ea-6a83-407d-8fda-06e18eec35a9	f5064908-4ea0-42c7-8a63-0ddfc2a80531	dc623009-9752-43d7-b22a-384740599eb7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13	500	cash	paid	\N	\N	2026-04-13 15:28:36.962826+00	f	\N	\N
e9048418-317d-4877-a951-8f445b45b006	84cf3d8e-64cc-4a90-8b33-12c94640d00b	ebc8c94f-09bf-41ca-8522-f81f98fb1469	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13	700	cash	paid	\N	\N	2026-04-13 15:30:18.94079+00	f	\N	\N
a07b6b44-1bf8-4e1a-890b-baa0f678a143	a529d878-71a9-4774-8ef5-b4e2ce601e22	c7a9948d-1c6b-40d9-a8b5-23c2597bf9f0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13	100	cash	paid	\N	\N	2026-04-13 15:31:43.526736+00	f	\N	\N
a38e8203-bfc3-447e-9a8b-61a9681bc33e	0730e6a0-07e6-44f1-b129-097c3fb6e85c	8933fd28-5d64-4ec9-9cd9-d5b594fff1eb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13	50	cash	paid	\N	\N	2026-04-13 16:10:24.066913+00	f	\N	\N
24f0f2e8-eb75-443c-b97d-1fab81be7a63	481d1580-100a-4f65-bc22-32aac9182e37	8fdc0983-6869-49ab-ba2e-866ebe6f7f5b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11	500	online	paid	\N	\N	2026-04-12 07:56:53.968295+00	f	\N	\N
d8b8a6fc-669a-488a-ae51-f16c7dbb291b	6340050f-5246-43c5-9297-d14267b9bad0	17f01068-23e4-438e-8322-5e4a12f3f332	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11	2000	online	paid	\N	\N	2026-04-12 07:57:20.041124+00	f	\N	\N
2207c037-10c8-4b89-80ab-8f6a44f3cc43	2a8f0801-a95d-49fb-a6a0-f9a9a84c463b	35899642-c883-4c26-a7ad-8e41a391be2b	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11	500	online	paid	\N	\N	2026-04-12 07:57:42.29352+00	f	\N	\N
92b81932-8977-496e-b874-0b85b99c465c	cb5975f3-72b1-4cc9-bd02-81342334cb40	6043f054-834d-437f-860a-7f9269935958	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-11	400	online	paid	\N	\N	2026-04-12 07:58:58.222227+00	f	\N	\N
a2a020f5-e42d-4c07-944f-d89e7994493a	963ccc89-3e62-4787-ae26-1b8b908b51c4	6064efcd-d142-44c8-864b-7f882850d18a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12	1500	online	paid	\N	\N	2026-04-12 08:00:37.124789+00	f	\N	\N
8ac96dd6-7578-4eaa-8789-411301e1af57	c458c3a2-4dd1-432a-b480-b8675bd14584	4a8b4664-03cc-4c63-a5e4-3cabf38d7ebe	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13	600	cash	paid	\N	\N	2026-04-13 14:25:22.385615+00	f	\N	\N
82aa4c7d-0ea8-462f-b1e9-49d8660f09bf	44e44d3f-1c42-41fa-8bf1-2bdb5bf219c7	2647ddf3-5d7a-405f-be10-8cb5f12edb5d	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13	200	cash	paid	\N	\N	2026-04-13 15:28:53.526644+00	f	\N	\N
dd90a94e-facf-4de5-a769-6ea28ad55f74	cb5975f3-72b1-4cc9-bd02-81342334cb40	6043f054-834d-437f-860a-7f9269935958	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13	400	online	paid	\N	\N	2026-04-14 03:19:01.615275+00	f	\N	\N
07a8d780-9667-44e7-96aa-20182619800b	80752817-7c75-426b-a97e-361b246ec563	135460a0-56bf-4c17-a4a8-5e66f29b52f6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12	300	online	paid	\N	\N	2026-04-12 07:59:38.147487+00	f	\N	\N
9ab16ed6-af05-47a5-8ba3-1c5361bce9e9	6d60857f-7cd1-437e-a536-c9d04949b1c7	d6c5de5c-32f1-4075-bce2-9a151bb80cb0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12	500	online	paid	\N	\N	2026-04-12 13:22:21.542978+00	f	\N	\N
bb4849d9-29e0-4bb9-876b-681a80d4b74f	790d3d01-21ef-4976-82d4-af3adacb886c	2c2fec84-b45b-456c-87b2-de7365174599	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12	100	online	paid	\N	\N	2026-04-12 13:22:51.073284+00	f	\N	\N
10a69164-8c10-4d1c-a47e-25c527317cb9	e00a821e-300f-432b-8519-5ef03b42b09c	6edc184d-553a-4ab7-b3bc-924f1ea007d6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12	1500	online	paid	\N	\N	2026-04-12 13:23:23.796569+00	f	\N	\N
dc3d9b99-7dd2-4913-a4ef-17886d6f52fd	89d5c659-aa6c-4a99-b0fc-f737d9e8e0e4	111a604f-46f8-4271-8912-ccbe479ab3ef	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12	1500	online	paid	\N	\N	2026-04-12 13:23:59.735206+00	f	\N	\N
2e6ca676-f019-4649-a413-a106116e6174	a0d4dce0-9bdd-4cf1-ad5d-1c95cf18e2dd	dfa34099-366b-4a3e-85ef-eb12e94f4083	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12	300	online	paid	\N	\N	2026-04-12 13:24:31.547454+00	f	\N	\N
3e2287d7-a517-4a1a-b0be-4c7a76f05edb	9920fe35-b725-4a78-802d-61689d6993b2	b9ea214a-e90e-4ad5-a848-3b1005f2e89f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12	300	online	paid	\N	\N	2026-04-12 13:27:27.489995+00	f	\N	\N
c276837d-15ef-4e3e-8509-e637026081f7	56da2e53-1358-4168-8c6e-cee12fe29c59	0e59bad3-eae7-435d-b166-6f5e876b3785	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12	500	online	paid	\N	\N	2026-04-12 13:27:54.284934+00	f	\N	\N
abd4ab18-6243-4468-8316-1877b3c2af63	ae9b4b5a-e5ed-4d12-a2c3-fc021439ac60	db8b2887-3836-45d0-b9ba-0f3a36a3ac8f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12	150	online	paid	\N	\N	2026-04-12 13:28:43.787935+00	f	\N	\N
4946550a-1324-4b14-8973-75332b936b28	bcb87a68-a59d-438f-b81a-e5a4a6b666c1	b4a8d905-3198-4d75-8ee3-3800ec8f2b40	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12	1000	online	paid	\N	\N	2026-04-12 13:29:06.725917+00	f	\N	\N
fdd2b238-74ff-49d3-8d1e-e2dc8ed5457e	3765d341-7b06-463d-82fa-add7d738b854	eab03433-a240-440d-8140-9be3f7ccf9a7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12	1000	online	paid	\N	\N	2026-04-12 13:29:43.296041+00	f	\N	\N
27253e37-8c6e-4b66-be11-3c78c065e815	e0fca0e1-df99-497f-87e4-41be32ec1780	c18d8b95-c031-4110-85c8-b265a89efc50	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12	500	online	paid	\N	\N	2026-04-12 14:19:33.941844+00	f	\N	\N
e1148f45-e70f-4581-ab0e-7af31712ef95	5f1540b7-3eda-41e6-87f9-f6a13d0a1980	a919714d-f972-4455-a828-e37bfbea4c34	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12	100	online	paid	\N	\N	2026-04-12 14:52:34.84481+00	f	\N	\N
bfa805ba-4123-4b97-a5b1-9cde0d336a25	cb86aae2-de85-41b5-bf5f-20645840e270	a22b5f37-a3d4-48de-a5d3-5717343478be	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12	300	cash	paid	\N	\N	2026-04-12 15:08:33.198333+00	f	\N	\N
d57af1b5-9bf7-4fe4-b6df-1a6574f8c1db	b0ad6445-eed2-49f7-9b7c-78fdf8a2a53d	2ee2c1a7-5fa1-4a20-9185-b1385b754870	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12	400	online	paid	\N	\N	2026-04-12 15:18:50.722806+00	f	\N	\N
0ecd7f50-2d4d-48ad-a748-1b2a1aeb58de	b22b99e0-ad0d-4b0b-bdeb-7f6883ff97c1	9b75966e-2f2f-476f-b255-0bd24264a797	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12	200	cash	paid	\N	\N	2026-04-12 15:30:16.296029+00	f	\N	\N
a13f47ac-8632-441a-b474-39a8c293d70a	5fecec3a-5262-4cfd-8464-57abf6fd6c0c	509f1fd9-7517-4b8b-a57b-817bd7e6f823	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12	300	cash	paid	\N	\N	2026-04-12 15:30:41.293852+00	f	\N	\N
8a1f27d4-84b6-4c9c-b58f-4167ee6ad0e9	f5064908-4ea0-42c7-8a63-0ddfc2a80531	dc623009-9752-43d7-b22a-384740599eb7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12	500	cash	paid	\N	\N	2026-04-12 15:31:08.836677+00	f	\N	\N
8fee7f2d-bc3a-434a-a2f3-af630bee5871	1ca2f5d0-fc1b-49ab-8443-25574737d3cf	18d2e760-ed6d-44b0-af27-6b7cb9d6ddbb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12	100	cash	paid	\N	\N	2026-04-12 15:31:32.836739+00	f	\N	\N
82cc9595-212b-4a3a-9e42-17bee32af6a7	7d1ca2e6-5ac0-47d0-9b5b-6080fb746026	f8942243-6f41-4580-bb7a-b78101128ade	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12	700	online	paid	\N	\N	2026-04-12 15:40:54.023658+00	f	\N	\N
6cf19eca-40cc-4d6d-b286-7bfb2a95832e	eccc41c7-9d86-41a5-8c93-ae01f74f8080	cc475a57-bcdd-42fc-a0a1-00504909a4e0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12	2000	online	paid	\N	\N	2026-04-12 16:29:36.153107+00	f	\N	\N
c64abdef-db9a-4357-b4e2-65c429ad3708	0730e6a0-07e6-44f1-b129-097c3fb6e85c	8933fd28-5d64-4ec9-9cd9-d5b594fff1eb	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12	50	cash	paid	\N	\N	2026-04-12 16:30:20.703671+00	f	\N	\N
10073e2b-42b4-42bd-b775-26cb5c88302b	23ac8ae5-7452-4182-b51c-a70026bbe0d8	bbc128c4-c3e1-4281-82c7-652d7065c721	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12	200	cash	paid	\N	\N	2026-04-12 16:38:03.184045+00	f	\N	\N
afdc4d22-3826-4bc4-8619-c757045d4294	6245a2e8-2eb5-4d5f-8b8a-aac817bfee18	55efd7cf-1188-4423-9a53-8ee2c53002fa	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12	200	online	paid	\N	\N	2026-04-12 17:23:34.38335+00	f	\N	\N
22639590-5063-478f-b075-9a1180ba01f4	f35169da-5d69-4e7e-a35e-ed6237a94cff	6398b3f9-45c4-45b0-a7fc-0e3e1ced4173	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-12	500	online	paid	\N	\N	2026-04-12 18:02:52.253417+00	f	\N	\N
b6c13a2b-80fe-46cf-81c9-ebf8af994e52	61b47ec3-e7e1-4a78-8784-836a84315124	e7f677ba-fc98-4aa6-b8e1-f5365ecb34c7	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13	1000	online	paid	\N	\N	2026-04-12 18:54:27.938632+00	f	\N	\N
70f004d6-1dc8-4f42-9ca6-4af7b7bead78	fb079db0-2262-4017-bd24-5d42ca326ff9	9ca88703-194e-4620-9685-63969504382a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13	2000	cash	paid	\N	\N	2026-04-13 05:18:21.839827+00	f	\N	\N
440e8047-94c9-4f01-bd04-631eef997b2f	2ef2bbe9-b267-4369-9bd3-51063fe4a3fa	2aeaa481-3253-43a4-a686-c3baf68e3693	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13	500	cash	paid	\N	\N	2026-04-13 06:06:05.67231+00	f	\N	\N
66dde5c0-c864-4fdf-a41b-4c8725bf059e	046f033d-2013-4dbe-9ac8-947af0d1e115	de360bdb-ec38-4f27-ae4f-69ebeac5f619	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13	500	cash	paid	\N	\N	2026-04-13 06:07:20.252735+00	f	\N	\N
e10b13c1-1ba9-4515-9740-49d3d1a69d7b	80752817-7c75-426b-a97e-361b246ec563	135460a0-56bf-4c17-a4a8-5e66f29b52f6	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13	300	cash	paid	\N	\N	2026-04-13 06:07:45.882407+00	f	\N	\N
2144e743-ecef-4cd0-9801-20eb906e1e82	34977a0a-e657-40cb-840d-a6df47bba8d3	d1929534-e23a-4d75-8031-6998ec8b0810	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13	500	online	paid	\N	\N	2026-04-13 07:24:35.898716+00	f	\N	\N
6589d145-8753-4023-82ff-62b94dfe010a	860f25ca-39ff-42f0-bacb-e409bd6007d7	71d81887-5e21-4486-97e6-faea2c876cff	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13	200	online	paid	\N	\N	2026-04-13 07:25:10.367106+00	f	\N	\N
0f1d7351-e0d7-459b-b2c8-674f9942bd9d	7d1ca2e6-5ac0-47d0-9b5b-6080fb746026	f8942243-6f41-4580-bb7a-b78101128ade	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13	700	online	paid	\N	\N	2026-04-13 07:25:40.338149+00	f	\N	\N
4699964c-1936-4799-8211-cc3a603b412e	df704001-715c-495c-832e-1971c5655106	02d3bf14-a0ef-4ed8-85fb-146ca7ab0fe4	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13	600	online	paid	\N	\N	2026-04-13 07:26:48.858175+00	f	\N	\N
c97eb6fe-3bc4-4969-9fb4-2e145306003c	6d60857f-7cd1-437e-a536-c9d04949b1c7	d6c5de5c-32f1-4075-bce2-9a151bb80cb0	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13	500	online	paid	\N	\N	2026-04-13 07:27:33.022798+00	f	\N	\N
29557d3c-7b87-4192-bcbf-e1626fb99862	ba9ab57b-e2d8-4c2a-902d-effb7b810b03	a3f57a0f-8bdf-47f7-a94d-819924cdc08a	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13	5000	online	paid	\N	\N	2026-04-13 07:28:34.734042+00	f	\N	\N
b3831b5d-6698-411f-b29d-80222036d865	bdfb7101-8e1c-4167-9c21-77c4defe8ce5	16844e34-775b-4f49-a6fc-69e52bc24cfe	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13	5000	cash	paid	\N	\N	2026-04-13 12:57:29.806588+00	f	\N	\N
2ba51da9-7cd5-433c-a254-eb6e85a3b644	02889b17-5d17-4dc1-ace1-381b0d733984	def4d986-3767-4793-a6e8-c767351fd93f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13	1500	cash	paid	\N	\N	2026-04-13 12:58:08.039936+00	f	\N	\N
7b0c7d85-9d37-40d2-a51b-13a8cdb5ea8e	66a5baef-e9ee-4830-8b91-10c5b91c0d5a	821de303-68d9-438d-8f21-b30da4ae6993	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13	100	online	paid	\N	\N	2026-04-13 13:10:00.516219+00	f	\N	\N
729fe4fe-6842-4f90-8e28-1fa1aeb8d83e	5f1540b7-3eda-41e6-87f9-f6a13d0a1980	a919714d-f972-4455-a828-e37bfbea4c34	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13	100	online	paid	\N	\N	2026-04-13 13:10:27.146052+00	f	\N	\N
ce42cbee-af4c-4663-9fff-54a851189fab	ae9b4b5a-e5ed-4d12-a2c3-fc021439ac60	db8b2887-3836-45d0-b9ba-0f3a36a3ac8f	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13	150	online	paid	\N	\N	2026-04-13 13:10:57.246972+00	f	\N	\N
a1085f34-be49-4ddf-826e-e6dc1c401ef9	22d10045-ef1c-4807-9278-c35dbb01d73f	db261798-826e-4d7b-9fc7-a4dba55df1f3	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13	200	online	paid	\N	\N	2026-04-13 14:25:27.328851+00	f	\N	\N
01507b48-70ec-4dad-8e78-50f335174797	5fecec3a-5262-4cfd-8464-57abf6fd6c0c	509f1fd9-7517-4b8b-a57b-817bd7e6f823	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13	300	cash	paid	\N	\N	2026-04-13 15:29:50.158287+00	f	\N	\N
a198a373-9545-4330-8e11-e4deddf4e027	d59ecb10-5af9-4f75-8f43-dfc52d537f0c	400fb688-b2dd-42c2-b2f6-c2c3a6bff5bd	96f6fa4a-af51-4aff-a9e1-5d65077bb7b0	2026-04-13	200	cash	paid	\N	\N	2026-04-13 15:31:21.015093+00	f	\N	\N
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
57	s3-multipart-uploads-metadata	f127886e00d1b374fadbc7c6b31e09336aad5287	2026-04-07 16:25:32.124299
58	operation-ergonomics	00ca5d483b3fe0d522133d9002ccc5df98365120	2026-04-07 16:25:32.153052
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

COPY storage.s3_multipart_uploads (id, in_progress_size, upload_signature, bucket_id, key, version, owner_id, created_at, user_metadata, metadata) FROM stdin;
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

SELECT pg_catalog.setval('auth.refresh_tokens_id_seq', 638, true);


--
-- Name: loans_loan_number_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.loans_loan_number_seq', 133, true);


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
-- Name: webauthn_challenges webauthn_challenges_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.webauthn_challenges
    ADD CONSTRAINT webauthn_challenges_pkey PRIMARY KEY (id);


--
-- Name: webauthn_credentials webauthn_credentials_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.webauthn_credentials
    ADD CONSTRAINT webauthn_credentials_pkey PRIMARY KEY (id);


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
-- Name: webauthn_challenges_expires_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX webauthn_challenges_expires_at_idx ON auth.webauthn_challenges USING btree (expires_at);


--
-- Name: webauthn_challenges_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX webauthn_challenges_user_id_idx ON auth.webauthn_challenges USING btree (user_id);


--
-- Name: webauthn_credentials_credential_id_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX webauthn_credentials_credential_id_key ON auth.webauthn_credentials USING btree (credential_id);


--
-- Name: webauthn_credentials_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX webauthn_credentials_user_id_idx ON auth.webauthn_credentials USING btree (user_id);


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
-- Name: webauthn_challenges webauthn_challenges_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.webauthn_challenges
    ADD CONSTRAINT webauthn_challenges_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: webauthn_credentials webauthn_credentials_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.webauthn_credentials
    ADD CONSTRAINT webauthn_credentials_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


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
-- Name: TABLE webauthn_challenges; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.webauthn_challenges TO postgres;
GRANT ALL ON TABLE auth.webauthn_challenges TO dashboard_user;


--
-- Name: TABLE webauthn_credentials; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.webauthn_credentials TO postgres;
GRANT ALL ON TABLE auth.webauthn_credentials TO dashboard_user;


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

\unrestrict JR42WfoXa5pVkZA37GFQfPg63YeuUN3f2rcwIl3VTJIS3dcLjrEBC4BnushHxNk

