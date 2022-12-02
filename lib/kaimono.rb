# frozen_string_literal: true
require "optparse"
require "yaml"
require "haml"

require_relative "kaimono/command"
require_relative "kaimono/options"
require_relative "kaimono/version"

module Kaimono

HTML_TEMPLATE = <<EOS
!!!
%html{lang: "ja"}
  %head
    %meta{charset: "utf-8"}
    %title Shopping List
  %body
    -task.each do |shop, items|
      %fieldset  
        %legend= shop
        #content
          -items.each do |item|
            %p<
              %label<
                %input{type: "checkbox"}= item
EOS

end