node.default['graylog2'] ||= {}
node.default['mongodb'] ||= {}

# General
default['graylog2']['major_version']     = '4.1'
default['graylog2']['server']['version'] = '4.1.3-1'
default['graylog2']['install_enterprise_plugins']   = true
default['graylog2']['install_enterprise_integrations_plugins'] = true
default['graylog2']['install_integrations_plugins'] = true

## By default the cookbook installs a meta package containing the key and URL for the current Graylog repository. To disable
## this behavior set your own repository informations here.
default['graylog2']['server']['repos']   = {
  # 'rhel' => {
  #   'url' => "https://packages.graylog2.org/repo/el/stable/#{node['graylog2']['major_version']}/x86_64/",
  #   'key' => 'https://packages.graylog2.org/repo/el/stable/GPG-KEY-graylog'
  # },
  # 'debian' => {
  #   'url' => "https://packages.graylog2.org/repo/debian/",
  #   'distribution' => '',
  #   'components' => ['stable', node['graylog2']['major_version']],
  #   'key' => 'https://packages.graylog2.org/repo/debian/keyring.gpg'
  # }
}
default['graylog2']['root_username']                       = 'admin'
default['graylog2']['root_email']                          = nil
default['graylog2']['root_timezone']                       = nil
default['graylog2']['restart']                             = 'delayed'
default['graylog2']['no_retention']                        = nil
default['graylog2']['disable_sigar']                       = nil
default['graylog2']['dashboard_widget_default_cache_time'] = '10s'
default['graylog2']['secrets_data_bag']                    = 'secrets'
default['graylog2']['secrets_data_bag_item']               = 'graylog'

# Users
default['graylog2']['server']['user']  = 'graylog'
default['graylog2']['server']['group'] = 'graylog'

# SHAs
default['graylog2']['password_secret']              = nil # pwgen -s 96 1
default['graylog2']['password_secret_enclose_char'] = '"'
default['graylog2']['root_password_sha2']           = nil # echo -n yourpassword | shasum -a 256

# Paths
default['graylog2']['node_id_file']        = '/etc/graylog/server/node-id'
default['graylog2']['plugin_dir']          = '/usr/share/graylog-server/plugin'
default['graylog2']['bin_dir']             = '/usr/share/graylog-server/bin'
default['graylog2']['data_dir']            = '/var/lib/graylog-server'
default['graylog2']['message_journal_dir'] = '/var/lib/graylog-server/journal'

# Network
default['graylog2']['trusted_proxies']                    = nil
default['graylog2']['http_proxy_uri']                     = nil
default['graylog2']['non_proxy_hosts']                    = nil
default['graylog2']['proxied_requests_thread_pool_size']  = 32
default['graylog2']['authorized_ports']                   = 514

# HTTP interface
default['graylog2']['http']['bind_address'] = '0.0.0.0:9000'
default['graylog2']['http']['publish_uri'] = nil
default['graylog2']['http']['external_uri'] = nil
default['graylog2']['http']['enable_cors'] = nil
default['graylog2']['http']['enable_gzip'] = nil
default['graylog2']['http']['max_header_size'] = nil
default['graylog2']['http']['thread_pool_size'] = nil
default['graylog2']['http']['enable_tls'] = nil
default['graylog2']['http']['tls_cert_file'] = nil
default['graylog2']['http']['tls_key_file'] = nil
default['graylog2']['http']['tls_key_password'] = nil

# Elasticsearch
# Elasticsearch http client (GL >= 2.3)
default['graylog2']['elasticsearch']['hosts']                           = 'http://127.0.0.1:9200'
default['graylog2']['elasticsearch']['max_total_connections']           = 200
default['graylog2']['elasticsearch']['max_total_connections_per_route'] = 20
default['graylog2']['elasticsearch']['max_retries']                     = 2
# WARNING: Automatic node discovery does not work if Elasticsearch requires authentication, e. g. with Shield.
default['graylog2']['elasticsearch']['discovery_enabled']               = true
default['graylog2']['elasticsearch']['discovery_filter']                = nil
default['graylog2']['elasticsearch']['discovery_frequency']             = nil # '30s'
default['graylog2']['elasticsearch']['compression_enabled']             = nil # true

# Optional node discovery by Chef search
default['graylog2']['elasticsearch']['node_search_query']                    = nil
default['graylog2']['elasticsearch']['node_search_attribute']                = nil
default['graylog2']['elasticsearch']['node_search_protocol']                 = 'http'

default['graylog2']['elasticsearch']['index_prefix']                         = 'graylog'
default['graylog2']['elasticsearch']['analyzer']                             = 'standard'
default['graylog2']['elasticsearch']['output_batch_size']                    = 500
default['graylog2']['elasticsearch']['output_flush_interval']                = 1
default['graylog2']['elasticsearch']['output_fault_count_threshold']         = 5
default['graylog2']['elasticsearch']['output_fault_penalty_seconds']         = 30
default['graylog2']['elasticsearch']['disable_version_check']                = nil
default['graylog2']['elasticsearch']['disable_index_optimization']           = nil
default['graylog2']['elasticsearch']['index_optimization_jobs']              = nil
default['graylog2']['elasticsearch']['index_optimization_max_num_segments']  = nil
default['graylog2']['elasticsearch']['index_ranges_cleanup_interval']        = nil
default['graylog2']['elasticsearch']['index_field_type_periodical_interval'] = nil
default['graylog2']['elasticsearch']['template_name']                        = nil


# MongoDb
default['graylog2']['mongodb']['uri'] = 'mongodb://127.0.0.1:27017/graylog'
default['graylog2']['mongodb']['max_connections'] = 100
default['graylog2']['mongodb']['threads_allowed_to_block_multiplier'] = 5

# Search
default['graylog2']['allow_leading_wildcard_searches'] = false
default['graylog2']['allow_highlighting']              = false

# Streams
default['graylog2']['stream_processing_max_faults'] = 3

# Buffer
default['graylog2']['processbuffer_processors']  = 5
default['graylog2']['outputbuffer_processors']   = 3
default['graylog2']['async_eventbus_processors'] = 2
default['graylog2']['outputbuffer_processor_keep_alive_time']        = 5000
default['graylog2']['outputbuffer_processor_threads_core_pool_size'] = 3
default['graylog2']['outputbuffer_processor_threads_max_pool_size']  = 30
default['graylog2']['processor_wait_strategy']   = 'blocking'
default['graylog2']['ring_size']                 = 65536
default['graylog2']['udp_recvbuffer_sizes']      = 1048576
default['graylog2']['inputbuffer_ring_size']     = 65536
default['graylog2']['inputbuffer_processors']    = 2
default['graylog2']['inputbuffer_wait_strategy'] = 'blocking'

# Message journal
default['graylog2']['message_journal_enabled']        = true
default['graylog2']['message_journal_max_age']        = '12h'
default['graylog2']['message_journal_max_size']       = '5gb'
default['graylog2']['message_journal_flush_age']      = '1m'
default['graylog2']['message_journal_flush_interval'] = 1000000
default['graylog2']['message_journal_segment_age']    = '1h'
default['graylog2']['message_journal_segment_size']   = '100mb'

# Timeouts
default['graylog2']['elasticsearch']['connect_timeout']                 = nil # '10s'
default['graylog2']['elasticsearch']['socket_timeout']                  = nil # '60s'
default['graylog2']['elasticsearch']['idle_timeout']                    = nil # '-1s'
default['graylog2']['elasticsearch']['index_optimization_timeout']      = nil # '1h'
default['graylog2']['output_module_timeout']                            = 10000
default['graylog2']['stale_master_timeout']                             = 2000
default['graylog2']['shutdown_timeout']                                 = 30000
default['graylog2']['stream_processing_timeout']                        = 2000
default['graylog2']['ldap_connection_timeout']                          = 2000
default['graylog2']['api_client_timeout']                               = 300
default['graylog2']['http_connect_timeout']                             = '5s'
default['graylog2']['http_read_timeout']                                = '10s'
default['graylog2']['http_write_timeout']                               = '10s'

# Intervals
default['graylog2']['server']['alert_check_interval'] = nil

# Cluster
default['graylog2']['ip_of_master']                     = node['ipaddress']
default['graylog2']['lb_recognition_period_seconds']    = 3
default['graylog2']['lb_throttle_threshold_percentage'] = 95

# Email transport
default['graylog2']['transport_email_enabled']           = false
default['graylog2']['transport_email_hostname']          = 'mail.example.com'
default['graylog2']['transport_email_port']              = 587
default['graylog2']['transport_email_use_auth']          = true
default['graylog2']['transport_email_use_tls']           = true
default['graylog2']['transport_email_use_ssl']           = false
default['graylog2']['transport_email_auth_username']     = 'you@example.com'
default['graylog2']['transport_email_auth_password']     = 'secret'
default['graylog2']['transport_email_subject_prefix']    = '[graylog]'
default['graylog2']['transport_email_from_email']        = 'graylog@example.com'
default['graylog2']['transport_email_web_interface_url'] = nil

# Logging
default['graylog2']['server']['log_file']              = '/var/log/graylog-server/server.log'
default['graylog2']['server']['log_max_size']          = '50MB'
default['graylog2']['server']['log_max_index']         = 10
default['graylog2']['server']['log_pattern']           = "%d{yyyy-MM-dd'T'HH:mm:ss.SSSXXX} %-5p [%c{1}] %m%n"
default['graylog2']['server']['log_level_application'] = 'info'
default['graylog2']['server']['log_level_root']        = 'warn'

# JVM
default['graylog2']['server']['skip_java_version_check'] = false
default['graylog2']['server']['java_bin'] = '/usr/bin/java'
default['graylog2']['server']['java_home'] = ''
default['graylog2']['server']['java_opts'] = '-Djava.net.preferIPv4Stack=true -Xms1g -Xmx1g -XX:NewRatio=1 -server -XX:+ResizeTLAB -XX:-OmitStackTraceInFastThrow'
default['graylog2']['server']['args']      = ''
default['graylog2']['server']['wrapper']   = ''
default['graylog2']['server']['gc_warning_threshold'] = nil

# Server
default['graylog2']['server']['override_restart_command'] = false
default['graylog2']['server']['additional_options']       = nil
default['graylog2']['server']['additional_env_vars']      = nil
default['graylog2']['server']['install_tzdata_java']      = false

# Collector Sidecar
default['graylog2']['sidecar']['version']                        = '1.1.0'
default['graylog2']['sidecar']['release']                        = '1'
default['graylog2']['sidecar']['repository']['version']          = '1'
default['graylog2']['sidecar']['repository']['release']          = '2'
default['graylog2']['sidecar']['server_url']                     = 'http://localhost:9000/api'
default['graylog2']['sidecar']['server_api_token']               = nil
default['graylog2']['sidecar']['update_interval']                = 10
default['graylog2']['sidecar']['tls_skip_verify']                = false
default['graylog2']['sidecar']['send_status']                    = false
default['graylog2']['sidecar']['list_log_files']                 = nil # single directory or '[dir1, dir2, dir3]'
default['graylog2']['sidecar']['name']                           = 'graylog-collector-sidecar'
default['graylog2']['sidecar']['id']                             = 'file:/etc/graylog/collector-sidecar/collector-id'
default['graylog2']['sidecar']['log_path']                       = '/var/log/graylog/collector-sidecar'
default['graylog2']['sidecar']['log_rotation_time']              = 86400
default['graylog2']['sidecar']['log_max_age']                    = 604800
default['graylog2']['sidecar']['tags']                           = 'linux' # multiple tags '[tag1, tag2, tag3]'
default['graylog2']['sidecar']['cache_path']                     = '/var/cache/graylog/collector-sidecar'
default['graylog2']['sidecar']['backends']['nxlog']['enabled']               = false
default['graylog2']['sidecar']['backends']['nxlog']['binary_path']           = '/usr/bin/nxlog'
default['graylog2']['sidecar']['backends']['nxlog']['configuration_path']    = '/etc/graylog/collector-sidecar/generated/nxlog.conf'
default['graylog2']['sidecar']['backends']['filebeat']['enabled']            = true
default['graylog2']['sidecar']['backends']['filebeat']['binary_path']        = '/usr/bin/filebeat'
default['graylog2']['sidecar']['backends']['filebeat']['configuration_path'] = '/etc/graylog/collector-sidecar/generated/filebeat.yml'
default['graylog2']['server']['collector_inactive_threshold']    = '1m'
default['graylog2']['server']['collector_expiration_threshold']  = '14d'

# Content packs
default['graylog2']['server']['content_packs_loader_enabled'] = false
default['graylog2']['server']['content_packs_dir']            = '/usr/share/graylog-server/contentpacks'
default['graylog2']['server']['content_packs_auto_load']      = 'grok-patterns.json'
