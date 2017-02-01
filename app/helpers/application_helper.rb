module ApplicationHelper
  ERROR_COLOR = "red darken-4".freeze
  SUCCESS_COLOR = "green darken-1".freeze
  BUTTON_CLASS = "btn waves-effect waves-light".freeze

  def get_flash_color(name)
    if name == "error"
      ERROR_COLOR
    else
      SUCCESS_COLOR
    end
  end
end
