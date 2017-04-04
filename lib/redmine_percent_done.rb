module RedminePercentDone

  def self.setup
    ::RedminePercentDone::IssuePatch.apply
  end

  def self.get_field_name
    unless (percent_done = Setting.plugin_redmine_percent_done["status-#field-to-link"]).blank?
      percent_done
    end
  end

  def self.get_field_value(issue)
    field_value = nil
    field_name = self.get_field_name

    issue.custom_field_values.each {
        |field|
      if field.custom_field.name == field_name
        field_value = field.value.to_f
      end
    }

    return field_value
  end

end
