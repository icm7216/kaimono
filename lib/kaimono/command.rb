module Kaimono
  class Command
    attr_reader :opts
    
    def self.run(argv)
      new(argv).execute
    end

    def initialize(argv)
      @argv = argv
      @kaimono_list = Kaimono::Options.new
      @options = @kaimono_list.parse(@argv)
    end

    def output_html
      html_file = @kaimono_list.filename + ".html"
      File.open(html_file, "w") do |w|
         w.puts @kaimono_list.to_html
      end
      puts "output HTML => #{html_file}"  
    end

    def execute
      puts @kaimono_list.to_s
      output_html
    end
  end
end
