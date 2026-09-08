-- ============================================================================
-- 13_remove_authentication_claims.sql
--
-- The site no longer advertises a physical authentication service, so this
-- brings a database seeded before that change in line. No schema changes.
--
--   · removes the authentication FAQ
--   · refreshes seeded site copy that carried the claim
--   · raises the authentication threshold so new listings stop entering the
--     admin authentication queue (the tooling stays; lower the threshold in
--     Admin → Settings if you ever bring the service back)
--
-- Safe to run more than once. Run it in the Supabase SQL Editor.
-- ============================================================================

delete from faqs
 where question = 'How does authentication work?';

update content_blocks
   set value = 'A Second Chance for pieces worth finding'
 where key = 'homepage_hero_title';

update content_blocks
   set value = 'Jordan''s buy-and-sell fashion marketplace.'
 where key = 'homepage_hero_subtitle';

update content_blocks
   set value = 'Payment protected until you accept the piece.'
 where key = 'announcement_bar';

update platform_settings
   set authentication_threshold = 9999999
 where id;
