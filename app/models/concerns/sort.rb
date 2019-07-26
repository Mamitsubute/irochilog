module Sort
  extend ActiveSupport::Concern

  def translate_sort_key(sort_key)   
    key = sort_key.to_s
    return "#{sort_key}" if key.blank?
    I18n.t('sort_key' + '.' + key)
  end
end
