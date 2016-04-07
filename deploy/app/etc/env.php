<?php
return array (
  'backend' => 
  array (
    'frontName' => 'admin',
  ),
  'install' => 
  array (
    'date' => 'Tue, 22 Mar 2016 23:34:20 +0000',
  ),
  'crypt' => 
  array (
    'key' => 'f0a297d1f49450646ff5564e8698db5f',
  ),
  'session' => 
  array (
    'save' => 'memcache',
    'save_path' => 'tcp://{MEMCACHE_ADDRESS}:11211'
  ),
'cache' =>
array(
   'frontend' =>
   array(
    'default' => 
      array (
        'backend' => 'Cm_Cache_Backend_Redis',
        'backend_options' => 
        array (
          'server' => '{REDIS_ADDRESS}',
	  'password' => '{REDIS_PASS}',
          'port' => '6379',
          'persistent' => '',
          'database' => '1',
          'force_standalone' => '0',
          'connect_retries' => '1',
          'read_timeout' => '10',
          'automatic_cleaning_factor' => '0',
          'compress_data' => '1',
          'compress_tags' => '1',
          'compress_threshold' => '20480',
          'compression_lib' => 'gzip',
        ),
      ),
    'page_cache' =>
    array(
      'backend' => 'Cm_Cache_Backend_Redis',
      'backend_options' =>
       array(
         'server' => '{REDIS_ADDRESS}',
         'port' => '6379',
         'database' => '1',
	 'password' => '{REDIS_PASS}',
         'compress_data' => '1'
       )
    )
  )
),
  'db' => 
  array (
    'table_prefix' => '',
    'connection' => 
    array (
      'default' => 
      array (
        'host' => '{DB_HOST}',
        'dbname' => '{DB_NAME}',
        'username' => '{DB_USER}',
        'password' => '{DB_PASSWORD}',
        'active' => '1',
      ),
    ),
  ),
  'resource' => 
  array (
    'default_setup' => 
    array (
      'connection' => 'default',
    ),
  ),
  'x-frame-options' => 'SAMEORIGIN',
  'MAGE_MODE' => 'default',
  'cache_types' => 
  array (
    'config' => 1,
    'layout' => 1,
    'block_html' => 1,
    'collections' => 1,
    'reflection' => 1,
    'db_ddl' => 1,
    'eav' => 1,
    'config_integration' => 1,
    'config_integration_api' => 1,
    'full_page' => 1,
    'translate' => 1,
    'config_webservice' => 1,
  ),
);
