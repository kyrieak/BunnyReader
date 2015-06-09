module ApplicationHelper

  LANG = { 1 => "English", 2 => "日本語" }

  def lang_str(lang_id)
    LANG[lang_id]
  end

  def expand_button
    content_tag :a, { class: 'glyphicon icon_bar_outer' } do
      concat(content_tag :span, '', class: 'icon-bar')
      concat(content_tag :span, '', class: 'icon-bar')
      concat(content_tag :span, '', class: 'icon-bar')
    end
  end

  def next_button
    content_tag(:a, '', { class: 'slide', id: 'next' }) do
      content_tag :span, '', { class: 'glyphicon glyphicon-circle-arrow-right' }
    end
  end

  def back_button
    content_tag :a, '', { class: 'slide v_hidden', id: 'back' } do
      content_tag :span, '', { class: 'glyphicon glyphicon-circle-arrow-left' }
    end
  end
  
  def user_feeds
    render partial: '/menu/user_feeds'
  end

  def user_settings
    render partial: '/menu/user_settings'
  end

  def user_account
    render partial: '/menu/user_account_info'
  end

  def logged_in?
    @logged_in ? true : false
  end

end
