# Flip Multiple Along

model = Sketchup.active_model
model.start_operation("Flip", true)
model.selection.each do |i|
  tr_flip = Geom::Transformation.scaling(
    i.definition.bounds.center,
    -1,# X (Red) Scale
    1,# Y (Green) Scale
    1# Z (Blue) Scale
  )
  i.transformation = i.transformation * tr_flip
end
model.commit_operation