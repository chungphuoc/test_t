module ApplicationHelper
  def bootstrap_class_for(flash_type)
    { success: 'alert-success',
      error: 'alert-danger',
      alert: 'alert-warning',
      notice: 'alert-info' }[flash_type.to_sym] || flash_type.to_s
  end

  def flash_messages(_opts = {})
    flash.each do |msg_type, message|
      concat(
        content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in text-center") do
          concat content_tag(:button, 'x', class: 'close', data: { dismiss: 'alert' })
          concat message.html_safe
        end
      )
    end
    nil
  end

  def link_to_switch_language
    if I18n.locale == :en
      link_to t('language', locale: :ja), {locale: :ja}, {class: 'btn-header'}
    else
      link_to t('language', locale: :en), {locale: :en}, {class: 'btn-header'}
    end
  end
end
