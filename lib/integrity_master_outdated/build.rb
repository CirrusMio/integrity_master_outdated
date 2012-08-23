module IntegrityMasterOutdated
  module Build
    def self.included kls
      kls.send :property, :rebase_master_version, String, :length => 255
      kls.before(:create) do
        cache_master_version
      end
    end

    def master?
      # TODO(todd): it would be nice to make this configurable.
      project.branch == 'master'
    end

    def outdated?
      rebase_master_version == master_version
    end

    private

    def master_project
      return project if master?
      project = Project.first(:url => url, :branch => 'master')
    end

    def master_version
      master_project or return nil
      master_project.last_build or return nil
      master_project.last_build.sha1
    end

    def cache_master_version
      self.rebase_master_version = master_version
    end
  end
end
