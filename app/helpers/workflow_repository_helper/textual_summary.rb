module WorkflowRepositoryHelper::TextualSummary
  include TextualMixins::TextualName
  include TextualMixins::TextualDescription

  def textual_group_properties
    TextualGroup.new(_("Properties"), %i[name description created updated status])
  end

  def textual_group_relationships
    TextualGroup.new(_("Relationships"), %i[provider workflows])
  end

  def textual_group_options
    TextualGroup.new(_("Repository Options"), %i[scm_url scm_branch])
  end

  def textual_group_smart_management
    TextualTags.new(_("Smart Management"), %i[tags])
  end

  def textual_created
    {:label => _("Created On"), :value => format_timezone(@record.created_at)}
  end

  def textual_updated
    {:label => _("Updated On"), :value => format_timezone(@record.updated_at)}
  end

  def textual_status
    h = {:label => _("Status"), :value => @record.status}
    unless @record.last_update_error.nil?
      h.update(:link => show_output_link, :title => _('Show refresh output'))
    end
    h
  end

  def textual_provider
    {:label => _("Provider"), :value => @record.manager.try(:name)}
  end

  def textual_workflows
    h = {:label => _('Workflows'), :value => @record.total_payloads}
    if @record.total_payloads.positive? && role_allows?(:feature => 'embedded_configuration_script_payload_view')
      h.update(:link  => url_for_only_path(:action => 'show', :id => @record, :display => 'workflows'),
               :title => _('Show all Workflows'))
    end
    h
  end

  def textual_scm_url
    {:label => _('SCM URL'), :title => _("Show Credential's SCM URL"), :value => @record.scm_url}
  end

  def textual_scm_branch
    {:label => _('SCM Branch'), :title => _("Show Credential's SCM branch"), :value => @record.scm_branch}
  end
end
