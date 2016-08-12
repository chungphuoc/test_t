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

  def link_to_switch_language(params = {})
    if I18n.locale == :en
      link_to t('language', locale: :ja), params.merge(locale: :ja), class: 'btn-header'
    else
      link_to t('language', locale: :en), params.merge(locale: :en), class: 'btn-header'
    end
  end

  def string_to_minutes(str = '00:00:00')
    return nil if str.nil?
    key_arr = [:hour, :minute, :second]
    time = Hash[key_arr.zip(str.split(':').map(&:to_i))]
    time[:hour] * 60 + time[:minute]
  end
end
