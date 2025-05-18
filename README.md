# Flashlight

A modern AI-powered web app for financial product discovery and distribution.

## Tech Stack

- [Next.js](https://nextjs.org/) (App Router, TypeScript, Tailwind CSS)
- [Supabase](https://supabase.com/) (Postgres, Auth, Storage)
- [Vercel](https://vercel.com/) (Preview Deployments)
- [Cursor](https://www.cursor.sh/) (AI-enhanced development)

## Local Development

### 1. Clone and install

```bash
git clone git@github.com:Skeptiballs/flashlight.git
cd flashlight
pnpm install
2. Set up environment
Create a file called .env.local at the root with the following content:


Bewerken
NEXT_PUBLIC_SUPABASE_URL=http://localhost:54321
NEXT_PUBLIC_SUPABASE_ANON_KEY=<your-local-anon-key>
3. Start Supabase and dev server

supabase start
pnpm dev
Then open http://localhost:3000 in your browser.

Deployment
This project is deployed via Vercel, linked to the main branch of this repository. Every pull request automatically generates a preview deployment.

Phase 0 Status
 GitHub + Vercel linked

 Local Supabase running

 Next.js starter app bootstrapped

 CI/CD working with PR previews

 - Tables created:
  - `companies`
  - `products`
  - `industry_bodies`
- Fields include: `slug`, `logo_url`, `description_md`, `is_new`, `is_featured`, etc.
- Relationships: `products.company_id → companies.id`
- RLS configured:
  - Public users can read
  - Authenticated users can write
- Migrations tracked in `/supabase/migrations`
- Run with: `supabase db reset`

