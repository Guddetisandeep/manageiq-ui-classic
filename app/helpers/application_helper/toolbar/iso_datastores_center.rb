class ApplicationHelper::Toolbar::IsoDatastoresCenter < ApplicationHelper::Toolbar::Basic
  button_group('iso_datastore_vmdb', [
    select(
      :iso_datastore_vmdb_choice,
      nil,
      t = N_('Configuration'),
      t,
      :items => [
        button(
          :iso_datastore_delete,
          'pficon pficon-delete fa-lg',
          N_('Remove selected ISO Datastores from Inventory'),
          N_('Remove ISO Datastores from Inventory'),
          :url_parms    => "main_div",
          :send_checked => true,
          :confirm      => N_("Warning: The selected ISO Datastores and ALL of their components will be permanently removed!"),
          :enabled      => false,
          :onwhen       => "1+"),
        separator,
        button(
          :iso_datastore_refresh,
          'fa fa-refresh fa-lg',
          N_('Refresh Relationships for selected ISO Datastores'),
          N_('Refresh Relationships'),
          :url_parms    => "main_div",
          :send_checked => true,
          :confirm      => N_("Refresh Relationships for selected ISO Datastores?"),
          :enabled      => false,
          :onwhen       => "1+"),
      ]
    ),
  ])
end
