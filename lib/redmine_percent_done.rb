module RedminePercentDone

  def self.setup
    ::RedminePercentDone::IssuePatch.apply
  end

  def self.get_field_id
    unless (percent_done = Setting.plugin_redmine_percent_done["status-#field-to-link"]).blank?
      percent_done.to_i
    end
  end

end
