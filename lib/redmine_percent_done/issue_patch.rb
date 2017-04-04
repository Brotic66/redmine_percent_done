module RedminePercentDone
  module IssuePatch

    def self.apply
      Issue.class_eval do
        # using prepend instead of include makes life much easier when you have
        # to override already existing methods. Death to alias_method_chain!
        prepend InstanceMethods
        before_save :update_done_ratio_for_status
      end unless Issue < InstanceMethods # no need to do this more than once.
    end

    module InstanceMethods
      def update_done_ratio_for_status
        to_rtn = 0
        field_value = RedminePercentDone.get_field_value(self)

        if field_value
          if field_value.zero? && self.spent_hours > 0
            to_rtn = 100
          elsif field_value > 0 && self.spent_hours > 0
            to_rtn = spent_hours * 100 / (spent_hours + field_value)
          end

          self.done_ratio = to_rtn
        end
      end
      private :update_done_ratio_for_status
    end

  end
end
