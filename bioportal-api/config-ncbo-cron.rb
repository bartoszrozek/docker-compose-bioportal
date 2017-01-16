LinkedData.config do |config|
  config.enable_monitoring = false
  config.cube_host = "redis-http"
  config.goo_host = "bioportal-4store"
  config.goo_port = 9000
  config.search_server_url = "http://bioportal-solr:8983/solr/core1"
  config.repository_folder = "/srv/bioportal/repository/"
  config.http_redis_host = "redis-http"
  config.http_redis_port = 6379
  config.goo_redis_host = "redis-goo"
  config.goo_redis_port = 6379
  config.enable_security = false
  #config.redis_host = "redis-http"
  #config.redis_port=6379

  # Email notifications.
  config.enable_notifications    = true
  config.email_sender            = "sender@domain.com" # Default sender for emails
  config.email_override          = "test@domain.com" # By default, all email gets sent here.  Disable with email_override_disable.
  config.smtp_host               = "smtp-unencrypted.stanford.edu"
  config.smtp_user               = nil
  config.smtp_password           = nil
  config.smtp_auth_type          = :none
  config.smtp_domain             = "localhost.localhost"  
end

Annotator.config do |config|
  config.mgrep_dictionary_file   = "/srv/mgrep/dictionary/dictionary.txt"
  config.stop_words_default_file = "./config/french_stop_words.txt"
  config.mgrep_host              = "bioportal-mgrep"
  config.mgrep_port              = 55555
  config.annotator_redis_host  = "redis-annotator"
  config.annotator_redis_port  = 6379
end

NcboCron.config do |config|
  config.redis_host  = "redis-annotator"
  config.redis_port  = 6379
  config.search_index_all_url = "http://bioportal-solr:8983/solr/core2"

  # Ontologies Report config
  config.ontology_report_path = "/srv/bioportal/reports/ontologies_report.json"

  # Google Analytics config
  config.analytics_service_account_email_address = "123456789999-sikipho0wk8q0atflrmw62dj4kpwoj3c@developer.gserviceaccount.com"
  config.analytics_path_to_key_file              = "config/bioportal-analytics.p12"
  config.analytics_profile_id                    = "ga:1234567"
  config.analytics_app_name                      = "BioPortal"
  config.analytics_app_version                   = "1.0.0"
  config.analytics_start_date                    = "2013-10-01"
  config.analytics_filter_str                    = "ga:networkLocation!@stanford;ga:networkLocation!@amazon"

  # this is a Base64.encode64 encoded personal access token
  # you need to run Base64.decode64 on it before using it in your code
  # this is a workaround because Github does not allow storing access tokens in a repo
  config.git_repo_access_token = "YOUR GITHUB REPO PERSONAL ACCESS TOKEN, encoded using Base64"
end

Goo.use_cache = true
