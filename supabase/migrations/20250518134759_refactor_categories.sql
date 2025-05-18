-- 1. Create table: product_categories
create table product_categories (
  id uuid primary key default uuid_generate_v4(),
  slug text not null unique,
  name text not null,
  description_md text,
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

-- 2. Add category_id to products (reference product_categories)
alter table products
  add column category_id uuid references product_categories(id) on delete set null;

-- 3. Drop old category column from products
alter table products
  drop column category;

-- 4. Create table: industry_body_categories
create table industry_body_categories (
  id uuid primary key default uuid_generate_v4(),
  slug text not null unique,
  name text not null,
  description_md text,
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

-- 5. Add category_id to industry_bodies (reference industry_body_categories)
alter table industry_bodies
  add column category_id uuid references industry_body_categories(id) on delete set null;

-- 6. Drop is_regulatory from industry_bodies
alter table industry_bodies
  drop column is_regulatory;
