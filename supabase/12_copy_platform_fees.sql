-- ============================================================================
-- 12_copy_platform_fees.sql
--
-- Wording refresh for databases seeded before this change. No schema changes.
-- Column names (commission_rate, commission_amount) stay as they are — this
-- only updates the words members read:
--
--   · "commission"  →  "platform fee"
--   · return window →  3 days from the handover, final once the buyer accepts
--   · payments      →  CliQ and cash on handover only
--
-- Safe to run more than once. Run it in the Supabase SQL Editor.
-- ============================================================================

update faqs
   set answer = 'Listing is free. A 12% platform fee is deducted when the buyer accepts the item.'
 where question = 'What does it cost to sell?';

update faqs
   set answer = 'Yes, if the item is not as described — open a return from your order within 3 days of the handover. Once you accept a piece, the sale is final.'
 where question = 'Can I return something?';

update faqs
   set answer = 'CliQ, or cash when you meet for the handover.'
 where question = 'Which payment methods work?';

update admin_roles
   set description = 'Transactions, platform fees, payouts and financial reports.'
 where description = 'Transactions, commission, payouts and financial reports.';
