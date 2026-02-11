CREATE TABLE IF NOT exists public.users (
    id bigserial primary key,
    name text NOT NULL DEFAULT gen_random_uuid(),
    birthday Date DEFAULT '1960-01-01'::date + trunc(random() * 365 * 62)::int,
    type INT DEFAULT floor(random() * 10),
    token UUID DEFAULT gen_random_uuid(),
    registration_at timestamp DEFAULT CURRENT_TIMESTAMP,
    phone text DEFAULT trunc(random() * 999999999 + 79000000000),
    edited_at timestamp DEFAULT timestamp '2023-08-20 10:00:00' + random() * (timestamp '2023-08-20 10:00:00' - timestamp '2023-08-31 23:00:00')
);

INSERT INTO public.users (id) SELECT * FROM generate_series(1, 100000);

SELECT setval('public.users_id_seq', 100000, true);