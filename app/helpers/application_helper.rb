module ApplicationHelper
  def get_flash_color(name)
    if name == "error"
      "red darken-4"
    else
      "green darken-1"
    end
  end
end
