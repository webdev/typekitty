require 'pp'
require 'thor'
require 'typekitty/api'

module Typekitty
    class CLI < Thor
        desc 'kits', 'Lists kits'
        option :token, :required => true
        def kits
            pp api.kits
        end

        desc 'kit KIT_ID', 'Get information about the draft version of a kit'
        option :token, :required => true
        def kit id
            pp api.kit id
        end

        desc 'libraries', 'Lists font libraries'
        def libraries
            pp api.libraries
        end

        no_commands do
            def api
                Typekitty::API.default_params :token => options[:token]
                Typekitty::API
            end
        end
    end
end
