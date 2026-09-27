-- XSarah database setup. Paste this whole file into Supabase > SQL Editor > New query, then click Run.

create table if not exists public.ptps (
  id          text primary key,
  data        jsonb not null,
  created_at  timestamptz not null default now(),
  created_by  uuid default auth.uid()
);

create table if not exists public.ptp_photos (
  id       text primary key,
  plan_id  text not null references public.ptps(id) on delete cascade,
  ord      int  not null default 0,
  data     jsonb not null
);

create index if not exists ptp_photos_plan_idx on public.ptp_photos(plan_id, ord);

-- Only signed-in people can see or change plans.
alter table public.ptps       enable row level security;
alter table public.ptp_photos enable row level security;

drop policy if exists "signed-in read plans"  on public.ptps;
drop policy if exists "signed-in write plans" on public.ptps;
drop policy if exists "signed-in read photos"  on public.ptp_photos;
drop policy if exists "signed-in write photos" on public.ptp_photos;

create policy "signed-in read plans"   on public.ptps       for select to authenticated using (true);
create policy "signed-in write plans"  on public.ptps       for all    to authenticated using (true) with check (true);
create policy "signed-in read photos"  on public.ptp_photos for select to authenticated using (true);
create policy "signed-in write photos" on public.ptp_photos for all    to authenticated using (true) with check (true);
