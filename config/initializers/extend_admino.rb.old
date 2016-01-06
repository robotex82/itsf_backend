require 'admino/table/head_row'
require 'admino/table/resource_row'

# timestamp columns
Admino::Table::HeadRow.send(:include, HeadRow::TimestampExtensions)
Admino::Table::ResourceRow.send(:include, ResourceRow::TimestampExtensions)

# table associations
Admino::Table::HeadRow.send(:include, HeadRow::AssociationExtensions)
Admino::Table::ResourceRow.send(:include, ResourceRow::AssociationExtensions)

# table published column
Admino::Table::HeadRow.send(:include, HeadRow::PublishedExtensions)
Admino::Table::ResourceRow.send(:include, ResourceRow::PublishedExtensions)

# table paperclip column
Admino::Table::HeadRow.send(:include, HeadRow::PaperclipExtensions)
Admino::Table::ResourceRow.send(:include, ResourceRow::PaperclipExtensions)

# table acts_as_list column
Admino::Table::HeadRow.send(:include, HeadRow::ActsAsListExtensions)
Admino::Table::ResourceRow.send(:include, ResourceRow::ActsAsListExtensions)
