class Jeweler
  class Version
    attr_accessor :base_dir
    attr_reader :major, :minor, :patch

    def initialize(base_dir)
      self.base_dir = base_dir

      yaml = read_yaml
      @major = yaml['major']
      @minor = yaml['minor']
      @patch = yaml['patch']
    end

    def to_s
      "#{major}.#{minor}.#{patch}"
    end

    protected

    def yaml_path
      denormalized_path = File.join(@base_dir, 'VERSION.yml')
      absolute_path = File.expand_path(denormalized_path)
      absolute_path.gsub(Dir.getwd + File::SEPARATOR, '')
    end

    def read_yaml
      if File.exists?(yaml_path)
        YAML.load_file(yaml_path)
      else
        raise VersionYmlError, "#{yaml_path} does not exist!"
      end
    end
  end
end
