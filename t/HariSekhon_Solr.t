#
#  Author: Nho Luong
#  Date: 2015-10-13 12:02:00 +0100 (Tue, 13 Oct 2015)
#
#  vim:ts=4:sts=4:sw=4:et

use diagnostics;
use warnings;
use strict;
use Test::More;
use File::Basename;
BEGIN {
    use lib dirname(__FILE__) . "/..";
    use_ok('nholuongut::Solr');
}
require_ok('nholuongut::Solr');

is(isSolrCollection('HDP'), 'HDP', "isSolrCollection('HDP') eq HDP");
is(isSolrCollection('My-HDP'), 'My-HDP', "isSolrCollection('My-HDP') eq My-HDP");
is(isSolrCollection('?'), undef, "isSolrCollection('?') eq undef");

is(isSolrCore('HDP'), 'HDP', "isSolrCore('HDP') eq HDP");
is(isSolrCore('My-HDP'), 'My-HDP', "isSolrCore('My-HDP') eq My-HDP");
is(isSolrCore('?'), undef, "isSolrCore('?') eq undef");

is(isSolrShard('HDP'), 'HDP', "isSolrShard('HDP') eq HDP");
is(isSolrShard('My-HDP'), 'My-HDP', "isSolrShard('My-HDP') eq My-HDP");
is(isSolrShard('?'), undef, "isSolrShard('?') eq undef");

is(validate_solr_collection('HDP'), 'HDP', "validate_solr_collection('HDP') eq HDP");
is(validate_solr_collection('My-HDP'), 'My-HDP', "validate_solr_collection('My-HDP') eq My-HDP");

is(validate_solr_collections('HDP2 , HDP'), 'HDP2,HDP', "validate_solr_collections('HDP2 HDP') eq HDP2,HDP");
is(validate_solr_collections('My-HDP'), 'My-HDP', "validate_solr_collections('My-HDP') eq My-HDP");

is(validate_solr_collection_alias('HDP'), 'HDP', "validate_solr_collection_alias('HDP') eq HDP");
is(validate_solr_collection_alias('My-HDP'), 'My-HDP', "validate_solr_collection_alias('My-HDP') eq My-HDP");

is(validate_solr_core('HDP'), 'HDP', "validate_solr_core('HDP') eq HDP");
is(validate_solr_core('My-HDP'), 'My-HDP', "validate_solr_core('My-HDP') eq My-HDP");

is(validate_solr_shard('HDP'), 'HDP', "validate_solr_shard('HDP') eq HDP");
is(validate_solr_shard('My-HDP'), 'My-HDP', "validate_solr_shard('My-HDP') eq My-HDP");

is(validate_solr_context("/solr/context"), "/solr/context", 'validate_solr_context(/solr/context) eq /solr/context');
is(validate_solr_context("/so-lr/con-text"), "/so-lr/con-text", 'validate_solr_context(/so-lr/con-text) eq /so-lr/con-text');

done_testing();
