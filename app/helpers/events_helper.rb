# frozen_string_literal: true

module EventsHelper # rubocop:disable Style/Documentation
  def price(event)
    if event.free?
      'Free'
    else
      number_to_currency(event.price, precision: 0)
    end
  end

  def day_and_time(event)
    event.starts_at.strftime('%B %d at %I:%M %P')
  end

  def nav_link_to(text, url)
    if current_page?(url)
      link_to(text, url, class: 'active')
    else
      link_to(text, url)
    end
  end

  def main_image(event)
    if event.main_image.attached?
      image_tag event.main_image
    else
      image_tag 'placeholder.png'
    end
  end
end
