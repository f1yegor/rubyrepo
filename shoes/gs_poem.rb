require "green_shoes"
=begin
Shoes.app(:width=>280, :height=>350) do
  para "the sun.\n",
  strong("a lemon.\n"),
  em("the goalie.\n"),
  code("the fireplace.\n"),
  strong(ins("very good."))
end
=end
=begin
Shoes.app do
  @o=oval :top=>0, :left=>0, :radius=>40
  stack :margin=>40
  { title "dancing with a circle"
    subtitle "how graceful and round"
end
=end
Shoes.app do
@e=edit_line :width=>80
	button "click" do
	alert @e.text
	end
end
