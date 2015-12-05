require 'admino/table/head_row'
require 'admino/table/resource_row'

# timestamp columns
Admino::Table::HeadRow.send(:include, HeadRow::TimestampExtensions)
Admino::Table::ResourceRow.send(:include, ResourceRow::TimestampExtensions)

# table associations
Admino::Table::HeadRow.send(:include, HeadRow::AssociationExtensions)
Admino::Table::ResourceRow.send(:include, ResourceRow::AssociationExtensions)