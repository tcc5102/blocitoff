module ItemsHelper
include ActionView::Helpers::DateHelper

  def days_left(item)
    "#{distance_of_time_in_words(item.created_at, Time.current)} ago"
    # "#{distance_of_time_in_words(item.created_at + 7.days, item.created_at)} left"
  end
end
