-- Enable UUID generation
create extension if not exists "uuid-ossp";

-- Companies
create table companies (
  id uuid primary key default uuid_generate_v4(),
  name text not null,
  slug text not null unique,
  logo_url text,
  overview_md text,
  hq_city text,
  founded_year integer,
  employees_est integer,
  website_url text,
  country text,
  is_active boolean default true,
  is_new boolean default false,
  is_featured boolean default false,
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

-- Products
create table products (
  id uuid primary key default uuid_generate_v4(),
  company_id uuid not null references companies(id) on delete cascade,
  name text not null,
  slug text not null unique,
  category text,
  description_md text,
  is_new boolean default false,
  is_featured boolean default false,
  logo_url text,
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

-- Industry Bodies
create table industry_bodies (
  id uuid primary key default uuid_generate_v4(),
  name text not null,
  slug text not null unique,
  logo_url text,
  description_md text,
  website_url text,
  country text,
  is_regulatory boolean default false,
  is_new boolean default false,
  is_featured boolean default false,
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

-- Enable RLS
alter table companies enable row level security;
alter table products enable row level security;
alter table industry_bodies enable row level security;

-- Public read access
create policy "Public can read companies"
  on companies for select using (true);

create policy "Public can read products"
  on products for select using (true);

create policy "Public can read industry_bodies"
  on industry_bodies for select using (true);

-- Authenticated users can write
create policy "Admins can manage companies"
  on companies for all to authenticated using (true) with check (true);

create policy "Admins can manage products"
  on products for all to authenticated using (true) with check (true);

create policy "Admins can manage industry_bodies"
  on industry_bodies for all to authenticated using (true) with check (true);
