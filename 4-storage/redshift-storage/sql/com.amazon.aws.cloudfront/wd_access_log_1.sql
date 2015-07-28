-- Copyright (c) 2014-2015 Snowplow Analytics Ltd. All rights reserved.
--
-- This program is licensed to you under the Apache License Version 2.0,
-- and you may not use this file except in compliance with the Apache License Version 2.0.
-- You may obtain a copy of the Apache License Version 2.0 at http://www.apache.org/licenses/LICENSE-2.0.
--
-- Unless required by applicable law or agreed to in writing,
-- software distributed under the Apache License Version 2.0 is distributed on an
-- "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the Apache License Version 2.0 for the specific language governing permissions and limitations there under.
--
-- Authors:       Fred Blundun
-- Copyright:     Copyright (c) 2014-2015 Snowplow Analytics Ltd
-- License:       Apache License Version 2.0
--
-- Compatibility: iglu:com.amazon.aws.cloudfront/wd_access_log/jsonschema/1-0-0
-- Compatibility: iglu:com.amazon.aws.cloudfront/wd_access_log/jsonschema/1-0-1
-- Compatibility: iglu:com.amazon.aws.cloudfront/wd_access_log/jsonschema/1-0-2
-- Compatibility: iglu:com.amazon.aws.cloudfront/wd_access_log/jsonschema/1-0-3

CREATE TABLE atomic.com_amazon_aws_cloudfront_wd_access_log_1 (
	-- Schema of this type
	schema_vendor   varchar(128)  encode runlength not null,
	schema_name     varchar(128)  encode runlength not null,
	schema_format   varchar(128)  encode runlength not null,
	schema_version  varchar(128)  encode runlength not null,
	-- Parentage of this type
	root_id         char(36)      encode raw not null,
	root_tstamp     timestamp     encode lzo not null,
	ref_root        varchar(255)  encode runlength not null,
	ref_tree        varchar(1500) encode runlength not null,
	ref_parent      varchar(255)  encode runlength not null,
	-- Properties of this type
	date_time           timestamp     encode lzo not null,
	x_edge_location     varchar(255)  encode lzo,
	sc_bytes            integer       encode lzo,
	c_ip                varchar(45)   encode lzo,
	cs_method           varchar(3)    encode lzo,
	cs_host             varchar(2000) encode lzo,
	cs_uri_stem         varchar(8192) encode lzo,
	sc_status           varchar(255)  encode lzo,
	cs_referer          varchar(8192) encode lzo,
	cs_user_agent       varchar(2000) encode lzo,
	cs_uri_query        varchar(8292) encode lzo,
	cs_cookie           varchar(1024) encode lzo,
	x_edge_result_type  varchar(2000) encode lzo,
	x_edge_request_type varchar(2000) encode lzo,
	x_host_header       varchar(2000) encode lzo,
	cs_protocol         varchar(5)    encode lzo,
	cs_bytes            integer       encode lzo,
	time_taken          float         encode lzo,
	FOREIGN KEY(root_id) REFERENCES atomic.events(event_id)
)
DISTSTYLE KEY
-- Optimized join to atomic.events
DISTKEY (root_id)
SORTKEY (root_tstamp);
