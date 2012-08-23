require 'pathname'

module IntegrityMasterOutdated
  module Routing
    def self.included kls
      kls.send(:get, '/:project/outdated_icon'){ outdated_status_icon_request }
    end

    private

    def outdated_status_icon_request
      login_required unless current_project.public?
      icon = 'up-to-date.png'
      last_build = current_project.last_build
      if last_build and last_build.outdated?
        icon = 'outdated.png'
      end
      path = Pathname.new(__FILE__).join("../../../icons/#{icon}")
      send_file path, last_modified: current_project.updated_at
    end
  end
end
