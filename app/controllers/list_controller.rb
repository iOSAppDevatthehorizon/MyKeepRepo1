class ListController < UITableViewController
  attr_accessor :all_notes

  def all_notes=(all_notes)
    @all_notes = all_notes
  end

  def numberOfSectionsInTableView(tableView)
    1
  end

  def tableView(tableView, numberOfRowsInSection:section)
    @all_notes.count
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    @reuseIdentifier ||= "CELL_IDENTIFIER"

    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier) || begin
      UITableViewCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier:@reuseIdentifier)      
    end
    cell.textLabel.text = @all_notes[indexPath.row]["title"]
    cell.detailTextLabel.text = @all_notes[indexPath.row]["content"]
    cell
  end

  def tableView(tableView, heightForRowAtIndexPath:indexPath)
    50
  end

end