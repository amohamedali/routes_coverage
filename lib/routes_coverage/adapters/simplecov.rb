module RoutesCoverage
  module Adapters
    class SimpleCov
      def self.use
        RoutesCoverage.reset!
        prev_block = ::SimpleCov.at_exit
        ::SimpleCov.at_exit{
          RoutesCoverage.perform_report
          prev_block.call
        }
      end
    end
  end
end
