-- Dynasty 8 – baza ofert. Uruchom w Supabase: SQL Editor → New query → wklej → Run.
-- PRZED uruchomieniem zamień ADMIN@TWOJ-EMAIL.pl (w 2 miejscach, na dole) na e-mail konta admina.

create table if not exists public.listings (
  id          bigint generated always as identity primary key,
  title       text not null,
  address     text,
  price       numeric default 0,
  status      text default 'Dostępna' check (status in ('Dostępna','Zarezerwowana','Sprzedana')),
  area        numeric,
  rooms       integer,
  description text,
  photos      jsonb not null default '[]'::jsonb,
  created_at  timestamptz not null default now()
);

create index if not exists listings_created_idx on public.listings (created_at desc);

alter table public.listings enable row level security;

-- Każdy odwiedzający może oglądać oferty:
drop policy if exists "oferty_odczyt_publiczny" on public.listings;
create policy "oferty_odczyt_publiczny" on public.listings
  for select using (true);

-- Dodawać, edytować i usuwać może wyłącznie konto admina (po e-mailu):
drop policy if exists "oferty_zapis_admin" on public.listings;
create policy "oferty_zapis_admin" on public.listings
  for all to authenticated
  using      ((auth.jwt() ->> 'email') = 'ADMIN@TWOJ-EMAIL.pl')
  with check ((auth.jwt() ->> 'email') = 'ADMIN@TWOJ-EMAIL.pl');
