# frozen_string_literal: true

Kaminari.configure do |config|
  config.default_per_page = 20
  # config.max_per_page = nil
  # 現在ページを中心に4ページ分のリンクが表示
  config.window = 4
  # 最初と最後のページリンク表示
  config.outer_window = 1
  # config.left = 0
  # config.right = 0
  # config.page_method_name = :page
  # config.param_name = :page
  # config.max_pages = nil
  # 最初のページにページパラメータを含める
  config.params_on_first_page = true
end
