-- Run this once in Supabase: SQL Editor -> New query -> paste -> Run

create table messages (
  id bigint generated always as identity primary key,
  name text not null check (char_length(name) between 1 and 40),
  body text not null check (char_length(body) between 1 and 200),
  created_at timestamptz default now()
);

alter table messages enable row level security;

create policy "anyone can read messages" on messages
  for select using (true);

create policy "anyone can add messages" on messages
  for insert with check (true);
