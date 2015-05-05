# dropdb aquameta
echo "Creating database ..."
createdb aquameta

echo "Loading core/*.sql ..."
cat core/0*/0*.sql  | psql -a aquameta 2>&1 | grep -B 2 -A 10 ERROR:


echo "Loading bundles-enabled/*.sql ..."
cat bundles-enabled/*.sql | psql -a aquameta 2>&1 | grep -B 2 -A 10 ERROR:

echo "Checking out head commit of every bundle ..."
echo "select bundle.checkout(c.id) from bundle.commit c join bundle.bundle b on b.head_commit_id = c.id;" | psql aquameta

echo "Loading semantics ..."
cat core/0*/semantics.sql  | psql -a aquameta 2>&1 | grep -B 2 -A 10 ERROR:

# echo "insert into remote_http (bundle_id, endpoint_url) values ('737177af-16f4-40e1-ac0d-2c11b2b727e9'::uuid, 'http://demo.aquameta.org/endpoint');" | psql aquameta
