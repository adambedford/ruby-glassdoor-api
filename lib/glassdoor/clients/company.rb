module Glassdoor
  module Clients
    module Company
      def self.find_by_title(title)
        api = Glassdoor::Utils::Api.instance
        hash  = api.gd_get(action: 'employers', q: title)

        if hash['employers'].any?
          company = hash['employers'].find { |h| h['exactMatch'] }
          Models::Company.new(company)
        else
          nil
        end
      end
    end
  end
end
