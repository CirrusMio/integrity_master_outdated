require 'integrity_master_outdated/build'
require 'integrity_master_outdated/routing'

Integrity::Build.send :include, IntegrityMasterOutdated::Build
Integrity::App.send :include, IntegrityMasterOutdated::Routing
