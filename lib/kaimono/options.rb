module Kaimono
  class Options
    def initialize
      @options = {}
      @config = {}
    end

    def hash_key_to_sym(h)
      Hash[h.map{|k, v| [k.to_s.to_sym, v]}]
    end

    def get_tasklist
      @options[:task] = hash_key_to_sym(@config)
    end

    def load_config(file)
      @config = YAML.load(File.read(file))
      get_tasklist
    end
    
    def filename
      @options[:filename].to_s
    end

    def to_s
      str = []
      str <<   "---------- file name ----------"
      str << @options[:filename].to_s

      @options[:task].each do |k,v|
        str << "------------------------------"
        str << "task name: #{k.to_s}"
        str << "------------------------------"
        str << "item:"
        v.each {|item| str << item.to_s}
      end
      str
    end

    def to_html
      haml = Haml::Template.new {Kaimono::HTML_TEMPLATE}
      html = haml.render(Object.new, {task: @options[:task]})
      html
    end

    def usage_message
      puts "The kaimono command generates HTML file from YAML-formatted Shopping List."
      puts
      puts "Usage: kaimono <YAML format file>"
      puts
      puts "version: #{Kaimono::VERSION}"
    end

    def parse(argv)
      if argv.empty? || (argv.size > 1) || File.extname(argv.first) != ".yml"
        usage_message
        exit
      end

      if File.exist?(argv.first)
        yaml_file = argv.first
        @options[:filename] = File.basename(yaml_file, ".yml")
        load_config(yaml_file)
      else
        puts "file not exist => #{argv.first}"
        exit
      end
      
      @options
    end
  end
end
