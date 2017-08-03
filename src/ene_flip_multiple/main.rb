# Eneroth Flip Multiple

# Copyright Julia Christina Eneroth, eneroth3@gmail.com

module EneFlipMultiple

  def self.flip(axis = 0)
    model = Sketchup.active_model
    model.start_operation("Flip", true)
    model.selection.each do |i|
      origin = i.definition.bounds.center # TODO: Optionally flip along axes.
      tr_flip = Geom::Transformation.scaling(
        origin,
        axis == 0 ? -1 : 1,
        axis == 1 ? -1 : 1,
        axis == 2 ? -1 : 1
      )
      i.transformation = i.transformation * tr_flip
    end
    model.commit_operation
  end

  def self.flip_available?
    model = Sketchup.active_model
    model.selection.select { |i| is_instance?(i) }.size > 1
  end

  def self.is_instance?(entity)
    entity.is_a?(Sketchup::Group) || entity.is_a?(Sketchup::ComponentInstance)
  end

  # Wrapper to menu#add_item that sends the undocumented position argument on
  # Windows only.
  def self.add_menu_item(menu, name, position = nil, &block)
    if position && Sketchup.platform == :platform_win
      menu.add_item(name, position, &block)
    else
      menu.add_item(name, &block)
    end
  end

  # Wrapper to menu#add_submenu that sends the undocumented position argument on
  # Windows only.
  def self.add_submenu(menu, name, position = nil)
    if position && Sketchup.platform == :platform_win
      menu.add_submenu(name, position)
    else
      menu.add_submenu(name)
    end
  end

  UI.add_context_menu_handler do |menu|
    if flip_available?
      menu = add_submenu(menu, "Flip Individually Along", menu_index)
      menu.add_item("Instances' Red") { flip(0) }
      menu.add_item("Instances' Green") { flip(1) }
      menu.add_item("Instances' Blue") { flip(2) }
    end
  end

end
