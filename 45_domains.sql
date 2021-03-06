/*
Domains allow extending data types with checks so that you don't have to change multiple single checks when validation requirements change.
*/
CREATE DOMAIN us_postal_code AS TEXT
CHECK(
   VALUE ~ '^\d{5}$'
OR VALUE ~ '^\d{5}-\d{4}$'
);

-- NB! All using tables will be scanned through, thus could get slow.
ALTER DOMAIN us_postal_code ADD CONSTRAINT zipchk CHECK (length(VALUE) = 5);
